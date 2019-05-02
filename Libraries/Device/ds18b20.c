/**
  ******************************************************************************
  * @file    ds18b20.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-08-13
  * @brief   the DS18B20 sourse file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "ds18b20.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/
/**
  * @brief  reset device
  * values.
  * @param  None
  * @retval ErrorStatus- ERROR or SUCCESS 
  */
ErrorStatus OneWireReset( void )
{
  ErrorStatus Err = SUCCESS;
  IO_Out(  );
  IO_Out_Low(  );
  delayus( 800 );
  IO_Out_High(  );
  IO_In(  );
  delayus( 60 );
  if ( IO_In_Read(  ) ) Err = ERROR;
  else while ( !IO_In_Read(  ) );
  delayus( 800 );
  return Err;
}

/**
  * @brief  byte write
  * values.
  * @param  byte
  * @retval 
  */
void OneWireWrite( uint8_t byte )
{
  uint8_t i;
  IO_Out(  );
  for ( i=0; i<8; i++ ){
    IO_Out_Low(  );
    delayus( 5 );
    if ( byte & (0x01<<i) ) IO_Out_High(  );
    delayus( 55 );
    IO_Out_High(  );
    delayus( 5 );
  } 
}

/**
  * @brief  byte read
  * values.
  * @param  byte
  * @retval 
  */
uint8_t OneWireRead( void )
{
  uint8_t data = 0;
  uint8_t i;
  for ( i=0; i<8; i++ ){
    IO_Out(  );
    IO_Out_Low(  );
    delayus( 5 );
    IO_Out_High(  );
    delayus( 5 );
    IO_In(  );
    if ( IO_In_Read( ) ) data |= ( 0x01<<i );
    delayus( 5 );
    delayus( 45 );  
    IO_Out(  );
    IO_Out_High(  );  
    delayus( 5 );
  } 
  return data;
}

ErrorStatus ROM_DS1820( ROM_TypeDef rom_cmd, uint8_t* Rom )
{
  uint8_t i;
  uint8_t temp[8];
  ErrorStatus Err = ERROR;
  if ( SUCCESS == OneWireReset() ){  // check device is on wire
    OneWireWrite( rom_cmd );  // master send ROM Command
    switch ( rom_cmd ){
    case READ_ROM:     
      for ( i=0; i<8; i++ )
      temp[i] = OneWireRead(  );
      if ( temp[7] == CalCRC_Bytes( temp, 7 ) ){
        for ( i=0; i<8; i++ )
          Rom[i] = temp[i];
        Err = SUCCESS;
      }
      break;
    case MATH_ROM:
      for ( i=0; i<8; i++ )
        OneWireWrite( Rom[i] );
      break;
    case SEARCH_ROM: break;
    case ALARM_SEARCH: break;
    case SKIP_ROM: break;
    default: break;
    }
  } 
  return Err;
}

ErrorStatus CMD_DS1820( CMD_TypeDef cmd, uint8_t* value )
{
  uint8_t i;
  uint8_t temp[9];
  ErrorStatus Err = SUCCESS;
  OneWireWrite( cmd );  // master send ROM Command
  switch ( cmd ){
  case CONVERT_T: break;
  case WRITE_SCRATCHPAD: break;
  case READ_SCRATCHPAD: // read temperature
    for ( i=0; i<9; i++ )
      temp[i] = OneWireRead(  );
    if ( temp[8] == CalCRC_Bytes( temp, 8 ) ){
      value[0] = temp[0]&0x0f;
      value[1] = (temp[1]<<4)|(temp[0]>>4);
    }
    break;
  case COPY_SCRATCHPAD: break;
  case RECALL_E2: break;
  case READ_POWER: break;
  default : break;
  }
  return Err;
}

/* Public functions ----------------------------------------------------------*/



/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
