/**
  ******************************************************************************
  * @file    ht1621.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2017-01-12
  * @brief   LCD Driver HT1621B SRC
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "ht1621.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/
/** 
  send bits to device 
  param   -data- send data byte
          -bits- how many bits will be send
  return  -none-
**/
void send( uint8_t data, uint8_t bits )
{
  uint8_t send_data;
  send_data = data << (8-bits);
  for ( uint8_t i=0; i<bits; i++ ){
    if ( send_data & ( 0x80 >> i ) ) // LSB to send
      DATA_HIGH();
    else DATA_LOW();
    WR_PULSE();
  }
}
void write_data( uint8_t add, uint8_t data )
{
  START_SEND();
  send( OPT_RW_ID, ID_LENTH );  // send write option ID
  send( add, ADD_LENTH );       // send seg value
  send( data, DAT_LENTH );      // send com value
  END_SEND();
}


void write_cmd( uint8_t cmd )
{
  START_SEND();
  send( OPT_CMD_ID, ID_LENTH );  // send write option ID
  send( cmd, CMD_LENTH-1 );      // send 8bit cmd value
  send( 1, 1 );                  // send last bit cmd value
  END_SEND();
}
   

void fill( void )
{
  uint8_t i;
  for ( i=0; i<32; i++ )
    write_data( i, 0x0f );
}

void clear( void )
{
  uint8_t i;
  for ( i=0; i<32; i++ )
    write_data( i, 0x00 );
}


/* Public functions ----------------------------------------------------------*/
void HT1621_Init( void )
{
  /* Data port init */
  GPIO_Init( DATA_PORT, DATA_PIN|WR_PIN|CS_PIN, GPIO_MODE_OUT_PP_HIGH_FAST );
  
  /* Back LED Port init set LCD back light on */
  GPIO_Init( BK_LED_PORT, BK_LED_PIN, GPIO_MODE_OUT_PP_HIGH_FAST );
  
  /* LCD ON */
  write_cmd( 0x29 );              // bias 1/2 & 4 coms
  write_cmd( CMD_SYS_ON );        // Systerm enable
  write_cmd( CMD_LCD_ON );        // LCD enable    
  fill(  );                       // Lit all section for checking
  delayms( 1000 ); 
  clear(  );                      // Clear the screen
}

/************************** (C) COPYRIGHT 2017 Darren *************************/
/********************************  END OF FILE  *******************************/
