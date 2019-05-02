/**
  ******************************************************************************
  * @file    cpu_cfg.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-03-13
  * @brief   CPU types SPACE-V1/V2, XX-V1
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __CPU_CFG_H
#define __CPU_CFG_H

//#define _USART_DEBUG_ 

/* Includes ------------------------------------------------------------------*/
#include "stm8s_conf.h"


/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/
// Position I/O
#define LED_Port                    GPIOB
#define LED_Pin						GPIO_PIN_5
#define KEY_Port                    GPIOA
#define KEY_Pin						GPIO_PIN_2
#define STB_Port                    GPIOA
#define STB_Pin						GPIO_PIN_1
#define CHRG_Port					GPIOA
#define CHRG_Pin					GPIO_PIN_3

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */
void UART1_Handler_Rx( void );
/* Private functions -------------------------------------------------------- */

#endif /* __CPU_CFG_H */

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
