/**
  ******************************************************************************
  * @file    lt8900.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2014-12-03
  * @brief   This is the lt8900 source file file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "lt8900.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
uint16_t LT8900_Reg32 = 0x4000;
uint16_t LT8900_Reg36, LT8900_Reg37, LT8900_Reg38, LT8900_Reg39;

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

/**
  * @brief  rw a byte with SPI
  * values.
  * @param  
  *   -dat send data
  * @retval 
  *   recive data 
  */
uint8_t SPI_NRF_RW( uint8_t dat )
{
  uint8_t i = 0;
  /* Waiting if the Transmit buffer not empty */
  while ( SPI_GetFlagStatus( SPI_FLAG_TXE ) == RESET )
  {
    delayus( 10 );
    if ( i++ > 10 )
    return 0;
  }
  /* Send a byte with SPI*/
  SPI_SendData( dat );
  /* Waiting if the Receive buffer empty */
  i = 0;
  while ( SPI_GetFlagStatus( SPI_FLAG_RXNE ) == RESET )
  {
    delayus( 10 );
    if ( i++ > 10 )
    return 0;
  }
  /* Return the byte read from the SPI bus */
  return SPI_ReceiveData(  );
}

/**
  * @brief  write lt8900 redister with SPI
  * values.
  * @param  
  *   -reg the register will be read
  *   -val_H the val of high byte
  *   -val_L the val of low byte
  * @retval 
  *   none
  */
void LT8900_WriteReg( uint8_t reg, uint16_t val )
{
  NRF_CSN_LOW(  );
  SPI_NRF_RW( reg );
  SPI_NRF_RW( (uint8_t)(val >> 8) );
  SPI_NRF_RW( (uint8_t)val );
  NRF_CSN_HIGH(  );
}

/**
  * @brief  read lt8900 redister val with SPI
  * values.
  * @param  
  *   -reg the register will be read
  * @retval 
  *   val 16bit
  */
uint16_t LT8900_ReadReg( uint8_t reg )
{
  uint16_t val;
  
  NRF_CSN_LOW(  );
  SPI_NRF_RW( reg + 0x80 );
  val = (uint16_t)SPI_NRF_RW( 0x00 ) << 8;
  val += (uint16_t)SPI_NRF_RW( 0x00 );
  NRF_CSN_HIGH(  );
  return val;
}


/* Public functions ----------------------------------------------------------*/

/**
  * @brief  init the lt8900 device
  * values.
  * @param  
  *   none
  * @retval 
  *   none
  */
void LT8900_Device_Init(  )
{
  /* IO init */
  GPIO_Init( NRF_RESETN_PORT, NRF_RESETN_PIN, GPIO_MODE_OUT_PP_HIGH_FAST );
  GPIO_Init( NRF_CSN_PORT, NRF_CSN_PIN, GPIO_MODE_OUT_PP_HIGH_FAST );
  GPIO_Init( NRF_SCK_PORT, NRF_SCK_PIN, GPIO_MODE_OUT_PP_HIGH_FAST );
  GPIO_Init( NRF_MOSI_PORT, NRF_MOSI_PIN, GPIO_MODE_OUT_PP_HIGH_FAST );
  GPIO_Init( NRF_MISO_PORT, NRF_MISO_PIN, GPIO_MODE_IN_FL_NO_IT );
  GPIO_Init( NRF_PKT_PORT, NRF_PKT_PIN, GPIO_MODE_IN_FL_NO_IT );
  
  /* SPI BUS init */
  CLK_PeripheralClockConfig( CLK_PERIPHERAL_SPI, ENABLE );
  SPI_Init( SPI_FIRSTBIT_MSB,
           SPI_BAUDRATEPRESCALER_2,
           SPI_MODE_MASTER,
           SPI_CLOCKPOLARITY_LOW,
           SPI_CLOCKPHASE_2EDGE,
           SPI_DATADIRECTION_2LINES_FULLDUPLEX,
           SPI_NSS_SOFT,
           0x01
           );
  SPI_Cmd( ENABLE );
}

/**
  * @brief  reset the lt8900
  * values.
  * @param  
  *   none
  * @retval 
  *   none
  */
void LT8900_Reg_Reset(  )
{
  NRF_RESETN_LOW(  );
  delayms( 1 );
  NRF_RESETN_HIGH(  );
  LT8900_WriteReg(0, 0x6FE0);
  LT8900_WriteReg(1, 0x5681);
  LT8900_WriteReg(2, 0x6617);
  
  LT8900_WriteReg(4, 0x9CC9);
  LT8900_WriteReg(5, 0x6637);
  
  LT8900_WriteReg(7, 0x0000);// use for setting 	RF frequency and to start or stop TX /RX packets  
  LT8900_WriteReg(8, 0x6C90);
  LT8900_WriteReg(9, 0x4800);//set TX power level 
  LT8900_WriteReg(10, 0x7FFD);//crystal osc.enabled 
  LT8900_WriteReg(11, 0x0008);//rssi enabled 
  LT8900_WriteReg(12, 0x0000);
  LT8900_WriteReg(13, 0x48BD);

  LT8900_WriteReg(22, 0x00ff);
  LT8900_WriteReg(23, 0x8005);
  LT8900_WriteReg(24, 0x0067);
  LT8900_WriteReg(25, 0x1659);
  LT8900_WriteReg(26, 0x19E0);
  LT8900_WriteReg(27, 0x1300);
  LT8900_WriteReg(28, 0x1800);

  LT8900_WriteReg(32, LT8900_Reg32);//set preamble_len :3 byes.  set syncword_len:32 bits ----Reg39[15:0],Reg36[15:0]
  LT8900_WriteReg(33, 0x3fC7);
  LT8900_WriteReg(34, 0x2000);
  LT8900_WriteReg(35, 0x0300);
  LT8900_WriteReg(36, LT8900_Reg36 );//set sync words Í¬²½×Ö½Ú
  LT8900_WriteReg(37, LT8900_Reg37 );//set sync words 
  LT8900_WriteReg(38, LT8900_Reg38 );//set sync words 
  LT8900_WriteReg(39, LT8900_Reg39 );//set sync words 
  LT8900_WriteReg(40, 0x4401);
  LT8900_WriteReg(41, 0xb000);//crc on scramble off ,1st byte packet length ,auto ack  off  
  LT8900_WriteReg(42, 0xFDB0);
  LT8900_WriteReg(43, 0x000F);//configure scan_rssi
  
  LT8900_WriteReg(50, 0x0000);
  
  delayms( 1 );
  
}

/**
  * @brief  config the LT8900 MAC
  * values.
  * @param  
  *   Syn_Len- bytes of MAC lenth
  *   MAC- device address val
  * @retval 
  *   none
  */
void LT8900_MAC_Cfg( Syn_Len_TypeDef Syn_Len, uint8_t* MAC )
{
  if (( Syn_Len & 0x18 ) == 0x18 )
  {
    LT8900_Reg32 |= 0x1800;
    LT8900_Reg36 = (uint16_t)MAC[0]<<8 | (uint16_t)MAC[1];
    LT8900_Reg37 = (uint16_t)MAC[2]<<8 | (uint16_t)MAC[3];
    LT8900_Reg38 = (uint16_t)MAC[4]<<8 | (uint16_t)MAC[5];
    LT8900_Reg39 = (uint16_t)MAC[6]<<8 | (uint16_t)MAC[7];
  }
  else if (( Syn_Len & 0x18 ) == 0x10 )
  {
    LT8900_Reg32 |= 0x1000;
    LT8900_Reg36 = (uint16_t)MAC[0]<<8 | (uint16_t)MAC[1];
    LT8900_Reg38 = (uint16_t)MAC[2]<<8 | (uint16_t)MAC[3];
    LT8900_Reg39 = (uint16_t)MAC[4]<<8 | (uint16_t)MAC[5];
  }
  else if (( Syn_Len & 0x18 ) == 0x08 )
  {
    LT8900_Reg32 |= 0x0800;
    LT8900_Reg36 = (uint16_t)MAC[0]<<8 | (uint16_t)MAC[1];
    LT8900_Reg39 = (uint16_t)MAC[2]<<8 | (uint16_t)MAC[3];
  }
  else 
  {
    LT8900_Reg32 |= 0x0000;
    LT8900_Reg36 = (uint16_t)MAC[0]<<8 | (uint16_t)MAC[1];
  }
  
}

/**
  * @brief  Send data with LT8900
  * values.
  * @param  
  *   *Data- the data will be send
  *   Data_Lenth- words will be send
  * @retval 
  *   0- Data is send;
  *   1- Data not send;
  */
uint8_t LT8900_Send_Data( uint8_t* Data, uint8_t Data_Lenth )
{
  uint8_t i;
  /* Reset Tx FIFO */
  LT8900_WriteReg( 52, 0x8000 ); 
  /* Write Tx FIFO */
  for ( i=0; i<Data_Lenth; i++ )
    LT8900_WriteReg( 50, (uint16_t)Data[i]<<8 );
  /* TX Mode Chanel 0 */
  LT8900_WriteReg( 7, 0x0100 ); 
  i = 0;
  while ( NRF_Read_PKT(  ) != 0 )
    {
      delayms( 1 );
      i++;
      if ( i >= 10 )
        return 1;
    }
  return 0;
  
}

/**
  * @brief  Recive data with LT8900
  * values.
  * @param  
  *   *Data- the data will be recive
  *   Data_Lenth- words will be recive
  * @retval 
  *   0- Data is recived;
  *   1- Data not recived;
  */
uint8_t LT8900_Recive_Data( uint8_t* Data, uint8_t Data_Lenth )
{
  uint8_t i;
  uint16_t Data16;
  LT8900_WriteReg( 52, 0x0080 ); // Reset Rx FIFO 
  LT8900_WriteReg( 7, 0x0080 );  //Set RX mode
  i = 0;
  while ( NRF_Read_PKT(  ) == 0 )
  {
    delayms( 1 );
    i++;
    if ( i >= 10 )
      return 1;
  }
  /* Read Rx FIFO */
  for ( i=0; i<Data_Lenth; i++ )  
  {
    Data16 = LT8900_ReadReg( 50 );
    Data[i] = (uint8_t)(Data16>>8);
  }
  LT8900_WriteReg( 7, 0x0000 ); // Idle Mode 
  return 0;
  
}

  
/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
