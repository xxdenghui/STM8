/**
  ******************************************************************************
  * @file    hal_spi.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-03-15
  * @brief   
  ******************************************************************************
  * @attention
  * 
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "hal_spi.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/
#define SPI_FLAG_TIMEOUT  ((uint16_t)0x1000)
/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/ 

/**
  * @brief  Send a byte to Tx DR
  * values 
  * @param  
  * -byte The data will be send
  * @retval None
  */



/* Public functions ----------------------------------------------------------*/

/**
  * @brief  uart print string
  * values 
  * @param  
  *     string
  * @retval None
  */
void hal_spi_cfg( HAL_SPI_Mode_TypeDef mode, HAL_SPI_FirstBit_TypeDef firstbit )
{
  SPI_Init( firstbit, SPI_BAUDRATEPRESCALER_2, mode, \
            SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_1EDGE, \
            SPI_DATADIRECTION_2LINES_FULLDUPLEX, SPI_NSS_HARD, (uint8_t)0x07 );
  CLK_PeripheralClockConfig( CLK_PERIPHERAL_SPI, ENABLE );
  SPI_Cmd( ENABLE );
}

void hal_spi_send( uint8_t* data, uint16_t lenth )
{
  for ( uint8_t i=0; i<lenth; i++ )
  {
    SPI_SendData( data[i] );
    while ( SET != SPI_GetFlagStatus( SPI_FLAG_TXE ) );
  }
}

void hal_spi_read( uint8_t* data, uint16_t lenth )
{
  for ( uint8_t i=0; i<lenth; i++ )
  {
    while ( SET != SPI_GetFlagStatus( SPI_FLAG_RXNE ) );
    data[i] = SPI_ReceiveData(  );
  }
}
  
/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
