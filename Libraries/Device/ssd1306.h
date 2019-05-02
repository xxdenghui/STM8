/**
  ******************************************************************************
  * @file    ssd1306.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-05-23
  * @brief   This is a demo file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __SSD1306_H
#define __SSD1306_H

/* Includes ------------------------------------------------------------------*/
#include "conf.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/
/* STM8L */
#ifdef STM8L
  #define RES_High()  GPIO_SetBits( GPIOB, GPIO_Pin_1 )
  #define RES_Low()   GPIO_ResetBits( GPIOB, GPIO_Pin_1 )
  #define CS_High()   GPIO_SetBits( GPIOB, GPIO_Pin_3 )
  #define CS_Low()    GPIO_ResetBits( GPIOB, GPIO_Pin_3 )
  #define SCLK_High() GPIO_SetBits( GPIOB, GPIO_Pin_5 )
  #define SCLK_Low()  GPIO_ResetBits( GPIOB, GPIO_Pin_5 )
  #define SDIN_High() GPIO_SetBits( GPIOB, GPIO_Pin_6 )
  #define SDIN_Low()  GPIO_ResetBits( GPIOB, GPIO_Pin_6 )
  #define DC_High()   GPIO_SetBits( GPIOB, GPIO_Pin_7 )
  #define DC_Low()    GPIO_ResetBits( GPIOB, GPIO_Pin_7 )
#endif

/* STM8S */
#ifdef STM8S
//SPACE V1
/*
  #define RES_High()  GPIO_WriteHigh( GPIOG, GPIO_PIN_0 )
  #define RES_Low()   GPIO_WriteLow ( GPIOG, GPIO_PIN_0 )
  #define CS_High()   GPIO_WriteHigh( GPIOG, GPIO_PIN_1 )
  #define CS_Low()    GPIO_WriteLow ( GPIOG, GPIO_PIN_1 )
  #define SCLK_High() GPIO_WriteHigh( GPIOC, GPIO_PIN_5 )
  #define SCLK_Low()  GPIO_WriteLow ( GPIOC, GPIO_PIN_5 )
  #define SDIN_High() GPIO_WriteHigh( GPIOC, GPIO_PIN_6 )
  #define SDIN_Low()  GPIO_WriteLow ( GPIOC, GPIO_PIN_6 )
  #define DC_High()   GPIO_WriteHigh( GPIOC, GPIO_PIN_4 )
  #define DC_Low()    GPIO_WriteLow ( GPIOC, GPIO_PIN_4 )
*/
//color sensor
#define RES_PORT			GPIOC
#define RES_PIN				GPIO_PIN_3
#define DC_PORT				GPIOC
#define DC_PIN				GPIO_PIN_4
#define SCK_PORT			GPIOC
#define SCK_PIN				GPIO_PIN_5
#define DIN_PORT			GPIOC
#define DIN_PIN				GPIO_PIN_6
#define CS_PORT				GPIOC
#define CS_PIN				GPIO_PIN_7

  #define RES_High()  GPIO_WriteHigh( RES_PORT, RES_PIN )
  #define RES_Low()   GPIO_WriteLow ( RES_PORT, RES_PIN )
  #define CS_High()   GPIO_WriteHigh( CS_PORT, CS_PIN )
  #define CS_Low()    GPIO_WriteLow ( CS_PORT, CS_PIN )
  #define SCLK_High() GPIO_WriteHigh( SCK_PORT, SCK_PIN )
  #define SCLK_Low()  GPIO_WriteLow ( SCK_PORT, SCK_PIN )
  #define SDIN_High() GPIO_WriteHigh( DIN_PORT, DIN_PIN )
  #define SDIN_Low()  GPIO_WriteLow ( DIN_PORT, DIN_PIN )
  #define DC_High()   GPIO_WriteHigh( DC_PORT, DC_PIN )
  #define DC_Low()    GPIO_WriteLow ( DC_PORT, DC_PIN )
#endif

#define XLevelL		0x00
#define XLevelH		0x10
#define XLevel	    ((XLevelH&0x0F)*16+XLevelL)
#define Max_Column	128
#define Max_Row		64
#define	Brightness	0xCF 
#define X_WIDTH 128
#define Y_WIDTH 64

/* Exported functions ------------------------------------------------------- */
void Power_On( void );
void LCD_CLS( void );
void LCD_Fill( uint8_t bmp_dat );
void LCD_Set_Pos( uint8_t x, uint8_t y );
void LCD_Reset( void );
void LCD_PS32x32Str( uint8_t x, uint8_t y, uint8_t s );
void LCD_P16x32Str( uint8_t x, uint8_t y, uint8_t *ch );
void LCD_P16x16Ch( uint8_t x, uint8_t y, uint8_t N );
void LCD_P8x16Str( uint8_t x, uint8_t y, uint8_t *ch );
void LCD_P6x8Str( uint8_t x, uint8_t y, uint8_t *ch );
void Draw_BMP( uint8_t x0, uint8_t y0, uint8_t x1, uint8_t y1, uint8_t set );

/* Private functions -------------------------------------------------------- */
static void Write_Dat( uint8_t dat );
static void Write_Com( uint8_t com );

#endif /* __SSD1306_H */

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
