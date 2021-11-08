//#include <pic.h>
#include <string.h>	//string operations

//IMPORTANT, baud rate configs below are correct only for F_osc=8MHz

#define BAUD_300    0
#define BAUD_1200	1
#define BAUD_2400	2
#define BAUD_9600   3
#define BAUD_10417	4
#define BAUD_19200  5
#define BAUD_57600  6
#define BAUD_115200 7

#define RX_INTERRUPT_DISABLE 0
#define RX_INTERRUPT_ENABLE  1
#define TX_INTERRUPT_DISABLE 0
#define TX_INTERRUPT_ENABLE  1

/*interrupt serial(void){
	if(RCIF){
		//new data received, execute this
		
	}

	if(TXIF){
		//can send data, execute this
		
	}

	if(T0IF){
		//if Timer0 interrupt, execute this

	}
}*/

uart_init(char baud, char rx_interrupt_enable, char tx_interrupt_enable){
    TRISC6=0;
	TRISC7=1;
    TXSTA=0b00100100;
    RCSTA=0b10010000;

	SPEN=1;		//serial port enable
	RX9=0;		//8bit receive
	SYNC=0;		//asynchronous mode
	BRGH=1;
	BRG16=1;

	GIE=0;		//disable global interrupts

	if(rx_interrupt_enable==1){
		CREN=1;		//enable receive
		ADDEN=1;	//enable address detection
		RCIE=1;		//uart receive interrupt enable
	}

	if(tx_interrupt_enable==1){
		TXIE=1;		//uart transmit interrupt enable
	}

	if(rx_interrupt_enable || tx_interrupt_enable){
		PEIE=1;		//peripheral interrupt enable
		GIE=1;		//global interrupt enable
	}

	switch(baud){
		case BAUD_300   :
			SPBRG=6666;
			break;
		case BAUD_1200  :
			SPBRG=1666;
			break;
		case BAUD_2400  :
			SPBRG=832;
			break;
		case BAUD_9600  :
			SPBRG=207;
			break;
		case BAUD_10417  :
			SPBRG=191;
			break;
		case BAUD_19200  :
			SPBRG=103;
			break;
		case BAUD_57600  :
			SPBRG=34;
			break;
		case BAUD_115200 :
			SPBRG=16;
			break;
	}
} 

txd(char write_data){
    TXREG = write_data;
    while(!TRMT);
}

uart_txt(string){
	char str[]="                                                                    ";
	strcpy(str, string);
	unsigned int len=strlen(str);
	unsigned int cnt=0;

	while(cnt<len){
		txd(str[cnt]);
		cnt++;
	}
}

int rxd(){
	CREN=1;		//enable receive
	ADDEN=1;	//enable address detection
	while(!RCIF){}
	CREN=0;		//disable receive
	ADDEN=0;	//diable address detection
	return RCREG;
}