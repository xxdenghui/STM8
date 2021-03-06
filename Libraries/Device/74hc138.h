/**
  ******************************************************************************
  * @file    74hc138.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-05-20
  * @brief   the 74HC138 Driver head file.
  ******************************************************************************
  * @attention
  * A   - GPIOC0
  * B   - GPIOC1
  * C   - GPIOC2
  * D   - GPIOC3
  * If need change please edit 74hc138.c
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __74HC138_H
#define __74HC138_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */
void IO_init_hc138( void );
void SetLine_hc138( uint8_t line );

/* Private functions -------------------------------------------------------- */

#endif /* __74HC138_H */

/************************** (C) COPYRIGHT 2016 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
