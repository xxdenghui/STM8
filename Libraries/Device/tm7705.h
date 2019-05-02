/**
  ******************************************************************************
  * @file		tm7705.h
  * @author		Darren
  * @version	V1.0.0
  * @date		2019-01-25
  * @brief		TM7705 ADC Chip Driver head file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __TM7705_H__
#define __TM7705_H__

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
//#include "hal_spi.h"
//#include "sof_spi.h"

/* Exported types ------------------------------------------------------------*/
typedef enum{
	ADC_CH1						= 0x00,
	ADC_CH2						= 0x01
} TM7705_Channel_TypeDef;

typedef enum{
	REG_COMM					= 0x00,
	REG_SET						= 0x01,
	REG_CLOCK					= 0x02,
	REG_DATA					= 0x03,
	REG_TEST					= 0x04,
	REG_OFFSET					= 0x06,
	REG_GAIN					= 0x07
} TM7705_Register_TypeDef;


/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/
#define TM7705_CS_PORT				GPIOD
#define TM7705_CS_PIN           	GPIO_PIN_1
#define TM7705_CS_High()          	GPIO_WriteHigh( AD7789_CS_PORT, AD7789_CS_PIN )
#define TM7705_CS_Low()           	GPIO_WriteLow ( AD7789_CS_PORT, AD7789_CS_PIN )

/* Exported functions ------------------------------------------------------- */
void TM7705_Init( void );
void TM7705_ReadADC( uint8_t* readval );
void TM7705_WriteCMD( uint8_t* cmd );

/* Private functions -------------------------------------------------------- */

#endif /* __TM7705_H__ */

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
