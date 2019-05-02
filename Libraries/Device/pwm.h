/**
  ******************************************************************************
  * @file    moto.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-07-21
  * @brief   电机驱动头文件
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __PWM_H
#define __PWM_H


/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"

/* Exported types ------------------------------------------------------------*/
typedef enum{
  T1_CH1            = (uint8_t)0x11,
  T1_CH2            = (uint8_t)0x12,
  T1_CH3            = (uint8_t)0x13,
  T1_CH4            = (uint8_t)0x14,
  T2_CH1            = (uint8_t)0x21,
  T2_CH2            = (uint8_t)0x22,
  T2_CH3            = (uint8_t)0x23
}PWM_Channel_TypeDef;
/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */
void PWM_Set( PWM_Channel_TypeDef Tx_CHx, uint8_t PWM_value );
void MotoStart( uint8_t speed );
void LEDsOn( uint8_t bright );
void MotoStop( void );
void LEDsOff( void );

/* Private functions -------------------------------------------------------- */

#endif /* __MOTO_H */

/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
