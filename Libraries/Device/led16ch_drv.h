/**
  ******************************************************************************
  * @file    led16ch_drv.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-05-21
  * @brief   This Driver used for 16 channel LED serial OUTPUT.
  *          Compatible chips - SM16127/SUM2016/MBI5024 ...
  ******************************************************************************
  * @attention
  * DI   - GPIOB5
  * CK   - GPIOC1
  * LE   - GPIOC2
  * OE   - GPIOC3
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __LED16CH_DRV_H
#define __LED16CH_DRV_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/
/* IO Port defines */
#define DI_Port         GPIOD
#define DI_Ch1          GPIO_PIN_0 
#define DI_Ch2          GPIO_PIN_2 
#define DI_Ch3          GPIO_PIN_3 
#define CK_Port         GPIOD
#define CK_Pin          GPIO_PIN_4
#define LE_Port         GPIOE
#define LE_Pin          GPIO_PIN_6
#define OE_Port         GPIOE
#define OE_Pin          GPIO_PIN_7

/* Exported functions ------------------------------------------------------- */
void IO_init_led16ch_drv( void );
void Send_data_led16ch_drv( uint8_t groups, uint8_t *data1, uint8_t *data2, uint8_t *data3 );
void Send_samebyte_led16ch_drv( uint8_t numbers, uint8_t value1, uint8_t value2, uint8_t value3 );
void OE_led16ch_drv( FunctionalState NewState );
/* Private functions -------------------------------------------------------- */
static void Send_byte_( uint8_t value );

#endif /* __LED16CH_DRV_H */

/************************** (C) COPYRIGHT 2016 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
