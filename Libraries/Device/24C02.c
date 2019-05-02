/**
  ******************************************************************************
  * @file    24C02.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-07-28
  * @brief   24C02 seouce file for STM8L series
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "24c02.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

/* Public functions ----------------------------------------------------------*/
/**
  * @brief  EErom write a byte from addr
  * values.
  * @param  
  *     -addr the write address
  *     -data the write byte
  * @retval
  *     -SUCCESS write done
  *     -ERROR   write failure
  */
ErrorStatus EEROM_WriteByte( uint8_t addr, uint8_t data )
{
  uint8_t buff[2] = {0};
  buff[0] = addr;
  buff[1] = data;
  ErrorStatus ErrStatus = ERROR;
  if ( Wire_busy(  ) == RESET ){
    Wire_MasterTransmit( EERom_Address, buff, 2 );
    ErrStatus = SUCCESS;
  }
  return ErrStatus;
}

/**
  * @brief  Read a byte from EErom with address addr
  * values.
  * @param  
  *     -addr   the address to be read
  *     -*data  the byte to be read
  * @retval
  *     -SUCCESS read done
  *     -ERROR   read failure
  */
ErrorStatus EEROM_RadomRead( uint8_t addr, uint8_t* data )
{
  ErrorStatus ErrStatus = ERROR;
  if ( Wire_busy(  ) == RESET ){
    Wire_MasterTransmit( EERom_Address, &addr, 1 );
    Wire_MasterReceive( EERom_Address, data, 5 );
  }
  return ErrStatus;
}


/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
