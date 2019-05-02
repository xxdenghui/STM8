/**
  ******************************************************************************
  * @file    hal_pwm.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-03-15
  * @brief   
  ******************************************************************************
  * @attention
  * 
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "hal_pwm.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/ 

/* Public functions ----------------------------------------------------------*/

/**
  * @brief  uart print string
  * values 
  * @param  
  *     string
  * @retval None
  */
void hal_pwm_set( HAL_PWMCH_TypeDef channel, uint16_t PWM_value, uint16_t maxvalue )
{
  switch ( channel >> 4 ){
#ifdef __STM8S_TIM1_H
  case 1: 
    CLK_PeripheralClockConfig( CLK_PERIPHERAL_TIMER1, ENABLE );
    TIM1_TimeBaseInit( 64, TIM1_COUNTERMODE_UP, maxvalue-1, 0 );
    switch ( channel & 0x0F ){
    case 1:
      TIM1_OC1Init( TIM1_OCMODE_PWM2, 
                    TIM1_OUTPUTSTATE_ENABLE, 
                    TIM1_OUTPUTNSTATE_DISABLE, 
                    PWM_value,
                    TIM1_OCPOLARITY_LOW,
                    TIM1_OCNPOLARITY_HIGH, 
                    TIM1_OCIDLESTATE_SET,
                    TIM1_OCNIDLESTATE_RESET );
      break;
    case 2:
      TIM1_OC2Init( TIM1_OCMODE_PWM2, 
                    TIM1_OUTPUTSTATE_ENABLE, 
                    TIM1_OUTPUTNSTATE_DISABLE, 
                    PWM_value,
                    TIM1_OCPOLARITY_LOW,
                    TIM1_OCNPOLARITY_HIGH, 
                    TIM1_OCIDLESTATE_SET,
                    TIM1_OCNIDLESTATE_RESET );
      break;
    case 3:
      TIM1_OC3Init( TIM1_OCMODE_PWM2, 
                    TIM1_OUTPUTSTATE_ENABLE, 
                    TIM1_OUTPUTNSTATE_DISABLE, 
                    PWM_value,
                    TIM1_OCPOLARITY_LOW,
                    TIM1_OCNPOLARITY_HIGH, 
                    TIM1_OCIDLESTATE_SET,
                    TIM1_OCNIDLESTATE_RESET );
      break;
    case 4:
      TIM1_OC4Init( TIM1_OCMODE_PWM2, 
                    TIM1_OUTPUTSTATE_ENABLE,  
                    PWM_value,
                    TIM1_OCPOLARITY_LOW,
                    TIM1_OCIDLESTATE_SET );
      break;
    default:
      break;
    }
    TIM1_CtrlPWMOutputs( ENABLE );
    TIM1_Cmd( ENABLE );
    break;
#endif	// __STM8S_TIM1_H
	
#ifdef __STM8S_TIM2_H    
  case 2:
    CLK_PeripheralClockConfig( CLK_PERIPHERAL_TIMER2, ENABLE );
    TIM2_TimeBaseInit( TIM2_PRESCALER_1, maxvalue-1 );
    switch ( channel & 0x0F ){
    case 1:
       TIM2_OC1Init( TIM2_OCMODE_PWM1, 
                     TIM2_OUTPUTSTATE_ENABLE, 
                     PWM_value, 
                     TIM2_OCPOLARITY_HIGH );
      TIM2_OC1PreloadConfig(ENABLE);
      break;
    case 2:
      TIM2_OC2Init( TIM2_OCMODE_PWM1, 
                    TIM2_OUTPUTSTATE_ENABLE,
                    PWM_value, 
                    TIM2_OCPOLARITY_HIGH );
      TIM2_OC2PreloadConfig(ENABLE);
      break;
    case 3:
      TIM2_OC3Init( TIM2_OCMODE_PWM1, 
                    TIM2_OUTPUTSTATE_ENABLE, 
                    PWM_value, 
                    TIM2_OCPOLARITY_HIGH );
      TIM2_OC3PreloadConfig(ENABLE);
      break;
    default:
      break;
    }
    TIM2_ARRPreloadConfig(ENABLE);
    TIM2_Cmd( ENABLE );
    break;
#endif	// __STM8S_TIM2_H
	
#ifdef __STM8S_TIM3_H    
  case 3:
    CLK_PeripheralClockConfig( CLK_PERIPHERAL_TIMER3, ENABLE );
    TIM3_TimeBaseInit( TIM3_PRESCALER_1, maxvalue-1 );
    TIM3_Cmd( ENABLE );
    switch ( channel & 0x0F ){
    case 1:
      TIM3_OC1Init( TIM3_OCMODE_PWM1, 
                    TIM3_OUTPUTSTATE_ENABLE, 
                    PWM_value, 
                    TIM3_OCPOLARITY_HIGH );
      break;
    case 2:
      TIM3_OC2Init( TIM3_OCMODE_PWM1, 
                    TIM3_OUTPUTSTATE_ENABLE, 
                    PWM_value, 
                    TIM3_OCPOLARITY_HIGH );
      break;
    default:
      break;
    }
    break;
#endif	// __STM8S_TIM3_H
	
  default:
    break;
  }
}

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
