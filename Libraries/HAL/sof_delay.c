/**
  ******************************************************************************
  * @file    delay.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2014-11-10
  * @brief   This is the delay source file.
  ******************************************************************************
  * @attention
  * The Sysclock must be 24MHz
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "sof_delay.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

/* Public functions ----------------------------------------------------------*/

/**
  * @brief  delayms fuctions
  * values.
  * @param  ms
  * @retval None
  */
void delayms( unsigned int ms )
{
    for( ; ms > 0; ms-- )
    {
      delayus( 1000 );
    }
}

/**
  * @brief  delayus fuctions
  * values.
  * @param  us
  * @retval None
  */
void delayus( unsigned int us )
{
  us-=3;
  while ( us-- )
  {
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop");
    asm("nop"); 
    asm("nop");
    asm("nop"); // 16MHz
    //asm("nop");
    //asm("nop");
    //asm("nop"); // 24MHz
  }
}

  
/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
