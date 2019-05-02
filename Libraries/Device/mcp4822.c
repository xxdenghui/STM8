/**
  ******************************************************************************
  * @file    mcp4822.c
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
#include "mcp4822.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

/* Public functions ----------------------------------------------------------*/

/**
  * @brief  Device Init
  * values.
  * @param  none
  * @retval None
  */
void Init_MCP4822( void )
{
  GPIO_Init( LD_PORT, LD_PIN, GPIO_MODE_OUT_PP_HIGH_FAST );
  GPIO_Init( MCP4822_CS_PORT, MCP4822_CS_PIN, GPIO_MODE_OUT_PP_HIGH_FAST );
  //hal_spi_cfg( master, msb );
  sof_spi_cfg( );
}
/**
  * @brief  set DAC value
  * values.
  * @param  chennel(0,1), value(0~4096)
  * @retval None
  */
void Set_MCP4822( uint8_t ch, uint16_t value )
{
  uint8_t SendCode[2] = {0};
  uint8_t ReadCode[2] = {0};
  SendCode[0] = (uint8_t)(value>>8);
  SendCode[1] = (uint8_t)value; 
  switch ( ch ){
  case 1: SendCode[0] |= 0x10; break;
  case 2: SendCode[0] |= 0x90; break;
  default: break;
  }
  // spi write 2 bytes
  MCP4822_CS_Low();
  sof_spi_rw( SendCode, ReadCode, 2 );
  MCP4822_CS_High();
  delayus( 5 );
  // read out
  LD_Low( );
  delayus( 5 );
  LD_High( ); 
}
/************************** (C) COPYRIGHT 2016 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
