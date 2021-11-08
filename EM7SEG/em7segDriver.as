opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F886
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_delays
	FNCALL	_main,_write_disp
	FNCALL	_main,_uart_init
	FNCALL	_main,_freshen_disp
	FNCALL	_freshen_disp,_write_disp
	FNCALL	_freshen_disp,_delays
	FNCALL	_write_disp,_delay
	FNROOT	_main
	FNCALL	_serial,_decode_num
	FNCALL	_serial,i1_write_disp
	FNCALL	_serial,_uart_txt
	FNCALL	i1_write_disp,i1_delay
	FNCALL	_uart_txt,_strcpy
	FNCALL	_uart_txt,_strlen
	FNCALL	_uart_txt,_txd
	FNCALL	intlevel1,_serial
	global	intlevel1
	FNROOT	intlevel1
	global	uart_txt@F1620
psect	idataBANK3,class=CODE,space=0,delta=2
global __pidataBANK3
__pidataBANK3:
	file	"C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\USART.h"
	line	100

;initializer for uart_txt@F1620
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	020h
	retlw	0
	global	_digit
	global	_num_seg_wrt_flg
	global	_address
	global	_data
	global	_m_address
	global	_received
	global	_clr_flgs
	global	_set_flgs
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_RCREG
_RCREG	set	26
	global	_RCSTA
_RCSTA	set	24
	global	_TXREG
_TXREG	set	25
	global	_ADDEN
_ADDEN	set	195
	global	_CREN
_CREN	set	196
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RA7
_RA7	set	47
	global	_RB0
_RB0	set	48
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RCIF
_RCIF	set	101
	global	_RX9
_RX9	set	198
	global	_SPEN
_SPEN	set	199
	global	_TXIF
_TXIF	set	100
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_SPBRG
_SPBRG	set	153
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_TXSTA
_TXSTA	set	152
	global	_BRGH
_BRGH	set	1218
	global	_RCIE
_RCIE	set	1125
	global	_SYNC
_SYNC	set	1220
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
	global	_TRMT
_TRMT	set	1217
	global	_TXIE
_TXIE	set	1124
	global	_ANSEL
_ANSEL	set	392
	global	_ANSELH
_ANSELH	set	393
	global	_BRG16
_BRG16	set	3131
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_4:	
	retlw	67	;'C'
	retlw	108	;'l'
	retlw	101	;'e'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	32	;' '
	retlw	65	;'A'
	retlw	108	;'l'
	retlw	108	;'l'
	retlw	0
psect	strings
	
STR_6:	
	retlw	83	;'S'
	retlw	101	;'e'
	retlw	103	;'g'
	retlw	32	;' '
	retlw	77	;'M'
	retlw	111	;'o'
	retlw	100	;'d'
	retlw	101	;'e'
	retlw	0
psect	strings
	
STR_5:	
	retlw	78	;'N'
	retlw	117	;'u'
	retlw	109	;'m'
	retlw	32	;' '
	retlw	77	;'M'
	retlw	111	;'o'
	retlw	100	;'d'
	retlw	101	;'e'
	retlw	0
psect	strings
	
STR_1:	
	retlw	65	;'A'
	retlw	68	;'D'
	retlw	82	;'R'
	retlw	32	;' '
	retlw	48	;'0'
	retlw	0
psect	strings
	
STR_7:	
	retlw	83	;'S'
	retlw	108	;'l'
	retlw	101	;'e'
	retlw	101	;'e'
	retlw	112	;'p'
	retlw	0
psect	strings
	
STR_8:	
	retlw	87	;'W'
	retlw	97	;'a'
	retlw	107	;'k'
	retlw	101	;'e'
	retlw	0
psect	strings
	
STR_2:	
	retlw	65	;'A'
	retlw	77	;'M'
	retlw	0
psect	strings
	
STR_3:	
	retlw	80	;'P'
	retlw	77	;'M'
	retlw	0
psect	strings
	file	"em7segDriver.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_address:
       ds      1

_data:
       ds      1

_m_address:
       ds      1

_received:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_digit:
       ds      1

_num_seg_wrt_flg:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_clr_flgs:
       ds      2

_set_flgs:
       ds      2

psect	dataBANK3,class=BANK3,space=1
global __pdataBANK3
__pdataBANK3:
	file	"C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\USART.h"
uart_txt@F1620:
       ds      69

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	bsf	status, 5	;RP0=1, select bank1
	clrf	((__pbssBANK1)+0)&07Fh
	clrf	((__pbssBANK1)+1)&07Fh
	clrf	((__pbssBANK1)+2)&07Fh
	clrf	((__pbssBANK1)+3)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK3
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK3
	bsf	status, 7	;select IRP bank2
	movlw low(__pdataBANK3+69)
	movwf btemp-1,f
	movlw high(__pidataBANK3)
	movwf btemp,f
	movlw low(__pidataBANK3)
	movwf btemp+1,f
	movlw low(__pdataBANK3)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1
global __pcstackBANK1
__pcstackBANK1:
	global	?_delays
?_delays:	; 0 bytes @ 0x0
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_uart_init
?_uart_init:	; 2 bytes @ 0x0
	global	uart_init@rx_interrupt_enable
uart_init@rx_interrupt_enable:	; 1 bytes @ 0x0
	global	delays@x
delays@x:	; 4 bytes @ 0x0
	global	delay@x
delay@x:	; 4 bytes @ 0x0
	ds	1
	global	uart_init@tx_interrupt_enable
uart_init@tx_interrupt_enable:	; 1 bytes @ 0x1
	ds	1
	global	??_uart_init
??_uart_init:	; 0 bytes @ 0x2
	global	uart_init@baud
uart_init@baud:	; 1 bytes @ 0x2
	ds	2
	global	?_write_disp
?_write_disp:	; 0 bytes @ 0x4
	global	??_delays
??_delays:	; 0 bytes @ 0x4
	global	??_delay
??_delay:	; 0 bytes @ 0x4
	global	write_disp@digit
write_disp@digit:	; 1 bytes @ 0x4
	global	delays@y
delays@y:	; 2 bytes @ 0x4
	ds	1
	global	write_disp@segment
write_disp@segment:	; 1 bytes @ 0x5
	ds	1
	global	??_write_disp
??_write_disp:	; 0 bytes @ 0x6
	global	delays@z
delays@z:	; 2 bytes @ 0x6
	ds	1
	global	write_disp@set_clr
write_disp@set_clr:	; 1 bytes @ 0x7
	ds	1
	global	??_freshen_disp
??_freshen_disp:	; 0 bytes @ 0x8
	ds	1
	global	freshen_disp@d
freshen_disp@d:	; 2 bytes @ 0x9
	ds	2
	global	freshen_disp@d_1755
freshen_disp@d_1755:	; 2 bytes @ 0xB
	ds	2
	global	freshen_disp@cnt
freshen_disp@cnt:	; 1 bytes @ 0xD
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xE
	global	main@k
main@k:	; 2 bytes @ 0xE
	ds	2
	global	main@j
main@j:	; 2 bytes @ 0x10
	ds	2
	global	main@i
main@i:	; 2 bytes @ 0x12
	ds	2
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_txd
??_txd:	; 0 bytes @ 0x0
	global	?_freshen_disp
?_freshen_disp:	; 0 bytes @ 0x0
	global	?_decode_num
?_decode_num:	; 0 bytes @ 0x0
	global	?_serial
?_serial:	; 0 bytes @ 0x0
	global	?i1_delay
?i1_delay:	; 0 bytes @ 0x0
	global	?_strcpy
?_strcpy:	; 1 bytes @ 0x0
	global	?_strlen
?_strlen:	; 2 bytes @ 0x0
	global	?_txd
?_txd:	; 2 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	txd@write_data
txd@write_data:	; 1 bytes @ 0x0
	global	decode_num@num
decode_num@num:	; 1 bytes @ 0x0
	global	strcpy@from
strcpy@from:	; 1 bytes @ 0x0
	global	i1delay@x
i1delay@x:	; 4 bytes @ 0x0
	ds	1
	global	??_strcpy
??_strcpy:	; 0 bytes @ 0x1
	global	??_decode_num
??_decode_num:	; 0 bytes @ 0x1
	global	decode_num@dig
decode_num@dig:	; 1 bytes @ 0x1
	ds	1
	global	??_strlen
??_strlen:	; 0 bytes @ 0x2
	global	decode_num@temp
decode_num@temp:	; 1 bytes @ 0x2
	global	strcpy@to
strcpy@to:	; 1 bytes @ 0x2
	global	strlen@s
strlen@s:	; 1 bytes @ 0x2
	ds	1
	global	strcpy@cp
strcpy@cp:	; 1 bytes @ 0x3
	global	strlen@cp
strlen@cp:	; 1 bytes @ 0x3
	ds	1
	global	??i1_delay
??i1_delay:	; 0 bytes @ 0x4
	global	?i1_write_disp
?i1_write_disp:	; 0 bytes @ 0x4
	global	?_uart_txt
?_uart_txt:	; 2 bytes @ 0x4
	global	i1write_disp@digit
i1write_disp@digit:	; 1 bytes @ 0x4
	global	uart_txt@string
uart_txt@string:	; 2 bytes @ 0x4
	ds	1
	global	i1write_disp@segment
i1write_disp@segment:	; 1 bytes @ 0x5
	ds	1
	global	??_uart_txt
??_uart_txt:	; 0 bytes @ 0x6
	global	??i1_write_disp
??i1_write_disp:	; 0 bytes @ 0x6
	ds	1
	global	i1write_disp@set_clr
i1write_disp@set_clr:	; 1 bytes @ 0x7
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	uart_txt@str
uart_txt@str:	; 69 bytes @ 0x0
	ds	69
	global	uart_txt@len
uart_txt@len:	; 2 bytes @ 0x45
	ds	2
	global	uart_txt@cnt
uart_txt@cnt:	; 2 bytes @ 0x47
	ds	2
	global	??_serial
??_serial:	; 0 bytes @ 0x49
	ds	5
;;Data sizes: Strings 51, constant 0, data 69, bss 10, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      14
;; BANK0           80     78      80
;; BANK1           80     20      24
;; BANK3           96      0      69
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_strlen	unsigned int  size(1) Largest target is 69
;;		 -> uart_txt@str(BANK0[69]), 
;;
;; ?_strcpy	PTR unsigned char  size(1) Largest target is 69
;;		 -> uart_txt@str(BANK0[69]), 
;;
;; strlen@s	PTR const unsigned char  size(1) Largest target is 69
;;		 -> uart_txt@str(BANK0[69]), 
;;
;; strlen@cp	PTR const unsigned char  size(1) Largest target is 69
;;		 -> uart_txt@str(BANK0[69]), 
;;
;; strcpy@from	PTR const unsigned char  size(1) Largest target is 8192
;;		 -> ROM(CODE[8192]), 
;;
;; strcpy@to	PTR unsigned char  size(1) Largest target is 69
;;		 -> uart_txt@str(BANK0[69]), 
;;
;; strcpy@cp	PTR unsigned char  size(1) Largest target is 69
;;		 -> uart_txt@str(BANK0[69]), 
;;
;; sp__strcpy	PTR unsigned char  size(1) Largest target is 69
;;		 -> uart_txt@str(BANK0[69]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _serial in COMMON
;;
;;   _serial->_uart_txt
;;   i1_write_disp->i1_delay
;;   _uart_txt->_strcpy
;;   _uart_txt->_strlen
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _serial in BANK0
;;
;;   _serial->_uart_txt
;;
;; Critical Paths under _main in BANK1
;;
;;   _main->_freshen_disp
;;   _freshen_disp->_write_disp
;;   _freshen_disp->_delays
;;   _write_disp->_delay
;;
;; Critical Paths under _serial in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _serial in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _serial in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 6     6      0    1085
;;                                             14 BANK1      6     6      0
;;                             _delays
;;                         _write_disp
;;                          _uart_init
;;                       _freshen_disp
;; ---------------------------------------------------------------------------------
;; (1) _freshen_disp                                         6     6      0     589
;;                                              8 BANK1      6     6      0
;;                         _write_disp
;;                             _delays
;; ---------------------------------------------------------------------------------
;; (2) _write_disp                                           4     2      2     111
;;                                              4 BANK1      4     2      2
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (3) _delay                                                4     0      4      23
;;                                              0 BANK1      4     0      4
;; ---------------------------------------------------------------------------------
;; (2) _delays                                               8     4      4      71
;;                                              0 BANK1      8     4      4
;; ---------------------------------------------------------------------------------
;; (1) _uart_init                                            3     1      2     110
;;                                              0 BANK1      3     1      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _serial                                               5     5      0    1170
;;                                             73 BANK0      5     5      0
;;                         _decode_num
;;                       i1_write_disp
;;                           _uart_txt
;; ---------------------------------------------------------------------------------
;; (5) i1_write_disp                                         4     2      2     367
;;                                              4 COMMON     4     2      2
;;                            i1_delay
;; ---------------------------------------------------------------------------------
;; (5) _uart_txt                                            79    77      2     346
;;                                              4 COMMON     6     4      2
;;                                              0 BANK0     73    73      0
;;                             _strcpy
;;                             _strlen
;;                                _txd
;; ---------------------------------------------------------------------------------
;; (6) i1_delay                                              4     0      4      75
;;                                              0 COMMON     4     0      4
;; ---------------------------------------------------------------------------------
;; (5) _decode_num                                           3     2      1     457
;;                                              0 COMMON     3     2      1
;; ---------------------------------------------------------------------------------
;; (6) _strlen                                               4     2      2      89
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (7) _strcpy                                               4     3      1      73
;;                                              0 COMMON     4     3      1
;; ---------------------------------------------------------------------------------
;; (6) _txd                                                  1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 7
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _delays
;;   _write_disp
;;     _delay
;;   _uart_init
;;   _freshen_disp
;;     _write_disp
;;       _delay
;;     _delays
;;
;; _serial (ROOT)
;;   _decode_num
;;   i1_write_disp
;;     i1_delay
;;   _uart_txt
;;     _strcpy
;;     _strlen
;;     _txd
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0      45       9       71.9%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50     14      18       7       30.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      C6      12        0.0%
;;ABS                  0      0      BB       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       B       2        0.0%
;;BANK0               50     4E      50       5      100.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      A       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 272 in file "C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2   18[BANK1 ] int 
;;  j               2   16[BANK1 ] int 
;;  k               2   14[BANK1 ] int 
;; Return value:  Size  Location     Type
;;                  2  1149[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       6       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_delays
;;		_write_disp
;;		_uart_init
;;		_freshen_disp
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
	line	272
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 1
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	273
	
l3316:	
;em7segDriver.c: 273: ANSEL=0x00;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(392)^0180h	;volatile
	line	274
;em7segDriver.c: 274: ANSELH=0x00;
	clrf	(393)^0180h	;volatile
	line	275
;em7segDriver.c: 275: TRISA=0x00;
	bcf	status, 6	;RP1=0, select bank1
	clrf	(133)^080h	;volatile
	line	276
	
l3318:	
;em7segDriver.c: 276: TRISB=0xFF;
	movlw	(0FFh)
	movwf	(134)^080h	;volatile
	line	277
	
l3320:	
;em7segDriver.c: 277: TRISC=0x00;
	clrf	(135)^080h	;volatile
	line	278
	
l3322:	
;em7segDriver.c: 278: PORTA=0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	279
	
l3324:	
;em7segDriver.c: 279: PORTC=0x00;
	clrf	(7)	;volatile
	line	281
	
l3326:	
;em7segDriver.c: 281: ((OPTION_REG) &= ~(1 << (7)));
	bsf	status, 5	;RP0=1, select bank1
	bcf	(129)^080h+(7/8),(7)&7	;volatile
	line	284
	
l3328:	
;em7segDriver.c: 284: ((OSCCON) |= 1 << (6));
	bsf	(143)^080h+(6/8),(6)&7	;volatile
	line	285
	
l3330:	
;em7segDriver.c: 285: ((OSCCON) |= 1 << (5));
	bsf	(143)^080h+(5/8),(5)&7	;volatile
	line	286
	
l3332:	
;em7segDriver.c: 286: ((OSCCON) |= 1 << (4));
	bsf	(143)^080h+(4/8),(4)&7	;volatile
	line	288
	
l3334:	
;em7segDriver.c: 288: if(!RB0==1){
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(48/8),(48)&7
	goto	u1441
	goto	u1440
u1441:
	goto	l3360
u1440:
	line	301
	
l3354:	
;em7segDriver.c: 301: delays(5000);
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_delays+3)^080h
	movlw	0
	movwf	(?_delays+2)^080h
	movlw	013h
	movwf	(?_delays+1)^080h
	movlw	088h
	movwf	(?_delays)^080h

	fcall	_delays
	line	302
	
l3356:	
;em7segDriver.c: 302: write_disp(0,0,0);
	clrf	(?_write_disp)^080h
	clrf	0+(?_write_disp)^080h+01h
	movlw	(0)
	fcall	_write_disp
	line	303
	
l3358:	
;em7segDriver.c: 303: write_disp(1,0,0);
	clrf	(?_write_disp)^080h
	clrf	0+(?_write_disp)^080h+01h
	movlw	(01h)
	fcall	_write_disp
	goto	l3354
	line	325
	
l3360:	
;em7segDriver.c: 319: }
;em7segDriver.c: 320: }
;em7segDriver.c: 325: delays(100);
	movlw	064h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_delays)^080h
	clrf	(?_delays+1)^080h
	clrf	(?_delays+2)^080h
	clrf	(?_delays+3)^080h

	fcall	_delays
	line	327
	
l3362:	
;em7segDriver.c: 327: uart_init(BAUDRATE,1,0);
	clrf	(?_uart_init)^080h
	incf	(?_uart_init)^080h,f
	clrf	0+(?_uart_init)^080h+01h
	movlw	(03h)
	fcall	_uart_init
	line	331
	
l3364:	
;em7segDriver.c: 331: for(int k=2;k>0;k--){
	movlw	02h
	movwf	(main@k)^080h
	clrf	(main@k+1)^080h
	line	332
	
l3370:	
;em7segDriver.c: 332: for(int j=0;j<2;j++){
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(main@j)^080h
	clrf	(main@j+1)^080h
	line	333
	
l3376:	
;em7segDriver.c: 333: for(int i=0;i<8;i++){
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(main@i)^080h
	clrf	(main@i+1)^080h
	line	334
	
l3382:	
;em7segDriver.c: 334: write_disp(k-1,j,i);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@j)^080h,w
	movwf	(?_write_disp)^080h
	movf	(main@i)^080h,w
	movwf	0+(?_write_disp)^080h+01h
	movf	(main@k)^080h,w
	addlw	0FFh
	fcall	_write_disp
	line	335
;em7segDriver.c: 335: delays(1000);
	movlw	0
	movwf	(?_delays+3)^080h
	movlw	0
	movwf	(?_delays+2)^080h
	movlw	03h
	movwf	(?_delays+1)^080h
	movlw	0E8h
	movwf	(?_delays)^080h

	fcall	_delays
	line	333
	
l3384:	
	incf	(main@i)^080h,f
	skipnz
	incf	(main@i+1)^080h,f
	
l3386:	
	movf	(main@i+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u1455
	movlw	low(08h)
	subwf	(main@i)^080h,w
u1455:

	skipc
	goto	u1451
	goto	u1450
u1451:
	goto	l3382
u1450:
	line	332
	
l3388:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	(main@j)^080h,f
	skipnz
	incf	(main@j+1)^080h,f
	
l3390:	
	movf	(main@j+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(02h))^80h
	subwf	btemp+1,w
	skipz
	goto	u1465
	movlw	low(02h)
	subwf	(main@j)^080h,w
u1465:

	skipc
	goto	u1461
	goto	u1460
u1461:
	goto	l3376
u1460:
	line	331
	
l3392:	
	movlw	-1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(main@k)^080h,f
	skipc
	decf	(main@k+1)^080h,f
	
l3394:	
	movf	(main@k+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01h))^80h
	subwf	btemp+1,w
	skipz
	goto	u1475
	movlw	low(01h)
	subwf	(main@k)^080h,w
u1475:

	skipnc
	goto	u1471
	goto	u1470
u1471:
	goto	l3370
u1470:
	line	341
	
l3396:	
;em7segDriver.c: 341: if(clr_flgs[0]!=0||clr_flgs[1]!=0||set_flgs[0]!=0||set_flgs[1]!=0){
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_clr_flgs)^080h,f
	skipz
	goto	u1481
	goto	u1480
u1481:
	goto	l3404
u1480:
	
l3398:	
	movf	0+(_clr_flgs)^080h+01h,f
	skipz
	goto	u1491
	goto	u1490
u1491:
	goto	l3404
u1490:
	
l3400:	
	movf	(_set_flgs)^080h,f
	skipz
	goto	u1501
	goto	u1500
u1501:
	goto	l3404
u1500:
	
l3402:	
	movf	0+(_set_flgs)^080h+01h,w
	skipz
	goto	u1510
	goto	l3396
u1510:
	line	342
	
l3404:	
;em7segDriver.c: 342: freshen_disp();
	fcall	_freshen_disp
	goto	l3396
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	345
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_freshen_disp
psect	text282,local,class=CODE,delta=2
global __ptext282
__ptext282:

;; *************** function _freshen_disp *****************
;; Defined at:
;;		line 122 in file "C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  d               2   11[BANK1 ] int 
;;  d               2    9[BANK1 ] int 
;;  cnt             1   13[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       5       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_write_disp
;;		_delays
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text282
	file	"C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
	line	122
	global	__size_of_freshen_disp
	__size_of_freshen_disp	equ	__end_of_freshen_disp-_freshen_disp
	
_freshen_disp:	
	opt	stack 1
; Regs used in _freshen_disp: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	123
	
l3264:	
	line	124
;em7segDriver.c: 124: for(int d=0;d<2;d++){
	clrf	(freshen_disp@d)^080h
	clrf	(freshen_disp@d+1)^080h
	line	125
	
l3270:	
;em7segDriver.c: 125: cnt=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(freshen_disp@cnt)^080h
	line	126
;em7segDriver.c: 126: while(clr_flgs[d]!=0){
	goto	l3284
	line	127
	
l3272:	
;em7segDriver.c: 127: if(((clr_flgs[d]>>cnt)&0x001)==0){cnt++;}
	movf	(freshen_disp@d)^080h,w
	addlw	_clr_flgs&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_freshen_disp+0)^080h+0
	incf	(freshen_disp@cnt)^080h,w
	goto	u1344
u1345:
	clrc
	rrf	(??_freshen_disp+0)^080h+0,f
u1344:
	addlw	-1
	skipz
	goto	u1345
	btfsc	0+(??_freshen_disp+0)^080h+0,(0)&7
	goto	u1351
	goto	u1350
u1351:
	goto	l3276
u1350:
	
l3274:	
	incf	(freshen_disp@cnt)^080h,f
	goto	l3284
	line	129
	
l3276:	
;em7segDriver.c: 128: else{
;em7segDriver.c: 129: write_disp(0,d,cnt);
	movf	(freshen_disp@d)^080h,w
	movwf	(?_write_disp)^080h
	movf	(freshen_disp@cnt)^080h,w
	movwf	0+(?_write_disp)^080h+01h
	movlw	(0)
	fcall	_write_disp
	line	130
	
l3278:	
;em7segDriver.c: 130: ((clr_flgs[d]) &= ~(1 << (cnt)));
	movf	(freshen_disp@d)^080h,w
	addlw	_clr_flgs&0ffh
	movwf	fsr0
	movlw	(01h)
	movwf	(??_freshen_disp+0)^080h+0
	incf	(freshen_disp@cnt)^080h,w
	goto	u1364
u1365:
	clrc
	rlf	(??_freshen_disp+0)^080h+0,f
u1364:
	addlw	-1
	skipz
	goto	u1365
	movf	0+(??_freshen_disp+0)^080h+0,w
	xorlw	0ffh
	bcf	status, 7	;select IRP bank1
	andwf	indf,f
	line	131
	
l3280:	
;em7segDriver.c: 131: cnt++;
	incf	(freshen_disp@cnt)^080h,f
	line	33
	
l3282:	
;em7segDriver.c: 132: delays(animation_delay);
	movlw	0E8h
	movwf	(?_delays)^080h
	clrf	(?_delays+1)^080h
	clrf	(?_delays+2)^080h
	clrf	(?_delays+3)^080h

	fcall	_delays
	line	126
	
l3284:	
	movf	(freshen_disp@d)^080h,w
	addlw	_clr_flgs&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,f
	skipz
	goto	u1371
	goto	u1370
u1371:
	goto	l3272
u1370:
	line	124
	
l3286:	
	incf	(freshen_disp@d)^080h,f
	skipnz
	incf	(freshen_disp@d+1)^080h,f
	
l3288:	
	movf	(freshen_disp@d+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(02h))^80h
	subwf	btemp+1,w
	skipz
	goto	u1385
	movlw	low(02h)
	subwf	(freshen_disp@d)^080h,w
u1385:

	skipc
	goto	u1381
	goto	u1380
u1381:
	goto	l3270
u1380:
	line	137
	
l3290:	
;em7segDriver.c: 133: }
;em7segDriver.c: 134: }
;em7segDriver.c: 135: }
;em7segDriver.c: 137: for(int d=0;d<2;d++){
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(freshen_disp@d_1755)^080h
	clrf	(freshen_disp@d_1755+1)^080h
	line	138
	
l3296:	
;em7segDriver.c: 138: cnt=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(freshen_disp@cnt)^080h
	line	139
;em7segDriver.c: 139: while(set_flgs[d]!=0){
	goto	l3310
	line	140
	
l3298:	
;em7segDriver.c: 140: if(((set_flgs[d]>>cnt)&0x001)==0){cnt++;}
	movf	(freshen_disp@d_1755)^080h,w
	addlw	_set_flgs&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_freshen_disp+0)^080h+0
	incf	(freshen_disp@cnt)^080h,w
	goto	u1394
u1395:
	clrc
	rrf	(??_freshen_disp+0)^080h+0,f
u1394:
	addlw	-1
	skipz
	goto	u1395
	btfsc	0+(??_freshen_disp+0)^080h+0,(0)&7
	goto	u1401
	goto	u1400
u1401:
	goto	l3302
u1400:
	
l3300:	
	incf	(freshen_disp@cnt)^080h,f
	goto	l3310
	line	142
	
l3302:	
;em7segDriver.c: 141: else{
;em7segDriver.c: 142: write_disp(1,d,cnt);
	movf	(freshen_disp@d_1755)^080h,w
	movwf	(?_write_disp)^080h
	movf	(freshen_disp@cnt)^080h,w
	movwf	0+(?_write_disp)^080h+01h
	movlw	(01h)
	fcall	_write_disp
	line	143
	
l3304:	
;em7segDriver.c: 143: ((set_flgs[d]) &= ~(1 << (cnt)));
	movf	(freshen_disp@d_1755)^080h,w
	addlw	_set_flgs&0ffh
	movwf	fsr0
	movlw	(01h)
	movwf	(??_freshen_disp+0)^080h+0
	incf	(freshen_disp@cnt)^080h,w
	goto	u1414
u1415:
	clrc
	rlf	(??_freshen_disp+0)^080h+0,f
u1414:
	addlw	-1
	skipz
	goto	u1415
	movf	0+(??_freshen_disp+0)^080h+0,w
	xorlw	0ffh
	bcf	status, 7	;select IRP bank1
	andwf	indf,f
	line	144
	
l3306:	
;em7segDriver.c: 144: cnt++;
	incf	(freshen_disp@cnt)^080h,f
	line	33
	
l3308:	
;em7segDriver.c: 145: delays(animation_delay);
	movlw	0E8h
	movwf	(?_delays)^080h
	clrf	(?_delays+1)^080h
	clrf	(?_delays+2)^080h
	clrf	(?_delays+3)^080h

	fcall	_delays
	line	139
	
l3310:	
	movf	(freshen_disp@d_1755)^080h,w
	addlw	_set_flgs&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,f
	skipz
	goto	u1421
	goto	u1420
u1421:
	goto	l3298
u1420:
	line	137
	
l3312:	
	incf	(freshen_disp@d_1755)^080h,f
	skipnz
	incf	(freshen_disp@d_1755+1)^080h,f
	
l3314:	
	movf	(freshen_disp@d_1755+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(02h))^80h
	subwf	btemp+1,w
	skipz
	goto	u1435
	movlw	low(02h)
	subwf	(freshen_disp@d_1755)^080h,w
u1435:

	skipc
	goto	u1431
	goto	u1430
u1431:
	goto	l3296
u1430:
	
l1077:	
	line	150
;em7segDriver.c: 146: }
;em7segDriver.c: 147: }
;em7segDriver.c: 148: }
;em7segDriver.c: 150: RC2 = RC3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	bcf	(58/8),(58)&7
	line	152
	
l1083:	
	return
	opt stack 0
GLOBAL	__end_of_freshen_disp
	__end_of_freshen_disp:
;; =============== function _freshen_disp ends ============

	signat	_freshen_disp,88
	global	_write_disp
psect	text283,local,class=CODE,delta=2
global __ptext283
__ptext283:

;; *************** function _write_disp *****************
;; Defined at:
;;		line 178 in file "C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
;; Parameters:    Size  Location     Type
;;  set_clr         1    wreg     unsigned char 
;;  digit           1    4[BANK1 ] unsigned char 
;;  segment         1    5[BANK1 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  set_clr         1    7[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_delay
;; This function is called by:
;;		_freshen_disp
;;		_main
;; This function uses a non-reentrant model
;;
psect	text283
	file	"C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
	line	178
	global	__size_of_write_disp
	__size_of_write_disp	equ	__end_of_write_disp-_write_disp
	
_write_disp:	
	opt	stack 1
; Regs used in _write_disp: [wreg+status,2+status,0+btemp+1+pclath+cstack]
;write_disp@set_clr stored from wreg
	movwf	(write_disp@set_clr)^080h
	line	179
	
l3240:	
;em7segDriver.c: 179: if(digit==0){RC2 = 1;RC3 = 0;}else{RC2 = 0;RC3 = 1;}
	movf	(write_disp@digit)^080h,f
	skipz
	goto	u1281
	goto	u1280
u1281:
	goto	l1120
u1280:
	
l3242:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(58/8),(58)&7
	bcf	(59/8),(59)&7
	goto	l3244
	
l1120:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(58/8),(58)&7
	bsf	(59/8),(59)&7
	line	180
	
l3244:	
;em7segDriver.c: 180: delay(1000);
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_delay+3)^080h
	movlw	0
	movwf	(?_delay+2)^080h
	movlw	03h
	movwf	(?_delay+1)^080h
	movlw	0E8h
	movwf	(?_delay)^080h

	fcall	_delay
	line	186
	
l3246:	
;em7segDriver.c: 186: if(set_clr==1){
	decf	(write_disp@set_clr)^080h,w
	skipz
	goto	u1291
	goto	u1290
u1291:
	goto	l1122
u1290:
	line	187
	
l3248:	
;em7segDriver.c: 187: RC0 = RC1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	btfsc	(57/8),(57)&7
	goto	u1301
	goto	u1300
	
u1301:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	goto	u1314
u1300:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
u1314:
	line	188
	
l3250:	
;em7segDriver.c: 188: PORTA = ~(1<<segment);
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(??_write_disp+0)^080h+0
	incf	(write_disp@segment)^080h,w
	goto	u1324
u1325:
	clrc
	rlf	(??_write_disp+0)^080h+0,f
u1324:
	addlw	-1
	skipz
	goto	u1325
	movf	0+(??_write_disp+0)^080h+0,w
	xorlw	0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	189
;em7segDriver.c: 189: }else{
	goto	l3254
	
l1122:	
	line	190
;em7segDriver.c: 190: RC0 = RC1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(57/8),(57)&7
	bcf	(56/8),(56)&7
	line	191
	
l3252:	
;em7segDriver.c: 191: PORTA = (1<<segment);
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(??_write_disp+0)^080h+0
	incf	(write_disp@segment)^080h,w
	goto	u1334
u1335:
	clrc
	rlf	(??_write_disp+0)^080h+0,f
u1334:
	addlw	-1
	skipz
	goto	u1335
	movf	0+(??_write_disp+0)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	31
	
l3254:	
;em7segDriver.c: 192: }
;em7segDriver.c: 193: delay(pulse_length);
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_delay+3)^080h
	movlw	0
	movwf	(?_delay+2)^080h
	movlw	07h
	movwf	(?_delay+1)^080h
	movlw	0D0h
	movwf	(?_delay)^080h

	fcall	_delay
	line	194
	
l3256:	
;em7segDriver.c: 194: RC2 = RC3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(59/8),(59)&7
	bcf	(58/8),(58)&7
	line	195
	
l3258:	
;em7segDriver.c: 195: RC0 = RC1 = 0;
	bcf	(57/8),(57)&7
	bcf	(56/8),(56)&7
	line	196
	
l3260:	
;em7segDriver.c: 196: PORTA = 0x00;
	clrf	(5)	;volatile
	line	198
	
l3262:	
;em7segDriver.c: 198: delay(19*pulse_length);
	movlw	0
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_delay+3)^080h
	movlw	0
	movwf	(?_delay+2)^080h
	movlw	094h
	movwf	(?_delay+1)^080h
	movlw	070h
	movwf	(?_delay)^080h

	fcall	_delay
	line	199
	
l1124:	
	return
	opt stack 0
GLOBAL	__end_of_write_disp
	__end_of_write_disp:
;; =============== function _write_disp ends ============

	signat	_write_disp,12408
	global	_delay
psect	text284,local,class=CODE,delta=2
global __ptext284
__ptext284:

;; *************** function _delay *****************
;; Defined at:
;;		line 96 in file "C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
;; Parameters:    Size  Location     Type
;;  x               4    0[BANK1 ] long 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, btemp+1
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       4       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_write_disp
;; This function uses a non-reentrant model
;;
psect	text284
	file	"C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
	line	96
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 1
; Regs used in _delay: [wreg+btemp+1]
	line	97
	
l3046:	
;em7segDriver.c: 97: while(x>0){
	goto	l3050
	line	98
	
l3048:	
;em7segDriver.c: 98: x--;
	movlw	0FFh
	addwf	(delay@x)^080h,f
	movlw	0FFh
	skipc
	addwf	(delay@x+1)^080h,f
	movlw	0FFh
	skipc
	addwf	(delay@x+2)^080h,f
	movlw	0FFh
	skipc
	addwf	(delay@x+3)^080h,f
	line	97
	
l3050:	
	movf	(delay@x+3)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	0
	xorlw	80h
	subwf	btemp+1,w
	
	skipz
	goto	u923
	movlw	0
	subwf	(delay@x+2)^080h,w
	skipz
	goto	u923
	movlw	0
	subwf	(delay@x+1)^080h,w
	skipz
	goto	u923
	movlw	01h
	subwf	(delay@x)^080h,w
u923:
	skipnc
	goto	u921
	goto	u920
u921:
	goto	l3048
u920:
	line	100
	
l1054:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
	global	_delays
psect	text285,local,class=CODE,delta=2
global __ptext285
__ptext285:

;; *************** function _delays *****************
;; Defined at:
;;		line 84 in file "C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
;; Parameters:    Size  Location     Type
;;  x               4    0[BANK1 ] long 
;; Auto vars:     Size  Location     Type
;;  z               2    6[BANK1 ] unsigned int 
;;  y               2    4[BANK1 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       4       0       0
;;      Locals:         0       0       4       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_freshen_disp
;;		_main
;; This function uses a non-reentrant model
;;
psect	text285
	file	"C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
	line	84
	global	__size_of_delays
	__size_of_delays	equ	__end_of_delays-_delays
	
_delays:	
	opt	stack 2
; Regs used in _delays: [wreg+status,2+status,0+btemp+1]
	line	85
	
l3032:	
;em7segDriver.c: 85: unsigned int y=0, z=0;
	clrf	(delays@y)^080h
	clrf	(delays@y+1)^080h
	clrf	(delays@z)^080h
	clrf	(delays@z+1)^080h
	line	86
;em7segDriver.c: 86: while(x>0){
	goto	l3044
	line	89
	
l3034:	
;em7segDriver.c: 89: z++;}
	incf	(delays@z)^080h,f
	skipnz
	incf	(delays@z+1)^080h,f
	line	88
	
l3036:	
	movlw	high(03E8h)
	subwf	(delays@z+1)^080h,w
	movlw	low(03E8h)
	skipnz
	subwf	(delays@z)^080h,w
	skipc
	goto	u891
	goto	u890
u891:
	goto	l3034
u890:
	line	90
	
l3038:	
;em7segDriver.c: 90: y++;
	incf	(delays@y)^080h,f
	skipnz
	incf	(delays@y+1)^080h,f
	line	87
	
l3040:	
	movlw	high(01F4h)
	subwf	(delays@y+1)^080h,w
	movlw	low(01F4h)
	skipnz
	subwf	(delays@y)^080h,w
	skipc
	goto	u901
	goto	u900
u901:
	goto	l3036
u900:
	line	92
	
l3042:	
;em7segDriver.c: 91: }
;em7segDriver.c: 92: x--;
	movlw	0FFh
	addwf	(delays@x)^080h,f
	movlw	0FFh
	skipc
	addwf	(delays@x+1)^080h,f
	movlw	0FFh
	skipc
	addwf	(delays@x+2)^080h,f
	movlw	0FFh
	skipc
	addwf	(delays@x+3)^080h,f
	line	86
	
l3044:	
	movf	(delays@x+3)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	0
	xorlw	80h
	subwf	btemp+1,w
	
	skipz
	goto	u913
	movlw	0
	subwf	(delays@x+2)^080h,w
	skipz
	goto	u913
	movlw	0
	subwf	(delays@x+1)^080h,w
	skipz
	goto	u913
	movlw	01h
	subwf	(delays@x)^080h,w
u913:
	skipnc
	goto	u911
	goto	u910
u911:
	goto	l3040
u910:
	line	94
	
l1048:	
	return
	opt stack 0
GLOBAL	__end_of_delays
	__end_of_delays:
;; =============== function _delays ends ============

	signat	_delays,4216
	global	_uart_init
psect	text286,local,class=CODE,delta=2
global __ptext286
__ptext286:

;; *************** function _uart_init *****************
;; Defined at:
;;		line 37 in file "C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\USART.h"
;; Parameters:    Size  Location     Type
;;  baud            1    wreg     unsigned char 
;;  rx_interrupt    1    0[BANK1 ] unsigned char 
;;  tx_interrupt    1    1[BANK1 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  baud            1    2[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK1 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text286
	file	"C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\USART.h"
	line	37
	global	__size_of_uart_init
	__size_of_uart_init	equ	__end_of_uart_init-_uart_init
	
_uart_init:	
	opt	stack 3
; Regs used in _uart_init: [wreg-fsr0h+status,2+status,0]
;uart_init@baud stored from wreg
	movwf	(uart_init@baud)^080h
	line	38
	
l2958:	
;USART.h: 38: TRISC6=0;
	bcf	(1086/8)^080h,(1086)&7
	line	39
;USART.h: 39: TRISC7=1;
	bsf	(1087/8)^080h,(1087)&7
	line	40
	
l2960:	
;USART.h: 40: TXSTA=0b00100100;
	movlw	(024h)
	movwf	(152)^080h	;volatile
	line	41
;USART.h: 41: RCSTA=0b10010000;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(24)	;volatile
	line	43
	
l2962:	
;USART.h: 43: SPEN=1;
	bsf	(199/8),(199)&7
	line	44
	
l2964:	
;USART.h: 44: RX9=0;
	bcf	(198/8),(198)&7
	line	45
	
l2966:	
;USART.h: 45: SYNC=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	46
	
l2968:	
;USART.h: 46: BRGH=1;
	bsf	(1218/8)^080h,(1218)&7
	line	47
	
l2970:	
;USART.h: 47: BRG16=1;
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3131/8)^0180h,(3131)&7
	line	49
	
l2972:	
;USART.h: 49: GIE=0;
	bcf	(95/8),(95)&7
	line	51
;USART.h: 51: if(rx_interrupt_enable==1){
	bcf	status, 6	;RP1=0, select bank1
	decf	(uart_init@rx_interrupt_enable)^080h,w
	skipz
	goto	u801
	goto	u800
u801:
	goto	l2976
u800:
	line	52
	
l2974:	
;USART.h: 52: CREN=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(196/8),(196)&7
	line	53
;USART.h: 53: ADDEN=1;
	bsf	(195/8),(195)&7
	line	54
;USART.h: 54: RCIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1125/8)^080h,(1125)&7
	line	57
	
l2976:	
;USART.h: 55: }
;USART.h: 57: if(tx_interrupt_enable==1){
	decf	(uart_init@tx_interrupt_enable)^080h,w
	skipz
	goto	u811
	goto	u810
u811:
	goto	l2980
u810:
	line	58
	
l2978:	
;USART.h: 58: TXIE=1;
	bsf	(1124/8)^080h,(1124)&7
	line	61
	
l2980:	
;USART.h: 59: }
;USART.h: 61: if(rx_interrupt_enable || tx_interrupt_enable){
	movf	(uart_init@rx_interrupt_enable)^080h,f
	skipz
	goto	u821
	goto	u820
u821:
	goto	l1005
u820:
	
l2982:	
	movf	(uart_init@tx_interrupt_enable)^080h,w
	skipz
	goto	u830
	goto	l3002
u830:
	
l1005:	
	line	62
;USART.h: 62: PEIE=1;
	bsf	(94/8),(94)&7
	line	63
;USART.h: 63: GIE=1;
	bsf	(95/8),(95)&7
	goto	l3002
	line	68
	
l2984:	
;USART.h: 68: SPBRG=6666;
	movlw	(0Ah)
	movwf	(153)^080h	;volatile
	line	69
;USART.h: 69: break;
	goto	l1016
	line	71
	
l2986:	
;USART.h: 71: SPBRG=1666;
	movlw	(082h)
	movwf	(153)^080h	;volatile
	line	72
;USART.h: 72: break;
	goto	l1016
	line	74
	
l2988:	
;USART.h: 74: SPBRG=832;
	movlw	(040h)
	movwf	(153)^080h	;volatile
	line	75
;USART.h: 75: break;
	goto	l1016
	line	77
	
l2990:	
;USART.h: 77: SPBRG=207;
	movlw	(0CFh)
	movwf	(153)^080h	;volatile
	line	78
;USART.h: 78: break;
	goto	l1016
	line	80
	
l2992:	
;USART.h: 80: SPBRG=191;
	movlw	(0BFh)
	movwf	(153)^080h	;volatile
	line	81
;USART.h: 81: break;
	goto	l1016
	line	83
	
l2994:	
;USART.h: 83: SPBRG=103;
	movlw	(067h)
	movwf	(153)^080h	;volatile
	line	84
;USART.h: 84: break;
	goto	l1016
	line	86
	
l2996:	
;USART.h: 86: SPBRG=34;
	movlw	(022h)
	movwf	(153)^080h	;volatile
	line	87
;USART.h: 87: break;
	goto	l1016
	line	89
	
l2998:	
;USART.h: 89: SPBRG=16;
	movlw	(010h)
	movwf	(153)^080h	;volatile
	line	90
;USART.h: 90: break;
	goto	l1016
	line	66
	
l3002:	
	movf	(uart_init@baud)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 0 to 7
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           25    13 (average)
; direct_byte           32     8 (fixed)
; jumptable            260     6 (fixed)
; rangetable            12     6 (fixed)
; spacedrange           22     9 (fixed)
; locatedrange           8     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l2984
	xorlw	1^0	; case 1
	skipnz
	goto	l2986
	xorlw	2^1	; case 2
	skipnz
	goto	l2988
	xorlw	3^2	; case 3
	skipnz
	goto	l2990
	xorlw	4^3	; case 4
	skipnz
	goto	l2992
	xorlw	5^4	; case 5
	skipnz
	goto	l2994
	xorlw	6^5	; case 6
	skipnz
	goto	l2996
	xorlw	7^6	; case 7
	skipnz
	goto	l2998
	goto	l1016
	opt asmopt_on

	line	92
	
l1016:	
	return
	opt stack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
;; =============== function _uart_init ends ============

	signat	_uart_init,12410
	global	_serial
psect	text287,local,class=CODE,delta=2
global __ptext287
__ptext287:

;; *************** function _serial *****************
;; Defined at:
;;		line 210 in file "C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       5       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_decode_num
;;		i1_write_disp
;;		_uart_txt
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text287
	file	"C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
	line	210
	global	__size_of_serial
	__size_of_serial	equ	__end_of_serial-_serial
	
_serial:	
	opt	stack 1
; Regs used in _serial: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_serial+1)
	movf	fsr0,w
	movwf	(??_serial+2)
	movf	pclath,w
	movwf	(??_serial+3)
	movf	btemp+1,w
	movwf	(??_serial+4)
	ljmp	_serial
psect	text287
	line	211
	
i1l3122:	
;em7segDriver.c: 211: RA7=1;
	bsf	(47/8),(47)&7
	line	212
;em7segDriver.c: 212: if(RCIF){
	btfss	(101/8),(101)&7
	goto	u109_21
	goto	u109_20
u109_21:
	goto	i1l3208
u109_20:
	line	214
	
i1l3124:	
;em7segDriver.c: 214: received = RCREG;
	movf	(26),w	;volatile
	movwf	(_received)
	line	215
	
i1l3126:	
;em7segDriver.c: 215: address = (received&0xE0)>>5;
	movf	(_received),w
	movwf	(??_serial+0)+0
	movlw	05h
u110_25:
	clrc
	rrf	(??_serial+0)+0,f
	addlw	-1
	skipz
	goto	u110_25
	movf	0+(??_serial+0)+0,w
	movwf	(_address)
	
i1l3128:	
	movlw	(07h)
	andwf	(_address),f
	line	216
	
i1l3130:	
;em7segDriver.c: 216: digit = ((received>>4)&0x001);
	swapf	(_received),w
	andlw	(0ffh shr 4) & 0ffh
	movwf	(_digit)
	
i1l3132:	
	movlw	(01h)
	andwf	(_digit),f
	line	217
;em7segDriver.c: 217: data = received&0x0F;
	movf	(_received),w
	movwf	(_data)
	
i1l3134:	
	movlw	(0Fh)
	andwf	(_data),f
	line	218
	
i1l3136:	
;em7segDriver.c: 218: if(address==m_address){
	movf	(_address),w
	xorwf	(_m_address),w
	skipz
	goto	u111_21
	goto	u111_20
u111_21:
	goto	i1l3148
u111_20:
	line	219
	
i1l3138:	
;em7segDriver.c: 219: if(num_seg_wrt_flg==0){decode_num(digit,data);}
	movf	(_num_seg_wrt_flg),f
	skipz
	goto	u112_21
	goto	u112_20
u112_21:
	goto	i1l3142
u112_20:
	
i1l3140:	
	movf	(_data),w
	movwf	(?_decode_num)
	movf	(_digit),w
	fcall	_decode_num
	goto	i1l3146
	line	220
	
i1l3142:	
;em7segDriver.c: 220: else{write_disp(((data>>3)&0x001),digit,0x7&data);RC2 = RC3 = 0;}
	movf	(_data),w
	movwf	0+(?i1_write_disp)+01h
	movlw	(07h)
	andwf	0+(?i1_write_disp)+01h,f
	movf	(_digit),w
	movwf	(?i1_write_disp)
	movf	(_data),w
	movwf	(??_serial+0)+0
	clrc
	rrf	(??_serial+0)+0,f
	clrc
	rrf	(??_serial+0)+0,f
	clrc
	rrf	(??_serial+0)+0,f
	movf	0+(??_serial+0)+0,w
	andlw	01h
	fcall	i1_write_disp
	
i1l3144:	
	bcf	(59/8),(59)&7
	bcf	(58/8),(58)&7
	line	221
	
i1l3146:	
;em7segDriver.c: 221: uart_txt("ADR 0");
	movlw	low((STR_1-__stringbase))
	movwf	(?_uart_txt)
	movlw	80h
	movwf	(?_uart_txt+1)
	fcall	_uart_txt
	line	224
	
i1l3148:	
;em7segDriver.c: 222: }
;em7segDriver.c: 224: if(address==0b111){
	movf	(_address),w
	xorlw	07h
	skipz
	goto	u113_21
	goto	u113_20
u113_21:
	goto	i1l3208
u113_20:
	line	225
	
i1l3150:	
;em7segDriver.c: 225: if(m_address==2){
	movf	(_m_address),w
	xorlw	02h
	skipz
	goto	u114_21
	goto	u114_20
u114_21:
	goto	i1l3164
u114_20:
	line	226
	
i1l3152:	
;em7segDriver.c: 226: if(data==0b1001){
	movf	(_data),w
	xorlw	09h
	skipz
	goto	u115_21
	goto	u115_20
u115_21:
	goto	i1l3158
u115_20:
	line	227
	
i1l3154:	
;em7segDriver.c: 227: set_flgs[1]=0b01110011;
	movlw	(073h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_set_flgs)^080h+01h
	line	228
;em7segDriver.c: 228: clr_flgs[1]=0b10001100;
	movlw	(08Ch)
	movwf	0+(_clr_flgs)^080h+01h
	line	229
	
i1l3156:	
;em7segDriver.c: 229: uart_txt("AM");
	movlw	low((STR_2-__stringbase))
	movwf	(?_uart_txt)
	movlw	80h
	movwf	(?_uart_txt+1)
	fcall	_uart_txt
	line	230
;em7segDriver.c: 230: }else if(data==0b1000){
	goto	i1l3164
	
i1l3158:	
	movf	(_data),w
	xorlw	08h
	skipz
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l3164
u116_20:
	line	231
	
i1l3160:	
;em7segDriver.c: 231: set_flgs[1]=0b01110111;
	movlw	(077h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	0+(_set_flgs)^080h+01h
	line	232
;em7segDriver.c: 232: clr_flgs[1]=0b00001000;
	movlw	(08h)
	movwf	0+(_clr_flgs)^080h+01h
	line	233
	
i1l3162:	
;em7segDriver.c: 233: uart_txt("PM");
	movlw	low((STR_3-__stringbase))
	movwf	(?_uart_txt)
	movlw	80h
	movwf	(?_uart_txt+1)
	fcall	_uart_txt
	line	237
	
i1l3164:	
;em7segDriver.c: 234: }
;em7segDriver.c: 235: }
;em7segDriver.c: 237: if(data==0b0000){
	movf	(_data),f
	skipz
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l3174
u117_20:
	line	238
	
i1l3166:	
;em7segDriver.c: 238: set_flgs[0]=0x00;set_flgs[1]=0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_set_flgs)^080h
	clrf	0+(_set_flgs)^080h+01h
	line	239
	
i1l3168:	
;em7segDriver.c: 239: clr_flgs[0]=0xFF;clr_flgs[1]=0xFF;
	movlw	(0FFh)
	movwf	(_clr_flgs)^080h
	
i1l3170:	
	movlw	(0FFh)
	movwf	0+(_clr_flgs)^080h+01h
	line	240
	
i1l3172:	
;em7segDriver.c: 240: uart_txt("Clear All");
	movlw	low((STR_4-__stringbase))
	movwf	(?_uart_txt)
	movlw	80h
	movwf	(?_uart_txt+1)
	fcall	_uart_txt
	line	241
;em7segDriver.c: 241: }else if(data==0b0001){
	goto	i1l3208
	
i1l3174:	
	decf	(_data),w
	skipz
	goto	u118_21
	goto	u118_20
u118_21:
	goto	i1l3180
u118_20:
	line	242
	
i1l3176:	
;em7segDriver.c: 242: num_seg_wrt_flg=0;
	clrf	(_num_seg_wrt_flg)
	line	243
	
i1l3178:	
;em7segDriver.c: 243: uart_txt("Num Mode");
	movlw	low((STR_5-__stringbase))
	movwf	(?_uart_txt)
	movlw	80h
	movwf	(?_uart_txt+1)
	fcall	_uart_txt
	line	244
;em7segDriver.c: 244: }else if(data==0b0010){
	goto	i1l3208
	
i1l3180:	
	movf	(_data),w
	xorlw	02h
	skipz
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l3186
u119_20:
	line	245
	
i1l3182:	
;em7segDriver.c: 245: num_seg_wrt_flg=1;
	clrf	(_num_seg_wrt_flg)
	incf	(_num_seg_wrt_flg),f
	line	246
	
i1l3184:	
;em7segDriver.c: 246: uart_txt("Seg Mode");
	movlw	low((STR_6-__stringbase))
	movwf	(?_uart_txt)
	movlw	80h
	movwf	(?_uart_txt+1)
	fcall	_uart_txt
	line	247
;em7segDriver.c: 247: }else if(data==0b1111){
	goto	i1l3208
	
i1l3186:	
	movf	(_data),w
	xorlw	0Fh
	skipz
	goto	u120_21
	goto	u120_20
u120_21:
	goto	i1l1140
u120_20:
	line	248
	
i1l3188:	
;em7segDriver.c: 248: PORTA=0x00;
	clrf	(5)	;volatile
	line	249
;em7segDriver.c: 249: PORTC=0x00;
	clrf	(7)	;volatile
	line	250
	
i1l3190:	
;em7segDriver.c: 250: TRISC=0xFF;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	251
	
i1l3192:	
;em7segDriver.c: 251: TRISA=0xFF;
	movlw	(0FFh)
	movwf	(133)^080h	;volatile
	line	252
	
i1l3194:	
;em7segDriver.c: 252: ((OPTION_REG) |= 1 << (7));
	bsf	(129)^080h+(7/8),(7)&7	;volatile
	line	253
	
i1l3196:	
;em7segDriver.c: 253: uart_txt("Sleep");
	movlw	low((STR_7-__stringbase))
	movwf	(?_uart_txt)
	movlw	80h
	movwf	(?_uart_txt+1)
	fcall	_uart_txt
	line	254
	
i1l3198:	
# 254 "C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
sleep ;#
psect	text287
	line	255
	
i1l3200:	
;em7segDriver.c: 255: uart_txt("Wake");
	movlw	low((STR_8-__stringbase))
	movwf	(?_uart_txt)
	movlw	80h
	movwf	(?_uart_txt+1)
	fcall	_uart_txt
	line	256
;em7segDriver.c: 256: TRISA=0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(133)^080h	;volatile
	line	257
	
i1l3202:	
;em7segDriver.c: 257: TRISC6=0;
	bcf	(1086/8)^080h,(1086)&7
	line	258
	
i1l3204:	
;em7segDriver.c: 258: TRISC7=1;
	bsf	(1087/8)^080h,(1087)&7
	line	259
	
i1l3206:	
;em7segDriver.c: 259: ((OPTION_REG) &= ~(1 << (7)));
	bcf	(129)^080h+(7/8),(7)&7	;volatile
	goto	i1l3208
	line	261
	
i1l1140:	
	line	264
	
i1l3208:	
;em7segDriver.c: 260: }
;em7segDriver.c: 261: }
;em7segDriver.c: 262: }
;em7segDriver.c: 264: if(TXIF){
	line	267
	
i1l1146:	
	line	268
;em7segDriver.c: 267: }
;em7segDriver.c: 268: RA7=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(47/8),(47)&7
	line	269
	
i1l1147:	
	movf	(??_serial+4),w
	movwf	btemp+1
	movf	(??_serial+3),w
	movwf	pclath
	movf	(??_serial+2),w
	movwf	fsr0
	swapf	(??_serial+1)^00h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_serial
	__end_of_serial:
;; =============== function _serial ends ============

	signat	_serial,88
	global	i1_write_disp
psect	text288,local,class=CODE,delta=2
global __ptext288
__ptext288:

;; *************** function i1_write_disp *****************
;; Defined at:
;;		line 178 in file "C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
;; Parameters:    Size  Location     Type
;;  write_disp      1    wreg     unsigned char 
;;  write_disp      1    4[COMMON] unsigned char 
;;  write_disp      1    5[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  write_disp      1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_delay
;; This function is called by:
;;		_serial
;; This function uses a non-reentrant model
;;
psect	text288
	file	"C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
	line	178
	global	__size_ofi1_write_disp
	__size_ofi1_write_disp	equ	__end_ofi1_write_disp-i1_write_disp
	
i1_write_disp:	
	opt	stack 2
; Regs used in i1_write_disp: [wreg+status,2+status,0+btemp+1+pclath+cstack]
;i1write_disp@set_clr stored from wreg
	movwf	(i1write_disp@set_clr)
	line	179
	
i1l3216:	
;em7segDriver.c: 179: if(digit==0){RC2 = 1;RC3 = 0;}else{RC2 = 0;RC3 = 1;}
	movf	(i1write_disp@digit),f
	skipz
	goto	u122_21
	goto	u122_20
u122_21:
	goto	i1l1120
u122_20:
	
i1l3218:	
	bsf	(58/8),(58)&7
	bcf	(59/8),(59)&7
	goto	i1l3220
	
i1l1120:	
	bcf	(58/8),(58)&7
	bsf	(59/8),(59)&7
	line	180
	
i1l3220:	
;em7segDriver.c: 180: delay(1000);
	movlw	0
	movwf	(?i1_delay+3)
	movlw	0
	movwf	(?i1_delay+2)
	movlw	03h
	movwf	(?i1_delay+1)
	movlw	0E8h
	movwf	(?i1_delay)

	fcall	i1_delay
	line	186
	
i1l3222:	
;em7segDriver.c: 186: if(set_clr==1){
	decf	(i1write_disp@set_clr),w
	skipz
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l1122
u123_20:
	line	187
	
i1l3224:	
;em7segDriver.c: 187: RC0 = RC1 = 1;
	bsf	(57/8),(57)&7
	btfsc	(57/8),(57)&7
	goto	u124_21
	goto	u124_20
	
u124_21:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	goto	u125_24
u124_20:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(56/8),(56)&7
u125_24:
	line	188
	
i1l3226:	
;em7segDriver.c: 188: PORTA = ~(1<<segment);
	movlw	(01h)
	movwf	(??i1_write_disp+0)+0
	incf	(i1write_disp@segment),w
	goto	u126_24
u126_25:
	clrc
	rlf	(??i1_write_disp+0)+0,f
u126_24:
	addlw	-1
	skipz
	goto	u126_25
	movf	0+(??i1_write_disp+0)+0,w
	xorlw	0ffh
	movwf	(5)	;volatile
	line	189
;em7segDriver.c: 189: }else{
	goto	i1l3230
	
i1l1122:	
	line	190
;em7segDriver.c: 190: RC0 = RC1 = 0;
	bcf	(57/8),(57)&7
	bcf	(56/8),(56)&7
	line	191
	
i1l3228:	
;em7segDriver.c: 191: PORTA = (1<<segment);
	movlw	(01h)
	movwf	(??i1_write_disp+0)+0
	incf	(i1write_disp@segment),w
	goto	u127_24
u127_25:
	clrc
	rlf	(??i1_write_disp+0)+0,f
u127_24:
	addlw	-1
	skipz
	goto	u127_25
	movf	0+(??i1_write_disp+0)+0,w
	movwf	(5)	;volatile
	line	31
	
i1l3230:	
;em7segDriver.c: 192: }
;em7segDriver.c: 193: delay(pulse_length);
	movlw	0
	movwf	(?i1_delay+3)
	movlw	0
	movwf	(?i1_delay+2)
	movlw	07h
	movwf	(?i1_delay+1)
	movlw	0D0h
	movwf	(?i1_delay)

	fcall	i1_delay
	line	194
	
i1l3232:	
;em7segDriver.c: 194: RC2 = RC3 = 0;
	bcf	(59/8),(59)&7
	bcf	(58/8),(58)&7
	line	195
	
i1l3234:	
;em7segDriver.c: 195: RC0 = RC1 = 0;
	bcf	(57/8),(57)&7
	bcf	(56/8),(56)&7
	line	196
	
i1l3236:	
;em7segDriver.c: 196: PORTA = 0x00;
	clrf	(5)	;volatile
	line	198
	
i1l3238:	
;em7segDriver.c: 198: delay(19*pulse_length);
	movlw	0
	movwf	(?i1_delay+3)
	movlw	0
	movwf	(?i1_delay+2)
	movlw	094h
	movwf	(?i1_delay+1)
	movlw	070h
	movwf	(?i1_delay)

	fcall	i1_delay
	line	199
	
i1l1124:	
	return
	opt stack 0
GLOBAL	__end_ofi1_write_disp
	__end_ofi1_write_disp:
;; =============== function i1_write_disp ends ============

	signat	i1_write_disp,88
	global	_uart_txt
psect	text289,local,class=CODE,delta=2
global __ptext289
__ptext289:

;; *************** function _uart_txt *****************
;; Defined at:
;;		line 99 in file "C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\USART.h"
;; Parameters:    Size  Location     Type
;;  string          2    4[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  str            69    0[BANK0 ] unsigned char [69]
;;  cnt             2   71[BANK0 ] unsigned int 
;;  len             2   69[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    4[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0      73       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         6      73       0       0       0
;;Total ram usage:       79 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_strcpy
;;		_strlen
;;		_txd
;; This function is called by:
;;		_serial
;; This function uses a non-reentrant model
;;
psect	text289
	file	"C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\USART.h"
	line	99
	global	__size_of_uart_txt
	__size_of_uart_txt	equ	__end_of_uart_txt-_uart_txt
	
_uart_txt:	
	opt	stack 1
; Regs used in _uart_txt: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	100
	
i1l3006:	
;USART.h: 100: char str[]="                                                                    ";
	movlw	(uart_txt@str)&0ffh
	movwf	fsr0
	movlw	low(uart_txt@F1620)
	movwf	(??_uart_txt+0)+0
	movf	fsr0,w
	movwf	((??_uart_txt+0)+0+1)
	movlw	69
	movwf	((??_uart_txt+0)+0+2)
u85_20:
	movf	(??_uart_txt+0)+0,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	
	movf	indf,w
	movwf	((??_uart_txt+0)+0+3)
	incf	(??_uart_txt+0)+0,f
	movf	((??_uart_txt+0)+0+1),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	((??_uart_txt+0)+0+3),w
	movwf	indf
	incf	((??_uart_txt+0)+0+1),f
	decfsz	((??_uart_txt+0)+0+2),f
	goto	u85_20
	line	101
	
i1l3008:	
;USART.h: 101: strcpy(str, string);
	movf	(uart_txt@string),w
	movwf	(?_strcpy)
	movlw	(uart_txt@str)&0ffh
	fcall	_strcpy
	line	102
	
i1l3010:	
;USART.h: 102: unsigned int len=strlen(str);
	movlw	(uart_txt@str)&0ffh
	fcall	_strlen
	movf	(1+(?_strlen)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(uart_txt@len+1)
	movf	(0+(?_strlen)),w
	movwf	(uart_txt@len)
	line	103
	
i1l3012:	
;USART.h: 103: unsigned int cnt=0;
	clrf	(uart_txt@cnt)
	clrf	(uart_txt@cnt+1)
	line	105
;USART.h: 105: while(cnt<len){
	goto	i1l3018
	line	106
	
i1l3014:	
;USART.h: 106: txd(str[cnt]);
	movf	(uart_txt@cnt),w
	addlw	uart_txt@str&0ffh
	movwf	fsr0
	movf	indf,w
	fcall	_txd
	line	107
	
i1l3016:	
;USART.h: 107: cnt++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(uart_txt@cnt),f
	skipnz
	incf	(uart_txt@cnt+1),f
	line	105
	
i1l3018:	
	movf	(uart_txt@len+1),w
	subwf	(uart_txt@cnt+1),w
	skipz
	goto	u86_25
	movf	(uart_txt@len),w
	subwf	(uart_txt@cnt),w
u86_25:
	skipc
	goto	u86_21
	goto	u86_20
u86_21:
	goto	i1l3014
u86_20:
	line	109
	
i1l1030:	
	return
	opt stack 0
GLOBAL	__end_of_uart_txt
	__end_of_uart_txt:
;; =============== function _uart_txt ends ============

	signat	_uart_txt,90
	global	i1_delay
psect	text290,local,class=CODE,delta=2
global __ptext290
__ptext290:

;; *************** function i1_delay *****************
;; Defined at:
;;		line 96 in file "C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
;; Parameters:    Size  Location     Type
;;  delay           4    0[COMMON] long 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, btemp+1
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		i1_write_disp
;; This function uses a non-reentrant model
;;
psect	text290
	file	"C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
	line	96
	global	__size_ofi1_delay
	__size_ofi1_delay	equ	__end_ofi1_delay-i1_delay
	
i1_delay:	
	opt	stack 2
; Regs used in i1_delay: [wreg+btemp+1]
	line	97
	
i1l3210:	
;em7segDriver.c: 97: while(x>0){
	goto	i1l3214
	line	98
	
i1l3212:	
;em7segDriver.c: 98: x--;
	movlw	0FFh
	addwf	(i1delay@x),f
	movlw	0FFh
	skipc
	addwf	(i1delay@x+1),f
	movlw	0FFh
	skipc
	addwf	(i1delay@x+2),f
	movlw	0FFh
	skipc
	addwf	(i1delay@x+3),f
	line	97
	
i1l3214:	
	movf	(i1delay@x+3),w
	xorlw	80h
	movwf	btemp+1
	movlw	0
	xorlw	80h
	subwf	btemp+1,w
	
	skipz
	goto	u121_23
	movlw	0
	subwf	(i1delay@x+2),w
	skipz
	goto	u121_23
	movlw	0
	subwf	(i1delay@x+1),w
	skipz
	goto	u121_23
	movlw	01h
	subwf	(i1delay@x),w
u121_23:
	skipnc
	goto	u121_21
	goto	u121_20
u121_21:
	goto	i1l3212
u121_20:
	line	100
	
i1l1054:	
	return
	opt stack 0
GLOBAL	__end_ofi1_delay
	__end_ofi1_delay:
;; =============== function i1_delay ends ============

	signat	i1_delay,88
	global	_decode_num
psect	text291,local,class=CODE,delta=2
global __ptext291
__ptext291:

;; *************** function _decode_num *****************
;; Defined at:
;;		line 154 in file "C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
;; Parameters:    Size  Location     Type
;;  dig             1    wreg     unsigned char 
;;  num             1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  dig             1    1[COMMON] unsigned char 
;;  temp            1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_serial
;; This function uses a non-reentrant model
;;
psect	text291
	file	"C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\em7segDriver.c"
	line	154
	global	__size_of_decode_num
	__size_of_decode_num	equ	__end_of_decode_num-_decode_num
	
_decode_num:	
	opt	stack 3
; Regs used in _decode_num: [wreg-fsr0h+status,2+status,0]
;decode_num@dig stored from wreg
	movwf	(decode_num@dig)
	line	155
	
i1l3052:	
;em7segDriver.c: 155: unsigned char temp = 0;
	clrf	(decode_num@temp)
	line	157
	
i1l3054:	
;em7segDriver.c: 157: if(num == 0){temp=0b00111111;}
	movf	(decode_num@num),f
	skipz
	goto	u93_21
	goto	u93_20
u93_21:
	goto	i1l3058
u93_20:
	
i1l3056:	
	movlw	(03Fh)
	movwf	(decode_num@temp)
	goto	i1l3118
	line	158
	
i1l3058:	
;em7segDriver.c: 158: else if(num == 1){temp=0b00000011;}
	decf	(decode_num@num),w
	skipz
	goto	u94_21
	goto	u94_20
u94_21:
	goto	i1l3062
u94_20:
	
i1l3060:	
	movlw	(03h)
	movwf	(decode_num@temp)
	goto	i1l3118
	line	159
	
i1l3062:	
;em7segDriver.c: 159: else if(num == 2){temp=0b01011011;}
	movf	(decode_num@num),w
	xorlw	02h
	skipz
	goto	u95_21
	goto	u95_20
u95_21:
	goto	i1l3066
u95_20:
	
i1l3064:	
	movlw	(05Bh)
	movwf	(decode_num@temp)
	goto	i1l3118
	line	160
	
i1l3066:	
;em7segDriver.c: 160: else if(num == 3){temp=0b01001111;}
	movf	(decode_num@num),w
	xorlw	03h
	skipz
	goto	u96_21
	goto	u96_20
u96_21:
	goto	i1l3070
u96_20:
	
i1l3068:	
	movlw	(04Fh)
	movwf	(decode_num@temp)
	goto	i1l3118
	line	161
	
i1l3070:	
;em7segDriver.c: 161: else if(num == 4){temp=0b01100110;}
	movf	(decode_num@num),w
	xorlw	04h
	skipz
	goto	u97_21
	goto	u97_20
u97_21:
	goto	i1l3074
u97_20:
	
i1l3072:	
	movlw	(066h)
	movwf	(decode_num@temp)
	goto	i1l3118
	line	162
	
i1l3074:	
;em7segDriver.c: 162: else if(num == 5){temp=0b01101101;}
	movf	(decode_num@num),w
	xorlw	05h
	skipz
	goto	u98_21
	goto	u98_20
u98_21:
	goto	i1l3078
u98_20:
	
i1l3076:	
	movlw	(06Dh)
	movwf	(decode_num@temp)
	goto	i1l3118
	line	163
	
i1l3078:	
;em7segDriver.c: 163: else if(num == 6){temp=0b01111101;}
	movf	(decode_num@num),w
	xorlw	06h
	skipz
	goto	u99_21
	goto	u99_20
u99_21:
	goto	i1l3082
u99_20:
	
i1l3080:	
	movlw	(07Dh)
	movwf	(decode_num@temp)
	goto	i1l3118
	line	164
	
i1l3082:	
;em7segDriver.c: 164: else if(num == 7){temp=0b00000111;}
	movf	(decode_num@num),w
	xorlw	07h
	skipz
	goto	u100_21
	goto	u100_20
u100_21:
	goto	i1l3086
u100_20:
	
i1l3084:	
	movlw	(07h)
	movwf	(decode_num@temp)
	goto	i1l3118
	line	165
	
i1l3086:	
;em7segDriver.c: 165: else if(num == 8){temp=0b01111111;}
	movf	(decode_num@num),w
	xorlw	08h
	skipz
	goto	u101_21
	goto	u101_20
u101_21:
	goto	i1l3090
u101_20:
	
i1l3088:	
	movlw	(07Fh)
	movwf	(decode_num@temp)
	goto	i1l3118
	line	166
	
i1l3090:	
;em7segDriver.c: 166: else if(num == 9){temp=0b01101111;}
	movf	(decode_num@num),w
	xorlw	09h
	skipz
	goto	u102_21
	goto	u102_20
u102_21:
	goto	i1l3094
u102_20:
	
i1l3092:	
	movlw	(06Fh)
	movwf	(decode_num@temp)
	goto	i1l3118
	line	167
	
i1l3094:	
;em7segDriver.c: 167: else if(num == 10){temp=0b00000001;}
	movf	(decode_num@num),w
	xorlw	0Ah
	skipz
	goto	u103_21
	goto	u103_20
u103_21:
	goto	i1l3098
u103_20:
	
i1l3096:	
	clrf	(decode_num@temp)
	incf	(decode_num@temp),f
	goto	i1l3118
	line	168
	
i1l3098:	
;em7segDriver.c: 168: else if(num == 11){temp=0b00001000;}
	movf	(decode_num@num),w
	xorlw	0Bh
	skipz
	goto	u104_21
	goto	u104_20
u104_21:
	goto	i1l3102
u104_20:
	
i1l3100:	
	movlw	(08h)
	movwf	(decode_num@temp)
	goto	i1l3118
	line	169
	
i1l3102:	
;em7segDriver.c: 169: else if(num == 12){temp=0b01000000;}
	movf	(decode_num@num),w
	xorlw	0Ch
	skipz
	goto	u105_21
	goto	u105_20
u105_21:
	goto	i1l3106
u105_20:
	
i1l3104:	
	movlw	(040h)
	movwf	(decode_num@temp)
	goto	i1l3118
	line	170
	
i1l3106:	
;em7segDriver.c: 170: else if(num == 13){temp=0b00001001;}
	movf	(decode_num@num),w
	xorlw	0Dh
	skipz
	goto	u106_21
	goto	u106_20
u106_21:
	goto	i1l3110
u106_20:
	
i1l3108:	
	movlw	(09h)
	movwf	(decode_num@temp)
	goto	i1l3118
	line	171
	
i1l3110:	
;em7segDriver.c: 171: else if(num == 14){temp=0b01001000;}
	movf	(decode_num@num),w
	xorlw	0Eh
	skipz
	goto	u107_21
	goto	u107_20
u107_21:
	goto	i1l3114
u107_20:
	
i1l3112:	
	movlw	(048h)
	movwf	(decode_num@temp)
	goto	i1l3118
	line	172
	
i1l3114:	
;em7segDriver.c: 172: else if(num == 15){temp=0b00000000;}
	movf	(decode_num@num),w
	xorlw	0Fh
	skipz
	goto	u108_21
	goto	u108_20
u108_21:
	goto	i1l1111
u108_20:
	
i1l3116:	
	clrf	(decode_num@temp)
	goto	i1l3118
	line	174
	
i1l1111:	
	
i1l3118:	
;em7segDriver.c: 174: set_flgs[dig]=temp;
	movf	(decode_num@dig),w
	addlw	_set_flgs&0ffh
	movwf	fsr0
	movf	(decode_num@temp),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	line	175
	
i1l3120:	
;em7segDriver.c: 175: clr_flgs[dig]=~temp;
	movf	(decode_num@dig),w
	addlw	_clr_flgs&0ffh
	movwf	fsr0
	comf	(decode_num@temp),w
	movwf	indf
	line	176
	
i1l1117:	
	return
	opt stack 0
GLOBAL	__end_of_decode_num
	__end_of_decode_num:
;; =============== function _decode_num ends ============

	signat	_decode_num,8312
	global	_strlen
psect	text292,local,class=CODE,delta=2
global __ptext292
__ptext292:

;; *************** function _strlen *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\strlen.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR const unsigned char 
;;		 -> uart_txt@str(69), 
;; Auto vars:     Size  Location     Type
;;  s               1    2[COMMON] PTR const unsigned char 
;;		 -> uart_txt@str(69), 
;;  cp              1    3[COMMON] PTR const unsigned char 
;;		 -> uart_txt@str(69), 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: FFEFF/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_txt
;; This function uses a non-reentrant model
;;
psect	text292
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\strlen.c"
	line	5
	global	__size_of_strlen
	__size_of_strlen	equ	__end_of_strlen-_strlen
	
_strlen:	
	opt	stack 2
; Regs used in _strlen: [wreg-fsr0h+status,2+status,0]
;strlen@s stored from wreg
	line	8
	movwf	(strlen@s)
	
i1l3024:	
	movf	(strlen@s),w
	movwf	(strlen@cp)
	line	9
	
i1l3026:	
	movf	(strlen@cp),w
	incf	(strlen@cp),f
	movwf	fsr0
	movf	indf,f
	skipz
	goto	u88_21
	goto	u88_20
u88_21:
	goto	i1l3026
u88_20:
	line	11
	
i1l3028:	
	movf	(strlen@s),w
	subwf	(strlen@cp),w
	movwf	(?_strlen)
	clrf	(?_strlen+1)
	btfsc	(?_strlen),7
	decf	(?_strlen+1),f
	movlw	-1
	addwf	(?_strlen),f
	skipc
	decf	(?_strlen+1),f
	line	12
	
i1l2107:	
	return
	opt stack 0
GLOBAL	__end_of_strlen
	__end_of_strlen:
;; =============== function _strlen ends ============

	signat	_strlen,4218
	global	_strcpy
psect	text293,local,class=CODE,delta=2
global __ptext293
__ptext293:

;; *************** function _strcpy *****************
;; Defined at:
;;		line 10 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\strcpy.c"
;; Parameters:    Size  Location     Type
;;  to              1    wreg     PTR unsigned char 
;;		 -> uart_txt@str(69), 
;;  from            1    0[COMMON] PTR const unsigned char 
;;		 -> ROM(8192), 
;; Auto vars:     Size  Location     Type
;;  to              1    2[COMMON] PTR unsigned char 
;;		 -> uart_txt@str(69), 
;;  cp              1    3[COMMON] PTR unsigned char 
;;		 -> uart_txt@str(69), 
;; Return value:  Size  Location     Type
;;                  1    wreg      PTR unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath
;; Tracked objects:
;;		On entry : 100/0
;;		On exit  : 100/0
;;		Unchanged: FFEFF/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_txt
;; This function uses a non-reentrant model
;;
psect	text293
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\strcpy.c"
	line	10
	global	__size_of_strcpy
	__size_of_strcpy	equ	__end_of_strcpy-_strcpy
	
_strcpy:	
	opt	stack 1
; Regs used in _strcpy: [wreg-fsr0h+status,2+status,0+pclath]
;strcpy@to stored from wreg
	line	18
	movwf	(strcpy@to)
	
i1l3020:	
	movf	(strcpy@to),w
	movwf	(strcpy@cp)
	line	19
	
i1l3022:	
	movf	(strcpy@from),w
	incf	(strcpy@from),f
	movwf	fsr0
	fcall	stringdir
	movwf	(??_strcpy+0)+0
	movf	(strcpy@cp),w
	incf	(strcpy@cp),f
	movwf	fsr0
	movf	(??_strcpy+0)+0,w
	movwf	indf
	movf	(indf),f
	skipz
	goto	u87_21
	goto	u87_20
u87_21:
	goto	i1l3022
u87_20:
	line	22
	
i1l2101:	
	return
	opt stack 0
GLOBAL	__end_of_strcpy
	__end_of_strcpy:
;; =============== function _strcpy ends ============

	signat	_strcpy,8313
	global	_txd
psect	text294,local,class=CODE,delta=2
global __ptext294
__ptext294:

;; *************** function _txd *****************
;; Defined at:
;;		line 94 in file "C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\USART.h"
;; Parameters:    Size  Location     Type
;;  write_data      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  write_data      1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  1018[COMMON] int 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/20
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_uart_txt
;; This function uses a non-reentrant model
;;
psect	text294
	file	"C:\Users\Shawn Maxwell\Documents\MPLAB Project Files\EM7SEG\USART.h"
	line	94
	global	__size_of_txd
	__size_of_txd	equ	__end_of_txd-_txd
	
_txd:	
	opt	stack 2
; Regs used in _txd: [wreg]
;txd@write_data stored from wreg
	movwf	(txd@write_data)
	line	95
	
i1l3004:	
;USART.h: 95: TXREG = write_data;
	movf	(txd@write_data),w
	movwf	(25)	;volatile
	line	96
;USART.h: 96: while(!TRMT);
	
i1l1019:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1217/8)^080h,(1217)&7
	goto	u84_21
	goto	u84_20
u84_21:
	goto	i1l1019
u84_20:
	line	97
	
i1l1022:	
	return
	opt stack 0
GLOBAL	__end_of_txd
	__end_of_txd:
;; =============== function _txd ends ============

	signat	_txd,4218
psect	text295,local,class=CODE,delta=2
global __ptext295
__ptext295:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
