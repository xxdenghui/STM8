/**
  ******************************************************************************
  * @file    ds18b20.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-08-13
  * @brief   This is the DS18B20 head file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __DS1820_H
#define __DS1820_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "delay.h"
#include "crc.h"

/* Exported types ------------------------------------------------------------*/
// ROM Command
typedef enum{
  SEARCH_ROM            = 0xF0,
  READ_ROM              = 0x33,
  MATH_ROM              = 0x55,
  SKIP_ROM              = 0xCC,
  ALARM_SEARCH          = 0xEC
}ROM_TypeDef;

// Fuctional Command
typedef enum{
  CONVERT_T             = 0x44,
  WRITE_SCRATCHPAD      = 0x4E,
  READ_SCRATCHPAD       = 0xBE,
  COPY_SCRATCHPAD       = 0x48,
  RECALL_E2             = 0xB8,
  READ_POWER            = 0xB4
}CMD_TypeDef;
/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/
#define DS1820_Port GPIOC
#define DS1820_Pin GPIO_PIN_1
#define IO_Out() GPIO_Init( DS1820_Port, DS1820_Pin, GPIO_MODE_OUT_PP_HIGH_FAST )
#define IO_In() GPIO_Init( DS1820_Port, DS1820_Pin, GPIO_MODE_IN_PU_NO_IT )
#define IO_Out_Low() GPIO_WriteLow( DS1820_Port, DS1820_Pin )
#define IO_Out_High() GPIO_WriteHigh( DS1820_Port, DS1820_Pin )
#define IO_In_Read() GPIO_ReadInputPin( DS1820_Port, DS1820_Pin )

/* Exported functions ------------------------------------------------------- */
ErrorStatus OneWireReset( void );
void OneWireWrite( uint8_t byte );
uint8_t OneWireRead( void );
ErrorStatus ROM_DS1820( ROM_TypeDef rom_cmd, uint8_t* Rom );
ErrorStatus CMD_DS1820( CMD_TypeDef cmd, uint8_t* value );

/* Private functions -------------------------------------------------------- */

#endif /* __DS1820_H */

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
