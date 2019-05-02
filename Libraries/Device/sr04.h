/**
  ******************************************************************************
  * @file    sr04.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-06-04
  * @brief   This is the ultrasonic sensor-SR04 head file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __SR04_H
#define __SR04_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "sof_delay.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/
#define TRIG_Port GPIOC
#define TRIG_Pin GPIO_PIN_2
#define ECHO_Port GPIOC
#define ECHO_Pin GPIO_PIN_3
#define ECHO_Read() GPIO_ReadInputPin( ECHO_Port, ECHO_Pin )

/* Exported functions ------------------------------------------------------- */
void Reset_SR04( void );
void EXTI_PORTC( void );
void Get_Distance( uint16_t* distance );
/* Private functions -------------------------------------------------------- */
void send_trig( void );
#endif /* __DS1820_H */

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
