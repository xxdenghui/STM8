/**
  ******************************************************************************
  * @file    ad7789.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-10-31
  * @briefAD7789 ADC Chip Driver head file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __AD7789_H
#define __AD7789_H

/* Includes ------------------------------------------------------------------*/
//#include "hal_spi.h"
#include "sof_spi.h"


/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/
#ifdef SS_V1
  #define AD7789_CS_PORT          GPIOC
  #define AD7789_CS_PIN           GPIO_PIN_1
#endif

#define AD7789_CS_High()          GPIO_WriteHigh( AD7789_CS_PORT, AD7789_CS_PIN )
#define AD7789_CS_Low()           GPIO_WriteLow ( AD7789_CS_PORT, AD7789_CS_PIN )

// register defines
#define CMD_WR_MODE_REG           0x18 //comand write mode register
#define CMD_WR_DATA_REG           0x38 //comand read data register(Conversion)

/* Exported functions ------------------------------------------------------- */
void Init_AD7789( void );
void ReadADC_AD7789( uint8_t* readval );
/* Private functions -------------------------------------------------------- */
void Reset_AD7789( void );
void WriteCMD_AD7789( uint8_t cmd, uint8_t reg );

#endif /* __AD7789_H */

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
