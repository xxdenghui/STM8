/**
  ******************************************************************************
  * @file    conf.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-11-19
  * @brief   This is the head file configuration file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __CONF_H
#define __CONF_H

//#define _USART_DEBUG_ 

/* Includes ------------------------------------------------------------------*/
#include "crc.h"
#include "cpu_cfg.h"
#include "hal_cfg.h"
#include "dev_cfg.h"
#include "board.h"

/* Exported types ------------------------------------------------------------*/
// bit type define
typedef volatile union{
	struct{
		unsigned bit0:1;
		unsigned bit1:1;
		unsigned bit2:1;
		unsigned bit3:1;
		unsigned bit4:1;
		unsigned bit5:1;
		unsigned bit6:1;
		unsigned bit7:1;
	};
	uint8_t byte;
}_BitTypeDef;
/*
_BitTypeDef sys_status;
#define sys_std_Power 							sys_status.bit0
#define sys_std_KeyHold							sys_status.bit1
#define sys_std_KeyLong							sys_status.bit2
#define sys_std_IRWay							sys_status.bit3
#define sys_std_Charge							sys_status.bit4
#define sys_std_BrightWay						sys_status.bit5
#define sys_std_LowBat							sys_status.bit6
#define sys_status_byte							sys_status.byte
*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/
#define ADC_BRIGHT_THR              10

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */

/* Private functions -------------------------------------------------------- */

#endif /* __CONF_H */

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
