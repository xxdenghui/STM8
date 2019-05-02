/**
  ******************************************************************************
  * @file    pwm.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-09-11
  * @brief   pwm
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "pwm.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

/**
  * @brief. pwm Timer init
  * values.
  *    PWM_Channel_TypeDef 
  * @retval 
  *    none
  */ 
void PWM_Set( PWM_Channel_TypeDef Tx_CHx, uint8_t PWM_value )
{
  uint8_t timer, channel;
  timer = Tx_CHx>>4;
  channel = Tx_CHx &= 0x0f;
  // Peri clk enable
  switch ( timer ){
  case 1:
    CLK_PeripheralClockConfig( CLK_PERIPHERAL_TIMER1, ENABLE );
    TIM1_TimeBaseInit( 512, TIM1_COUNTERMODE_UP, 199, 0 );
    // Timer1 channel 
    switch ( channel ){
    // Timer1 CH1
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
    // Timer1 CH2
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
    // Timer1 CH3
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
    // Timer1 CH4
    case 4:
      TIM1_OC4Init( TIM1_OCMODE_PWM2, 
                    TIM1_OUTPUTSTATE_ENABLE,  
                    PWM_value,
                    TIM1_OCPOLARITY_LOW,
                    TIM1_OCIDLESTATE_SET );
      break;
    default: break;
    }
    TIM1_CtrlPWMOutputs( ENABLE );
    TIM1_Cmd( ENABLE );
    break;
    
  // Timer2 channel 
  case 2:
    CLK_PeripheralClockConfig( CLK_PERIPHERAL_TIMER2, ENABLE );
    TIM2_TimeBaseInit( TIM2_PRESCALER_512, 199 );
    switch ( channel ){
    // Timer2 CH1
    case 1:
      TIM2_OC1Init( TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, PWM_value, TIM2_OCPOLARITY_HIGH );
      TIM2_OC1PreloadConfig(ENABLE);
      break;
    // Timer2 CH2
    case 2:
      TIM2_OC2Init( TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, PWM_value, TIM2_OCPOLARITY_HIGH );
      TIM2_OC2PreloadConfig(ENABLE);
      break;
    // Timer2 CH3
    case 3:
      TIM2_OC3Init( TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, PWM_value, TIM2_OCPOLARITY_HIGH );
      TIM2_OC3PreloadConfig(ENABLE);
      break;
    default: break;
    }
    TIM2_ARRPreloadConfig(ENABLE);
    TIM2_Cmd( ENABLE );
    break;
    
  default: break;
  }
//  GPIO_Init( GPIOC, GPIO_PIN_1, GPIO_MODE_OUT_PP_HIGH_FAST );  /* CH1 TIM1_CH1 */
//  GPIO_Init( GPIOC, GPIO_PIN_2, GPIO_MODE_OUT_PP_HIGH_FAST );  /* CH1 TIM1_CH1 */
}

/**
  * @brief. moto start
  * values.
  *    speed 0-50
  * @retval 
  *    none
  */ 
void MotoStart( uint8_t speed )
{
  TIM1_OC2Init( TIM1_OCMODE_PWM2, 
                TIM1_OUTPUTSTATE_ENABLE, 
                TIM1_OUTPUTNSTATE_DISABLE, 
                speed,
                TIM1_OCPOLARITY_LOW,
                TIM1_OCNPOLARITY_HIGH, 
                TIM1_OCIDLESTATE_SET,
                TIM1_OCNIDLESTATE_RESET );
}


void LEDsOn( uint8_t bright )
{
  TIM1_OC1Init( TIM1_OCMODE_PWM2, 
                TIM1_OUTPUTSTATE_ENABLE, 
                TIM1_OUTPUTNSTATE_DISABLE, 
                bright,
                TIM1_OCPOLARITY_LOW,
                TIM1_OCNPOLARITY_HIGH, 
                TIM1_OCIDLESTATE_SET,
                TIM1_OCNIDLESTATE_RESET );
}

/**
  * @brief. LED OFF
  * values.
  *    none
  * @retval 
  *    none
  */ 
void LEDsOff( void )
{
  TIM1_OC1Init( TIM1_OCMODE_PWM2, 
                TIM1_OUTPUTSTATE_ENABLE, 
                TIM1_OUTPUTNSTATE_DISABLE, 
                0,
                TIM1_OCPOLARITY_LOW,
                TIM1_OCNPOLARITY_HIGH, 
                TIM1_OCIDLESTATE_SET,
                TIM1_OCNIDLESTATE_RESET );
}

/**
  * @brief. moto stop
  * values.
  *    none
  * @retval 
  *    none
  */ 
void MotoStop( void )
{
  TIM1_OC2Init( TIM1_OCMODE_PWM2, 
                TIM1_OUTPUTSTATE_ENABLE, 
                TIM1_OUTPUTNSTATE_DISABLE, 
                0,
                TIM1_OCPOLARITY_LOW,
                TIM1_OCNPOLARITY_HIGH, 
                TIM1_OCIDLESTATE_SET,
                TIM1_OCNIDLESTATE_RESET );
}


/* Public functions ----------------------------------------------------------*/

  
/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
