/**
  ******************************************************************************
  * @file    ad7152_3.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-07-13
  * @brief   ad7152_3 driver seouce file for STM8S series
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "ad7152_3.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
extern uint8_t Slave_Buffer_Tx[BUFFER_SIZE];
extern uint8_t Slave_Buffer_Rx[BUFFER_SIZE];
extern uint8_t Master_Buffer_Tx[BUFFER_SIZE];
extern uint8_t Master_Buffer_Rx[BUFFER_SIZE];
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
ErrorStatus ReadTemp( uint8_t* temp )
{
  ErrorStatus Err = SUCCESS;
  Master_Buffer_Tx[0] = 0x00;
  I2C_MasterTransmit( AD7152_Address, 1 );
  I2C_MasterReceive( AD7152_Address, 5 );
  for ( uint8_t i=0; i<5; i++ )
    temp[i] = Master_Buffer_Rx[i];
  return Err;
}

ErrorStatus WriteData( void )
{
  ErrorStatus Err = SUCCESS;
  Master_Buffer_Tx[0] = 0x0f;
  Master_Buffer_Tx[1] = 0x1a;
  I2C_MasterTransmit( AD7152_Address, 2 );
  return Err;
}


/************************** (C) COPYRIGHT 2016 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
