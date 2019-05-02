/**
  ******************************************************************************
  * @file    led_mode.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2018-05-03
  * @brief   This is led_mode head file.
  ******************************************************************************
  * @attention
  * 
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __LED_MODE_H__
#define __LED_MODE_H__

/* Includes ------------------------------------------------------------------*/
#include "stm8l15x_gpio.h"
#include "hal_cfg.h"
#include "hal_pwm.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/
#define FLASH_MODE              (uint8_t)0x01
#define BREATH_MODE             (uint8_t)0x02
#define FANTASY_MODE            (uint8_t)0x03

/* Exported functions ------------------------------------------------------- */
void LED_Color( void );
void Bright_Reset( void );
void Mode_Reset( void );

/* Private functions -------------------------------------------------------- */
void Mix_color( void );
void Clear_Color( void );
void Flash_Mode( void );
void Breath_Mode( void );
void Fantasy_Mode( void );

#endif /* __LED_MODE_H__ */

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
