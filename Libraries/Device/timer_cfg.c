/**
  ******************************************************************************
  * @file    Timer_cfg.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-02-25
  * @brief   Timers Configuration seouce file
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "timer_cfg.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
__IO uint16_t TIM4_CNT = 0;

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/
/**
  * @brief  Timer1 Init
  * values.
  * @param  none
  * @retval none
  */
static void TIM1_Config( void )
{
  TIM1_DeInit(  );
/* Time Base configuration */
/*TIM1_Period = 4095
  TIM1_Prescaler = 0
  TIM1_CounterMode = TIM1_COUNTERMODE_UP
  TIM1_RepetitionCounter = 0*/
  TIM1_TimeBaseInit( 0, TIM1_COUNTERMODE_UP, 4999, 0 );
/* Channel 1, 2,3 and 4 Configuration in PWM mode */ 
/*TIM1_OCMode = TIM1_OCMODE_PWM2
  TIM1_OutputState = TIM1_OUTPUTSTATE_ENABLE
  TIM1_OutputNState = TIM1_OUTPUTNSTATE_ENABLE
  TIM1_Pulse = CCR1_Val
  TIM1_OCPolarity = TIM1_OCPOLARITY_LOW
  TIM1_OCNPolarity = TIM1_OCNPOLARITY_HIGH
  TIM1_OCIdleState = TIM1_OCIDLESTATE_SET
  TIM1_OCNIdleState = TIM1_OCIDLESTATE_RESET  */
/*TIM1_OC1Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
               CCR1_Val, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
               TIM1_OCNIDLESTATE_RESET);*/ 
/*TIM1_Pulse = CCR2_Val*/
  TIM1_OC2Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE, 0,
               TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET, 
               TIM1_OCNIDLESTATE_RESET);
/*TIM1_Pulse = CCR3_Val*/
/*TIM1_OC3Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE,
               CCR3_Val, TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET,
               TIM1_OCNIDLESTATE_RESET);*/
/*TIM1_Pulse = CCR4_Val*/
/*TIM1_OC4Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_ENABLE, CCR4_Val, TIM1_OCPOLARITY_LOW,
               TIM1_OCIDLESTATE_SET);*/  
/* TIM1 counter enable */
  TIM1_Cmd(ENABLE);
/* TIM1 Main Output Enable */
  TIM1_CtrlPWMOutputs(ENABLE);
}

/**
  * @brief  Timer4 Init
  * values.
  * @param  none
  * @retval none
  */
static void TIM4_Config( void )
{
  /* Time base configuration */
  /* TIM4 configuration:
   - TIM4CLK is set to 24 MHz, the TIM4 Prescaler is equal to 128 so the TIM1 counter
   clock used is 24 MHz / 128 = 187 500 Hz
  - With 125 000 Hz we can generate time base:
      max time base is 2.048 ms if TIM4_PERIOD = 255 --> (255 + 1) / 187500 = 
      min time base is 0.016 ms if TIM4_PERIOD = 1   --> (  1 + 1) / 187500 = 
  - In this example we need to generate a time base equal to 1.2 ms
   so TIM4_PERIOD = (0.0008 * 187500 - 1) = 149 (1250Hz)*/  
  TIM4_TimeBaseInit(TIM4_PRESCALER_128, 149 );
  /* Clear TIM4 update flag */
  TIM4_ClearFlag(TIM4_FLAG_UPDATE);
  /* Enable update interrupt */
  TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  /* Enable TIM4 */
  TIM4_Cmd(ENABLE);
}

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  All Timers Init
  * values.
  * @param  none
  * @retval none
  */
void TimersInit( void )
{
  TIM1_Config(  );
  TIM4_Config(  );
}

void IT_TIM4_Dec( void )
{
  if ( TIM4_CNT != 0x00 )
    TIM4_CNT--;
}

/**
  * @brief  Set PWM OUT
  * values.
  * @param  pwm value
  * @retval none
  */
void SetPWM( uint8_t PWM_Chenel, uint16_t value )
{
  switch ( PWM_Chenel )
  {
  case 1:
    TIM1_OC2Init(TIM1_OCMODE_PWM2, TIM1_OUTPUTSTATE_ENABLE, TIM1_OUTPUTNSTATE_ENABLE, value,
               TIM1_OCPOLARITY_LOW, TIM1_OCNPOLARITY_HIGH, TIM1_OCIDLESTATE_SET, 
               TIM1_OCNIDLESTATE_RESET);
    break;
  default: break;
  }
}

/************************** (C) COPYRIGHT 2016 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
