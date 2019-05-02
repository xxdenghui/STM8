/**
  ******************************************************************************
  * @file    wire.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-11-19
  * @brief   seouce file for wire bus
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "hal_wire.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
uint16_t I2C_Timeout;
__IO uint16_t Event = 0x00;
__IO uint8_t Tx_Idx = 0x0;
__IO uint8_t Rx_Idx = 0x0;
uint8_t NumOfBytes = 5;
uint8_t Slave_Buffer_Tx[BUFFER_SIZE];
uint8_t Slave_Buffer_Rx[BUFFER_SIZE];
uint8_t Master_Buffer_Tx[BUFFER_SIZE];
uint8_t Master_Buffer_Rx[BUFFER_SIZE];
/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

/* Public functions ----------------------------------------------------------*/

/**
  * @brief  readys I2C pins and sets I2C bitrate
  * values.
  * @param  None
  * @retval None
  */
#if defined STM8L15
void I2C_begin( uint8_t address, uint8_t IT )
{
  CLK_PeripheralClockConfig( CLK_Peripheral_I2C1, ENABLE );
  I2C_Init( I2C1, I2C_SPEED, address, I2C_Mode_I2C, I2C_DUTYCYCLE_2, I2C_Ack_Enable, 
            I2C_AcknowledgedAddress_7bit );
  if ( IT )
    I2C_ITConfig(I2C1, (I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
  else I2C_Cmd( I2C1, ENABLE ); 
}
#endif
#if defined STM8S
void I2C_begin( uint8_t address, uint8_t IT )
{
  CLK_PeripheralClockConfig( CLK_PERIPHERAL_I2C, ENABLE );
  I2C_Init( I2C_SPEED, address, I2C_DUTYCYCLE_2, I2C_ACK_CURR, 
            I2C_ADDMODE_7BIT, 16 );
  if ( IT )
    I2C_ITConfig( (I2C_IT_TypeDef)(I2C_IT_ERR | I2C_IT_EVT | I2C_IT_BUF), ENABLE);
  else I2C_Cmd( ENABLE ); 
}
#endif

/**
  * @brief  wait I2C bus is busy
  * values.
  * @param  None
  * @retval
  *     -SET is busy
  *     -RESET is free
  */
FlagStatus I2C_busy( void )
{
  FlagStatus busy = RESET;
  /* While the bus is busy */
  I2C_Timeout = I2C_LONG_TIMEOUT;
  while(I2C_GetFlagStatus(I2C_FLAG_BUSBUSY))
  {
    if((I2C_Timeout--)==0) busy = SET;
  }
  return busy;
}

/**
  * @brief  I2C wire Master Transmit
  * values.
  * @param  
  *     - address the start transmit address
  *     - buffsize how many bytes will be transmit
  * @retval
  *     -SUCCESS transmit is done
  *     -ERROR   transmit error
  */
ErrorStatus I2C_MasterTransmit( uint8_t address, uint8_t buffsize )
{
  ErrorStatus ErrStatus = SUCCESS;
  I2C_GenerateSTART( ENABLE );    // Send START condition
  I2C_Timeout = I2C_FLAG_TIMEOUT;
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT)){ //EV5
    if((I2C_Timeout--) == 0){
      ErrStatus = ERROR;
      break; 
    }
  }
  if ( ErrStatus != ERROR ){
    I2C_Send7bitAddress( address, I2C_DIRECTION_TX );  //Send slave Address for read
    I2C_Timeout = I2C_FLAG_TIMEOUT;
    while(!I2C_CheckEvent( I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)){  //EV6
      if((I2C_Timeout--) == 0){
        ErrStatus = ERROR;
        break;
      }
    }
  }
  if ( ErrStatus != ERROR ){
    for ( Tx_Idx=0; Tx_Idx<buffsize; Tx_Idx++ ){
      if ( ErrStatus == ERROR ) break;
      I2C_SendData( Master_Buffer_Tx[Tx_Idx] );  
      if ( Tx_Idx == buffsize-1 ){
        I2C_Timeout = I2C_FLAG_TIMEOUT;
        while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTED)){
          if((I2C_Timeout--) == 0){
            ErrStatus = ERROR;
            break;
          }
        }
      }else{
        I2C_Timeout = I2C_FLAG_TIMEOUT;
        while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_TRANSMITTING)){
          if((I2C_Timeout--) == 0){
            ErrStatus = ERROR;
            break;
          }
        }
      }
    }
  }
  
  I2C_GenerateSTOP( ENABLE );
  return ErrStatus;
}

/**
  * @brief  I2C wire Master Receive
  * values.
  * @param  
  *     - address the start receive address
  *     - buffsize how many bytes to be receive
  * @retval
  *     -SUCCESS receive is done
  *     -ERROR   receive error
  */
ErrorStatus I2C_MasterReceive( uint8_t address, uint8_t buffsize )
{
  ErrorStatus ErrStatus = SUCCESS;
  I2C_GenerateSTART( ENABLE );    // Send START condition
  I2C_Timeout = I2C_FLAG_TIMEOUT;
  while(!I2C_CheckEvent( I2C_EVENT_MASTER_MODE_SELECT)){
    if((I2C_Timeout--) == 0){
      ErrStatus = ERROR;
      break;
    }
  }
  if ( ErrStatus != ERROR ){
    I2C_Send7bitAddress( address, I2C_DIRECTION_RX );  //Send slave Address for read
    I2C_Timeout = I2C_FLAG_TIMEOUT;
    while(!I2C_CheckEvent( I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED)){
      if((I2C_Timeout--) == 0){
        ErrStatus = ERROR;
        break;
      }
    }
    if ( ErrStatus != ERROR ){
      for ( uint8_t i=0; i<buffsize; i++ ){
        if ( i == buffsize-1 ){
          I2C_AcknowledgeConfig( I2C_ACK_NONE );
          I2C_Timeout = I2C_FLAG_TIMEOUT;
          while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_RECEIVED)){
            if((I2C_Timeout--) == 0){
              ErrStatus = ERROR;
              break;
            }
          }
          Master_Buffer_Rx[i] = I2C_ReceiveData(  );
        }else {
          I2C_AcknowledgeConfig( I2C_ACK_CURR );
          I2C_Timeout = I2C_FLAG_TIMEOUT;
          while(!I2C_CheckEvent( I2C_EVENT_MASTER_BYTE_RECEIVED)){
            if((I2C_Timeout--) == 0){
              ErrStatus = ERROR;
              break;
            }
          }
          Master_Buffer_Rx[i] = I2C_ReceiveData(  );
        }
      }
    }
  }
  I2C_GenerateSTOP( ENABLE );
  return ErrStatus;
}

/**
  * @brief  I2C wire Slave Transmit (not OK!)
  * values.
  * @param  
  *     - *data the transmit data
  * @retval
  *     -SUCCESS start is done
  *     -ERROR   start error
  */
ErrorStatus I2C_SlaveTransmit( uint8_t* data )
{
  uint8_t i = 0;
  ErrorStatus ErrStatus = SUCCESS;
  while(!I2C_CheckEvent( I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED)); //EV1
  i = 0;
  while(!I2C_CheckEvent( I2C_EVENT_SLAVE_STOP_DETECTED)){
    I2C_SendData( data[i++] );
    I2C_Timeout = I2C_FLAG_TIMEOUT;
    while(!I2C_CheckEvent( I2C_EVENT_SLAVE_BYTE_TRANSMITTING)){
      if((I2C_Timeout--) == 0){
        ErrStatus = ERROR;
        break;
      }
    }
  }  
  
  return ErrStatus;
}

/**
  * @brief  I2C wire Start Condition
  * values.
  * @param  none
  * @retval none
  */
void I2C_Start( void )
{
  I2C_GenerateSTART( ENABLE );
}

/**
  * @brief  I2C wire Interrupt fuction, used in stm815x_it.c (I2C1_SPI2_IRQHandler,29)
  * values.
  * @param  none 
  * @retval none
  */
void I2C_Handler( void )
{
  if ((I2C->SR2) != 0){        // Read SR2 register to get I2C error
    I2C->SR2 = 0;              // Clears SR2 register
  }
  Event = I2C_GetLastEvent(  );
  switch ( Event ){
  case I2C_EVENT_MASTER_MODE_SELECT:    // EV5
    I2C_Send7bitAddress( SlaveAddress, I2C_DIRECTION_TX );
    break;
  case I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED:    // EV6
    Tx_Idx = 0;
    if (NumOfBytes != 0){
      I2C_SendData( Master_Buffer_Tx[Tx_Idx++]);   // Send the first Data
      NumOfBytes--;             // Decrement number of bytes
    }
    if (NumOfBytes == 0){
      I2C_ITConfig( I2C_IT_BUF, DISABLE);
    }
    break;
  case I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED:    // EV6
    break;
  case I2C_EVENT_MASTER_MODE_ADDRESS10:        // EV9
    break;
  case I2C_EVENT_MASTER_BYTE_RECEIVED:         // EV7
    break;
  case I2C_EVENT_MASTER_BYTE_TRANSMITTING:     // EV8
    I2C_SendData( Master_Buffer_Tx[Tx_Idx++]);     // Send the first Data
    NumOfBytes--;               // Decrement number of bytes
    if (NumOfBytes == 0){
      I2C_ITConfig( I2C_IT_BUF, DISABLE);
    }
    break;
  case I2C_EVENT_MASTER_BYTE_TRANSMITTED:      // EV8-2
    I2C_GenerateSTOP( ENABLE);             // Send STOP condition
    I2C_ITConfig( I2C_IT_EVT, DISABLE);
    break;
  case I2C_EVENT_SLAVE_RECEIVER_ADDRESS_MATCHED:    // EV1
    break;
  case I2C_EVENT_SLAVE_TRANSMITTER_ADDRESS_MATCHED:    // EV1
    Tx_Idx = 0;
    break;
  case I2C_EVENT_SLAVE_GENERALCALLADDRESS_MATCHED:    // EV1
    break;
  case I2C_EVENT_SLAVE_BYTE_RECEIVED:    // EV7
    break;
  case I2C_EVENT_SLAVE_STOP_DETECTED:    // EV4 
    I2C->CR2 |= I2C_CR2_ACK;
    break;
  case I2C_EVENT_SLAVE_BYTE_TRANSMITTED:    // EV3
    I2C_SendData( Slave_Buffer_Tx[Tx_Idx++] );  
    break;
  case I2C_EVENT_SLAVE_BYTE_TRANSMITTING:    // EV3
    I2C_SendData( Slave_Buffer_Tx[Tx_Idx++] );
    break;
  case I2C_EVENT_SLAVE_ACK_FAILURE:    // EV3-2
    I2C_ClearITPendingBit( I2C_ITPENDINGBIT_ACKNOWLEDGEFAILURE );
    break;
  default:
    break;
  }
}



/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
