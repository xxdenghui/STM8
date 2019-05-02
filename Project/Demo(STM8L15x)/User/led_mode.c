/**
  ******************************************************************************
  * @file     Project/USER/led_mode.c
  * @author   Darren
  * @version  V1.0.0
  * @date     2018-05-03
  * @brief    led_modes
  * @Hardware 
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "led_mode.h"
 
/* Private defines -----------------------------------------------------------*/
#define OFF_LEDS()              GPIO_WriteHigh( OUT_Port, OUTA_Pin|OUTB_Pin|OUTC_Pin )
#define ON_OUTA()               GPIO_WriteLow( OUT_Port, OUTA_Pin )
#define ON_OUTB()               GPIO_WriteLow( OUT_Port, OUTB_Pin )
#define ON_OUTC()               GPIO_WriteLow( OUT_Port, OUTC_Pin )
#define MAX_BRIGHT              (uint8_t)250
/* Private variables ---------------------------------------------------------*/
uint8_t scan_mode;               
uint16_t pescal_count;
uint8_t change_way;
uint16_t pescal;
uint8_t change_times;
uint8_t color_std;
uint8_t red1;
uint8_t red2;
uint8_t green1;
uint8_t green2;
uint8_t blue1;
uint8_t blue2;
uint8_t holdtimes;

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

/*******************************************************************************
 * brief: ModeScan
 * param: none
 * retval: none
 * remark: 
 ******************************************************************************/
void LED_Color(void)
{
  if ( pescal_count ) pescal_count--;                                           
  else {
    pescal_count = pescal;  
    if ( change_times ) { 
      switch ( scan_mode ){
      case FLASH_MODE:
        Flash_Mode();
        break;
      case BREATH_MODE:
        Breath_Mode();
        break;
      case FANTASY_MODE:
        Fantasy_Mode();
        break;
      default:
        OFF_LEDS();
        break;
      }
    }
    else OFF_LEDS();
  }
  Mix_color();
}

/*******************************************************************************
 * brief: Mix_color
 * param: none
 * retval: none
 * remark: 
 ******************************************************************************/
void Mix_color( void )
{
  OFF_LEDS();
  Bright_Reset();
  /*switch ( color_std ){
  case 0: 
    if ( blue1 ){
      hal_pwm_set( t1ch2, blue1, MAX_BRIGHT );
      ON_OUTA();
      break;
    }
    else color_std++;
  case 1:
    if ( green1 ){
      hal_pwm_set( t1ch3, green1, MAX_BRIGHT );
      ON_OUTA();
      break;
    }
    else color_std++;
  case 2:
    if ( green2 ){
      hal_pwm_set( t1ch1, green2, MAX_BRIGHT );
      ON_OUTB();
      break;
    }
    else color_std++;
  case 3:
    if ( blue2 ){
      hal_pwm_set( t1ch3, blue2, MAX_BRIGHT );
      ON_OUTB();
      break;
    }
    else color_std++;
  case 4:
    if ( red1 ){
      hal_pwm_set( t1ch1, red1, MAX_BRIGHT );
      ON_OUTC();
      break;
    }
    else color_std++;
  case 5:
    if ( red2 ){
      hal_pwm_set( t1ch2, red2, MAX_BRIGHT );
      ON_OUTC();
      break;
    }
  }
  color_std++;
  if ( color_std>5 ) color_std = 0;*/
  if ( color_std == 0 ){
    if ( red1 ){
      hal_pwm_set( t1ch1, red1, MAX_BRIGHT );
      ON_OUTC();
    }
  }
  else if ( color_std == 1 ){
    if ( red2 ){
      hal_pwm_set( t1ch2, red2, MAX_BRIGHT );
      ON_OUTC();
    }
  }
  else if ( color_std == 2 ){
    if ( green1 ){
      hal_pwm_set( t1ch3, green1, MAX_BRIGHT );
      ON_OUTA();
    }
  }
  else if ( color_std == 3 ){
    if ( green2 ){
      hal_pwm_set( t1ch1, green2, MAX_BRIGHT );
      ON_OUTB();
    }
  }
  else if ( color_std == 4 ){
    if ( blue1 ){
      hal_pwm_set( t1ch2, blue1, MAX_BRIGHT );
      ON_OUTA();
    }
  }
  else if ( color_std == 5 ){
    if ( blue2 ){
      hal_pwm_set( t1ch3, blue2, MAX_BRIGHT );
      ON_OUTB();
    }
  }
  color_std++;
  if ( color_std>5 ) color_std = 0;
}

/*******************************************************************************
 * brief: Flash_Mode
 * param: none
 * retval: none
 * remark: 
 ******************************************************************************/
void Flash_Mode(void)
{
  Clear_Color();
  switch ( change_way ){
  case 0:
    red1 = MAX_BRIGHT;
    break;
  case 1:
    red2 = MAX_BRIGHT;
    break;
  case 2:
    green1 = MAX_BRIGHT;
    break;
  case 3:
    green2 = MAX_BRIGHT;
    break;
  case 4:
    blue1 = MAX_BRIGHT;
    break;
  case 5:
    blue2 = MAX_BRIGHT;
    break;
  case 6:
    red1 = 200;
    green1 = 50;
    break;
  case 7:
    red2 = 200;
    green2 = 50;
    break;
  case 8:
    red1 = 200;
    blue1 = 100;
    break;
  case 9:
    red2 = 200;
    blue2 = 100;
    break;
  case 10:
    green1 = blue1 = MAX_BRIGHT;
    break;
  case 11:
    green2 = blue2 = MAX_BRIGHT;
    break;
  case 12:
    red1 = green1 = blue1 = MAX_BRIGHT;
    break;
  case 13:
    red2 = green2 = blue2 = MAX_BRIGHT;
    break;
  default:
    break;
  }
  change_way++;
  if ( change_way>13 ) change_way = 0;
}

/*******************************************************************************
 * brief: Flicker_Mode
 * param: none
 * retval: none
 * remark: 
 ******************************************************************************/
void Breath_Mode(void)
{
  if ( holdtimes<MAX_BRIGHT ){
    holdtimes++;
    switch ( change_way ){
    case 0:
      red1 = holdtimes;
      break;
    case 1:
      red1 = MAX_BRIGHT-holdtimes;
      break;
    case 2:
      holdtimes++;
      break;
    case 3:
      red2 = holdtimes;
      green2 = red2>>3;
      break;
    case 4:
      red2 = MAX_BRIGHT-holdtimes;
      green2 = red2>>3;
      break;
    case 5:
      holdtimes++;
      break;
    case 6:
      red1 = holdtimes;
      green1 = red1>>2;
      break;
    case 7:
      red1 = MAX_BRIGHT-holdtimes;
      green1 = red1>>2;
      break;
    case 8:
      holdtimes++;
      break;
    case 9:
      green2 = holdtimes;
      break;
    case 10:
      green2 = MAX_BRIGHT-holdtimes;
      break;
    case 11:
      holdtimes++;
      break;
    case 12:
      green1 = holdtimes;
      blue1 = green1>>1;
      break;
    case 13:
      green1 = MAX_BRIGHT-holdtimes;
      blue1 = green1>>1;
      break;
    case 14:
      holdtimes++;
      break;
    case 15:
      blue2 = holdtimes;
      break;
    case 16:
      blue2 = MAX_BRIGHT-holdtimes;
      break;
    case 17:
      holdtimes++;
      break;
    case 18:
      red1 = holdtimes;
      blue1 = red1>>2;
      break;
    case 19:
      red1 = MAX_BRIGHT-holdtimes;
      blue1 = red1>>2;
      break;
    case 20:
      holdtimes++;
      break;
    case 21:
      red2 = holdtimes;
      green2 = blue2 = red2;
      break;
    case 22:
      red2 = MAX_BRIGHT-holdtimes;
      green2 = blue2 = red2;
      break;
    case 23:
      holdtimes++;
      break;
    default:
      change_way = 0;
      break;
    }
  }
  else {
    holdtimes = 0;
    change_way++;
  }
}

/*******************************************************************************
 * brief: Fantasy_Mode
 * param: none
 * retval: none
 * remark: full color change mode
 ******************************************************************************/
void Fantasy_Mode( void )
{
  if ( holdtimes<MAX_BRIGHT ){
    holdtimes++;
    switch ( change_way ){
    case 0:
      green1 = green2 = holdtimes;
      red1 = red2 = MAX_BRIGHT;
      break;
    case 1:
      red1 = red2 = MAX_BRIGHT-holdtimes;
      break;
    case 2:
      blue1 = blue2 = holdtimes;
      break;
    case 3:
      green1 = green2 = MAX_BRIGHT-holdtimes;
      break;
    case 4:
      red1 = red2 = holdtimes;
      break;
    case 5:
      green1 = green2 = holdtimes;
      break;
    case 6:
      blue1 = blue2 = green1 = green2 = MAX_BRIGHT-holdtimes;
      break;
    default:
      change_way = 0;
      break;
    }
  }
  else {
    holdtimes = 0;
    change_way++;
  }
}

/*******************************************************************************
 * brief: Bright_Reset
 * param: none
 * retval: none
 * remark: reset the pwm value
 ******************************************************************************/
void Bright_Reset( void )
{
  hal_pwm_set( t1ch1, 0, MAX_BRIGHT );
  hal_pwm_set( t1ch2, 0, MAX_BRIGHT );
  hal_pwm_set( t1ch3, 0, MAX_BRIGHT );
}

void Clear_Color( void )
{
  red1 = red2 = green1 = green2 = blue1 = blue2 = 0;
}

/*******************************************************************************
 * brief: Mode_Reset
 * param: none
 * retval: none
 * remark: reset the mode
 ******************************************************************************/
void Mode_Reset( void )
{
  pescal = 200;
  change_times = 1;
  scan_mode = FLASH_MODE;
  Clear_Color();
  pescal_count = pescal;
}
/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/

