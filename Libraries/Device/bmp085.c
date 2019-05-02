/**
  ******************************************************************************
  * @file    bmp085.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-11-17
  * @brief   
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "bmp085.h"
#include "delay.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/
#define AC1_AddH 0xAA
#define AC2_AddH 0xAC
#define AC3_AddH 0xAE
#define AC4_AddH 0xB0
#define AC5_AddH 0xB2
#define AC6_AddH 0xB4
#define B1_AddH 0xB6
#define B2_AddH 0xB8
#define MB_AddH 0xBA
#define MC_AddH 0xBC
#define MD_AddH 0xBE

#define UT_CTL 0x2E
#define UP_CTL 0x34

#define Val_AddH 0xF6
/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
extern uint8_t Slave_Buffer_Tx[255];
extern uint8_t Slave_Buffer_Rx[255];
extern uint8_t Master_Buffer_Tx[255];
extern uint8_t Master_Buffer_Rx[255];

int16_t AC1;
int16_t AC2;
int16_t AC3;
uint16_t AC4;
uint16_t AC5;
uint16_t AC6;
int16_t B1;
int16_t B2;
uint16_t MB;
int16_t MC;
int16_t MD;

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

int16_t Read2Byte_BMP085( uint8_t reg )
{
  int16_t value;
  Master_Buffer_Tx[0] = reg;
  I2C_MasterTransmit( BMP085_Address, 1 );
  I2C_MasterReceive( BMP085_Address, 2 );
  value = (int16_t)Master_Buffer_Rx[0];
  value |= (int16_t)(Master_Buffer_Rx[1]<<8);
  return value;
}
/* Public functions ----------------------------------------------------------*/
/**
  * @brief  Device Init
  * @param  
  *     none
  * @retval
  *     none
  */
void Init_BMP085( void )
{
  AC1 = Read2Byte_BMP085( AC1_AddH );
  AC2 = Read2Byte_BMP085( AC2_AddH );
  AC3 = Read2Byte_BMP085( AC3_AddH );
  AC4 = Read2Byte_BMP085( AC4_AddH );
  AC5 = Read2Byte_BMP085( AC5_AddH );
  AC6 = Read2Byte_BMP085( AC6_AddH );
  B1  = Read2Byte_BMP085( B1_AddH );
  B2  = Read2Byte_BMP085( B2_AddH );
  MB  = Read2Byte_BMP085( MB_AddH );
  MC  = Read2Byte_BMP085( MC_AddH );
  MD  = Read2Byte_BMP085( MD_AddH );
}

/**
  * @brief  EErom write a byte from addr
  * @param  
  *     -addr the write address
  *     -data the write byte
  * @retval
  *     -SUCCESS write done
  *     -ERROR   write failure
  */
long GetUT_BMP085( void )
{
  long value;
  Master_Buffer_Tx[0] = UT_CTL;
  I2C_MasterTransmit( BMP085_Address, 1 );
  delayms( 30 );
  value = (long)Read2Byte_BMP085( Val_AddH );
  return value;
} 

long GetUP_BMP085( void )
{
  long value;
  Master_Buffer_Tx[0] = UP_CTL;
  I2C_MasterTransmit( BMP085_Address, 1 );
  delayms( 30 );
  value = (long)Read2Byte_BMP085( Val_AddH );
  value &= 0x00FFFF;
  return value;
} 

/**
  * @brief 
  *
  *
  */
long GetParam_BMP085( uint8_t choice )
{
  long UT;
  long UP;
  long X1, X2, B5, B6, X3, B3, p;
  unsigned long B4, B7;
  long temperature;
  long pressure;
  UT = GetUT_BMP085( );
  UP = GetUP_BMP085( );
  X1 = ((long)UT - AC6) * AC5 >> 15;
  X2 = ((long)MC << 11) / (X1 + MD);
  B5 = X1 + X2;
  temperature = (B5 + 8) >> 4;
  if ( !choice )
    return (long)temperature;
  B6 = B5 - 4000;
  X1 = ( B2 * ( B6 * B6 >> 12 ) ) >> 11;
  X2 = AC2 * B6 >> 11;
  X3 = X1 + X2;
  B3 = ( ( (long)AC1 * 4 + X3 ) + 2 ) /4;
  X1 = AC3 * B6 >> 13;
  X2 = ( B1 * ( B6 * B6 >> 12 ) ) >> 16;
  X3 = ( ( X1 + X2 ) + 2 ) >> 2;
  B4 = ( AC4 * (unsigned long)( X3 + 32768 ) ) >> 15;
  B7 = ( (unsigned long)UP - B3 ) * ( 50000 );
  if ( B7 < 0x80000000 )
    p = ( B7 * 2 ) / B4;
  else 
    p = ( B7 / B4 ) * 2;
  X1 = ( p >> 8 ) * ( p >> 8 );
  X2 = ( X1 * 3038 ) >> 16;
  pressure = p + ( ( X1 + X2 + 3791 ) >> 4 );
  return (long)pressure;
}


/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
