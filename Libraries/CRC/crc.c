/**
  ******************************************************************************
  * @file    crc.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-01-26
  * @brief   This is a CRC Check seous file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "crc.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
/* CRC8 Check array */
const unsigned char crc8_array[256] = {
0x00, 0x5e, 0xbc, 0xe2, 0x61, 0x3f, 0xdd, 0x83,
0xc2, 0x9c, 0x7e, 0x20, 0xa3, 0xfd, 0x1f, 0x41,
0x9d, 0xc3, 0x21, 0x7f, 0xfc, 0xa2, 0x40, 0x1e,
0x5f, 0x01, 0xe3, 0xbd, 0x3e, 0x60, 0x82, 0xdc,
0x23, 0x7d, 0x9f, 0xc1, 0x42, 0x1c, 0xfe, 0xa0,
0xe1, 0xbf, 0x5d, 0x03, 0x80, 0xde, 0x3c, 0x62,
0xbe, 0xe0, 0x02, 0x5c, 0xdf, 0x81, 0x63, 0x3d,
0x7c, 0x22, 0xc0, 0x9e, 0x1d, 0x43, 0xa1, 0xff,
0x46, 0x18, 0xfa, 0xa4, 0x27, 0x79, 0x9b, 0xc5,
0x84, 0xda, 0x38, 0x66, 0xe5, 0xbb, 0x59, 0x07,
0xdb, 0x85, 0x67, 0x39, 0xba, 0xe4, 0x06, 0x58,
0x19, 0x47, 0xa5, 0xfb, 0x78, 0x26, 0xc4, 0x9a,
0x65, 0x3b, 0xd9, 0x87, 0x04, 0x5a, 0xb8, 0xe6,
0xa7, 0xf9, 0x1b, 0x45, 0xc6, 0x98, 0x7a, 0x24,
0xf8, 0xa6, 0x44, 0x1a, 0x99, 0xc7, 0x25, 0x7b,
0x3a, 0x64, 0x86, 0xd8, 0x5b, 0x05, 0xe7, 0xb9,
0x8c, 0xd2, 0x30, 0x6e, 0xed, 0xb3, 0x51, 0x0f,
0x4e, 0x10, 0xf2, 0xac, 0x2f, 0x71, 0x93, 0xcd,
0x11, 0x4f, 0xad, 0xf3, 0x70, 0x2e, 0xcc, 0x92,
0xd3, 0x8d, 0x6f, 0x31, 0xb2, 0xec, 0x0e, 0x50,
0xaf, 0xf1, 0x13, 0x4d, 0xce, 0x90, 0x72, 0x2c,
0x6d, 0x33, 0xd1, 0x8f, 0x0c, 0x52, 0xb0, 0xee,
0x32, 0x6c, 0x8e, 0xd0, 0x53, 0x0d, 0xef, 0xb1,
0xf0, 0xae, 0x4c, 0x12, 0x91, 0xcf, 0x2d, 0x73,
0xca, 0x94, 0x76, 0x28, 0xab, 0xf5, 0x17, 0x49,
0x08, 0x56, 0xb4, 0xea, 0x69, 0x37, 0xd5, 0x8b,
0x57, 0x09, 0xeb, 0xb5, 0x36, 0x68, 0x8a, 0xd4,
0x95, 0xcb, 0x29, 0x77, 0xf4, 0xaa, 0x48, 0x16,
0xe9, 0xb7, 0x55, 0x0b, 0x88, 0xd6, 0x34, 0x6a,
0x2b, 0x75, 0x97, 0xc9, 0x4a, 0x14, 0xf6, 0xa8,
0x74, 0x2a, 0xc8, 0x96, 0x15, 0x4b, 0xa9, 0xf7,
0xb6, 0xe8, 0x0a, 0x54, 0xd7, 0x89, 0x6b, 0x35,
};

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/
/**
  * @brief  CRC8 one byte Calan Cheack
  * values.
  * @param  
  *    byte- The check byte
  * @retval 
  *    CRC8-
  */
unsigned char CalCRC_OneByte( unsigned char byte )  // 0x18=> 00011000 X8 + X5 + X4 + 1 
{
 unsigned char i,CRC_OneByte;
 CRC_OneByte = 0;
 for ( i=0; i<8 ;i++ )
 {
   if ( ( CRC_OneByte ^ byte ) & 0x01 )
   {
    CRC_OneByte ^= 0x18;
    CRC_OneByte >>= 1;
    CRC_OneByte |= 0x80;
   }      
   else 
     CRC_OneByte >>= 1;
     byte >>= 1;
 }
 return CRC_OneByte;
}

/* Public functions ----------------------------------------------------------*/

/**
  * @brief  CRC Table Check
  * values.
  * @param  
  *    p- The data add
  *    Lenth- Bytes to be check
  * @retval 
  *    CRC8-
  */ 
unsigned char CRC8_Table(unsigned char *p, unsigned char Lenth)
{
    unsigned char crc8 = 0;
    unsigned char counter;
    for( counter = Lenth; counter > 0; counter-- )
    {
        crc8 = crc8_array[crc8^*p]; //Check for CRC
        p++;
    }
    return crc8;
}

/**
  * @brief  CRC8 Calan Cheack
  * values.
  * @param  
  *    p- The check bytes add
  *    Lenth- Bytes to be check
  * @retval 
  *    CRC8-
  */
unsigned char CalCRC_Bytes( unsigned char *p, unsigned char Lenth )
{
 unsigned char CRC = 0;
 while ( Lenth-- )
 { 
    CRC = CalCRC_OneByte( CRC ^ *p++ ); 
 }
 return CRC;
}

/**
  * @brief  get max val in counts of numbers
  * values.
  * @param  
  *    num  - numbers
  * @retval 
  *    the maxval
  */
unsigned char max( unsigned char* num, unsigned char counts )
{
  unsigned char maxval = 0;
  for ( unsigned char i=0; i<counts; i++ ){
    if (maxval < num[i])
      maxval = num[i];
  }
  return maxval;
}


/**
  * @brief  numbers to string
  * values.
  * @param  
  *    num  - numbers
  *    *str - string
  * @retval 
  *    none
  */
void Dec2String( unsigned char num, char *str )
{
  *str = num/100 + ASCII_NUM_0;
  if ( *str != ASCII_NUM_0 )
    str++;
  *str = num/10%10 + ASCII_NUM_0;
  str++;
  *str = num%10 + ASCII_NUM_0;
  str++;
  *str = '\0';
}


/**
  * @brief  BCD to string
  * values.
  * @param  
  *    num  - BCD numbers
  *    *str - string
  * @retval 
  *    none
  */
void BCD2String( unsigned char num, char *str )
{
  *str = num/16 + ASCII_NUM_0;
  str++;
  *str = num%16 + ASCII_NUM_0;
  str++;
  *str = ' ';
  str++;
  *str = '\0';
}

/**
  * @brief  Hex to string
  * values.
  * @param  
  *    hex  - HEX numbers
  *    *str - string
  * @retval 
  *    none
  */
void Hex2String( unsigned char hex, char *str )
{
  if ( hex/16 <= 9 )
    *str = hex/16 + ASCII_NUM_0;
  else *str = hex/16 + ASCII_NUM_0 + 7;
  str++; 
  if ( hex%16 <= 9 )
    *str = hex%16 + ASCII_NUM_0;
  else *str = hex%16 + ASCII_NUM_0 + 7;
  str++;
  *str = ' ';
  str++;
  *str = '\0';
}

void ByteToHexStr(const unsigned char* source, char* dest, int sourceLen)  
{  
    short i;  
    unsigned char highByte, lowByte;  
  
    for (i = 0; i < sourceLen; i++)  
    {  
        highByte = source[i] >> 4;  
        lowByte = source[i] & 0x0f ;  
  
        highByte += 0x30;  
  
        if (highByte > 0x39)  
                dest[i * 2] = highByte + 0x07;  
        else  
                dest[i * 2] = highByte;  
  
        lowByte += 0x30;  
        if (lowByte > 0x39)  
            dest[i * 2 + 1] = lowByte + 0x07;  
        else  
            dest[i * 2 + 1] = lowByte;  
    }  
    return ;  
} 

void HexStrToByte(const char* source, unsigned char* dest, int sourceLen)  
{  
    short i;  
    unsigned char highByte, lowByte;  
      
    for (i = 0; i < sourceLen; i += 2)  
    {  
        highByte = toupper(source[i]);  
        lowByte  = toupper(source[i + 1]);  
  
        if (highByte > 0x39)  
            highByte -= 0x37;  
        else  
            highByte -= 0x30;  
  
        if (lowByte > 0x39)  
            lowByte -= 0x37;  
        else  
            lowByte -= 0x30;  
  
        dest[i / 2] = (highByte << 4) | lowByte;  
    }  
    return ;  
} 


/**
  * @brief  check sum
  * values.
  * @param  
  *    *num  - check array
  *    start - the start array number
  *    end   - the end array number
  * @retval 
  *    none
  */
unsigned char CheckSum( unsigned char* num, unsigned char start, unsigned char end )
{
  unsigned char sum = 0;
  for ( unsigned char i=start; i<=end; i++ )
    sum += num[i];
  return sum;
}

/**
  * @brief  compare array
  * values.
  * @param  
  *    *array1  - first array
  *    *array2  - second array
  *    counter  - How many bytes to be compare
  * @retval 
  *    Compare_TypeDef
  */
Compare_TypeDef ArrayCompare( unsigned char* array1, unsigned char* array2, unsigned char counter )
{
  for ( unsigned char i=0; i<counter; i++ ){
    if ( array1[i]>array2[i] )
      return MAX;
    else if ( array1[i]<array2[i] )
      return MIN;      
  }
  return EQUAL;
}

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
