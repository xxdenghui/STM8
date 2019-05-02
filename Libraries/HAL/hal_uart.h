/**
  ******************************************************************************
  * @file    hal_uart.h
  * @author  Darren Tang
  * @version V1.0.2
  * @date    2019-05-02
  * @brief   This is a uart head file.
  ******************************************************************************
  * @attention
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __HAL_UART_H
#define __HAL_UART_H

/* Includes ------------------------------------------------------------------*/
#ifdef STM8S
#include "stm8s.h"
#endif

#ifdef STM8L15
#include "stm8l15x.h"
#endif

/* Exported types ------------------------------------------------------------*/
typedef enum {
  uart1                 = (uint8_t)0x01,
  uart2                 = (uint8_t)0x02,
  uart3                 = (uint8_t)0x03
}Uart_TypeDef;

/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */
void uart_cfg( Uart_TypeDef Uartx, uint32_t Baud );
void uart_printf( Uart_TypeDef Uartx, char *string );
void uart_send_buff( Uart_TypeDef Uartx, uint8_t* data, uint8_t lenth );

#ifdef __STM8S_UART1_H
ErrorStatus UART1_SendByte( uint8_t byte );
#endif	// __STM8S_UART1_H

#ifdef __STM8S_UART2_H
ErrorStatus UART2_SendByte( uint8_t byte );
#endif	// __STM8S_UART2_H

#ifdef __STM8S_UART3_H
ErrorStatus UART3_SendByte( uint8_t byte );
#endif	// __STM8S_UART3_H

#ifdef USART1
ErrorStatus USART1_SendByte( uint8_t byte );
#endif	// USART1

#ifdef USART2
ErrorStatus USART2_SendByte( uint8_t byte );
#endif	//USART2

#ifdef USART3
ErrorStatus USART3_SendByte( uint8_t byte );
#endif	// USART3


/* Private functions -------------------------------------------------------- */

#endif /* __HAL_UART_H */

/************************** (C) COPYRIGHT 2019 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
