/**
  ******************************************************************************
  * @file    DHT22.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2014-11-10
  * @brief   the DHT22 sourse file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "dht11.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

/* Public functions ----------------------------------------------------------*/

/**
  * @brief  DHT22 start fuctions
  * values.
  * @param  None
  * @retval None
  */
void DHT11_Start( void )
{
    DHT_IO_OUT;
    DHT_IO_LOW;
    delayms( 18 );
    DHT_IO_HIGH;
    delayus( 30 );
}

/**
  * @brief  DHT check fuctions
  * values.
  * @param  None
  * @retval 0=erro, 1=OK.
  */
uint8_t DHT11_Check( void )
{
  uint8_t check = 0;
  DHT_IO_IN;
  while ( !DHT_IO_READ && check < 10 )  /* 检测从机低电平80us */
  {
    check++;
    delayus( 10 );
  }
  if ( check >= 10 ) 
    return 0;
  else check = 0;
  while ( DHT_IO_READ && check < 10 )  /* 检测从机高电平 80us */
  {
    check++;
    delayus( 10 );
  }
  if ( check >= 10 ) 
    return 0;
  else return 1;
}

/**
  * @brief  DHT read a bit fuctions
  * values.
  * @param  None
  * @retval bit value
  */
uint8_t DHT11_Read_Bit( void )
{
  uint8_t check = 0;
  while ( !DHT_IO_READ && check < 6 )  /* 检测低电平长度 50us*/
  {
    check++;
    delayus( 10 );
  }
  check = 0;
  while ( DHT_IO_READ && check < 8 )  /* 检测高电平长度 */
  {
    check++;
    delayus( 10 );
  }
  if ( check <= 4 ) return 0;
  else return 1;
}

/**
  * @brief  DHT read a byte fuctions
  * values.
  * @param  None
  * @retval byte value
  */
uint8_t DHT11_Read_Byte( void )
{
  uint8_t i,dat = 0;
  for ( i = 0;i < 8; i++ )
  {
    dat<<=1;
    dat |= DHT11_Read_Bit(  );
  }
  return dat;
}

/**
  * @brief  DHT read fuctions
  * values.
  * @param  None
  * @retval 0=falue, 1=succed
  */
ErrorStatus DHT11_Read( uint8_t *temp )
{
  ErrorStatus Err = ERROR;
  uint8_t buff[5];
  uint8_t i;
  DHT11_Start(  );
  if ( DHT11_Check(  ) )
  {
    for ( i = 0; i < 5; i++ )   /* 读取5byte数据到缓存 */
    {
      buff[i] = DHT11_Read_Byte(  );
    }
    if ( buff[0] + buff[1] + buff[2] + buff[3] == buff[4] )  /* 校验和并输出数据 */
    {
      *temp = buff[2];
      temp++;
      *temp = buff[3];
      temp++;
      *temp = buff[0];
      temp++;
      *temp = buff[1];
      Err = SUCCESS;
    }
  }
  return Err;
}



/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
