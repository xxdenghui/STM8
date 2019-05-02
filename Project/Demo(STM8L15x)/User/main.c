/**
  ******************************************************************************
  * @file     Project/USER/main.c
  * @author   Darren
  * @version  V1.0.0
  * @date     2017-01-15
  * @brief    watering control
  * @Hardware CT1501-V1
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "conf.h"

/* Private defines -----------------------------------------------------------*/
#define SYS_CK                  (uint8_t)0x01   // systick flag
#define SYS_HOLD                (uint8_t)0x02   // sys hold flag

#define TRG_PORT                GPIOD         
#define TRG_PIN                 GPIO_PIN_1    
#define EN_PORT                 GPIOD           
#define EN_PIN                  GPIO_PIN_0         

#define TURN_PORT				GPIOB

// task ready mark
#define TASK_KEY_READY			0x01
#define TASK_TEST_BLINK_READY	0x02

/* Private variables ---------------------------------------------------------*/
uint8_t sys_status = 0;
uint8_t tasks_ready = 0;
uint8_t systick1 = 0;
uint8_t systick2 = 0;

/* The system clock information variables */
uint8_t sysclock = 0;           // systerm clock MHz
uint8_t sysclockType = 0;       // systerm clock source type
char sysclock_string[3] = "00";   // systerm clock string
uint8_t systick_times = 0;      // systick counter


/* Private function prototypes -----------------------------------------------*/
void SystemInit( void );
void TIme4_CallBack( void );

void task_key(void);
void task_test_blink(void);

/* Private functions ---------------------------------------------------------*/

int main( void )
{
	/* Initialization function */
	SystemInit(  );

	/* Interface loop */
	while ( 1 ){
		task_key();
		task_test_blink();
	}  
}

void SystemInit( void )
{
	disableInterrupts(  );
	/* clock initialization *******************************************************/
	/* Systerm clock source init */
	CLK_DeInit(  ); 
	CLK_HSEConfig( CLK_HSE_OFF ); 
	CLK_LSEConfig( CLK_LSE_OFF );
	CLK_ClockSwitchCmd( ENABLE ); 			// open sysclock choose switch
	CLK_SYSCLKSourceConfig( CLK_SYSCLKSource_HSI ); // sysclock choose
	CLK_SYSCLKDivConfig( CLK_SYSCLKDiv_1 ); 
	//sysclockSource = CLK_GetSYSCLKSource(  ); // get sysclock source
	//sysclockfreq = CLK_GetClockFreq( )/1000;  // get clock frequence KHz

	/* I/O initialization *******************************************************/
	/* running led pin & fan pin & air pin initialization */
	GPIO_Init( TURN_PORT, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST );  // turnde port init
	GPIO_Init( GPIOD, GPIO_PIN_2|GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST );  // turnde port init
	GPIO_Init( EN_PORT, EN_PIN, GPIO_MODE_OUT_PP_LOW_FAST );  // EN Pin init
	GPIO_Init( TRG_PORT, TRG_PIN, GPIO_MODE_IN_PU_NO_IT );  // CL Pin init
	
	/* Peripherals initialization ***********************************************/
	/* usart initialization */
	uart_cfg( uart3, 9600, no_it );
	
	/* systick timer using TIM4 */
	CLK_PeripheralClockConfig( CLK_Peripheral_TIM4, ENABLE );
	TIM4_TimeBaseInit( TIM4_Prescaler_64, 249 );  // 64p=250KHz, 249+1 priod=1ms
	TIM4_ClearFlag( TIM4_FLAG_Update );
	TIM4_ITConfig( TIM4_IT_Update, ENABLE );
	TIM4_Cmd( ENABLE );

	/* Initialization information ***********************************************/
	sysclockType = CLK_GetSYSCLKSource(  );
	sysclock = CLK_GetClockFreq( )/1000000;
	Dec2String( sysclock, sysclock_string );

	/* Print the initialization information  */
	uart_printf( uart3, "Start working...\r" );
	uart_printf( uart3, "Systerm Clock is: " );
	uart_printf( uart3, sysclock_string );
	uart_printf( uart3, "MHz\r" );
	uart_printf( uart3, "Systerm Clock source is: " );
	switch ( sysclockType ){
	case CLK_SYSCLKSource_HSI: uart_printf( uart3, "HSI\r" ); break;
	case CLK_SYSCLKSource_LSI: uart_printf( uart3, "LSI\r" ); break;
	case CLK_SYSCLKSource_HSE: uart_printf( uart3, "HSE\r" ); break;
	case CLK_SYSCLKSource_LSE: uart_printf( uart3, "LSE\r" ); break;
	} 

	/* enable Interruput */ 
	enableInterrupts(  );
}


void task_key(void)
{
	if ( tasks_ready & TASK_KEY_READY ){
		
		tasks_ready &= ~TASK_KEY_READY;
	}
}

void task_test_blink(void)
{
	if ( tasks_ready & TASK_TEST_BLINK_READY ){
		GPIO_WriteReverse(TURN_PORT, GPIO_PIN_ALL );
		tasks_ready &= ~TASK_TEST_BLINK_READY;
	}
}

/* IRQHandler functions *******************************************************/
void TIme4_CallBack( void )
{
	if ( systick1++ >= 100 ){	// 1ms*100=100ms
		systick1 = 0;
		
		tasks_ready |= TASK_KEY_READY;	// task key
		
		if ( systick2++ >= 10 ){	// 100ms*10=1S
			systick2 = 0;
			
			tasks_ready |= TASK_TEST_BLINK_READY;	// task test blink
		}
	}
}


#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/

