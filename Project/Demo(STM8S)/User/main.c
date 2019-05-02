/**
  ******************************************************************************
  * @file      Project/USER/main.c
  * @author    Darren
  * @version   V1.0.0
  * @date      2019-01-22
  * @brief     
  * @Hardware  mA-S-V1.0.0
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "conf.h"
 
/* Private defines -----------------------------------------------------------*/

// bit define
/*union{
	struct{
		unsigned b0:1;
		unsigned b1:1;
		unsigned b2:1;
		unsigned b3:1;
		unsigned   :4;
	} Task_Status_Bit;
	uint8_t Task_Status_Byte;
}Task_Status;
#define task_Power 							Task_Status.Task_Status_Bit.b0
#define task_Mix 							Task_Status.Task_Status_Bit.b1
#define task_Pwm 							Task_Status.Task_Status_Bit.b2
#define task_PwmWay		 					Task_Status.Task_Status_Bit.b3	*/
// systerm mark
typedef struct Task_Components_Type
{
    uint8_t run;                // task mark
    uint16_t timer;             // task conter
    uint16_t period;            // task period
    void (*TaskFunc)(void);     // tasks
} Task_Components_Type;


/* Private variables ---------------------------------------------------------*/
CLK_Source_TypeDef sysclockSource;
uint8_t sysclockfreq = 0;
char sysclock_string[3] = "00";

uint16_t pwmValue, pwmSet, maxPwm;
uint8_t delayTime;				// 0~15min
uint8_t bright;					// 0~100


/* Private function prototypes -----------------------------------------------*/
void SystemInit( void );

// task fuctions prototypes
void TaskRemarks(void);
void TaskProcess(void);

void Task_Blink(void);
void Task_Pwm(void);

// task list
typedef enum Task_List
{
	TASK_PWM,
    TASK_BLINK,
    TASKS_MAX
} Task_List;

// task types
static Task_Components_Type Tasks_Type[]=
{  
  {0, 1500, 1500, Task_Pwm},
  {0, 10000, 10000, Task_Blink},
};

/* Private functions ---------------------------------------------------------*/

int main(void)
{
    SystemInit(  );
    // Interface loop
    while ( 1 ){
        TaskProcess();
    } 
}
 
void SystemInit( void ) 
{
    /* Clock Initialization */
    CLK_DeInit(  ); 
    CLK_HSICmd( ENABLE );
    CLK_ClockSwitchCmd( ENABLE ); // open sysclock choose switch
    //CLK_SYSCLKSourceConfig( CLK_SYSCLKSource_HSI ); 				// sysclock choose
    //CLK_SYSCLKDivConfig( CLK_SYSCLKDiv_1 ); 
	CLK_HSIPrescalerConfig( CLK_PRESCALER_HSIDIV1 );
    sysclockSource = CLK_GetSYSCLKSource(  ); 						// get sysclock source
    sysclockfreq = (uint8_t)(CLK_GetClockFreq( )/1000000);  		// get clock frequence MHz
  
    /* systick timer init */
    CLK_PeripheralClockConfig( CLK_PERIPHERAL_TIMER4, ENABLE );
    TIM4_TimeBaseInit( TIM4_PRESCALER_64, 25 );
    TIM4_PrescalerConfig( TIM4_PRESCALER_64, TIM4_PSCRELOADMODE_UPDATE );
    TIM4_ITConfig( TIM4_IT_UPDATE, ENABLE );
    TIM4_Cmd( ENABLE ); 
     
    /* GPIO Initialization */
    GPIO_Init( LED_Port, LED_Pin, GPIO_MODE_OUT_PP_HIGH_FAST );     // Blink LED I/O init
  
    /* ADC Initialization */

	
	/* PWM Initalization */
	hal_pwm_set( t1ch3, 0, 100 );
	  
    /* USART Initialization */
    uart_cfg( uart1, 9600, no_it );
    GPIO_Init( GPIOD, GPIO_PIN_5, GPIO_MODE_OUT_PP_HIGH_FAST );     // USART Tx PORT
    GPIO_Init( GPIOD, GPIO_PIN_6, GPIO_MODE_IN_PU_NO_IT );          // USART Rx PORT
    Dec2String( sysclockfreq, sysclock_string );
    uart_printf( uart1, "Start working...\n" );
    uart_printf( uart1, "Systerm Clock is: " );
    uart_printf( uart1, sysclock_string );
    uart_printf( uart1, "MHz\n" );
  
    /* Device Init */
	
	/* Value Reset */
	
    /* Interrupts Initialization */
    enableInterrupts(  );
}

/*******************************************************************************
 * brief: Tim4_CallBack
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
void Tim4_CallBack( void )
{
    TIM4_ClearITPendingBit( TIM4_IT_UPDATE );
    TaskRemarks();
}

/*******************************************************************************
 * brief: TaskRemarks
 * param: none
 * retval: none
 * remark: task remarks
 ******************************************************************************/
void TaskRemarks(void)
{
    uint8_t i;
    for ( i=0; i<TASKS_MAX; i++ ){
        if ( Tasks_Type[i].timer ){   
            Tasks_Type[i].timer--;
            if ( Tasks_Type[i].timer == 0 ){
                Tasks_Type[i].timer = Tasks_Type[i].period;
                Tasks_Type[i].run = 1;	// set task to ready
            }
        }    
    }
	
}

unsigned long kalman_filter(unsigned long ADC_Value)
{
float x_k1_k1,x_k_k1;
static float ADC_OLD_Value;
float Z_k;
static float P_k1_k1;

static float Q = 0.0001;
static float R = 5;
static float Kg = 0;
static float P_k_k1 = 1;

float kalman_adc;
static float kalman_adc_old=0;

Z_k = ADC_Value;

if (abs(kalman_adc_old-ADC_Value)>=10)
{ 
    x_k1_k1= ADC_Value*0.382 + kalman_adc_old*0.618;
}else
{
    x_k1_k1 = kalman_adc_old;
}
x_k_k1 = x_k1_k1;
P_k_k1 = P_k1_k1 + Q;

Kg = P_k_k1/(P_k_k1 + R);

kalman_adc = x_k_k1 + Kg * (Z_k - kalman_adc_old);
P_k1_k1 = (1 - Kg)*P_k_k1;
P_k_k1 = P_k1_k1;

ADC_OLD_Value = ADC_Value;
kalman_adc_old = kalman_adc;

return get_int_num(kalman_adc);
}


/*******************************************************************************
 * brief: TaskProcess
 * param: none
 * retval: none
 * remark: 
 ******************************************************************************/
void TaskProcess(void)
{ 
    uint8_t i;
    for ( i=0; i<TASKS_MAX; i++ ){
        if ( Tasks_Type[i].run ){     
            Tasks_Type[i].TaskFunc(); 
            Tasks_Type[i].run = 0;    
        }    
    }
}

/*******************************************************************************
 * brief: Task_Blink
 * param: none
 * retval: none
 * remark: Blink
 ******************************************************************************/
void Task_Blink(void)
{
    GPIO_WriteReverse( LED_Port, LED_Pin ); 
}


/*******************************************************************************
 * brief: Task_Pwm
 * param: none
 * retval: none
 * remark: Pwm
 ******************************************************************************/
void Task_Pwm(void)
{
	if ( pwmValue < pwmSet )
		pwmValue++;
	else if ( pwmValue > pwmSet )
		pwmValue--;
	hal_pwm_set( t1ch3, pwmValue, maxPwm );
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

