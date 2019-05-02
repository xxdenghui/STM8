/**
  ******************************************************************************
  * @file    crc.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-01-26
  * @brief   This is crc head file.
  ******************************************************************************
  * @attention
  *  CRC8
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __CRC_H
#define __CRC_H

/* Includes ------------------------------------------------------------------*/
#include <ctype.h>
/* Exported types ------------------------------------------------------------*/

typedef enum{
  MAX           = (unsigned char)0x01,
  MIN           = (unsigned char)0x02,
  EQUAL         = (unsigned char)0x03
}Compare_TypeDef;

/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/
/* Private macros ------------------------------------------------------------*/
#define ASCII_NUM_0 0x30

/* Exported functions ------------------------------------------------------- */
unsigned char CRC8_Table(unsigned char *p, unsigned char Lenth);
unsigned char CalCRC_Bytes( unsigned char *p, unsigned char Lenth );
unsigned char max( unsigned char* num, unsigned char counts );
void Dec2String( unsigned char num, char *str );
void BCD2String( unsigned char num, char *str );
void Hex2String( unsigned char hex, char *str );
void ByteToHexStr(const unsigned char* source, char* dest, int sourceLen);
void HexStrToByte(const char* source, unsigned char* dest, int sourceLen);
unsigned char CheckSum( unsigned char* num, unsigned char start, unsigned char end );
Compare_TypeDef ArrayCompare( unsigned char* array1, unsigned char* array2, unsigned char counter );

/* Private functions -------------------------------------------------------- */
unsigned char CalCRC_OneByte( unsigned char byte );

#endif /* __CRC_H */

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
