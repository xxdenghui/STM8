/**
  ******************************************************************************
  * @file    hf3333.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-07-23
  * @brief   
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __HF3333_H
#define __HF3333_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "uart.h"
#include "crc.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/
#define MODE_FLOWER             0x01
#define MODE_VEGETABLE          0x02
#define MODE_LEAF               0x03
#define MODE_CUSTOM             0x04
#define TIME_DOT                0x05
#define MOON                    0x06
#define SUN                     0x07
#define DAYS                    0x08

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */
void LCD_UpdateDays( uint8_t days );
void LCD_UpdateHour( uint8_t types, uint8_t status );
void LCD_UpdateMinute( uint8_t types, uint8_t status );
void LCD_TimePoint( uint8_t status );
void LCD_UpdateTemp( uint8_t status );
void LCD_UpdateWaterLevel( uint8_t status );
void LCD_UpdateIcon( uint8_t icon, uint8_t status );
void LCD_UpdateMode( uint8_t status );
void LCD_Init( void );
void LCD_Refresh( void );
FlagStatus LCD_ReadKey( uint8_t* value );

void TIM4_Handler( void );
void UART2_Handler( void );
/* Private functions -------------------------------------------------------- */




#endif /* __HF3333_H */

/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
