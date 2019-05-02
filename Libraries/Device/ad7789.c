/**
  ******************************************************************************
  * @file    AD7789.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-10-31
  * @brief   AD7789 ADC Chip Driver seouce file
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "ad7789.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
  uint8_t send_buff[4] = {0};
  uint8_t read_buff[4] = {0};
/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

void Reset_AD7789( void )
{
  uint8_t ResetData[4] = { 0xff, 0xff, 0xff, 0xff };
  sof_spi_rw( ResetData, read_buff, 4 );
}

void WriteCMD_AD7789( uint8_t cmd, uint8_t reg )
{
  send_buff[0] = cmd;
  send_buff[1] = reg;
  sof_spi_rw( send_buff, read_buff, 2 );
}

/* Public functions ----------------------------------------------------------*/
void Init_AD7789( void )
{
  sof_spi_cfg( );
  GPIO_Init( AD7789_CS_PORT, AD7789_CS_PIN, GPIO_MODE_OUT_PP_HIGH_FAST );
  delayms(1);
  AD7789_CS_Low( );
  Reset_AD7789( );
  WriteCMD_AD7789( CMD_WR_MODE_REG, 0x06 );
  AD7789_CS_High( );
}

void ReadADC_AD7789( uint8_t* readval )
{
  //send cmd
  send_buff[0] = 0x10;
  send_buff[1] = 0x82;
  AD7789_CS_Low( );
  sof_spi_rw( send_buff, read_buff, 2 );
  while ( GPIO_ReadInputPin( MISO_PORT, MISO_PIN ) );
  send_buff[0] = 0x38;
  sof_spi_rw( send_buff, readval, 4 );
  AD7789_CS_High( );  
}

/**
  * @brief  OLEDs power on
  * values.
  * @param  None
  * @retval None
  */



/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
