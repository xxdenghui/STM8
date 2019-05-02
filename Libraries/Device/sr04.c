/**
  ******************************************************************************
  * @file    sr04.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-06-04
  * @brief   the ultrasonic sensor-SR04 sourse file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "sr04.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
uint8_t Level = 0;
uint16_t Check_over = 0;
/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/
void send_trig( void )
{
  GPIO_WriteHigh( TRIG_Port, TRIG_Pin );
  delayus(20);
  GPIO_WriteLow( TRIG_Port, TRIG_Pin );
}
/* Public functions ----------------------------------------------------------*/
/**
  * @brief  reset device
  * values.
  * @param  None
  * @retval ErrorStatus- ERROR or SUCCESS 
  */
void Reset_SR04( void )
{
  /* IO Init */
  GPIO_Init( TRIG_Port, TRIG_Pin, GPIO_MODE_OUT_PP_LOW_SLOW );
  GPIO_Init( ECHO_Port, ECHO_Pin, GPIO_MODE_IN_FL_IT );
  
  /* periph Init */
  TIM1_TimeBaseInit( 1412, TIM1_COUNTERMODE_UP, 0, 0 );
  
  /* EXTI Init */
  EXTI_SetExtIntSensitivity( EXTI_PORT_GPIOC, EXTI_SENSITIVITY_RISE_ONLY );
}

/**
  * @brief  reset device
  * values.
  * @param  None
  * @retval ErrorStatus- ERROR or SUCCESS 
  */
void EXTI_PORTC( void )
{
  if ( Level ){
    //TIM1_TimeBaseInit( 1412, TIM1_COUNTERMODE_UP, 0, 0 );
    TIM1_Cmd( DISABLE );
    EXTI_SetExtIntSensitivity( EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_ONLY );
    Level = 0;
    Check_over = 1;
  } else {
    TIM1_Cmd( ENABLE );
    EXTI_SetExtIntSensitivity( EXTI_PORT_GPIOC, EXTI_SENSITIVITY_RISE_ONLY );
    Level = 1;
  }
}

/**
  * @brief  reset device
  * values.
  * @param  None
  * @retval ErrorStatus- ERROR or SUCCESS 
  */
void Get_Distance( uint16_t* distance )
{
  send_trig( );
  while ( Check_over ){
    *distance = TIM1_GetCounter(  );
    Check_over = 0;
  }
}


/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
