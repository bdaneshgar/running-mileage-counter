#include <pic.h>			//PIC16F886 register definitions included here
#include "USART.h"

#define _XTAL_FREQ 8000000	//8 MHz cpu clock speed
#define testbit(data,bitno) ((data>>bitno)&0x001)		//Byte manipulation macros
#define bit_set(var,bitno) ((var) |= 1 << (bitno))
#define bit_clr(var,bitno) ((var) &= ~(1 << (bitno)))

//Access I/0 via macros
#define SEGA	RA0		//EM Low Side Mux'd Segments
#define SEGB	RA1
#define SEGC	RA2
#define SEGD	RA3
#define SEGE	RA4
#define SEGF	RA5
#define SEGG	RA6

#define SC1		RC0		//High Side Set/Clr Ctrl
#define SC2		RC1
#define DISP1	RC2		//Select Enable for Digit 1 or 2
#define DISP2	RC3

#define TX		RC6		//UART Serial Slave Port
#define RX		RC7

#define Test	RB0		//Test button
#define Debug	RA7		//Debug LED

//Gloabal Variables////////////////////////////////////////
unsigned char m_address = 0;	//assigned device programmed address, will execute commands directed at this address, EEPROM address 0x00 holds this address
const unsigned long pulse_length = 2000;	//pulse length ~14.14ms
const char BAUDRATE = BAUD_9600;	//serial comm baud rate setting
const char animation_delay = 1000;	//wait between segment changes for animation effect
const char invert0 = 0;			//change the set/clear polarity of each digit (found some em displays have opposite polarity on coil windings) 
const char invert1 = 0;
const char eeprom_addr = 1;		//sets whether to look at eeprom or hardware solder links for the module address

//          |adr||n||data |
// received 0 0 0 0 0 0 0 0
unsigned char received = 0;	//full byte received over serail
unsigned char address = 0;	//adr, extracted command address, 3 bits, 7 max possible slaves 0-6 
								//(if address=7, data=0 reserved for clear all attached displays command)
								//(if device programmed address=2 then data 0b1000/0b1001 writes A or P to 2nd digit)
								//(if address=7, data=1,2 then change mode to number write,independent segment set/clear)
								//(if address=7, data=0xF then go to sleep, any received byte will wake processor up)
								//SEE EXAMPLES BELOW

//EXAMPLE
//received=0b111x0001 -> put into number write mode
//received=0b00010011 -> write number '3' to 2nd digit of module with address 0
//received=0b00101111 -> clear just 1st digit of address 1
//received=0b111x0000 -> clear all attached displays
//received=0b01101100 -> write hyphen to 1st digit of address 3

//received=0b111x0010 -> put into independent segment write mode
//received=0b01011011 -> set segment D of 2nd digit of address 2
//received=0b01101001 -> set segment B of 1st digit of address 3
//received=0b00010111 -> clear segment G of 2nd digit of address 0
//received=0b00100000 -> clear segment A of 1st digit of address 1

//received=0b111x0001 -> put back into number write mode
//received=0b111x1111 -> go to sleep
//received=0b111x0010 -> wake up, put into independent segment write mode

unsigned char digit = 0;	//n, extracted digit, 1 bit, digit to update (two digits per module), digit = 0 -> DISP1 selected, digit = 1 -> DISP2 selected
unsigned char data = 0;		//data, extracted data, 4 bits, 16 states for full display of all possible hex values
unsigned char set_flgs [2] = {0,0};	//flags for each digit on what needs to be set
unsigned char clr_flgs [2] = {0,0};	//flags for each digit on what needs to be cleared
unsigned char num_seg_wrt_flg = 0;	//0 - number mode, 1 - segment mode 

//Function Prototypes//////////////////////////////////////
void delays(long);
void delay(long);

void eeprom_wrt(char,char);
char eeprom_rd(char);
void update_disp();
void write_disp(unsigned char,unsigned char,unsigned char);
void decode_num(unsigned char,unsigned char);
void initialize_disp(void);
///////////////////////////////////////////////////////////

//Functions////////////////////////////////////////////////
void delays(long x){	//longer delay function (blocking)
    unsigned int y=0, z=0;
   	while(x>0){
		while(y<500){
	       	while(z<1000){
				z++;}
			y++;
		}
	x--;
	}
}

void delay(long x){	//quick delay function (blocking)
	while(x>0){
		x--;
	}
}

//----------------EEPROM Read, Write Functions----------------------------------------------
void eeprom_wrt(char addr, char data){	//Write to one of 128 available bytes eeprom, addr from 0x0 to 0x80
	WREN = 1;						//enable write
	EEDATA = data;					//set data and address
	EEADR = addr;
	GIE = 0;						//disable interrupts
	EECON2 = 0x55;					//initialize register (as per datasheet, eeprom section)
	EECON2 = 0xAA;
	bit_set(EECON1,1);				//set write bit
	while(testbit(EECON1,1)==1){}	//wait until write finished
	WREN = 0;						//disable write
}

char eeprom_rd(char addr){			//Read from eeprom, see eeprom_wrt comment for specifics
	EEADR = addr;					//set address
	bit_set(EECON1,0);				//set read bit
	while(testbit(EECON1,0)==1){}	//wait until read finished
	return EEDATA; 					//return requested value
}

void freshen_disp(void){	//updates only segments that need changing for both digits (does all clears before sets)
	unsigned char cnt = 0;
	for(int d=0;d<2;d++){		//check both digits
		cnt=0;
		while(clr_flgs[d]!=0){		//is there any segments that need to be cleared?
			if(testbit(clr_flgs[d],cnt)==0){cnt++;}	//find first segment flagged for clearing
			else{
				write_disp(0,d,cnt);						//clear segment
				bit_clr(clr_flgs[d],cnt);					//dont forget to clear bit in that flag
				cnt++;
				delays(animation_delay);
			}
		}
	}

	for(int d=0;d<2;d++){		//check both digits
		cnt=0;
		while(set_flgs[d]!=0){		//is there any segments that need to be set?
			if(testbit(set_flgs[d],cnt)==0){cnt++;}	//find first segment flagged for setting
			else{
				write_disp(1,d,cnt);						//set segment
				bit_clr(set_flgs[d],cnt);					//dont forget to clear bit in that flag
				cnt++;
				delays(animation_delay);
			}
		}
	}	

	DISP1 = DISP2 = 0;	//clear display write enables
	//delays(animation_delay);	//wait awhile before animating next segment change (~1 sec)
}

void decode_num(unsigned char dig,unsigned char num){	//BCD to segment decoding to assign proper flags to set/clear
	unsigned char temp = 0;

	if(num == 0){temp=0b00111111;}			//numerical characters
	else if(num == 1){temp=0b00000011;}
	else if(num == 2){temp=0b01011011;}
	else if(num == 3){temp=0b01001111;}
	else if(num == 4){temp=0b01100110;}
	else if(num == 5){temp=0b01101101;}
	else if(num == 6){temp=0b01111101;}
	else if(num == 7){temp=0b00000111;}
	else if(num == 8){temp=0b01111111;}
	else if(num == 9){temp=0b01101111;}
	else if(num == 10){temp=0b00000001;}	//various hyphens
	else if(num == 11){temp=0b00001000;}
	else if(num == 12){temp=0b01000000;}
	else if(num == 13){temp=0b00001001;}
	else if(num == 14){temp=0b01001000;}
	else if(num == 15){temp=0b00000000;}	//clear all segments

	set_flgs[dig]=temp;		//assign flags to set/clear segments
	clr_flgs[dig]=~temp;
}

void write_disp(unsigned char set_clr, unsigned char digit, unsigned char segment){	//low level multiplexed signalling to set h-bridges and control signals
	if(digit==0){DISP1 = 1;DISP2 = 0;}else{DISP1 = 0;DISP2 = 1;}	//select correct digit to update;
	delay(1000);	//1.5ms close, 0.5ms open reed relay
	
	//unsigned char s_c = 0;
	//if(((0b1&~digit)&invert0)||(digit&invert1)){s_c=0b1&~set_clr;}else{s_c=set_clr;}	//account for displays with inverted coil windings TEST!!!!

	//set or clear segments
	if(set_clr==1){//if(s_c==1){					//set
		SC1 = SC2 = 1;
		PORTA = ~(1<<segment);
	}else{						//clear
		SC1 = SC2 = 0;
		PORTA = (1<<segment);
	}
	delay(pulse_length);	//some delay to allow mechanical segment change
	/**/	DISP1 = DISP2 = 0;	//clear display write enables
	SC1 = SC2 = 0;
	PORTA = 0x00;
	
	delay(19*pulse_length);	//longer delay to prevent overheating of coils, duty<=5% according to datasheet
}

void initialize_disp(void){	//call this on power on to ensure all segments are off in a known state
	set_flgs[0]=0x00;
	set_flgs[1]=0x00;
	clr_flgs[0]=0xFF;
	clr_flgs[1]=0xFF;
	freshen_disp();
}

//Interrupt////////////////////////////////////////////////
void interrupt serial(void){	//This gets executed everytime a serial byte is received
	Debug=1;
	if(RCIF){	//Serial receive interrupt flag (an unread byte in the circular buffer is available)
		//new data received, execute this, flag cleared when data read out
		received = RCREG;				//retrieve byte
		address = (received&0xE0)>>5;	//extract command address
		digit = testbit(received,4);	//extract digit to update
		data = received&0x0F;			//extract data nibble
		if(address==m_address){	//if command address matches this modules assigned address, update data to display
			if(num_seg_wrt_flg==0){decode_num(digit,data);}
			else{write_disp(testbit(data,3),digit,0x7&data);DISP1 = DISP2 = 0;}	//data=(1 bit, set/clr)(3 bits, segment 0-7)
			uart_txt("ADR 0");
		}

		if(address==0b111){		//if address=7 command and data=0 received then clear all displays
			if(m_address==2){	//if this is the 3rd display then allow AM/PM indication
				if(data==0b1001){				//if data=0b1001 then write P to 2nd digit
					set_flgs[1]=0b01110011;
					clr_flgs[1]=0b10001100;
					uart_txt("AM");
				}else if(data==0b1000){			//if data=0b1000 then write A to 2nd digit
					set_flgs[1]=0b01110111;
					clr_flgs[1]=0b00001000;
					uart_txt("PM");
				}
			}

			if(data==0b0000){
				set_flgs[0]=0x00;set_flgs[1]=0x00;
				clr_flgs[0]=0xFF;clr_flgs[1]=0xFF;	//clear all attached displays
				uart_txt("Clear All");
			}else if(data==0b0001){
				num_seg_wrt_flg=0;	//number write mode
				uart_txt("Num Mode");
			}else if(data==0b0010){
				num_seg_wrt_flg=1;	//independent segment write mode
				uart_txt("Seg Mode");
			}else if(data==0b1111){
				PORTA=0x00;	//Enter SLEEP Mode, to exit send any serial byte
				PORTC=0x00;	//for low power set all IO low and as inputs, disable pullups
				TRISC=0xFF;
				TRISA=0xFF;
				bit_set(OPTION_REG,7);	//disable pullups on PORTB
				uart_txt("Sleep");
				SLEEP();
				uart_txt("Wake");
				TRISA=0x00;
				TRISC6=0;
				TRISC7=1;
				bit_clr(OPTION_REG,7);	//enable pullups on PORTB
			}
		}	
	}

	if(TXIF){
		//can send data, execute this, flag cleared when data written to buffer to send
		
	}
	Debug=0;
}
///////////////////////////////////////////////////////////

main(){
	ANSEL=0x00;		//initialize I/O
	ANSELH=0x00;
	TRISA=0x00;
	TRISB=0xFF;
	TRISC=0x00;
	PORTA=0x00;
	PORTC=0x00;
	
	bit_clr(OPTION_REG,7);	//enable pullups on PORTB
	//RBPU=0;				//enable pullups on PORTB

	bit_set(OSCCON,6);	//set clk speed to 8MHz
	bit_set(OSCCON,5);
	bit_set(OSCCON,4);
	
	if(!Test==1){	//if test held on power up, implement all segments test, implement way of setting address over serial as well
		while(0){
			PORTA = 0xFF;
			SC1=DISP1=1;
			SC2=DISP2=0;
			delays(5000);
			PORTA = 0x00;
			SC1=DISP1=0;
			SC2=DISP2=1;
			delays(5000);
		}
		while(1){
			//initialize_disp();
			delays(5000);
			write_disp(0,0,0);	
			write_disp(1,0,0);
			//write_disp(0,0,1);
			//write_disp(0,0,2);
			//write_disp(0,0,3);
			//write_disp(0,0,4);
			//write_disp(0,0,5);
			//write_disp(0,0,6);
			//write_disp(0,0,7);
			//write_disp(1,0,0);	
			//write_disp(1,0,1);
			//write_disp(1,0,2);
			//write_disp(1,0,3);
			//write_disp(1,0,4);
			//write_disp(1,0,5);
			//write_disp(1,0,6);
			//write_disp(1,0,7);
		}
	}

	//if(eeprom_addr==1){m_address = eeprom_rd(0);}	//check module assigned address from eeprom address 0 if v1 board (no solder links)
	//else{m_address=(0x0E&~PORTB)>>1;}	//check solder links to set module address if v2 board (solder link means bit is 1, no solder means 0)

	delays(100);

	uart_init(BAUDRATE,RX_INTERRUPT_ENABLE,TX_INTERRUPT_DISABLE);	//Initialize Serial to 9600 Baud, RX interrupt but no TX

	//initialize_disp();	//initialize to a blank display at startup
	
	for(int k=2;k>0;k--){	//sequentially test all segments on and then off
		for(int j=0;j<2;j++){
			for(int i=0;i<8;i++){
				write_disp(k-1,j,i);
				delays(1000);
			}
		}
	}
	
	while(1){
		if(clr_flgs[0]!=0||clr_flgs[1]!=0||set_flgs[0]!=0||set_flgs[1]!=0){		//if there are changes to be written then execute them
			freshen_disp();		//sit here and wait for serial display update command
		}
	}
}