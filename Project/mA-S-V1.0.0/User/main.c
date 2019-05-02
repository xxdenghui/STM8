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

// systerm mark
typedef struct Task_Components_Type
{
    uint8_t run;                				// task mark
    uint16_t timer;             				// task conter
    uint16_t period;            				// task period
    void (*TaskFunc)(void);    					// tasks
} Task_Components_Type;


/* Private variables ---------------------------------------------------------*/

uint16_t ADC_Bright_OCC, ADC_Bright_SET;		// adc bright occurence & set value,R16=2.3K,RV2=100K,ADC value=0~1000
uint8_t ADC_Time_OCC;							// adc delay time occurence & set value,R17=4.3K,RV3=100K,ADC value=0~980
uint16_t Bright_OCC, Bright_SET;				// soft pwm values

uint32_t step = 1;
uint32_t stepCounter;
uint16_t adcValue;

/* Private function prototypes -----------------------------------------------*/
void SystemInit( void );

// task fuctions prototypes
void TaskRemarks(void);
void TaskProcess(void);

void Task_ADC_Cov(void);
void Task_SOF_Pwm(void);
void Task_Blink(void);

void BaseTimer_CallBack( void );
// task list
typedef enum Task_List
{
    TASK_ADC_COV,
	TASK_SOF_PWM,
	TASK_BLINK,
    TASKS_MAX
} Task_List;

// task types: run, timer, period, fuctions
static Task_Components_Type Tasks_Type[]=
{  
  {0, 10, 10, Task_ADC_Cov},			
  {0, 9, 10, Task_SOF_Pwm},
  {0, 8, 500, Task_Blink},
};

/* Private functions ---------------------------------------------------------*/
/*******************************************************************************
 * brief: main
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
int main(void) 
{
    SystemInit(  );
    // Interface loop
    while ( 1 ){
        TaskProcess();
    } 
}

/*******************************************************************************
 * brief: SystemInit
 * param: none
 * retval: none
 * remark: none
 ******************************************************************************/
void SystemInit( void ) 
{
    BoardInit();
	
	ADC1_StartConversion();											// start continuous conversion
	while ( !ADC1_GetFlagStatus( ADC1_FLAG_EOC ) );
	ADC1_ClearFlag( ADC1_FLAG_EOC );
	for ( uint8_t i=0; i<10; i++ )
		adcValue += ADC1_GetBufferValue( i );
	ADC_Bright_SET = adcValue/10;
  
    //DeviceInit();
	
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
void BaseTimer_CallBack( void )
{
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
 * brief: Task_ADC_Cov
 * param: none
 * retval: none
 * remark: ADC Cov
 ******************************************************************************/
void Task_ADC_Cov(void)
{
  	uint8_t i;
	static uint8_t taskAdcStep = 0;
	
	switch ( taskAdcStep ){
	case 0:
	  	ADC1_ConversionConfig( ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_3, ADC1_ALIGN_RIGHT );
		taskAdcStep = 1;
		break;
	case 1:
	  	if ( ADC1_GetFlagStatus( ADC1_FLAG_EOC ) ){
	  		ADC1_ClearFlag( ADC1_FLAG_EOC );
			for ( i=0; i<10; i++ )
				adcValue += ADC1_GetBufferValue( i );
			ADC_Bright_OCC = adcValue/10;
			taskAdcStep = 2;
	  	}
	  	break;
	case 2:
	  	ADC1_ConversionConfig( ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_4, ADC1_ALIGN_RIGHT );
		taskAdcStep = 3;
	   	break;
	case 3:
	  	if ( ADC1_GetFlagStatus( ADC1_FLAG_EOC ) ){
	  		ADC1_ClearFlag( ADC1_FLAG_EOC );
			for ( i=0; i<10; i++ )
				adcValue += ADC1_GetBufferValue( i );
			ADC_Time_OCC = (uint8_t)((adcValue/10)>>6);
			taskAdcStep = 4; 
	  	}
	  	break;
	case 4:
		if ( (ADC_Bright_OCC>(ADC_Bright_SET+ADC_BRIGHT_THR))||(ADC_Bright_OCC<(ADC_Bright_SET-ADC_BRIGHT_THR)) ){
			Bright_OCC = Bright_SET = ADC_Bright_OCC;
		}
		else {
			Bright_SET = ADC_Bright_OCC;
		}
		ADC_Bright_SET = ADC_Bright_OCC;
		step = ((uint32_t)ADC_Time_OCC+1)*6000/Bright_SET;
		stepCounter = 0;				// reset conter
		taskAdcStep = 0;
	  	break;
		
	default:
	  	break;
	}
}

/*******************************************************************************
 * brief: soft pwm changing
 * param: none
 * retval: none
 * remark: Pwm
 ******************************************************************************/
void Task_SOF_Pwm(void)
{
    if ( ++stepCounter >= step ){
        stepCounter = 0;
        if ( !GetKey() ){       				 			// go bright
            if ( Bright_OCC < Bright_SET ){
                Bright_OCC++;
                if ( Bright_OCC>25 )
                	REL_On();
            }
            else if ( Bright_OCC > Bright_SET ){
                Bright_OCC--;
                if ( Bright_OCC<20 )
                	REL_Off();
            }
            OutSet( Bright_OCC );
        }
        else {                                              // go dark
            if ( Bright_OCC ){
                Bright_OCC--;
                OutSet( Bright_OCC );
                if ( Bright_OCC<20 )
                	REL_Off();
            }
        }
    }
}

void Task_Blink(void){
	GPIO_WriteReverse(OUT_Port, LED_Pin);
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

