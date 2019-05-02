/**
  ******************************************************************************
  * @file    hal_uart.c
  * @author  Darren Tang
  * @version V1.0.2
  * @date    2019-05-02
  * @brief   This is the uart configration source file.
  ******************************************************************************
  * @attention
  * 
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "hal_uart.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/
#define UART_FLAG_TIMEOUT  ((uint16_t)0x1000)
/* Private variables ---------------------------------------------------------*/
uint16_t UART_Timeout;
/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/ 

/**
  * @brief  Send a byte to Tx DR
  * values 
  * @param  
  * -byte The data will be send
  * @retval None
  */

/* STM8S UART1 send byte */
#ifdef __STM8S_UART1_H
static ErrorStatus UART1_SendByte( uint8_t byte )
{
  ErrorStatus ErrStatus = SUCCESS;
  UART1_SendData8( byte );
  UART_Timeout = UART_FLAG_TIMEOUT;
  while ( UART1_GetFlagStatus( UART1_FLAG_TXE ) == RESET ){
    if((UART_Timeout--) == 0){
      ErrStatus = ERROR;
      break;
    }
  }
  return ErrStatus;
}
#endif	// __STM8S_UART1_H


/* STM8S UART2 send byte */
#ifdef __STM8S_UART2_H
static ErrorStatus UART2_SendByte( uint8_t byte )
{
  ErrorStatus ErrStatus = SUCCESS;
  UART2_SendData8( byte );
  UART_Timeout = UART_FLAG_TIMEOUT;
  while ( UART2_GetFlagStatus( UART2_FLAG_TXE ) == RESET ){
    if((UART_Timeout--) == 0){
      ErrStatus = ERROR;
      break;
    }
  }
  return ErrStatus;
}
#endif	// __STM8S_UART2_H

/* STM8S UART3 send byte */
#ifdef __STM8S_UART3_H
static ErrorStatus UART3_SendByte( uint8_t byte )
{
  ErrorStatus ErrStatus = SUCCESS;
  UART3_SendData8( byte );
  UART_Timeout = UART_FLAG_TIMEOUT;
  while ( UART3_GetFlagStatus( UART3_FLAG_TXE ) == RESET ){
    if((UART_Timeout--) == 0){
      ErrStatus = ERROR;
      break;
    }
  }
  return ErrStatus;
}
#endif	// __STM8S_UART3_H

/* STM8L USART1 send byte */
#if defined USART1
static ErrorStatus USART1_SendByte( uint8_t byte )
{
  ErrorStatus ErrStatus = SUCCESS;
  USART_SendData8( USART1, byte );
  UART_Timeout = UART_FLAG_TIMEOUT;
  while ( USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET ){
    if((UART_Timeout--) == 0){
      ErrStatus = ERROR;
      break;
    }
  }
  return ErrStatus;
}
#endif

/* STM8L USART2 send byte */
#if defined USART2
static ErrorStatus USART2_SendByte( uint8_t byte )
{
  ErrorStatus ErrStatus = SUCCESS;
  USART_SendData8( USART2, byte );
  UART_Timeout = UART_FLAG_TIMEOUT;
  while ( USART_GetFlagStatus(USART2, USART_FLAG_TC) == RESET ){
    if((UART_Timeout--) == 0){
      ErrStatus = ERROR;
      break;
    }
  }
  return ErrStatus;
}
#endif

/* STM8L USART3 send byte */
#if defined USART3
static ErrorStatus USART3_SendByte( uint8_t byte )
{
  ErrorStatus ErrStatus = SUCCESS;
  USART_SendData8( USART3, byte );
  UART_Timeout = UART_FLAG_TIMEOUT;
  while ( USART_GetFlagStatus(USART3, USART_FLAG_TC) == RESET ){
    if((UART_Timeout--) == 0){
      ErrStatus = ERROR;
      break;
    }
  }
  return ErrStatus;
}
#endif

/* Public functions ----------------------------------------------------------*/

/**
  * @brief  Uart config
  * values 
  * @param  
  *     Uartx = uart1,uart2,uart3
  *     Baud  
  *     Parity
  *     lenth
  *     stopbit
  *     IT
  * @retval none
  */
void uart_cfg( Uart_TypeDef Uartx, uint32_t Baud )
{

  switch ( Uartx ){
/* STM8S UART1 config */
#ifdef __STM8S_UART1_H
    case uart1:
      CLK_PeripheralClockConfig( CLK_PERIPHERAL_UART1, ENABLE );
      UART1_Init( Baud, 
                  UART1_WORDLENGTH_8D, 
                  UART1_STOPBITS_1, 
                  UART1_PARITY_NO, 
                  UART1_SYNCMODE_CLOCK_DISABLE,
                  UART1_MODE_TXRX_ENABLE );
      UART1_Cmd( ENABLE ); 
      break;
#endif	// __STM8S_UART1_H
        
/* STM8S UART2 config */    
#ifdef __STM8S_UART2_H
  case uart2:
    CLK_PeripheralClockConfig( CLK_PERIPHERAL_UART2, ENABLE );
    UART2_Init( Baud, 
                UART2_WORDLENGTH_8D, 
                UART2_STOPBITS_1, 
                UART2_PARITY_NO, 
                UART2_SYNCMODE_CLOCK_DISABLE, 
                UART2_MODE_TXRX_ENABLE );
    UART2_Cmd( ENABLE );
    break;
#endif	// __STM8S_UART2_H
      
/* STM8S UART3 config */
#ifdef __STM8S_UART3_H 
  case uart3:
    CLK_PeripheralClockConfig( CLK_PERIPHERAL_UART3, ENABLE );
    UART3_Init( Baud, 
                UART3_WORDLENGTH_8D, 
                UART3_STOPBITS_1, 
                UART3_PARITY_NO, 
                UART3_MODE_TXRX_ENABLE );
    UART3_Cmd( ENABLE );
    break;
#endif	// __STM8S_UART3_H

/* STM8L USART1 config */
#ifdef USART1
    case uart1:
      CLK_PeripheralClockConfig( CLK_Peripheral_USART1, ENABLE );
      USART_Init( USART1, Baud, USART_WordLength_8b, USART_StopBits_1, 
              USART_Parity_No, USART_Mode_RxTx );
      USART_Cmd( USART1, ENABLE );
      break;
#endif
	
/* STM8L USART2 config */
#ifdef USART2
    case uart2:
      CLK_PeripheralClockConfig( CLK_Peripheral_USART2, ENABLE );
      USART_Init( USART2, Baud, USART_WordLength_8b, USART_StopBits_1, 
              USART_Parity_No, USART_Mode_RxTx );
      USART_Cmd( USART2, ENABLE );
      break;
#endif
	  
/* STM8L USART3 config */
#ifdef USART3
    case uart3:
      CLK_PeripheralClockConfig( CLK_Peripheral_USART3, ENABLE );
      USART_Init( USART3, Baud, USART_WordLength_8b, USART_StopBits_1, 
              USART_Parity_No, USART_Mode_RxTx );
      USART_Cmd( USART3, ENABLE );
      break;
#endif    
    
    default:
      break;   
  }
}


/**
  * @brief  uart print string
  * values 
  * @param  
  *     string
  * @retval None
  */
void uart_printf( Uart_TypeDef Uartx, char *string )
{
  char *stringbuff;
  switch ( Uartx ){
    
/* STM8S UART1 send string */
#ifdef __STM8S_UART1_H 
    case uart1:
      for( stringbuff = string; *stringbuff; stringbuff++ ) 
        UART1_SendByte( *stringbuff );  
      break;
#endif	// __STM8S_UART1_H
	  
/* STM8S UART2 send string */
#ifdef __STM8S_UART2_H 
    case uart2:
      for( stringbuff = string; *stringbuff; stringbuff++ ) 
        UART2_SendByte( *stringbuff );  
      break;
#endif	// __STM8S_UART2_H
	  
/* STM8S UART3 send string */
#ifdef __STM8S_UART3_H 
    case uart3:
      for( stringbuff = string; *stringbuff; stringbuff++ ) 
        UART3_SendByte( *stringbuff );  
      break;
#endif	// __STM8S_UART3_H
	  
/* STM8L USART1 send string */
#ifdef USART1 
    case uart1:
      for( stringbuff = string; *stringbuff; stringbuff++ ) 
        USART1_SendByte( *stringbuff );  
      break;
#endif          

/* STM8L USART2 send string */
#ifdef USART2 
    case uart2:
      for( stringbuff = string; *stringbuff; stringbuff++ ) 
        USART2_SendByte( *stringbuff );  
      break;
#endif       
      
/* STM8L USART3 send string */
#ifdef USART3 
    case uart3:
      for( stringbuff = string; *stringbuff; stringbuff++ ) 
        USART3_SendByte( *stringbuff );  
      break;
#endif  
      
  default:
      break;
  }
}

/**
  * @brief  uart send buff
  * values 
  * @param  
  *     data-  The buff data
  *     lenth- The numbers of byte
  * @retval None
  */
void uart_send_buff( Uart_TypeDef Uartx, uint8_t* data, uint8_t lenth )
{
  uint8_t i;
  switch ( Uartx ){

/* STM8S UART1 send buff */    
#ifdef __STM8S_UART1_H 
  case uart1:
    for( i=0; i<lenth; i++ )
      UART1_SendByte( data[i] );  
    break;
#endif	// __STM8S_UART1_H

/* STM8S UART2 send buff */     
#ifdef __STM8S_UART2_H 
  case uart2:
    for( i=0; i<lenth; i++ )
      UART2_SendByte( data[i] );  
    break;
#endif	// __STM8S_UART2_H

/* STM8S UART3 send buff */     
#ifdef __STM8S_UART3_H 
  case uart3:
    for( i=0; i<lenth; i++ )
      UART3_SendByte( data[i] );  
    break;
#endif	// __STM8S_UART3_H	
	
/* STM8L USART1 send buff */    
#ifdef USART1 
  case uart1:
    for( i=0; i<lenth; i++ )
      USART1_SendByte( data[i] );  
    break;
#endif

/* STM8L USART2 send buff */    
#ifdef USART2 
  case uart2:
    for( i=0; i<lenth; i++ )
      USART2_SendByte( data[i] );  
    break;
#endif

/* STM8L USART3 send buff */    
#ifdef USART3 
  case uart3:
    for( i=0; i<lenth; i++ )
      USART3_SendByte( data[i] );  
    break;
#endif
    
  }
}

  
/************************** (C) COPYRIGHT 2019 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
