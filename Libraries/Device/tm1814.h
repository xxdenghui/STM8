/**
  ******************************************************************************
  * @file    tm1814h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2017-01-06
  * @brief   This is a tm1814 driver file.
  ******************************************************************************
  * @attention
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __TM1814_H
#define __TM1814_H

/* Includes ------------------------------------------------------------------*/
#ifdef STM8S
#include "stm8s.h"
#endif

#ifdef STM8L15
#include "stm8l15x.h"
#endif

#include "sof_delay.h"
/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/
#define MAX_COLOR_CHANNEL       4
#define MAX_LENTH               1
#define BUFF_LENTH              MAX_COLOR_CHANNEL+MAX_COLOR_CHANNEL*MAX_LENTH
/* Exported functions ------------------------------------------------------- */
void TM1814_Refresh( void );
void TM1814_SetColor( uint8_t *buff );

/* Private functions -------------------------------------------------------- */
void send_byte( uint8_t byte );
void send_reset( void );

#endif /* __TM1814_H */

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
