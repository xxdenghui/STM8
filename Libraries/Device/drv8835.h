/**
  ******************************************************************************
  * @file    drv8835.h
  * @author  Darren
  * @version V1.0.0
  * @date    2018-05-28
  * @brief   drv8835 head file
  ******************************************************************************
  * @attention
  * 
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __DRV8835_H__
#define __DRV8835_H__

/* Includes ------------------------------------------------------------------*/
#include "cpu_cfg.h"

/* Exported types ------------------------------------------------------------*/
typedef enum{
    ININ_MOTO_COAST          = (uint8_t)0x00,
    ININ_MOTO_REVERSE        = (uint8_t)0x01,   
    ININ_MOTO_FORWARD        = (uint8_t)0x02,
    ININ_MOTO_BRAKE          = (uint8_t)0x03,
    PHEN_MOTO_BRAKE          = (uint8_t)0x05,   
    PHEN_MOTO_FORWARD        = (uint8_t)0x06,
    PHEN_MOTO_REVERSE        = (uint8_t)0x07
} Moto_State;
     
typedef enum {
    COAST                    = (uint8_t)0x00,
    REVERSE                  = (uint8_t)0x01,
    FORWARD                  = (uint8_t)0x02,
    BREAK                    = (uint8_t)0x03
} Moto_RunTypeDef;
/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */
void Drv8835_Init( void );
uint8_t Drv8835_Moto_X( Moto_RunTypeDef way );
uint8_t Drv8835_Moto_Y( Moto_RunTypeDef way );
/* Private functions -------------------------------------------------------- */

#endif /* __DRV8835_H__ */

/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
