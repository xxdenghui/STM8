/**
  ******************************************************************************
  * @file    ds1302.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-06-06
  * @brief   This is a demo file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __DS1302_H
#define __DS1302_H

/* Includes ------------------------------------------------------------------*/
#include "conf.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/

//RTC_Weekdays
typedef enum
{
  RTC_Weekday_Monday      =  ((uint8_t)0x01), /*!< WeekDay is Monday */
  RTC_Weekday_Tuesday     =  ((uint8_t)0x02), /*!< WeekDay is Tuesday */
  RTC_Weekday_Wednesday   =  ((uint8_t)0x03), /*!< WeekDay is Wednesday */
  RTC_Weekday_Thursday    =  ((uint8_t)0x04), /*!< WeekDay is Thursday */
  RTC_Weekday_Friday      =  ((uint8_t)0x05), /*!< WeekDay is Friday */
  RTC_Weekday_Saturday    =  ((uint8_t)0x06), /*!< WeekDay is Saturday */
  RTC_Weekday_Sunday      =  ((uint8_t)0x07)  /*!< WeekDay is Sunday */
}
RTC_Weekday_TypeDef;

//RTC_Months
typedef enum
{
  RTC_Month_January   =  ((uint8_t)0x01), /*!< Month is January */
  RTC_Month_February  =  ((uint8_t)0x02), /*!< Month is February */
  RTC_Month_March     =  ((uint8_t)0x03), /*!< Month is March */
  RTC_Month_April     =  ((uint8_t)0x04), /*!< Month is April */
  RTC_Month_May       =  ((uint8_t)0x05), /*!< Month is May */
  RTC_Month_June      =  ((uint8_t)0x06), /*!< Month is June */
  RTC_Month_July      =  ((uint8_t)0x07), /*!< Month is July */
  RTC_Month_August    =  ((uint8_t)0x08), /*!< Month is August */
  RTC_Month_September =  ((uint8_t)0x09), /*!< Month is September */
  RTC_Month_October   =  ((uint8_t)0x10), /*!< Month is October */
  RTC_Month_November  =  ((uint8_t)0x11), /*!< Month is November */
  RTC_Month_December  =  ((uint8_t)0x12)  /*!< Month is December */
}
RTC_Month_TypeDef;

// RTC Time structure definition
typedef struct
{
  uint8_t RTC_Hours;       
  
  uint8_t RTC_Minutes;   
  
  uint8_t RTC_Seconds;   
}
RTC_TimeTypeDef;


//RTC Date structure definition
typedef struct
{   
  uint8_t RTC_Date;  
  
  uint8_t RTC_Month;
  
  uint8_t RTC_Year; 
  
  uint8_t RTC_Week;
}
RTC_DateTypeDef;

/* Private macros ------------------------------------------------------------*/
#define WRITE_SECOND            0x80 
#define READ_SECOND             0x81 
#define WRITE_MINUTE            0x82 
#define READ_MINUTE             0x83 
#define WRITE_HOUR              0x84 
#define READ_HOUR               0x85 
#define WRITE_DATE              0x86 
#define READ_DATE               0x87 
#define WRITE_MONTH             0x88 
#define READ_MONTH              0x89
#define WRITE_WEEK              0x8A 
#define READ_WEEK               0x8B 
#define WRITE_YEAR              0x8C 
#define READ_YEAR               0x8D 
#define WRITE_PROTECT           0x8E


#define CLK_Port                GPIOB
#define CLK_Pin                 GPIO_PIN_3
#define DIO_Port                GPIOB
#define DIO_Pin                 GPIO_PIN_2
#define CE_Port                 GPIOB
#define CE_Pin                  GPIO_PIN_1
#define CLK_High()              GPIO_WriteHigh( CLK_Port, CLK_Pin )
#define CLK_Low()               GPIO_WriteLow( CLK_Port, CLK_Pin )
#define DIO_High()              GPIO_WriteHigh( DIO_Port, DIO_Pin )
#define DIO_Low()               GPIO_WriteLow( DIO_Port, DIO_Pin )
#define DIO_In()                GPIO_ReadInputPin( DIO_Port, DIO_Pin )
#define CE_High()               GPIO_WriteHigh( CE_Port, CE_Pin )
#define CE_Low()                GPIO_WriteLow( CE_Port, CE_Pin )

#define _OPHF                   GPIO_MODE_OUT_PP_HIGH_FAST
#define _OPLF                   GPIO_MODE_OUT_PP_LOW_FAST
#define _IPNI                   GPIO_MODE_IN_PU_NO_IT
#define _IO                     GPIO_Init
/* Exported functions ------------------------------------------------------- */
void DeviceInit_DS1302( void );
void Reset_DS1302( void );
uint8_t Singelbyte_Read( uint8_t addr );
void Singelbyte_Write( uint8_t addr, uint8_t dat );
void RTC_TimeStructInit( RTC_TimeTypeDef* RTC_TimeStruct );
void RTC_SetTime( RTC_TimeTypeDef* RTC_TimeStruct);
void RTC_SetDate( RTC_DateTypeDef* RTC_DateStruct);
void RTC_GetTime( RTC_TimeTypeDef* RTC_TimeStruct );
void RTC_GetDate( RTC_DateTypeDef* RTC_DateStruct );

/* Private functions -------------------------------------------------------- */




#endif /* __DS1302_H */

/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
