/**
  ******************************************************************************
  * @file    hal_cfg.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-03-13
  * @brief   
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __HAL_CFG_H
#define __HAL_CFG_H

/* Includes ------------------------------------------------------------------*/
#include "hal_uart.h"
//#include "hal_spi.h"
//#include "sof_delay.h"
//#include "hal_pwm.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/
#define LED_Port        GPIOD
#define LED_Pin         GPIO_PIN_0

#define OUT_Port        GPIOB
#define OUTA_Pin        GPIO_PIN_0
#define OUTB_Pin        GPIO_PIN_1
#define OUTC_Pin        GPIO_PIN_2

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */

/* Private functions -------------------------------------------------------- */

#endif /* __HAL_CFG_H */

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
