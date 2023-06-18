
#define butonArttir Button(&GPIOA_IDR, 0, 100, 1)
#define butonAzalt Button(&GPIOA_IDR, 1, 100, 1)
#define butonSifirla Button(&GPIOA_IDR, 2, 100, 1)

sbit LCD_RS at GPIOE_ODR.B8;
sbit LCD_EN at GPIOE_ODR.B10;
sbit LCD_D4 at GPIOE_ODR.B4;
sbit LCD_D5 at GPIOE_ODR.B5;
sbit LCD_D6 at GPIOE_ODR.B6;
sbit LCD_D7 at GPIOE_ODR.B7;

unsigned int period;
int i=0;
char txt[12];

void Kurulum() {

	period=PWM_TIM4_Init(10000);
	PWM_TIM4_Set_Duty((period/100)*0,_PWM_NON_INVERTED, _PWM_CHANNEL2);
	PWM_TIM4_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM4_CH2_PD13);
		
	GPIO_Digital_Input(&GPIOA_IDR, _GPIO_PINMASK_0 |  
								   _GPIO_PINMASK_1 |
								   _GPIO_PINMASK_2);

	Lcd_Init();
	Lcd_Cmd(_LCD_CURSOR_OFF);
	Lcd_Cmd(_LCD_CLEAR);

}


void main() {
    Kurulum();
    
    while(1) {

        if(butonArttir){
            i=i+10;
            if(i>=100)  i=100;
        }     
        if(butonAzalt){
            i=i-20;
            if(i<=0)  i=0;
        }
        if(butonSifirla){
            i=0;
        }    

        PWM_TIM4_Set_Duty((period/100)*i,_PWM_NON_INVERTED, _PWM_CHANNEL2);
        delay_ms(100);

        IntToStr(i,txt);
        Lcd_Out(1,1,"Ses Degeri");
        Lcd_Out(2,1,"%");
        Lcd_Out_CP(txt);
		
        delay_ms(1000);
   }
}