/**
  ******************************************************************************
  * @file    74hc138.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-05-20
  * @brief   the 74HC138 Driver sourse file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "74hc138.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

/* Public functions ----------------------------------------------------------*/

/**
  * @brief  Init 74hc138 IO
  * values.
  * @param  None
  * @retval None
  */
void IO_init_hc138( void )
{
//   OE Reset to High
//   GPIO_Init( GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST );
//   A,B,C,D Reset to Low
  GPIO_Init( GPIOC, GPIO_PIN_1|GPIO_PIN_2|GPIO_PIN_3|GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_FAST );
}
		

/**
  * @brief  Init 74hc138 IO
  * values.
  * @param  None
  * @retval None
  */
void SetLine_hc138( uint8_t line )
{
  uint8_t get_line;
  if ( line < 16 ){
    get_line = 0xE1 & GPIO_ReadInputData( GPIOC );
    GPIO_Write( GPIOC, (get_line|(line<<1)) );
  }
}


/************************** (C) COPYRIGHT 2016 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
