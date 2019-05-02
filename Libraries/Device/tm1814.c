/**
  ******************************************************************************
  * @file     Project/USER/main.c
  * @author   Darren
  * @version  V1.0.0
  * @date     05-03-2016
  * @brief    Sensor to 0-10V & 0-20mA & RS485
  * @Hardware SS-V1
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "tm1814.h"
 
/* Private defines -----------------------------------------------------------*/
                 
/* Private variables ---------------------------------------------------------*/
uint8_t Color_buff[MAX_COLOR_CHANNEL+MAX_LENTH*4] = {
  0x3f, 0x3f, 0x3f, 0x3f,
  0xff, 0xff, 0xff, 0xff
};

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

void send_byte( uint8_t byte )
{
  uint8_t i;
  for ( i=0; i<8; i++ ){
    // 720ns low and 530ns high with 16MHz sysclock
    if ( byte & 0x80 ){
      GPIOB->ODR = 0x00;
      __no_operation();__no_operation();__no_operation();
      __no_operation();__no_operation();__no_operation();
      __no_operation();__no_operation();__no_operation();
      __no_operation();__no_operation();__no_operation();
      GPIOB->ODR = 0x01;
      __no_operation();__no_operation();__no_operation();
      __no_operation();__no_operation();__no_operation();
      __no_operation();__no_operation();
    } else {
      // 360ns low and 890ns high with 16MHz sysclock
      GPIOB->ODR = 0x00;
      __no_operation();__no_operation();__no_operation();
      __no_operation();__no_operation();
      GPIOB->ODR = 0x01;
      __no_operation();__no_operation();__no_operation();
      __no_operation();__no_operation();__no_operation();
      __no_operation();__no_operation();__no_operation();
      __no_operation();__no_operation();__no_operation();
      __no_operation();__no_operation();__no_operation();
    }
    byte <<= 1;
  }
}

void send_reset( void )
{
  GPIOB->ODR = 0x00;
  __no_operation();__no_operation();__no_operation();
  __no_operation();__no_operation();__no_operation();
  __no_operation();__no_operation();__no_operation();
  __no_operation();__no_operation();__no_operation();
  GPIOB->ODR = 0x01;delayus(200);
}

/* refresh the color buffer, less than 300ms/times ---------------------------*/
void TM1814_Refresh( void )
{
  uint8_t i = 0;
  uint8_t *CC_value = Color_buff;
  uint8_t *CCH_value = Color_buff+4;
  disableInterrupts(  );
  for ( i=0; i<MAX_COLOR_CHANNEL; i++ ){
    send_byte( CC_value[i] );
  }
  for ( i=0; i<MAX_COLOR_CHANNEL; i++ ){
    send_byte( CC_value[i] ^ 0xff );
  }
  for ( i=0; i<(MAX_LENTH*MAX_COLOR_CHANNEL); i++ ){
    send_byte( CCH_value[i] );
  }
  send_reset(  );
  enableInterrupts(  );
}

void TM1814_SetColor( uint8_t *buff )
{
  uint8_t i;
  disableInterrupts(  );
  for ( i=0; i<BUFF_LENTH; i++ )
    Color_buff[i] =  buff[i];
  enableInterrupts(  );
}

/************************** (C) COPYRIGHT 2017 DarrenTang *********************/
/********************************  END OF FILE  *******************************/

