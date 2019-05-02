/**
  ******************************************************************************
  * @file    Timer_cfg.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-02-25
  * @brief   Timers configuration head files.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __TIMER_CFG_H
#define __TIMER_CFG_H

/* Includes ------------------------------------------------------------------*/
#include "conf.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */
void TimersInit( void );
void IT_TIM4_Dec( void );
void SetPWM( uint8_t PWM_Chenel, uint16_t value );
/* Private functions -------------------------------------------------------- */
static void TIM1_Config( void );
static void TIM4_Config( void );
#endif /* __TIMER_CFG_H */

/************************** (C) COPYRIGHT 2016 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
