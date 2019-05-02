/**
  ******************************************************************************
  * @file    DHT22.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-11-10
  * @brief   This is a DHT22 head file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __DHT11_H
#define __DHT11_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "delay.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/
#define DHT_PROT GPIOC
#define DHT_IO_PIN GPIO_PIN_4
#define DHT_IO_OUT GPIO_Init( DHT_PROT, DHT_IO_PIN, GPIO_MODE_OUT_PP_LOW_FAST )
#define DHT_IO_HIGH GPIO_WriteHigh( DHT_PROT, DHT_IO_PIN )

#define DHT_IO_LOW GPIO_WriteLow( DHT_PROT, DHT_IO_PIN )

#define DHT_IO_IN GPIO_Init( DHT_PROT, DHT_IO_PIN, GPIO_MODE_IN_PU_NO_IT )
#define DHT_IO_READ GPIO_ReadInputPin( DHT_PROT, DHT_IO_PIN )

/* Exported functions ------------------------------------------------------- */
void DHT11_Start( void );
uint8_t DHT11_Check( void );
uint8_t DHT11_Read_Bit( void );
uint8_t DHT11_Read_Byte( void );
ErrorStatus DHT11_Read( uint8_t *temp );

/* Private functions -------------------------------------------------------- */

#endif /* __DHT11_H */

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
