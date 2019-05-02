/**
  ******************************************************************************
  * @file		tm7705.c
  * @author		Darren
  * @version	V1.0.0
  * @date		2019-01-25
  * @brief		TM7705 ADC Chip Driver seouce file
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "tm7705.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
  uint8_t send_buff[2] = {0};
  uint8_t read_buff[3] = {0};
/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

void TM7705_WriteCMD( uint8_t* cmd )
{
	
}

void TM7705_ReadADC( uint8_t* readval )
{
   
}

/* Public functions ----------------------------------------------------------*/
void TM7705_Init( void )
{
  GPIO_Init( TM7705_CS_PORT, TM7705_CS_PIN, GPIO_MODE_OUT_PP_HIGH_FAST );
  SPI_Init( SPI_FIRSTBIT_MSB,
		   	SPI_BAUDRATEPRESCALER_16,
			SPI_MODE_MASTER,
			SPI_CLOCKPOLARITY_HIGH,
			SPI_CLOCKPHASE_2EDGE,
			SPI_DATADIRECTION_2LINES_FULLDUPLEX,
			SPI_NSS_SOFT,
			0x07 );
  SPI_Cmd( ENABLE );
}




/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
