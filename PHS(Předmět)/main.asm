;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.3 #11866 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _timer0
	.globl _main
	.globl _second
	.globl _GetKeyboard
	.globl _SetLedBar
	.globl _init_interrupts
	.globl _LCD_Init
	.globl _LCD_SendData
	.globl _LCD_SendCmd
	.globl _LCD_State
	.globl _Pause
	.globl _Delay
	.globl _printf
	.globl _KEY_R_4
	.globl _KEY_R_3
	.globl _KEY_R_2
	.globl _KEY_R_1
	.globl _KEY_C_4
	.globl _KEY_C_3
	.globl _KEY_C_2
	.globl _KEY_C_1
	.globl _LB_OE
	.globl _LB_RCK
	.globl _LB_SCL
	.globl _LB_SCK
	.globl _LB_Data
	.globl _ZAR
	.globl _SMT
	.globl _POT
	.globl _LED3
	.globl _LED2
	.globl _LED1
	.globl _Buzzer
	.globl _Tlac2
	.globl _Tlac1
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _run
	.globl _index
	.globl _second_PARM_2
	.globl _LCD_Pos
	.globl _TIMER
	.globl _XBYTE
	.globl _DBYTE
	.globl _CBYTE
	.globl _putchar
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
G$P0$0_0$0 == 0x0080
_P0	=	0x0080
G$SP$0_0$0 == 0x0081
_SP	=	0x0081
G$DPL$0_0$0 == 0x0082
_DPL	=	0x0082
G$DPH$0_0$0 == 0x0083
_DPH	=	0x0083
G$PCON$0_0$0 == 0x0087
_PCON	=	0x0087
G$TCON$0_0$0 == 0x0088
_TCON	=	0x0088
G$TMOD$0_0$0 == 0x0089
_TMOD	=	0x0089
G$TL0$0_0$0 == 0x008a
_TL0	=	0x008a
G$TL1$0_0$0 == 0x008b
_TL1	=	0x008b
G$TH0$0_0$0 == 0x008c
_TH0	=	0x008c
G$TH1$0_0$0 == 0x008d
_TH1	=	0x008d
G$P1$0_0$0 == 0x0090
_P1	=	0x0090
G$SCON$0_0$0 == 0x0098
_SCON	=	0x0098
G$SBUF$0_0$0 == 0x0099
_SBUF	=	0x0099
G$P2$0_0$0 == 0x00a0
_P2	=	0x00a0
G$IE$0_0$0 == 0x00a8
_IE	=	0x00a8
G$P3$0_0$0 == 0x00b0
_P3	=	0x00b0
G$IP$0_0$0 == 0x00b8
_IP	=	0x00b8
G$PSW$0_0$0 == 0x00d0
_PSW	=	0x00d0
G$ACC$0_0$0 == 0x00e0
_ACC	=	0x00e0
G$B$0_0$0 == 0x00f0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
G$P0_0$0_0$0 == 0x0080
_P0_0	=	0x0080
G$P0_1$0_0$0 == 0x0081
_P0_1	=	0x0081
G$P0_2$0_0$0 == 0x0082
_P0_2	=	0x0082
G$P0_3$0_0$0 == 0x0083
_P0_3	=	0x0083
G$P0_4$0_0$0 == 0x0084
_P0_4	=	0x0084
G$P0_5$0_0$0 == 0x0085
_P0_5	=	0x0085
G$P0_6$0_0$0 == 0x0086
_P0_6	=	0x0086
G$P0_7$0_0$0 == 0x0087
_P0_7	=	0x0087
G$IT0$0_0$0 == 0x0088
_IT0	=	0x0088
G$IE0$0_0$0 == 0x0089
_IE0	=	0x0089
G$IT1$0_0$0 == 0x008a
_IT1	=	0x008a
G$IE1$0_0$0 == 0x008b
_IE1	=	0x008b
G$TR0$0_0$0 == 0x008c
_TR0	=	0x008c
G$TF0$0_0$0 == 0x008d
_TF0	=	0x008d
G$TR1$0_0$0 == 0x008e
_TR1	=	0x008e
G$TF1$0_0$0 == 0x008f
_TF1	=	0x008f
G$P1_0$0_0$0 == 0x0090
_P1_0	=	0x0090
G$P1_1$0_0$0 == 0x0091
_P1_1	=	0x0091
G$P1_2$0_0$0 == 0x0092
_P1_2	=	0x0092
G$P1_3$0_0$0 == 0x0093
_P1_3	=	0x0093
G$P1_4$0_0$0 == 0x0094
_P1_4	=	0x0094
G$P1_5$0_0$0 == 0x0095
_P1_5	=	0x0095
G$P1_6$0_0$0 == 0x0096
_P1_6	=	0x0096
G$P1_7$0_0$0 == 0x0097
_P1_7	=	0x0097
G$RI$0_0$0 == 0x0098
_RI	=	0x0098
G$TI$0_0$0 == 0x0099
_TI	=	0x0099
G$RB8$0_0$0 == 0x009a
_RB8	=	0x009a
G$TB8$0_0$0 == 0x009b
_TB8	=	0x009b
G$REN$0_0$0 == 0x009c
_REN	=	0x009c
G$SM2$0_0$0 == 0x009d
_SM2	=	0x009d
G$SM1$0_0$0 == 0x009e
_SM1	=	0x009e
G$SM0$0_0$0 == 0x009f
_SM0	=	0x009f
G$P2_0$0_0$0 == 0x00a0
_P2_0	=	0x00a0
G$P2_1$0_0$0 == 0x00a1
_P2_1	=	0x00a1
G$P2_2$0_0$0 == 0x00a2
_P2_2	=	0x00a2
G$P2_3$0_0$0 == 0x00a3
_P2_3	=	0x00a3
G$P2_4$0_0$0 == 0x00a4
_P2_4	=	0x00a4
G$P2_5$0_0$0 == 0x00a5
_P2_5	=	0x00a5
G$P2_6$0_0$0 == 0x00a6
_P2_6	=	0x00a6
G$P2_7$0_0$0 == 0x00a7
_P2_7	=	0x00a7
G$EX0$0_0$0 == 0x00a8
_EX0	=	0x00a8
G$ET0$0_0$0 == 0x00a9
_ET0	=	0x00a9
G$EX1$0_0$0 == 0x00aa
_EX1	=	0x00aa
G$ET1$0_0$0 == 0x00ab
_ET1	=	0x00ab
G$ES$0_0$0 == 0x00ac
_ES	=	0x00ac
G$EA$0_0$0 == 0x00af
_EA	=	0x00af
G$P3_0$0_0$0 == 0x00b0
_P3_0	=	0x00b0
G$P3_1$0_0$0 == 0x00b1
_P3_1	=	0x00b1
G$P3_2$0_0$0 == 0x00b2
_P3_2	=	0x00b2
G$P3_3$0_0$0 == 0x00b3
_P3_3	=	0x00b3
G$P3_4$0_0$0 == 0x00b4
_P3_4	=	0x00b4
G$P3_5$0_0$0 == 0x00b5
_P3_5	=	0x00b5
G$P3_6$0_0$0 == 0x00b6
_P3_6	=	0x00b6
G$P3_7$0_0$0 == 0x00b7
_P3_7	=	0x00b7
G$RXD$0_0$0 == 0x00b0
_RXD	=	0x00b0
G$TXD$0_0$0 == 0x00b1
_TXD	=	0x00b1
G$INT0$0_0$0 == 0x00b2
_INT0	=	0x00b2
G$INT1$0_0$0 == 0x00b3
_INT1	=	0x00b3
G$T0$0_0$0 == 0x00b4
_T0	=	0x00b4
G$T1$0_0$0 == 0x00b5
_T1	=	0x00b5
G$WR$0_0$0 == 0x00b6
_WR	=	0x00b6
G$RD$0_0$0 == 0x00b7
_RD	=	0x00b7
G$PX0$0_0$0 == 0x00b8
_PX0	=	0x00b8
G$PT0$0_0$0 == 0x00b9
_PT0	=	0x00b9
G$PX1$0_0$0 == 0x00ba
_PX1	=	0x00ba
G$PT1$0_0$0 == 0x00bb
_PT1	=	0x00bb
G$PS$0_0$0 == 0x00bc
_PS	=	0x00bc
G$P$0_0$0 == 0x00d0
_P	=	0x00d0
G$F1$0_0$0 == 0x00d1
_F1	=	0x00d1
G$OV$0_0$0 == 0x00d2
_OV	=	0x00d2
G$RS0$0_0$0 == 0x00d3
_RS0	=	0x00d3
G$RS1$0_0$0 == 0x00d4
_RS1	=	0x00d4
G$F0$0_0$0 == 0x00d5
_F0	=	0x00d5
G$AC$0_0$0 == 0x00d6
_AC	=	0x00d6
G$CY$0_0$0 == 0x00d7
_CY	=	0x00d7
G$Tlac1$0_0$0 == 0x00b2
_Tlac1	=	0x00b2
G$Tlac2$0_0$0 == 0x00b3
_Tlac2	=	0x00b3
G$Buzzer$0_0$0 == 0x00b6
_Buzzer	=	0x00b6
G$LED1$0_0$0 == 0x00c2
_LED1	=	0x00c2
G$LED2$0_0$0 == 0x00c3
_LED2	=	0x00c3
G$LED3$0_0$0 == 0x00c4
_LED3	=	0x00c4
G$POT$0_0$0 == 0x0090
_POT	=	0x0090
G$SMT$0_0$0 == 0x0091
_SMT	=	0x0091
G$ZAR$0_0$0 == 0x0092
_ZAR	=	0x0092
G$LB_Data$0_0$0 == 0x0093
_LB_Data	=	0x0093
G$LB_SCK$0_0$0 == 0x0094
_LB_SCK	=	0x0094
G$LB_SCL$0_0$0 == 0x0095
_LB_SCL	=	0x0095
G$LB_RCK$0_0$0 == 0x0096
_LB_RCK	=	0x0096
G$LB_OE$0_0$0 == 0x0097
_LB_OE	=	0x0097
G$KEY_C_1$0_0$0 == 0x0080
_KEY_C_1	=	0x0080
G$KEY_C_2$0_0$0 == 0x0081
_KEY_C_2	=	0x0081
G$KEY_C_3$0_0$0 == 0x0082
_KEY_C_3	=	0x0082
G$KEY_C_4$0_0$0 == 0x0083
_KEY_C_4	=	0x0083
G$KEY_R_1$0_0$0 == 0x0084
_KEY_R_1	=	0x0084
G$KEY_R_2$0_0$0 == 0x0085
_KEY_R_2	=	0x0085
G$KEY_R_3$0_0$0 == 0x0086
_KEY_R_3	=	0x0086
G$KEY_R_4$0_0$0 == 0x0087
_KEY_R_4	=	0x0087
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; overlayable bit register bank
;--------------------------------------------------------
	.area BIT_BANK	(REL,OVR,DATA)
bits:
	.ds 1
	b0 = bits[0]
	b1 = bits[1]
	b2 = bits[2]
	b3 = bits[3]
	b4 = bits[4]
	b5 = bits[5]
	b6 = bits[6]
	b7 = bits[7]
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
G$CBYTE$0_0$0==.
_CBYTE::
	.ds 2
G$DBYTE$0_0$0==.
_DBYTE::
	.ds 1
G$XBYTE$0_0$0==.
_XBYTE::
	.ds 2
G$TIMER$0_0$0==.
_TIMER::
	.ds 2
G$LCD_Pos$0_0$0==.
_LCD_Pos::
	.ds 1
Lmain.second$power$1_0$38==.
_second_PARM_2:
	.ds 2
G$index$0_0$0==.
_index::
	.ds 2
G$run$0_0$0==.
_run::
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
Lmain.SetLedBar$sloc0$0_1$0==.
_SetLedBar_sloc0_1_0:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	C$main.c$28$1_0$49 ==.
;	main.c:28: __code   byte *CBYTE=0;
	clr	a
	mov	_CBYTE,a
	mov	(_CBYTE + 1),a
	C$main.c$29$1_0$49 ==.
;	main.c:29: __idata  byte *DBYTE=0;
;	1-genFromRTrack replaced	mov	_DBYTE,#0x00
	mov	_DBYTE,a
	C$main.c$30$1_0$49 ==.
;	main.c:30: __xdata  byte *XBYTE=0;
	mov	_XBYTE,a
	mov	(_XBYTE + 1),a
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Delay'
;------------------------------------------------------------
;pause                     Allocated to registers r6 r7 
;------------------------------------------------------------
	G$Delay$0$0 ==.
	C$main.c$142$0_0$16 ==.
;	main.c:142: void Delay(int pause)
;	-----------------------------------------
;	 function Delay
;	-----------------------------------------
_Delay:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r6,dpl
	mov	r7,dph
	C$main.c$144$1_0$16 ==.
;	main.c:144: TIMER=1+pause;
	mov	a,#0x01
	add	a,r6
	mov	_TIMER,a
	clr	a
	addc	a,r7
	mov	(_TIMER + 1),a
	C$main.c$145$1_0$16 ==.
;	main.c:145: while(TIMER);
00101$:
	mov	a,_TIMER
	orl	a,(_TIMER + 1)
	jnz	00101$
	C$main.c$146$1_0$16 ==.
;	main.c:146: }
	C$main.c$146$1_0$16 ==.
	XG$Delay$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Pause'
;------------------------------------------------------------
;i                         Allocated to registers r6 r7 
;------------------------------------------------------------
	G$Pause$0$0 ==.
	C$main.c$148$1_0$17 ==.
;	main.c:148: void Pause()
;	-----------------------------------------
;	 function Pause
;	-----------------------------------------
_Pause:
	C$main.c$150$2_0$17 ==.
;	main.c:150: int i=30;
	mov	r6,#0x1e
	mov	r7,#0x00
	C$main.c$151$1_0$17 ==.
;	main.c:151: while(i--);
00101$:
	mov	ar4,r6
	mov	ar5,r7
	dec	r6
	cjne	r6,#0xff,00110$
	dec	r7
00110$:
	mov	a,r4
	orl	a,r5
	jnz	00101$
	C$main.c$152$1_0$17 ==.
;	main.c:152: }
	C$main.c$152$1_0$17 ==.
	XG$Pause$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_State'
;------------------------------------------------------------
;temp                      Allocated to registers 
;------------------------------------------------------------
	G$LCD_State$0$0 ==.
	C$main.c$154$1_0$18 ==.
;	main.c:154: byte LCD_State()
;	-----------------------------------------
;	 function LCD_State
;	-----------------------------------------
_LCD_State:
	C$main.c$158$1_0$18 ==.
;	main.c:158: Pause();
	lcall	_Pause
	C$main.c$159$1_0$18 ==.
;	main.c:159: P2=(LCD_RW | 0x0F);
	mov	_P2,#0x2f
	C$main.c$160$1_0$18 ==.
;	main.c:160: Pause();
	lcall	_Pause
	C$main.c$161$1_0$18 ==.
;	main.c:161: P2=(LCD_RW |LCD_EN | 0x0F);
	mov	_P2,#0x6f
	C$main.c$162$1_0$18 ==.
;	main.c:162: Pause();
	lcall	_Pause
	C$main.c$163$1_0$18 ==.
;	main.c:163: temp=16*(P2&0x0F);
	mov	a,_P2
	anl	a,#0x0f
	swap	a
	anl	a,#0xf0
	mov	r7,a
	C$main.c$164$1_0$18 ==.
;	main.c:164: P2=(LCD_RW | 0x0F);
	mov	_P2,#0x2f
	C$main.c$166$1_0$18 ==.
;	main.c:166: Pause();
	push	ar7
	lcall	_Pause
	C$main.c$167$1_0$18 ==.
;	main.c:167: P2=(LCD_RW | 0x0F);
	mov	_P2,#0x2f
	C$main.c$168$1_0$18 ==.
;	main.c:168: Pause();
	lcall	_Pause
	C$main.c$169$1_0$18 ==.
;	main.c:169: P2=(LCD_RW |LCD_EN | 0x0F);
	mov	_P2,#0x6f
	C$main.c$170$1_0$18 ==.
;	main.c:170: Pause();
	lcall	_Pause
	pop	ar7
	C$main.c$171$1_0$18 ==.
;	main.c:171: temp=temp+P2&0x0F;
	mov	a,_P2
	add	a,r7
	anl	a,#0x0f
	mov	dpl,a
	C$main.c$172$1_0$18 ==.
;	main.c:172: P2=(LCD_RW | 0x0F);
	mov	_P2,#0x2f
	C$main.c$174$1_0$18 ==.
;	main.c:174: return (temp);
	C$main.c$175$1_0$18 ==.
;	main.c:175: }
	C$main.c$175$1_0$18 ==.
	XG$LCD_State$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_SendCmd'
;------------------------------------------------------------
;val                       Allocated to registers r7 
;------------------------------------------------------------
	G$LCD_SendCmd$0$0 ==.
	C$main.c$177$1_0$20 ==.
;	main.c:177: void LCD_SendCmd( byte val )
;	-----------------------------------------
;	 function LCD_SendCmd
;	-----------------------------------------
_LCD_SendCmd:
	mov	r7,dpl
	C$main.c$179$1_0$20 ==.
;	main.c:179: Pause();
	push	ar7
	lcall	_Pause
	pop	ar7
	C$main.c$180$1_0$20 ==.
;	main.c:180: P2=((val>>4)&0x0F);
	mov	a,r7
	swap	a
	anl	a,#0x0f
	mov	r6,a
	anl	ar6,#0x0f
	mov	_P2,r6
	C$main.c$181$1_0$20 ==.
;	main.c:181: Pause();
	push	ar7
	push	ar6
	lcall	_Pause
	pop	ar6
	C$main.c$182$1_0$20 ==.
;	main.c:182: P2= LCD_EN | ((val>>4)&0x0F);
	mov	a,#0x40
	orl	a,r6
	mov	_P2,a
	C$main.c$183$1_0$20 ==.
;	main.c:183: Pause();
	push	ar6
	lcall	_Pause
	pop	ar6
	C$main.c$184$1_0$20 ==.
;	main.c:184: P2=((val>>4)&0x0F);
	mov	_P2,r6
	C$main.c$185$1_0$20 ==.
;	main.c:185: Pause();
	lcall	_Pause
	pop	ar7
	C$main.c$186$1_0$20 ==.
;	main.c:186: P2=( (val & 0x0F) );
	anl	ar7,#0x0f
	mov	_P2,r7
	C$main.c$187$1_0$20 ==.
;	main.c:187: Pause();
	push	ar7
	lcall	_Pause
	pop	ar7
	C$main.c$188$1_0$20 ==.
;	main.c:188: P2=( LCD_EN | (val & 0x0F ));
	mov	a,#0x40
	orl	a,r7
	mov	_P2,a
	C$main.c$189$1_0$20 ==.
;	main.c:189: Pause();
	push	ar7
	lcall	_Pause
	pop	ar7
	C$main.c$190$1_0$20 ==.
;	main.c:190: P2=( (val & 0x0F) );
	mov	_P2,r7
	C$main.c$192$1_0$20 ==.
;	main.c:192: while(LCD_State()&0x80);
00101$:
	lcall	_LCD_State
	mov	a,dpl
	jb	acc.7,00101$
	C$main.c$193$1_0$20 ==.
;	main.c:193: }
	C$main.c$193$1_0$20 ==.
	XG$LCD_SendCmd$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_SendData'
;------------------------------------------------------------
;val                       Allocated to registers r7 
;------------------------------------------------------------
	G$LCD_SendData$0$0 ==.
	C$main.c$195$1_0$22 ==.
;	main.c:195: void LCD_SendData( byte val )
;	-----------------------------------------
;	 function LCD_SendData
;	-----------------------------------------
_LCD_SendData:
	mov	r7,dpl
	C$main.c$197$1_0$22 ==.
;	main.c:197: Pause();
	push	ar7
	lcall	_Pause
	pop	ar7
	C$main.c$198$1_0$22 ==.
;	main.c:198: P2=( LCD_RS | ((val>>4)&0x0F) );
	mov	a,r7
	swap	a
	anl	a,#0x0f
	mov	r6,a
	anl	ar6,#0x0f
	mov	a,#0x10
	orl	a,r6
	mov	r5,a
	mov	_P2,r5
	C$main.c$199$1_0$22 ==.
;	main.c:199: Pause();
	push	ar7
	push	ar6
	push	ar5
	lcall	_Pause
	pop	ar5
	pop	ar6
	C$main.c$200$1_0$22 ==.
;	main.c:200: P2= LCD_RS | LCD_EN | ((val>>4)&0x0F);
	mov	a,#0x50
	orl	a,r6
	mov	_P2,a
	C$main.c$201$1_0$22 ==.
;	main.c:201: Pause();
	push	ar5
	lcall	_Pause
	pop	ar5
	C$main.c$202$1_0$22 ==.
;	main.c:202: P2=( LCD_RS | ((val>>4)&0x0F) );
	mov	_P2,r5
	C$main.c$203$1_0$22 ==.
;	main.c:203: Pause();
	lcall	_Pause
	pop	ar7
	C$main.c$204$1_0$22 ==.
;	main.c:204: P2=( LCD_RS | (val & 0x0F) );
	anl	ar7,#0x0f
	mov	a,#0x10
	orl	a,r7
	mov	r6,a
	mov	_P2,r6
	C$main.c$205$1_0$22 ==.
;	main.c:205: Pause();
	push	ar7
	push	ar6
	lcall	_Pause
	pop	ar6
	pop	ar7
	C$main.c$206$1_0$22 ==.
;	main.c:206: P2=( LCD_RS | LCD_EN | (val & 0x0F) );
	mov	a,#0x50
	orl	a,r7
	mov	_P2,a
	C$main.c$207$1_0$22 ==.
;	main.c:207: Pause();
	push	ar6
	lcall	_Pause
	pop	ar6
	C$main.c$208$1_0$22 ==.
;	main.c:208: P2=( LCD_RS | (val & 0x0F) );
	mov	_P2,r6
	C$main.c$210$1_0$22 ==.
;	main.c:210: while(LCD_State()&0x80);
00101$:
	lcall	_LCD_State
	mov	a,dpl
	jb	acc.7,00101$
	C$main.c$211$1_0$22 ==.
;	main.c:211: }
	C$main.c$211$1_0$22 ==.
	XG$LCD_SendData$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_Init'
;------------------------------------------------------------
	G$LCD_Init$0$0 ==.
	C$main.c$214$1_0$24 ==.
;	main.c:214: void LCD_Init(void)
;	-----------------------------------------
;	 function LCD_Init
;	-----------------------------------------
_LCD_Init:
	C$main.c$216$1_0$24 ==.
;	main.c:216: P2=( 0 );      /* set RS, RW and EN low */
	mov	_P2,#0x00
	C$main.c$218$1_0$24 ==.
;	main.c:218: Delay(50);        /* power on delay - wait more than 15 ms */
	mov	dptr,#0x0032
	lcall	_Delay
	C$main.c$220$1_0$24 ==.
;	main.c:220: P2=( 0x03 );           /* lce enable low */
	mov	_P2,#0x03
	C$main.c$221$1_0$24 ==.
;	main.c:221: Delay(1);                /* wait more than 100us */
	mov	dptr,#0x0001
	lcall	_Delay
	C$main.c$222$1_0$24 ==.
;	main.c:222: P2=( LCD_EN | 0x03 );  /* lcd enable high */
	mov	_P2,#0x43
	C$main.c$223$1_0$24 ==.
;	main.c:223: Delay(1);                /* wait more than 100us */
	mov	dptr,#0x0001
	lcall	_Delay
	C$main.c$224$1_0$24 ==.
;	main.c:224: P2=( 0x03 );           /* lce enable low */
	mov	_P2,#0x03
	C$main.c$225$1_0$24 ==.
;	main.c:225: Delay(5);                  /* wait more than 4.1 ms */
	mov	dptr,#0x0005
	lcall	_Delay
	C$main.c$227$1_0$24 ==.
;	main.c:227: P2=( 0x03 );           /* lcd enable low */
	mov	_P2,#0x03
	C$main.c$228$1_0$24 ==.
;	main.c:228: Delay(1);                /* wait more than 100us */
	mov	dptr,#0x0001
	lcall	_Delay
	C$main.c$229$1_0$24 ==.
;	main.c:229: P2=( LCD_EN | 0x03 );  /* lcd enable high */
	mov	_P2,#0x43
	C$main.c$230$1_0$24 ==.
;	main.c:230: Delay(1);                /* wait more than 100us */
	mov	dptr,#0x0001
	lcall	_Delay
	C$main.c$231$1_0$24 ==.
;	main.c:231: P2=( 0x03 );           /* lcd enable low */
	mov	_P2,#0x03
	C$main.c$232$1_0$24 ==.
;	main.c:232: Delay(5);                /* wait more than 100us */
	mov	dptr,#0x0005
	lcall	_Delay
	C$main.c$234$1_0$24 ==.
;	main.c:234: P2=( 0x03 );           /* lcd enable low */
	mov	_P2,#0x03
	C$main.c$235$1_0$24 ==.
;	main.c:235: Delay(1);                /* wait more than 100us */
	mov	dptr,#0x0001
	lcall	_Delay
	C$main.c$236$1_0$24 ==.
;	main.c:236: P2=( LCD_EN | 0x03 );  /* lcd enable high */
	mov	_P2,#0x43
	C$main.c$237$1_0$24 ==.
;	main.c:237: Delay(1);                /* wait more than 100us */
	mov	dptr,#0x0001
	lcall	_Delay
	C$main.c$238$1_0$24 ==.
;	main.c:238: P2=( 0x03 );           /* lcd enable low */
	mov	_P2,#0x03
	C$main.c$239$1_0$24 ==.
;	main.c:239: Delay(5);                /* wait more than 100us */
	mov	dptr,#0x0005
	lcall	_Delay
	C$main.c$241$1_0$24 ==.
;	main.c:241: P2=( 0x02 );           /* lcd enable low */
	mov	_P2,#0x02
	C$main.c$242$1_0$24 ==.
;	main.c:242: Delay(1);                /* wait more than 100us */
	mov	dptr,#0x0001
	lcall	_Delay
	C$main.c$243$1_0$24 ==.
;	main.c:243: P2=( LCD_EN | 0x02 );  /* lcd enable high */
	mov	_P2,#0x42
	C$main.c$244$1_0$24 ==.
;	main.c:244: Delay(1);                /* wait more than 100us */
	mov	dptr,#0x0001
	lcall	_Delay
	C$main.c$245$1_0$24 ==.
;	main.c:245: P2=( 0x02 );           /* lcd enable low */
	mov	_P2,#0x02
	C$main.c$246$1_0$24 ==.
;	main.c:246: Delay(5);                /* wait more than 100us */
	mov	dptr,#0x0005
	lcall	_Delay
	C$main.c$248$1_0$24 ==.
;	main.c:248: LCD_SendCmd(0x28);   /* 4 bit mode, 1/16 duty, 5x8 font */
	mov	dpl,#0x28
	lcall	_LCD_SendCmd
	C$main.c$249$1_0$24 ==.
;	main.c:249: LCD_SendCmd(0x08);   /* display off */
	mov	dpl,#0x08
	lcall	_LCD_SendCmd
	C$main.c$250$1_0$24 ==.
;	main.c:250: LCD_SendCmd(0x01);   /* display clear */
	mov	dpl,#0x01
	lcall	_LCD_SendCmd
	C$main.c$251$1_0$24 ==.
;	main.c:251: LCD_SendCmd(0x06);   /* entry mode */
	mov	dpl,#0x06
	lcall	_LCD_SendCmd
	C$main.c$252$1_0$24 ==.
;	main.c:252: LCD_SendCmd(0x0C);   /* display on, blinking cursor off */
	mov	dpl,#0x0c
	lcall	_LCD_SendCmd
	C$main.c$253$1_0$24 ==.
;	main.c:253: LCD_Pos=0;
	mov	_LCD_Pos,#0x00
	C$main.c$254$1_0$24 ==.
;	main.c:254: }
	C$main.c$254$1_0$24 ==.
	XG$LCD_Init$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putchar'
;------------------------------------------------------------
;c                         Allocated to registers r6 r7 
;------------------------------------------------------------
	G$putchar$0$0 ==.
	C$main.c$258$1_0$26 ==.
;	main.c:258: int putchar(int c)
;	-----------------------------------------
;	 function putchar
;	-----------------------------------------
_putchar:
	mov	r6,dpl
	mov	r7,dph
	C$main.c$260$1_0$26 ==.
;	main.c:260: if(c==10)
	cjne	r6,#0x0a,00110$
	cjne	r7,#0x00,00110$
	C$main.c$262$2_0$27 ==.
;	main.c:262: while((LCD_Pos!=0)&&(LCD_Pos!=40))
00104$:
	mov	a,_LCD_Pos
	jz	00111$
	mov	a,#0x28
	cjne	a,_LCD_Pos,00137$
	sjmp	00111$
00137$:
	C$main.c$264$3_0$28 ==.
;	main.c:264: LCD_SendData(32);
	mov	dpl,#0x20
	lcall	_LCD_SendData
	C$main.c$265$3_0$28 ==.
;	main.c:265: LCD_Pos++;
	inc	_LCD_Pos
	C$main.c$266$3_0$28 ==.
;	main.c:266: if(LCD_Pos==80) LCD_Pos=0;
	mov	a,#0x50
	cjne	a,_LCD_Pos,00104$
	mov	_LCD_Pos,#0x00
	sjmp	00104$
00110$:
	C$main.c$271$2_0$29 ==.
;	main.c:271: LCD_SendData(c);
	mov	dpl,r6
	lcall	_LCD_SendData
	C$main.c$272$2_0$29 ==.
;	main.c:272: LCD_Pos++;
	inc	_LCD_Pos
	C$main.c$273$2_0$29 ==.
;	main.c:273: if(LCD_Pos==80) LCD_Pos=0;
	mov	a,#0x50
	cjne	a,_LCD_Pos,00111$
	mov	_LCD_Pos,#0x00
00111$:
	C$main.c$275$1_0$26 ==.
;	main.c:275: return 0;
	mov	dptr,#0x0000
	C$main.c$276$1_0$26 ==.
;	main.c:276: }
	C$main.c$276$1_0$26 ==.
	XG$putchar$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'init_interrupts'
;------------------------------------------------------------
	G$init_interrupts$0$0 ==.
	C$main.c$286$1_0$31 ==.
;	main.c:286: void init_interrupts(void)
;	-----------------------------------------
;	 function init_interrupts
;	-----------------------------------------
_init_interrupts:
	C$main.c$288$1_0$31 ==.
;	main.c:288: TMOD=0x21;
	mov	_TMOD,#0x21
	C$main.c$289$1_0$31 ==.
;	main.c:289: TCON=0x50;
	mov	_TCON,#0x50
	C$main.c$290$1_0$31 ==.
;	main.c:290: PCON=0x80;
	mov	_PCON,#0x80
	C$main.c$291$1_0$31 ==.
;	main.c:291: TL0=(byte)NPER;
	mov	_TL0,#0xe6
	C$main.c$292$1_0$31 ==.
;	main.c:292: TH0=(byte)(NPER >> 8);
	mov	_TH0,#0xbe
	C$main.c$293$1_0$31 ==.
;	main.c:293: IE=0x82;
	mov	_IE,#0x82
	C$main.c$294$1_0$31 ==.
;	main.c:294: }
	C$main.c$294$1_0$31 ==.
	XG$init_interrupts$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SetLedBar'
;------------------------------------------------------------
;n                         Allocated to registers r6 r7 
;i                         Allocated to registers r5 
;------------------------------------------------------------
	G$SetLedBar$0$0 ==.
	C$main.c$308$1_0$33 ==.
;	main.c:308: void SetLedBar (word n)
;	-----------------------------------------
;	 function SetLedBar
;	-----------------------------------------
_SetLedBar:
	mov	r6,dpl
	mov	r7,dph
	C$main.c$311$1_0$33 ==.
;	main.c:311: LB_RCK = 0;
;	assignBit
	clr	_LB_RCK
	C$main.c$312$1_0$33 ==.
;	main.c:312: LB_SCL = 0;
;	assignBit
	clr	_LB_SCL
	C$main.c$313$1_0$33 ==.
;	main.c:313: LB_SCL = 1;
;	assignBit
	setb	_LB_SCL
	C$main.c$314$1_0$33 ==.
;	main.c:314: LB_SCK = 0;
;	assignBit
	clr	_LB_SCK
	C$main.c$316$2_0$34 ==.
;	main.c:316: for (i=0; i<10; i++)
	mov	r5,#0x00
00102$:
	C$main.c$318$3_0$35 ==.
;	main.c:318: LB_Data = !(n & 1);
	mov	a,r6
	anl	a,#0x01
	cjne	a,#0x01,00114$
00114$:
	mov  _SetLedBar_sloc0_1_0,c
	clr	a
	rlc	a
	add	a,#0xff
	mov	_LB_Data,c
	C$main.c$319$3_0$35 ==.
;	main.c:319: n >>= 1;		// n = n >> 1
	mov	a,r7
	clr	c
	rrc	a
	xch	a,r6
	rrc	a
	xch	a,r6
	mov	r7,a
	C$main.c$320$3_0$35 ==.
;	main.c:320: LB_SCK = 1;
;	assignBit
	setb	_LB_SCK
	C$main.c$321$3_0$35 ==.
;	main.c:321: LB_SCK = 0;
;	assignBit
	clr	_LB_SCK
	C$main.c$316$2_0$34 ==.
;	main.c:316: for (i=0; i<10; i++)
	inc	r5
	cjne	r5,#0x0a,00115$
00115$:
	jc	00102$
	C$main.c$323$1_0$33 ==.
;	main.c:323: LB_RCK = 1;
;	assignBit
	setb	_LB_RCK
	C$main.c$324$1_0$33 ==.
;	main.c:324: LB_OE = 0;
;	assignBit
	clr	_LB_OE
	C$main.c$325$1_0$33 ==.
;	main.c:325: }
	C$main.c$325$1_0$33 ==.
	XG$SetLedBar$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'GetKeyboard'
;------------------------------------------------------------
	G$GetKeyboard$0$0 ==.
	C$main.c$343$1_0$37 ==.
;	main.c:343: char GetKeyboard(void)
;	-----------------------------------------
;	 function GetKeyboard
;	-----------------------------------------
_GetKeyboard:
	C$main.c$345$1_0$37 ==.
;	main.c:345: P0 = 0xFF;
	mov	_P0,#0xff
	C$main.c$346$1_0$37 ==.
;	main.c:346: KEY_R_1 = 0;
;	assignBit
	clr	_KEY_R_1
	C$main.c$347$1_0$37 ==.
;	main.c:347: Pause();
	lcall	_Pause
	C$main.c$348$1_0$37 ==.
;	main.c:348: if (!KEY_C_1) return '1';
	jb	_KEY_C_1,00102$
	mov	dpl,#0x31
	ljmp	00133$
00102$:
	C$main.c$349$1_0$37 ==.
;	main.c:349: if (!KEY_C_2) return '2';
	jb	_KEY_C_2,00104$
	mov	dpl,#0x32
	ljmp	00133$
00104$:
	C$main.c$350$1_0$37 ==.
;	main.c:350: if (!KEY_C_3) return '3';
	jb	_KEY_C_3,00106$
	mov	dpl,#0x33
	ljmp	00133$
00106$:
	C$main.c$351$1_0$37 ==.
;	main.c:351: if (!KEY_C_4) return 'A';
	jb	_KEY_C_4,00108$
	mov	dpl,#0x41
	ljmp	00133$
00108$:
	C$main.c$353$1_0$37 ==.
;	main.c:353: P0 = 0xFF;
	mov	_P0,#0xff
	C$main.c$354$1_0$37 ==.
;	main.c:354: KEY_R_2 = 0;
;	assignBit
	clr	_KEY_R_2
	C$main.c$355$1_0$37 ==.
;	main.c:355: Pause();
	lcall	_Pause
	C$main.c$356$1_0$37 ==.
;	main.c:356: if (!KEY_C_1) return '4';
	jb	_KEY_C_1,00110$
	mov	dpl,#0x34
	sjmp	00133$
00110$:
	C$main.c$357$1_0$37 ==.
;	main.c:357: if (!KEY_C_2) return '5';
	jb	_KEY_C_2,00112$
	mov	dpl,#0x35
	sjmp	00133$
00112$:
	C$main.c$358$1_0$37 ==.
;	main.c:358: if (!KEY_C_3) return '6';
	jb	_KEY_C_3,00114$
	mov	dpl,#0x36
	sjmp	00133$
00114$:
	C$main.c$359$1_0$37 ==.
;	main.c:359: if (!KEY_C_4) return 'B';
	jb	_KEY_C_4,00116$
	mov	dpl,#0x42
	sjmp	00133$
00116$:
	C$main.c$361$1_0$37 ==.
;	main.c:361: P0 = 0xFF;
	mov	_P0,#0xff
	C$main.c$362$1_0$37 ==.
;	main.c:362: KEY_R_3 = 0;
;	assignBit
	clr	_KEY_R_3
	C$main.c$363$1_0$37 ==.
;	main.c:363: Pause();
	lcall	_Pause
	C$main.c$364$1_0$37 ==.
;	main.c:364: if (!KEY_C_1) return '7';
	jb	_KEY_C_1,00118$
	mov	dpl,#0x37
	sjmp	00133$
00118$:
	C$main.c$365$1_0$37 ==.
;	main.c:365: if (!KEY_C_2) return '8';
	jb	_KEY_C_2,00120$
	mov	dpl,#0x38
	sjmp	00133$
00120$:
	C$main.c$366$1_0$37 ==.
;	main.c:366: if (!KEY_C_3) return '9';
	jb	_KEY_C_3,00122$
	mov	dpl,#0x39
	sjmp	00133$
00122$:
	C$main.c$367$1_0$37 ==.
;	main.c:367: if (!KEY_C_4) return 'C';
	jb	_KEY_C_4,00124$
	mov	dpl,#0x43
	sjmp	00133$
00124$:
	C$main.c$369$1_0$37 ==.
;	main.c:369: P0 = 0xFF;
	mov	_P0,#0xff
	C$main.c$370$1_0$37 ==.
;	main.c:370: KEY_R_4 = 0;
;	assignBit
	clr	_KEY_R_4
	C$main.c$371$1_0$37 ==.
;	main.c:371: Pause();
	lcall	_Pause
	C$main.c$372$1_0$37 ==.
;	main.c:372: if (!KEY_C_1) return '*';
	jb	_KEY_C_1,00126$
	mov	dpl,#0x2a
	sjmp	00133$
00126$:
	C$main.c$373$1_0$37 ==.
;	main.c:373: if (!KEY_C_2) return '0';
	jb	_KEY_C_2,00128$
	mov	dpl,#0x30
	sjmp	00133$
00128$:
	C$main.c$374$1_0$37 ==.
;	main.c:374: if (!KEY_C_3) return '#';
	jb	_KEY_C_3,00130$
	mov	dpl,#0x23
	sjmp	00133$
00130$:
	C$main.c$375$1_0$37 ==.
;	main.c:375: if (!KEY_C_4) return 'D';
	jb	_KEY_C_4,00132$
	mov	dpl,#0x44
	sjmp	00133$
00132$:
	C$main.c$377$1_0$37 ==.
;	main.c:377: return -1;
	mov	dpl,#0xff
00133$:
	C$main.c$378$1_0$37 ==.
;	main.c:378: }
	C$main.c$378$1_0$37 ==.
	XG$GetKeyboard$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'second'
;------------------------------------------------------------
;power                     Allocated with name '_second_PARM_2'
;number                    Allocated to registers r6 r7 
;res                       Allocated to registers r4 r5 
;i                         Allocated to registers r2 r3 
;------------------------------------------------------------
	G$second$0$0 ==.
	C$main.c$380$1_0$39 ==.
;	main.c:380: int second(int number,int power){
;	-----------------------------------------
;	 function second
;	-----------------------------------------
_second:
	mov	r6,dpl
	mov	r7,dph
	C$main.c$381$2_0$39 ==.
;	main.c:381: int res=1;
	mov	r4,#0x01
	mov	r5,#0x00
	C$main.c$382$3_0$40 ==.
;	main.c:382: for(int i=1;i<power;i++){
	mov	r2,#0x01
	mov	r3,#0x00
00103$:
	clr	c
	mov	a,r2
	subb	a,_second_PARM_2
	mov	a,r3
	xrl	a,#0x80
	mov	b,(_second_PARM_2 + 1)
	xrl	b,#0x80
	subb	a,b
	jnc	00101$
	C$main.c$383$1_0$39 ==.
;	main.c:383: res*=number;
	mov	__mulint_PARM_2,r6
	mov	(__mulint_PARM_2 + 1),r7
	mov	dpl,r4
	mov	dph,r5
	push	ar7
	push	ar6
	push	ar3
	push	ar2
	lcall	__mulint
	mov	r4,dpl
	mov	r5,dph
	pop	ar2
	pop	ar3
	pop	ar6
	pop	ar7
	C$main.c$382$2_0$40 ==.
;	main.c:382: for(int i=1;i<power;i++){
	inc	r2
	cjne	r2,#0x00,00103$
	inc	r3
	sjmp	00103$
00101$:
	C$main.c$385$1_0$39 ==.
;	main.c:385: return res;
	mov	dpl,r4
	mov	dph,r5
	C$main.c$386$1_0$39 ==.
;	main.c:386: }
	C$main.c$386$1_0$39 ==.
	XG$second$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;bStisk                    Allocated to registers 
;wx                        Allocated to registers 
;buzzerTimer               Allocated to registers r6 r7 
;------------------------------------------------------------
	G$main$0$0 ==.
	C$main.c$394$1_0$43 ==.
;	main.c:394: void main(void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	C$main.c$398$1_0$43 ==.
;	main.c:398: init_interrupts();
	lcall	_init_interrupts
	C$main.c$399$1_0$43 ==.
;	main.c:399: LCD_Init();
	lcall	_LCD_Init
	C$main.c$400$1_0$43 ==.
;	main.c:400: printf("7 - Stop\n");
	mov	a,#___str_0
	push	acc
	mov	a,#(___str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	C$main.c$401$1_0$43 ==.
;	main.c:401: printf("C - Start\n");
	mov	a,#___str_1
	push	acc
	mov	a,#(___str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	C$main.c$402$1_0$43 ==.
;	main.c:402: run=0;
	mov	_run,#0x00
	C$main.c$403$1_0$43 ==.
;	main.c:403: index=3;
	mov	_index,#0x03
	mov	(_index + 1),#0x00
	C$main.c$404$2_0$44 ==.
;	main.c:404: word buzzerTimer=0;
	mov	r6,#0x00
	mov	r7,#0x00
	C$main.c$405$1_1$44 ==.
;	main.c:405: SetLedBar(second(2,2)-1);
	mov	_second_PARM_2,#0x02
;	1-genFromRTrack replaced	mov	(_second_PARM_2 + 1),#0x00
	mov	(_second_PARM_2 + 1),r7
	mov	dptr,#0x0002
	push	ar7
	push	ar6
	lcall	_second
	mov	a,dpl
	mov	b,dph
	add	a,#0xff
	mov	dpl,a
	mov	a,b
	addc	a,#0xff
	mov	dph,a
	lcall	_SetLedBar
	pop	ar6
	pop	ar7
	C$main.c$406$1_1$44 ==.
;	main.c:406: while(1){
00113$:
	C$main.c$407$2_1$45 ==.
;	main.c:407: if(GetKeyboard()=='C' && run==0){
	push	ar7
	push	ar6
	lcall	_GetKeyboard
	mov	r5,dpl
	pop	ar6
	pop	ar7
	cjne	r5,#0x43,00102$
	mov	a,_run
	jnz	00102$
	C$main.c$408$3_1$46 ==.
;	main.c:408: Buzzer=1;
;	assignBit
	setb	_Buzzer
	C$main.c$409$3_1$46 ==.
;	main.c:409: buzzerTimer=0;
	mov	r6,#0x00
	mov	r7,#0x00
	C$main.c$410$3_1$46 ==.
;	main.c:410: printf("7 - Stop\n");
	push	ar7
	push	ar6
	mov	a,#___str_0
	push	acc
	mov	a,#(___str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	C$main.c$411$3_1$46 ==.
;	main.c:411: printf("Rotace vlny\n");
	mov	a,#___str_2
	push	acc
	mov	a,#(___str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	pop	ar6
	pop	ar7
	C$main.c$412$3_1$46 ==.
;	main.c:412: run=1;
	mov	_run,#0x01
00102$:
	C$main.c$414$2_1$45 ==.
;	main.c:414: if(GetKeyboard()=='7' && run==1){
	push	ar7
	push	ar6
	lcall	_GetKeyboard
	mov	r5,dpl
	pop	ar6
	pop	ar7
	cjne	r5,#0x37,00148$
	sjmp	00149$
00148$:
	ljmp	00108$
00149$:
	mov	a,#0x01
	cjne	a,_run,00150$
	sjmp	00151$
00150$:
	ljmp	00108$
00151$:
	C$main.c$415$3_1$47 ==.
;	main.c:415: Buzzer=1;
;	assignBit
	setb	_Buzzer
	C$main.c$416$3_1$47 ==.
;	main.c:416: buzzerTimer=0;
	mov	r6,#0x00
	mov	r7,#0x00
	C$main.c$417$3_1$47 ==.
;	main.c:417: if(index<11)
	clr	c
	mov	a,_index
	subb	a,#0x0b
	mov	a,(_index + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00105$
	C$main.c$418$3_1$47 ==.
;	main.c:418: printf("Kombinace 0x%x\n",second(2,index)-1);
	mov	_second_PARM_2,_index
	mov	(_second_PARM_2 + 1),(_index + 1)
	mov	dptr,#0x0002
	push	ar7
	push	ar6
	lcall	_second
	mov	a,dpl
	mov	b,dph
	add	a,#0xff
	mov	r4,a
	mov	a,b
	addc	a,#0xff
	mov	r5,a
	push	ar4
	push	ar5
	mov	a,#___str_3
	push	acc
	mov	a,#(___str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar6
	pop	ar7
	sjmp	00106$
00105$:
	C$main.c$420$3_1$47 ==.
;	main.c:420: printf("Kombinace 0x%x\n",1023-(second(2,index-9)-1));
	mov	a,_index
	add	a,#0xf7
	mov	_second_PARM_2,a
	mov	a,(_index + 1)
	addc	a,#0xff
	mov	(_second_PARM_2 + 1),a
	mov	dptr,#0x0002
	push	ar7
	push	ar6
	lcall	_second
	mov	a,dpl
	mov	b,dph
	add	a,#0xff
	mov	r4,a
	mov	a,b
	addc	a,#0xff
	mov	r5,a
	mov	a,#0xff
	clr	c
	subb	a,r4
	mov	r4,a
	mov	a,#0x03
	subb	a,r5
	mov	r5,a
	push	ar4
	push	ar5
	mov	a,#___str_3
	push	acc
	mov	a,#(___str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xfb
	mov	sp,a
	pop	ar6
	pop	ar7
00106$:
	C$main.c$421$3_1$47 ==.
;	main.c:421: printf("C - Start\n");
	push	ar7
	push	ar6
	mov	a,#___str_1
	push	acc
	mov	a,#(___str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
	pop	ar6
	pop	ar7
	C$main.c$422$3_1$47 ==.
;	main.c:422: run=0;
	mov	_run,#0x00
00108$:
	C$main.c$424$2_1$45 ==.
;	main.c:424: if(buzzerTimer==5){
	cjne	r6,#0x05,00111$
	cjne	r7,#0x00,00111$
	C$main.c$425$3_1$48 ==.
;	main.c:425: Buzzer=0;
;	assignBit
	clr	_Buzzer
00111$:
	C$main.c$427$2_1$45 ==.
;	main.c:427: buzzerTimer++;
	inc	r6
	cjne	r6,#0x00,00155$
	inc	r7
00155$:
	ljmp	00113$
	C$main.c$429$1_1$43 ==.
;	main.c:429: }
	C$main.c$429$1_1$43 ==.
	XG$main$0$0 ==.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0'
;------------------------------------------------------------
	G$timer0$0$0 ==.
	C$main.c$437$1_1$49 ==.
;	main.c:437: void timer0() __interrupt 1
;	-----------------------------------------
;	 function timer0
;	-----------------------------------------
_timer0:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+7)
	push	(0+6)
	push	(0+5)
	push	(0+4)
	push	(0+3)
	push	(0+2)
	push	(0+1)
	push	(0+0)
	push	psw
	mov	psw,#0x00
	C$main.c$439$1_0$49 ==.
;	main.c:439: TL0=(byte)NPER;
	mov	_TL0,#0xe6
	C$main.c$440$1_0$49 ==.
;	main.c:440: TH0=(byte)(NPER >> 8);
	mov	_TH0,#0xbe
	C$main.c$441$1_0$49 ==.
;	main.c:441: if(++TIMER>=300){
	mov	a,#0x01
	add	a,_TIMER
	mov	r6,a
	clr	a
	addc	a,(_TIMER + 1)
	mov	r7,a
	mov	_TIMER,r6
	mov	(_TIMER + 1),r7
	clr	c
	mov	a,r6
	subb	a,#0x2c
	mov	a,r7
	subb	a,#0x01
	jnc	00142$
	ljmp	00114$
00142$:
	C$main.c$442$2_0$50 ==.
;	main.c:442: if(run==1){
	mov	a,#0x01
	cjne	a,_run,00143$
	sjmp	00144$
00143$:
	ljmp	00108$
00144$:
	C$main.c$443$3_0$51 ==.
;	main.c:443: TIMER=0;
	clr	a
	mov	_TIMER,a
	mov	(_TIMER + 1),a
	C$main.c$444$3_0$51 ==.
;	main.c:444: if(index <11)
	clr	c
	mov	a,_index
	subb	a,#0x0b
	mov	a,(_index + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jnc	00102$
	C$main.c$445$3_0$51 ==.
;	main.c:445: SetLedBar(second(2,index)-1);
	mov	_second_PARM_2,_index
	mov	(_second_PARM_2 + 1),(_index + 1)
	mov	dptr,#0x0002
	lcall	_second
	mov	a,dpl
	mov	b,dph
	add	a,#0xff
	mov	dpl,a
	mov	a,b
	addc	a,#0xff
	mov	dph,a
	lcall	_SetLedBar
	sjmp	00103$
00102$:
	C$main.c$447$3_0$51 ==.
;	main.c:447: SetLedBar(1023-(second(2,index-10)-1));
	mov	a,_index
	add	a,#0xf6
	mov	_second_PARM_2,a
	mov	a,(_index + 1)
	addc	a,#0xff
	mov	(_second_PARM_2 + 1),a
	mov	dptr,#0x0002
	lcall	_second
	mov	a,dpl
	mov	b,dph
	add	a,#0xff
	mov	r6,a
	mov	a,b
	addc	a,#0xff
	mov	r7,a
	mov	a,#0xff
	clr	c
	subb	a,r6
	mov	dpl,a
	mov	a,#0x03
	subb	a,r7
	mov	dph,a
	lcall	_SetLedBar
00103$:
	C$main.c$448$3_0$51 ==.
;	main.c:448: if(index>=20)
	clr	c
	mov	a,_index
	subb	a,#0x14
	mov	a,(_index + 1)
	xrl	a,#0x80
	subb	a,#0x80
	jc	00105$
	C$main.c$449$3_0$51 ==.
;	main.c:449: index=2;
	mov	_index,#0x02
	mov	(_index + 1),#0x00
	sjmp	00116$
00105$:
	C$main.c$451$3_0$51 ==.
;	main.c:451: index++;
	mov	r6,_index
	mov	r7,(_index + 1)
	mov	a,#0x01
	add	a,r6
	mov	_index,a
	clr	a
	addc	a,r7
	mov	(_index + 1),a
	sjmp	00116$
00108$:
	C$main.c$453$2_0$50 ==.
;	main.c:453: TIMER=0;
	clr	a
	mov	_TIMER,a
	mov	(_TIMER + 1),a
	sjmp	00116$
00114$:
	C$main.c$454$1_0$49 ==.
;	main.c:454: }else if(TIMER==150 && run==1)
	mov	a,#0x96
	cjne	a,_TIMER,00147$
	clr	a
	cjne	a,(_TIMER + 1),00147$
	sjmp	00148$
00147$:
	sjmp	00116$
00148$:
	mov	a,#0x01
	cjne	a,_run,00116$
	C$main.c$455$1_0$49 ==.
;	main.c:455: SetLedBar(0);
	mov	dptr,#0x0000
	lcall	_SetLedBar
00116$:
	C$main.c$456$1_0$49 ==.
;	main.c:456: }
	pop	psw
	pop	(0+0)
	pop	(0+1)
	pop	(0+2)
	pop	(0+3)
	pop	(0+4)
	pop	(0+5)
	pop	(0+6)
	pop	(0+7)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	C$main.c$456$1_0$49 ==.
	XG$timer0$0$0 ==.
	reti
	.area CSEG    (CODE)
	.area CONST   (CODE)
Fmain$__str_0$0_0$0 == .
	.area CONST   (CODE)
___str_0:
	.ascii "7 - Stop"
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
Fmain$__str_1$0_0$0 == .
	.area CONST   (CODE)
___str_1:
	.ascii "C - Start"
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
Fmain$__str_2$0_0$0 == .
	.area CONST   (CODE)
___str_2:
	.ascii "Rotace vlny"
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
Fmain$__str_3$0_0$0 == .
	.area CONST   (CODE)
___str_3:
	.ascii "Kombinace 0x%x"
	.db 0x0a
	.db 0x00
	.area CSEG    (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
