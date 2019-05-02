/**
  ******************************************************************************
  * @file    wire.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-06-18
  * @brief   Head file of buscfg for STM8S series.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __WIRE_H
#define __WIRE_H

/* Includes ------------------------------------------------------------------*/
#include "conf.h"

/* Exported types ------------------------------------------------------------*/
#define size_t uint8_t
/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/
#define SysFrequencyMHz         16
#define I2C_SPEED               100000
#define BUFFER_SIZE             10
#define Master_Address          0xAA
#define SlaveAddress            0x22
/* Maximum Timeout values for flags and events waiting loops. These timeouts are
   not based on accurate values, they just guarantee that the application will 
   not remain stuck if the I2C communication is corrupted.
   You may modify these timeout values depending on CPU frequency and application
   conditions (interrupts routines ...). */   
#define I2C_FLAG_TIMEOUT         ((uint32_t)0x1000)
#define I2C_LONG_TIMEOUT         ((uint32_t)(10 * I2C_FLAG_TIMEOUT))

/* Exported functions ------------------------------------------------------- */
void I2C_begin( uint8_t address, uint8_t IT);
FlagStatus I2C_busy( void );
ErrorStatus I2C_MasterTransmit( uint8_t address, uint8_t buffsize );
ErrorStatus I2C_MasterReceive( uint8_t address, uint8_t buffsize );
ErrorStatus I2C_SlaveTransmit( uint8_t* data );
ErrorStatus I2C_SlaveReceive( uint8_t* data );
void I2C_Start( void );
void I2C_Handler( void );


/* Private functions -------------------------------------------------------- */

#endif /* __WIRE_H */

/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
