/**
  ******************************************************************************
  * @file    ht1621.h
  * @author  Darren
  * @version V1.0.0
  * @date    2017-01-12
  * @brief   LCD Driver TH1621B Driver
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __HT1621_H
#define __HT1621_H

/* Includes ------------------------------------------------------------------*/
#include "conf.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/


/* Private macros ------------------------------------------------------------*/
/* IO set */
#define DATA_PORT               GPIOC
#define DATA_PIN                GPIO_PIN_6
#define WR_PIN                  GPIO_PIN_5
#define CS_PIN                  GPIO_PIN_4
#define BK_LED_PORT             GPIOD
#define BK_LED_PIN              GPIO_PIN_7

/* IO fuction */
#define START_SEND()            GPIO_WriteLow( DATA_PORT, CS_PIN )
#define END_SEND()              GPIO_WriteHigh( DATA_PORT, CS_PIN )
#define DATA_HIGH()             GPIO_WriteHigh( DATA_PORT, DATA_PIN )
#define DATA_LOW()              GPIO_WriteLow( DATA_PORT, DATA_PIN )  
#define WR_PULSE()              GPIO_WriteLow( DATA_PORT, WR_PIN );\
                                GPIO_WriteHigh( DATA_PORT, WR_PIN )
#define BK_ON()                 GPIO_WriteHigh(BK_LED_PORT, BK_LED_PIN)
#define BK_OFF()                GPIO_WriteLow(BK_LED_PORT, BK_LED_PIN)
                                  
#define ID_LENTH                3
#define ADD_LENTH               6
#define DAT_LENTH               4
#define CMD_LENTH               9
#define OPT_RW_ID               0x5
#define OPT_CMD_ID              0x4

#define CMD_SYS_OFF             0x00
#define CMD_SYS_ON              0x01
#define CMD_LCD_OFF             0x02
#define CMD_LCD_ON              0x03
                                  
/* Exported functions ------------------------------------------------------- */
void HT1621_Init( void );

/* Private functions -------------------------------------------------------- */
void send( uint8_t data, uint8_t bits );
void write_data( uint8_t add, uint8_t data );
void write_cmd( uint8_t cmd );
void fill( void );
void clear( void );


#endif /* __HT1621_H */

/************************** (C) COPYRIGHT 2017 Darren  ************************/
/********************************  END OF FILE  *******************************/
