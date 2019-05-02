/**
  ******************************************************************************
  * @file    led16ch_drv.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-05-21
  * @brief   the 74HC138 Driver sourse file.
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "led16ch_drv.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/
/**
  * @brief  serial send a byte 
  * values.
  * @param  value
  * @retval None
  */
static void sendbyte( uint8_t value1, uint8_t value2, uint8_t value3 )
{
  uint8_t i;
  // send serial data with bits
  for ( i=0; i<8; i++ ){
// DI
    if ( (0x01<<i) & value1 )
      GPIO_WriteHigh( DI_Port, DI_Ch1 );
    else 
      GPIO_WriteLow( DI_Port, DI_Ch1 );
    if ( (0x01<<i) & value2 )
      GPIO_WriteHigh( DI_Port, DI_Ch2 );
    else 
      GPIO_WriteLow( DI_Port, DI_Ch2 );
    if ( (0x01<<i) & value3 )
      GPIO_WriteHigh( DI_Port, DI_Ch3 );
    else 
      GPIO_WriteLow( DI_Port, DI_Ch3 );
// CK
    GPIO_WriteHigh( CK_Port, CK_Pin );
    GPIO_WriteLow( CK_Port, CK_Pin );
  }
// LE
  GPIO_WriteHigh( LE_Port, LE_Pin );
  GPIO_WriteLow( LE_Port, LE_Pin );
}

/* Public functions ----------------------------------------------------------*/

/**
  * @brief  IO Init
  * values.
  * @param  None
  * @retval None
  */
void IO_init_led16ch_drv( void )
{
  // DI Reset to Low
  GPIO_Init( DI_Port, DI_Ch1|DI_Ch2|DI_Ch3, GPIO_MODE_OUT_PP_LOW_FAST );
  // CK Reset to Low
  GPIO_Init( CK_Port, CK_Pin, GPIO_MODE_OUT_PP_LOW_FAST );
  // LE Reset to Low
  GPIO_Init( LE_Port, LE_Pin, GPIO_MODE_OUT_PP_LOW_FAST );
  // OE Reset to High
  GPIO_Init( OE_Port, OE_Pin, GPIO_MODE_OUT_PP_HIGH_FAST );
}

/**
  * @brief  Send 16 bits serial data in each group
  * values.
  * @param  groups - numbers
  *         *data - the 16data buff
  * @retval None
  */
void Send_data_led16ch_drv( uint8_t groups, uint8_t *data1, uint8_t *data2, uint8_t *data3 )
{
  uint8_t i;
  // Send the serial data with bytes
  for ( i=0; i<groups; i++ )
    sendbyte( data1[i], data2[i], data3[i] );
}

/**
  * @brief  Send a byte serial data in each group
  * values.
  * @param  numbers - How many same bytes will be send 
  *         value - the same byte
  * @retval None
  */
void Send_samebyte_led16ch_drv( uint8_t numbers, uint8_t value1, uint8_t value2, uint8_t value3 )
{
  uint8_t i;
  // Send the serial data with bytes
  for ( i=0; i<numbers; i++ )
    sendbyte( value1, value2, value3 );
}

/**
  * @brief  OE Status set Line LEDs ON/OFF
  * values.
  * @param  NewState new state of HSEEN, value accepted ENABLE, DISABLE.
  * @retval None
  */
void OE_led16ch_drv( FunctionalState NewState )
{
  /* Check the parameters */
  assert_param(IS_FUNCTIONALSTATE_OK(NewState));
  
  if (NewState != DISABLE)
    // OE set low to Show LEDs
    GPIO_WriteLow( OE_Port, OE_Pin );
  else
    // OE set high to OFF LEDs
    GPIO_WriteHigh( OE_Port, OE_Pin );
}


/************************** (C) COPYRIGHT 2016 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
