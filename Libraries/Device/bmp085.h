/**
  ******************************************************************************
  * @file    bmp085.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-11-17
  * @brief   
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __BMP085_H
#define __BMP085_H

/* Includes ------------------------------------------------------------------*/
#include "wire.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/

#define BMP085_Address      0xEE

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */
void Init_BMP085( void );
int16_t Read2Byte_BMP085( uint8_t reg );
long GetUT_BMP085( void );
long GetParam_BMP085( uint8_t choice );
/* Private functions -------------------------------------------------------- */

#endif /* __BMP085_H */

/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
