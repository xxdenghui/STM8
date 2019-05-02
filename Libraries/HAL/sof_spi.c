/**
  ******************************************************************************
  * @file    sofspi.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-10-31
  * @brief   
  ******************************************************************************
  * @attention
  * 
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "sof_spi.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/ 

/**
  * @brief  init gpio pins
  * values 
  * @param  None
  * @retval None
  */
void SPI_GPIO_CFG(  )
{
  GPIO_Init( MOSI_PORT, MOSI_PIN, GPIO_MODE_OUT_PP_HIGH_FAST );
  GPIO_Init( SCK_PORT, SCK_PIN, GPIO_MODE_OUT_PP_HIGH_FAST );
  GPIO_Init( MISO_PORT, MISO_PIN, GPIO_MODE_IN_PU_NO_IT );
}


/* Public functions ----------------------------------------------------------*/

/**
  * @brief  uart print string
  * values 
  * @param  
  *     string
  * @retval None
  */
void sof_spi_cfg( void )
{
  SPI_GPIO_CFG(  );
}

void sof_spi_rw( uint8_t* send_data,  uint8_t* read_data, uint8_t bytes )
{
  for ( uint8_t j=0; j<bytes; j++ ){
    // read & write one byte
    for ( uint8_t i=0; i<8; i++ ){
      GPIO_WriteLow( SCK_PORT, SCK_PIN ); // SCK low
      delayus( 3 );
//      read_data[j] |= ( GPIO_ReadInputPin( MISO_PORT, MISO_PIN ) << (8-i) );  //read bit
      if ( GPIO_ReadInputPin( MISO_PORT, MISO_PIN ) )
        read_data[j] |= (0x80>>i);
      else 
        read_data[j] &= ~(0x80>>i);
      if ( send_data[j] & (0x80>>i) )
        GPIO_WriteHigh( MOSI_PORT, MOSI_PIN ); // write high bit
      else 
        GPIO_WriteLow( MOSI_PORT, MOSI_PIN ); // write low bit
      delayus( 5 );
      GPIO_WriteHigh( SCK_PORT, SCK_PIN ); // SCK high
    }
  }
}

  
/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
