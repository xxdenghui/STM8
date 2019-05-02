/**
  ******************************************************************************
  * @file    tft_uart.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-09-17
  * @brief   
  ******************************************************************************
  * @attention
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __TFT_UART_H
#define __TFT_UART_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "conf.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */
void Processing_DAT( void );
void Processing_CMD( void );
void Second_DEC( void );
void Mode_CHG( void );

void Get_Command( void );
void Get_Value( void );
void Send_DAT( void );
void Refresh_TXT( void );

void UART2_RX_Handler( void );
/* Private functions -------------------------------------------------------- */

#endif /* __TFT_UART_H */

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
