_Kurulum:
;Quiz2_Cevap2.c,17 :: 		void Kurulum() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Quiz2_Cevap2.c,19 :: 		period=PWM_TIM4_Init(10000);
MOVW	R0, #10000
BL	_PWM_TIM4_Init+0
MOVW	R1, #lo_addr(_period+0)
MOVT	R1, #hi_addr(_period+0)
STRH	R0, [R1, #0]
;Quiz2_Cevap2.c,20 :: 		PWM_TIM4_Set_Duty((period/100)*0,_PWM_NON_INVERTED, _PWM_CHANNEL2);
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #0
BL	_PWM_TIM4_Set_Duty+0
;Quiz2_Cevap2.c,21 :: 		PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PD13);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVS	R0, #1
BL	_PWM_TIM4_Start+0
;Quiz2_Cevap2.c,25 :: 		_GPIO_PINMASK_2);
MOVW	R1, #7
;Quiz2_Cevap2.c,23 :: 		GPIO_Digital_Input(&GPIOA_IDR, _GPIO_PINMASK_0 |
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
;Quiz2_Cevap2.c,25 :: 		_GPIO_PINMASK_2);
BL	_GPIO_Digital_Input+0
;Quiz2_Cevap2.c,27 :: 		Lcd_Init();
BL	_Lcd_Init+0
;Quiz2_Cevap2.c,28 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;Quiz2_Cevap2.c,29 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;Quiz2_Cevap2.c,31 :: 		}
L_end_Kurulum:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Kurulum
_main:
;Quiz2_Cevap2.c,34 :: 		void main() {
;Quiz2_Cevap2.c,35 :: 		Kurulum();
BL	_Kurulum+0
;Quiz2_Cevap2.c,37 :: 		while(1) {
L_main0:
;Quiz2_Cevap2.c,39 :: 		if(butonArttir){
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main2
;Quiz2_Cevap2.c,40 :: 		i=i+10;
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, #10
SXTH	R0, R0
STRH	R0, [R1, #0]
;Quiz2_Cevap2.c,41 :: 		if(i>=100)  i=100;
CMP	R0, #100
IT	LT
BLT	L_main3
MOVS	R1, #100
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main3:
;Quiz2_Cevap2.c,42 :: 		}
L_main2:
;Quiz2_Cevap2.c,43 :: 		if(butonAzalt){
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main4
;Quiz2_Cevap2.c,44 :: 		i=i-20;
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
SUBS	R0, #20
SXTH	R0, R0
STRH	R0, [R1, #0]
;Quiz2_Cevap2.c,45 :: 		if(i<=0)  i=0;
CMP	R0, #0
IT	GT
BGT	L_main5
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main5:
;Quiz2_Cevap2.c,46 :: 		}
L_main4:
;Quiz2_Cevap2.c,47 :: 		if(butonSifirla){
MOVS	R3, #1
MOVS	R2, #100
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main6
;Quiz2_Cevap2.c,48 :: 		i=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
;Quiz2_Cevap2.c,49 :: 		}
L_main6:
;Quiz2_Cevap2.c,51 :: 		PWM_TIM4_Set_Duty((period/100)*i,_PWM_NON_INVERTED, _PWM_CHANNEL2);
MOVW	R0, #lo_addr(_period+0)
MOVT	R0, #hi_addr(_period+0)
LDRH	R1, [R0, #0]
MOVS	R0, #100
UDIV	R1, R1, R0
UXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
MULS	R0, R1, R0
MOVS	R2, #1
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;Quiz2_Cevap2.c,52 :: 		delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main7:
SUBS	R7, R7, #1
BNE	L_main7
NOP
NOP
NOP
NOP
;Quiz2_Cevap2.c,54 :: 		IntToStr(i,txt);
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt+0)
MOVT	R1, #hi_addr(_txt+0)
BL	_IntToStr+0
;Quiz2_Cevap2.c,55 :: 		Lcd_Out(1,1,"Ses Degeri");
MOVW	R0, #lo_addr(?lstr1_Quiz2_Cevap2+0)
MOVT	R0, #hi_addr(?lstr1_Quiz2_Cevap2+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;Quiz2_Cevap2.c,56 :: 		Lcd_Out(2,1,"%");
MOVW	R0, #lo_addr(?lstr2_Quiz2_Cevap2+0)
MOVT	R0, #hi_addr(?lstr2_Quiz2_Cevap2+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;Quiz2_Cevap2.c,57 :: 		Lcd_Out_CP(txt);
MOVW	R0, #lo_addr(_txt+0)
MOVT	R0, #hi_addr(_txt+0)
BL	_Lcd_Out_CP+0
;Quiz2_Cevap2.c,59 :: 		delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_main9:
SUBS	R7, R7, #1
BNE	L_main9
NOP
NOP
NOP
NOP
;Quiz2_Cevap2.c,60 :: 		}
IT	AL
BAL	L_main0
;Quiz2_Cevap2.c,61 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
