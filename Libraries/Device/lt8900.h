/**
  ******************************************************************************
  * @file    lt8900.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-12-03
  * @brief   This is the lt8900 head file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __LT8900_H
#define __LT8900_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "delay.h"

/* Exported types ------------------------------------------------------------*/

/** @MAC lenth set
  * @{
  */
typedef enum
{
  Syn_Len_64 = (uint8_t)0x18,
  Syn_Len_48 = (uint8_t)0x10,
  Syn_Len_32 = (uint8_t)0x08,
  Syn_Len_16 = (uint8_t)0x00
}Syn_Len_TypeDef;

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/

/* IO defines for MiRF */
#define NRF_RESETN_PORT GPIOC
#define NRF_RESETN_PIN GPIO_PIN_2
#define NRF_PKT_PORT GPIOC
#define NRF_PKT_PIN GPIO_PIN_3
#define NRF_CSN_PORT GPIOC
#define NRF_CSN_PIN GPIO_PIN_4
#define NRF_SCK_PORT GPIOC
#define NRF_SCK_PIN GPIO_PIN_5
#define NRF_MOSI_PORT GPIOC
#define NRF_MOSI_PIN GPIO_PIN_6
#define NRF_MISO_PORT GPIOC
#define NRF_MISO_PIN GPIO_PIN_7

#define NRF_RESETN_LOW() GPIO_WriteLow( NRF_RESETN_PORT, NRF_RESETN_PIN )
#define NRF_RESETN_HIGH() GPIO_WriteHigh( NRF_RESETN_PORT, NRF_RESETN_PIN )
#define NRF_CSN_LOW() GPIO_WriteLow( NRF_CSN_PORT, NRF_CSN_PIN )
#define NRF_CSN_HIGH() GPIO_WriteHigh( NRF_CSN_PORT, NRF_CSN_PIN )
#define NRF_Read_PKT() GPIO_ReadInputPin( NRF_PKT_PORT, NRF_PKT_PIN )

/* IO defines for MiLink */
/*#define NRF_RESETN_PORT GPIOB
#define NRF_RESETN_PIN GPIO_Pin_2
#define NRF_CSN_PORT GPIOB
#define NRF_CSN_PIN GPIO_Pin_3
#define NRF_SCK_PORT GPIOB
#define NRF_SCK_PIN GPIO_Pin_5
#define NRF_MOSI_PORT GPIOB
#define NRF_MOSI_PIN GPIO_Pin_6
#define NRF_MISO_PORT GPIOB
#define NRF_MISO_PIN GPIO_Pin_7
#define NRF_PKT_PORT GPIOB
#define NRF_PKT_PIN GPIO_Pin_0

#define NRF_RESETN_LOW() GPIO_ResetBits( NRF_RESETN_PORT, NRF_RESETN_PIN )
#define NRF_RESETN_HIGH() GPIO_SetBits( NRF_RESETN_PORT, NRF_RESETN_PIN )
#define NRF_CSN_LOW() GPIO_ResetBits( NRF_CSN_PORT, NRF_CSN_PIN )
#define NRF_CSN_HIGH() GPIO_SetBits( NRF_CSN_PORT, NRF_CSN_PIN )
#define NRF_Read_PKT() GPIO_ReadInputDataBit( NRF_PKT_PORT, NRF_PKT_PIN )
*/

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */
void LT8900_Device_Init( void );
void LT8900_Reg_Reset( void );
void LT8900_MAC_Cfg( Syn_Len_TypeDef Syn_Len, uint8_t* MAC );
uint8_t LT8900_Send_Data( uint8_t *Data, uint8_t Data_Lenth );
uint8_t LT8900_Recive_Data( uint8_t* Data, uint8_t Data_Lenth );
//void LT8900_Mode_Cfg( LT8900_Mode_TypeDef );

/* Private functions -------------------------------------------------------- */
uint8_t SPI_NRF_RW( uint8_t dat );
uint8_t SPI_NRF_ReadReg( uint8_t reg );
void LT8900_WriteReg( uint8_t reg, uint16_t val );
uint16_t LT8900_ReadReg( uint8_t reg );

#endif /* __LT8900_H */

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
