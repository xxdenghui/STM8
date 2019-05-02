/**
  ******************************************************************************
  * @file      Project/USER/board.c
  * @author    Darren
  * @version   V1.0.0
  * @date      2019-05-02
  * @brief     
  * @Hardware  mA-S-V1.0.0
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "board.h"
 
/* Private defines -----------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
CLK_Source_TypeDef sysclockSource;
uint8_t sysclockfreq = 0;
char sysclock_string[3] = "00";

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/
/*******************************************************************************
 * brief: ClockInit
 * param: none
 * retval: none
 * remark: chip clock init
 ******************************************************************************/
void ClockInit(void)
{
	CLK_DeInit(  ); 
    CLK_HSICmd( ENABLE );
    CLK_ClockSwitchCmd( ENABLE ); // open sysclock choose switch
    //CLK_SYSCLKSourceConfig( CLK_SYSCLKSource_HSI ); 				// sysclock choose
    //CLK_SYSCLKDivConfig( CLK_SYSCLKDiv_1 ); 
	CLK_HSIPrescalerConfig( CLK_PRESCALER_HSIDIV1 );
    sysclockSource = CLK_GetSYSCLKSource(  ); 						// get sysclock source
    sysclockfreq = (uint8_t)(CLK_GetClockFreq( )/1000000);  		// get clock frequence MHz
}

/*******************************************************************************
 * brief: BaseTimerInit
 * param: none
 * retval: none
 * remark: base timer inti using timer4 period is 1ms
 ******************************************************************************/
void BaseTimerInit(void)
{
	CLK_PeripheralClockConfig( CLK_PERIPHERAL_TIMER4, ENABLE );
    TIM4_TimeBaseInit( TIM4_PRESCALER_64, 25 );
    TIM4_PrescalerConfig( TIM4_PRESCALER_64, TIM4_PSCRELOADMODE_UPDATE );
    TIM4_ITConfig( TIM4_IT_UPDATE, ENABLE );
    TIM4_Cmd( ENABLE ); 
	
}

/*******************************************************************************
 * brief: GPIOInit
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
void GPIOInit(void)
{
	GPIO_Init( OUT_Port, REL1_Pin|REL2_Pin, GPIO_MODE_OUT_PP_LOW_FAST );   
    GPIO_Init( OUT_Port, LED_Pin, GPIO_MODE_OUT_PP_HIGH_FAST );
    GPIO_Init( IN_Port, SW_Pin, GPIO_MODE_IN_PU_NO_IT );
}

/*******************************************************************************
 * brief: ADCInit
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
void ADCInit(void)
{
	CLK_PeripheralClockConfig( CLK_PERIPHERAL_ADC, ENABLE );       // enable adc clock
	GPIO_Init( GPIOD, GPIO_PIN_2|GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT );
	ADC1_PrescalerConfig( ADC1_PRESSEL_FCPU_D18 );
	ADC1_ExternalTriggerConfig( ADC1_EXTTRIG_TIM, DISABLE );		
	ADC1_SchmittTriggerConfig( ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );
	ADC1_SchmittTriggerConfig( ADC1_SCHMITTTRIG_CHANNEL4, DISABLE );
	ADC1_ConversionConfig( ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_3, ADC1_ALIGN_RIGHT );
	ADC1_Cmd( ENABLE );
	ADC1_DataBufferCmd( ENABLE );
}

/*******************************************************************************
 * brief: UartInit
 * param: none
 * retval: none
 * remark: uart inti using uart1
 ******************************************************************************/
void UartInit(void)
{
	uart_cfg( uart1, 9600 );
    GPIO_Init( GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST );     // USART Tx PORT
    GPIO_Init( GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT );          // USART Rx PORT
    Dec2String( sysclockfreq, sysclock_string );
    uart_printf( uart1, "Start working...\n" );
    uart_printf( uart1, "Systerm Clock is: " );
    uart_printf( uart1, sysclock_string );
    uart_printf( uart1, "MHz\n" );
}

/*******************************************************************************
 * brief: OutSet
 * param: none
 * retval: none
 * remark: pwm output
 ******************************************************************************/
void OutSet(uint16_t pwm)
{
  	if ( pwm >= MAX_PWM ) 
		pwm = MAX_PWM;
	hal_pwm_set( t1ch3, pwm, MAX_PWM );
}

/*******************************************************************************
 * brief: BoardInit
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
void BoardInit( void ) 
{
    ClockInit();
  	BaseTimerInit();
	GPIOInit();
	ADCInit();
	UartInit();
	OutSet(0);

}

/************************** (C) COPYRIGHT 2019 DarrenTang *********************/
/********************************  END OF FILE  *******************************/

