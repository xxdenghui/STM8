/**
  ******************************************************************************
  * @file    mcp4822.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-03-15
  * @brief   
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MCP4822_H
#define __MCP4822_H

/* Includes ------------------------------------------------------------------*/
//#include "hal_spi.h"
#include "sof_spi.h"
#include "sof_delay.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/
#ifdef SS_V1
  #define LD_PORT               GPIOC
  #define LD_PIN                GPIO_PIN_3
  #define MCP4822_CS_PORT       GPIOC
  #define MCP4822_CS_PIN        GPIO_PIN_4
#endif
#define LD_High()               GPIO_WriteHigh( LD_PORT, LD_PIN )
#define LD_Low()                GPIO_WriteLow ( LD_PORT, LD_PIN )
#define MCP4822_CS_High()       GPIO_WriteHigh( MCP4822_CS_PORT, MCP4822_CS_PIN )
#define MCP4822_CS_Low()        GPIO_WriteLow ( MCP4822_CS_PORT, MCP4822_CS_PIN )
/* Exported functions ------------------------------------------------------- */
void Init_MCP4822( void );
void Set_MCP4822( uint8_t ch, uint16_t value );
/* Private functions -------------------------------------------------------- */

#endif /* __MCP4822_H */

/************************** (C) COPYRIGHT 2016 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
