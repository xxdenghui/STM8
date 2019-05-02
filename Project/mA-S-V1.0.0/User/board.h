/**
  ******************************************************************************
  * @file    board.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2019-05-02
  * @brief   This is the head file board init file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __BOARD_H
#define __BOARD_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s_conf.h"
#include "cpu_cfg.h"
#include "hal_cfg.h"
#include "crc.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/
#define REL_On()				GPIO_WriteLow( OUT_Port, REL1_Pin|REL2_Pin );\
								GPIO_WriteHigh( OUT_Port, LED_Pin )
#define REL_Off()				GPIO_WriteHigh( OUT_Port, REL1_Pin|REL2_Pin );\
								GPIO_WriteLow( OUT_Port, LED_Pin )
#define GetKey()                GPIO_ReadInputPin( IN_Port, SW_Pin )

#define MAX_PWM	                    1000
/* Private macros ------------------------------------------------------------*/
#define OUT_Port                    GPIOC
#define LED_Pin                     GPIO_PIN_4
#define REL1_Pin                    GPIO_PIN_5
#define REL2_Pin                    GPIO_PIN_6
#define IN_Port                     GPIOC
#define SW_Pin                      GPIO_PIN_7

/* Exported functions ------------------------------------------------------- */
void BoardInit( void );
void OutSet(uint16_t pwm);
/* Private functions -------------------------------------------------------- */

#endif /* __BOARD_H */

/************************** (C) COPYRIGHT 2019 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
