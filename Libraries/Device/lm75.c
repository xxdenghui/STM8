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
#include "lm75.h"

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
  Master_Buffer_Tx[0] = TEMP;
  I2C_MasterTransmit( LM75_Address, 1 );
  I2C_MasterReceive( LM75_Address, 2 );
  temp[0] = Master_Buffer_Rx[0];
  temp[1] = Master_Buffer_Rx[1];
  return Err;
}


/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
