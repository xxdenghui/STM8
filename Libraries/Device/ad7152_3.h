/**
  ******************************************************************************
  * @file    ad7152_3.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-07-13
  * @brief   AD7153 driver head file
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __AD7152_H
#define __AD7152_H

/* Includes ------------------------------------------------------------------*/
#include "wire.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/

#define AD7152_Address        0x90 

/* Private macros ------------------------------------------------------------*/
#define STATUS          0
#define CH1_MSB         1
#define CH1_LSB         2


/* Exported functions ------------------------------------------------------- */
ErrorStatus ReadTemp( uint8_t* temp );
ErrorStatus WriteData( void );

/* Private functions -------------------------------------------------------- */

#endif /* __AD7152_H */

/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
