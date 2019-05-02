/**
  ******************************************************************************
  * @file    ds1302.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-06-06
  * @brief   ds1302 seouce file
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "ds1302.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Write data with soft SPI
  * values.
  * @param  dat
  * @retval None
  */
void DeviceInit_DS1302( void )
{
  _IO( CLK_Port,  CLK_Pin, _OPLF );
  _IO( DIO_Port,  DIO_Pin,  _OPLF );
  _IO( CE_Port,   CE_Pin,   _OPLF );
}

/**
  * @brief  Reset DS1302
  * values.
  * @param  dat
  * @retval None
  */
void Reset_DS1302( void )
{
  Singelbyte_Write (WRITE_PROTECT,0x00); 
  Singelbyte_Write (WRITE_SECOND,0x56);
  Singelbyte_Write (WRITE_MINUTE,0x34); 
  Singelbyte_Write (WRITE_HOUR,0x12); 
  Singelbyte_Write (WRITE_PROTECT,0x80);
}

/**
  * @brief  DS1302 ���ֽڶ�����
  * values.
  * @param  addr-��ȡ��ַ
  * @retval ���ض�ȡֵ(BCD-8421)
  */
uint8_t Singelbyte_Read( uint8_t addr )
{
  uint8_t temp = 0;
  CE_Low(  );
  CLK_Low(  );
  _IO( DIO_Port,  DIO_Pin,  _OPHF );    //set DIO out
  CE_High(  );
  for ( uint8_t i=0; i<8; i++ )
  {
    CLK_Low(  );
    if ( addr & (0x01<<i) )
      DIO_High(  );
    else
      DIO_Low(  );
    CLK_High(  );
  }
  _IO( DIO_Port,  DIO_Pin,  _IPNI );    //set DIO in
  CLK_High(  );
  delayus( 5 );
  for ( uint8_t i=0; i<8; i++ )
  {
    CLK_Low(  );
    if ( DIO_In(  ) )
      temp |= (0x01<<i);
    else
      temp &= ~(0x01<<i);
    if ( i<7 )
      CLK_High(  );
  }
  CE_Low(  );
  return temp;
}

/**
  * @brief  DS1302 ���ֽ�д����
  * values.
  * @param  addr-д���ַ
  *         dat-д������
  * @retval none
  */
void Singelbyte_Write( uint8_t addr, uint8_t dat )
{
  CE_Low(  );
  CLK_Low(  );
  _IO( DIO_Port,  DIO_Pin,  _OPHF );    //set DIO out
  CE_High(  );
  for ( uint8_t i=0; i<8; i++ )
  {
    CLK_Low(  );
    if ( addr & (0x01<<i) )
      DIO_High(  );
    else
      DIO_Low(  );
    CLK_High(  );
  }
  for ( uint8_t i=0; i<8; i++ )
  {
    CLK_Low(  );
    if ( dat & (0x01<<i) )
      DIO_High(  );
    else
      DIO_Low(  );
    CLK_High(  );
  }
  CLK_Low(  );
  CE_Low(  );
}
   
/* Public functions ----------------------------------------------------------*/

/**
  * @brief  DS1302 �趨ʱ��
  * values.
  * @param  RTC_TimeStruct-ʱ��ṹ��
  * @retval none
  */
void RTC_SetTime( RTC_TimeTypeDef* RTC_TimeStruct )
{
  Singelbyte_Write (WRITE_PROTECT,0x00); 
  Singelbyte_Write (WRITE_SECOND,RTC_TimeStruct->RTC_Seconds);
  Singelbyte_Write (WRITE_MINUTE,RTC_TimeStruct->RTC_Minutes); 
  Singelbyte_Write (WRITE_HOUR,RTC_TimeStruct  ->RTC_Hours); 
  Singelbyte_Write (WRITE_PROTECT,0x80);
}

/**
  * @brief  DS1302 ��ȡʱ��
  * values.
  * @param  RTC_TimeStruct-ʱ��ṹ��
  * @retval none
  */
void RTC_GetTime( RTC_TimeTypeDef* RTC_TimeStruct )
{
  RTC_TimeStruct->RTC_Seconds = Singelbyte_Read( READ_SECOND );
  RTC_TimeStruct->RTC_Minutes = Singelbyte_Read( READ_MINUTE );
  RTC_TimeStruct->RTC_Hours   = Singelbyte_Read( READ_HOUR );
}

/**
  * @brief  DS1302 �趨����
  * values.
  * @param  RTC_DateStruct-���ڽṹ��
  * @retval none
  */
void RTC_SetDate( RTC_DateTypeDef* RTC_DateStruct)
{
  Singelbyte_Write (WRITE_PROTECT,0x00); 
  Singelbyte_Write (WRITE_DATE,RTC_DateStruct  ->RTC_Date);
  Singelbyte_Write (WRITE_MONTH,RTC_DateStruct ->RTC_Month); 
  Singelbyte_Write (WRITE_YEAR,RTC_DateStruct  ->RTC_Year); 
  Singelbyte_Write (WRITE_WEEK,RTC_DateStruct  ->RTC_Week); 
  Singelbyte_Write (WRITE_PROTECT,0x80);
}

/**
  * @brief  DS1302 ��ȡ����
  * values.
  * @param  RTC_TimeStruct-���ڽṹ��
  * @retval none
  */
void RTC_GetDate( RTC_DateTypeDef* RTC_DateStruct )
{
  RTC_DateStruct->RTC_Date   = Singelbyte_Read( READ_DATE );
  RTC_DateStruct->RTC_Month  = Singelbyte_Read( READ_MONTH );
  RTC_DateStruct->RTC_Year   = Singelbyte_Read( READ_YEAR );
  RTC_DateStruct->RTC_Week   = Singelbyte_Read( READ_WEEK );
}

/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/