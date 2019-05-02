/**
  ******************************************************************************
  * @file    hf3333.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-07-23
  * @brief   lcd hf3333 seouce file
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "hf3333.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/
#define TIM4COUNTS1      50     // 2ms x 50 = 100ms
#define TIM4COUNTS2      5      // 100ms x 5 = 500ms
/* Private variables ---------------------------------------------------------*/
extern uint8_t CurrentTime[];
extern uint8_t OnTime[];
extern uint8_t OffTime[];
extern uint8_t CurrentTimeSet[];
extern uint8_t TimetypeStatus;
uint8_t Mode = 1;
uint8_t WaterLevel = 0x01;
uint16_t Days = 0;
extern uint8_t SensorBuff[];
extern uint8_t BeepStatus;
extern uint8_t TimeRefreshStatus;
extern uint16_t BeepTime;
uint8_t UartCounts = 0;
uint8_t GetKeyVal = 0;
extern uint8_t KeyStatus;
uint8_t KeyVal = 0;

const uint8_t num2seg[10] = {
  0x7d, 0x60, 0x3e, 0x7a, 0x63, 0x5b, 0x5f, 0x70, 0x7f, 0x7b // 0~9
};
uint8_t LCD_Display_buff[22] = {     // Display buff  
  0xf1, 0xf1, 0xf1,                  // start code
  0x00, 0x01,                        // key backlight
  0x00, 0x00, 0x00, 0x80, 0x00,      // seg value
  0x00, 0x00, 0x00, 0x00, 0x00,      
  0x00, 0x00, 0x00, 0xc8, 0x0c, 
  0x00, 0x7e                         // check sum end code
};

uint8_t TIM4Counter;
uint8_t HundredMs;

uint8_t DisStatus = 0x07;         // 0-Hour, 1-Minute, 2-TimeDot, 3-Modes, 4-WatelLevel
                                  // 5-Days, 6-Moon, 7-Sun
uint8_t DisStatus2 = 0x00;        // 0- Temp, 1-DaysIcon , 2-FlawerIcon       
uint8_t FlashStatus = 0x04;       // 0-Hour, 1-Minute, 2-TimeDot, 3-Modes, 4-WatelLevel
                                  // 5-Days, 6-Moon, 7-Sun

/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/
/**
  * @brief  Update days
  * values.
  *     -status SET or RESET
  * @retval None
  */
void LCD_UpdateDays( uint8_t status )
{
  if ( status ){
    LCD_Display_buff[5] = num2seg[Days/100];  
    LCD_Display_buff[6] = num2seg[Days/10%10];
    LCD_Display_buff[7] = num2seg[Days%10]; 
  }else {
    LCD_Display_buff[5] = 0x00;  
    LCD_Display_buff[6] = 0x00; 
    LCD_Display_buff[7] = 0x00; 
  }         
}

/**
  * @brief  Update hours
  * values.
  * @param  status- on or off Display
  * @retval None
  */
void LCD_UpdateHour( uint8_t types, uint8_t status )
{
  if ( status ){
    switch ( types ){
    case 0:
      if ( DisStatus2 & 0x02 )
        LCD_Display_buff[8] = num2seg[CurrentTime[0]/10] | 0x80;    // current hours
      else 
        LCD_Display_buff[8] = num2seg[CurrentTime[0]/10];    // current hours
      LCD_Display_buff[9] = num2seg[CurrentTime[0]%10];
      break;
    case 1:
      LCD_Display_buff[8] = num2seg[OnTime[0]/10] | 0x80;        // ON hours
      LCD_Display_buff[9] = num2seg[OnTime[0]%10];
      break;
    case 2:
      LCD_Display_buff[8] = num2seg[OffTime[0]/10] | 0x80;       // OFF hours 
      LCD_Display_buff[9] = num2seg[OffTime[0]%10];
      break;
    case 3:
      LCD_Display_buff[8] = num2seg[CurrentTimeSet[0]/10] | 0x80;// current Setting hours 
      LCD_Display_buff[9] = num2seg[CurrentTimeSet[0]%10];
      break;
    default:
      break;
    }
  }else {
    LCD_Display_buff[8]  &= 0x80;        // off display
    LCD_Display_buff[9]  &= 0x80;
  }
}

/**
  * @brief  Update time minutes
  * values.
  * @param  status- on or off Display
  * @retval None
  */
void LCD_UpdateMinute( uint8_t types, uint8_t status )
{
  if ( status ){
    switch ( types ){
      case 0:
        LCD_Display_buff[10] = num2seg[CurrentTime[1]/10];  // current minutes 
        LCD_Display_buff[11] = num2seg[CurrentTime[1]%10];
        break;
      case 1:
        LCD_Display_buff[10] = num2seg[OnTime[1]/10];       // ON minutes 
        LCD_Display_buff[11] = num2seg[OnTime[1]%10];
        break;
      case 2:
        LCD_Display_buff[10] = num2seg[OffTime[1]/10];      // OFF minutes 
        LCD_Display_buff[11] = num2seg[OffTime[1]%10];
        break;
      case 3:
        LCD_Display_buff[10] = num2seg[CurrentTimeSet[1]/10];  // current Setting minutes 
        LCD_Display_buff[11] = num2seg[CurrentTimeSet[1]%10];
        break;
      default:
        break;
    }
  }else {
    LCD_Display_buff[10] &= 0x80;
    LCD_Display_buff[11] &= 0x80;
  }
}

/**
  * @brief  Time point change
  * values.
  * @param  *time
  * @retval None
  */
void LCD_TimePoint( uint8_t status )
{
  if ( status )
    LCD_UpdateIcon( TIME_DOT, SET );
  else 
    LCD_UpdateIcon( TIME_DOT, RESET );
}

/**
  * @brief  Update tempreture and humidity
  * values.
  * @param  *temp
  * @retval None
  */
void LCD_UpdateTemp( uint8_t status )
{
  if ( status ){
    LCD_Display_buff[12] = num2seg[SensorBuff[0]];         // tempreture 
    LCD_Display_buff[13] = num2seg[SensorBuff[1]] | 0x80;  // tempreture & dot icon
    LCD_Display_buff[14] = num2seg[SensorBuff[2]] | 0x80;  // tempreture & ℃ icon
    LCD_Display_buff[15] = num2seg[SensorBuff[3]];         // humidity         
    LCD_Display_buff[16] = num2seg[SensorBuff[4]] | 0x80;  // humidity & dot icon       
    LCD_Display_buff[17] = num2seg[SensorBuff[5]] | 0x80;  // humidity & % icon
  }else {
    LCD_Display_buff[12] = 0;         
    LCD_Display_buff[13] = 0;  
    LCD_Display_buff[14] = 0;  
    LCD_Display_buff[15] = 0;  
    LCD_Display_buff[16] = 0;  
    LCD_Display_buff[17] = 0;  
  }  
}

/**
  * @brief  Update Days Icon
  * values.
  * @param  status
  * @retval None
  */
void LCD_UpdateDaysIcon( uint8_t status )
{
  LCD_UpdateIcon( DAYS, status );
}
/**
  * @brief  Update Days Icon
  * values.
  * @param  status
  * @retval None
  */
void LCD_UpdateFlawer( uint8_t status )
{
  if ( status ) LCD_Display_buff[18] |= 0x08;
  else LCD_Display_buff[18] &= ~0x08;
}

/**
  * @brief  Update water level
  * values.
  * @param  *temp
  * @retval None
  */
void LCD_UpdateWaterLevel( uint8_t status )
{
  if ( status ){
    LCD_Display_buff[18] &= ~0x37;        // off icons
    if ( (WaterLevel>0x00) & (WaterLevel<=0x01) )
      LCD_Display_buff[18] |= 0x20;         
    else if ( (WaterLevel>0x01) & (WaterLevel<=0x03) )
      LCD_Display_buff[18] |= 0x10;
    else if ( (WaterLevel>0x03) & (WaterLevel<=0x07) )
      LCD_Display_buff[18] |= 0x01;
    else if ( (WaterLevel>0x07) & (WaterLevel<=0x0f) )
      LCD_Display_buff[18] |= 0x02;
    else if ( (WaterLevel>0x0f) & (WaterLevel<=0x1f) )
      LCD_Display_buff[18] |= 0x04;
  }else LCD_Display_buff[18] &= ~0x37;        // off icons
}

/**
  * @brief  Update icon
  * values.
  * @param  
  *     -icon the icon name
  *     -status SET or RESET
  * @retval None
  */
void LCD_UpdateIcon( uint8_t icon, uint8_t status )
{
  uint8_t site;
  switch ( icon ){
  case MODE_FLOWER:     site = 5;  break;
  case MODE_VEGETABLE:  site = 6;  break;
  case MODE_LEAF:       site = 7;  break;
  case DAYS:            site = 8;  break;
  case MODE_CUSTOM:     site = 15; break;
  case TIME_DOT:        site = 9;  break;
  case MOON:            site = 10; break;
  case SUN:             site = 11; break;
  default:              site = 12; break;
  }
  if ( SET == status ) LCD_Display_buff[site] |= 0x80;
  else LCD_Display_buff[site] &= ~0x80;
}

/**
  * @brief  Update mode
  * values.
  * @param  
  *     -status SET or RESET
  * @retval None
  */
void LCD_UpdateMode( uint8_t status )
{
  switch ( Mode ){
  case 1: LCD_UpdateIcon( MODE_VEGETABLE, status ); break;
  case 2: LCD_UpdateIcon( MODE_LEAF, status ); break;
  case 3: LCD_UpdateIcon( MODE_FLOWER, status ); break;
  case 4: LCD_UpdateIcon( MODE_CUSTOM, status ); break;
  default: break;
  }
}


/* Public functions ----------------------------------------------------------*/
/**
  * @brief  LCD驱动初始化
  * values.
  * @param  none
  * @retval none
  */
void LCD_Init( void )
{
  /* UART Init */
  UART2Init( 1 );
  /* refresh Timer init */
  TIM4_TimeBaseInit( TIM4_PRESCALER_128, 249 ); // 2ms
  TIM4_ClearFlag(TIM4_FLAG_UPDATE);
  TIM4_ITConfig( TIM4_IT_UPDATE, ENABLE );
  TIM4Counter = 0;
  HundredMs = 0;
  TIM4_Cmd( ENABLE );
  ITC_SetSoftwarePriority( ITC_IRQ_TIM4_OVF, ITC_PRIORITYLEVEL_2 );
  ITC_SetSoftwarePriority( ITC_IRQ_UART2_RX, ITC_PRIORITYLEVEL_1 );
//  LCD_UpdateIcon(  );
}

/**
  * @brief  刷新LCD显示
  * values.
  * @param  none
  * @retval none
  */
void LCD_Refresh( void )
{
  LCD_Display_buff[20] = CheckSum( LCD_Display_buff, 3, 19 );
  for ( uint8_t i=0; i<22; i++ ){
    UART2_SendByte( LCD_Display_buff[i] );
  }
}

/**
  * @brief  LCD数据包读取
  * values.
  * @param  
  *     - *data 
  * @retval 
  *     - SET data changed
  *     - RESET data not changed
  */
FlagStatus LCD_ReadKey( uint8_t* value )
{
  uint8_t getbyte;
  FlagStatus status = RESET;
  UART2_ReadByte( &getbyte );
  if ( getbyte == 0xF1 ){
    UART2_ReadByte( &getbyte );
    if ( getbyte == 0xF1 ){
      UART2_ReadByte( &getbyte );
      if ( getbyte == 0xF1 ){
        UART2_ReadByte( &getbyte );
        if ( getbyte == 0xF1 ){
          UART2_ReadByte( &getbyte );
          if ( (getbyte != *value)&&(getbyte<5) ){
            *value = getbyte;
            status = SET;
          }
        }
      }
    }
  }
  return status;
}

/**
  * @brief  LCD更新显示定时器
  * values.
  * @param none
  * @retval none
  */
void TIM4_Handler( void )
{
  if ( BeepTime&&BeepStatus ){
      BeepTime--;
      if ( BeepTime == 0 ){
        BeepStatus = 0;
        BEEP_Cmd( DISABLE );
      }
    }
  TIM4Counter++;
  if ( TIM4Counter >= TIM4COUNTS1 ){
    TIM4Counter = 0;
    TimeRefreshStatus = 1;
    if ( DisStatus2 & 0x01 ) LCD_UpdateTemp( 1 );        // Temp Humi
      else LCD_UpdateTemp( 0 );
//    if ( DisStatus2 & 0x02 ) LCD_UpdateDaysIcon( 1 );        // Days icon
//      else LCD_UpdateDaysIcon( 0 );
    if ( DisStatus2 & 0x04 ) LCD_UpdateFlawer( 1 );        // Flawer icon
      else LCD_UpdateFlawer( 0 );
    HundredMs++;
    if ( HundredMs >= TIM4COUNTS2 ){
      HundredMs = 0;
      DisStatus ^= FlashStatus; // FlashStatus 有置位的取反产生闪烁效果
      if ( DisStatus & 0x01 ) LCD_UpdateHour( TimetypeStatus, 1 );        // Hour
      else LCD_UpdateHour( TimetypeStatus, 0 );
      if ( DisStatus & 0x02 ) LCD_UpdateMinute( TimetypeStatus, 1 );      // Minute
      else LCD_UpdateMinute( TimetypeStatus, 0 );
      if ( DisStatus & 0x04 ) LCD_TimePoint( 1 );         // TimePoint
      else LCD_TimePoint( 0 );       
      if ( DisStatus & 0x10 ) LCD_UpdateWaterLevel( 1 );  // WaterLevel
      else LCD_UpdateWaterLevel( 0 );
      if ( DisStatus & 0x20 ) LCD_UpdateDays( 1 );        // Days
      else LCD_UpdateDays( 0 );  
      if ( DisStatus & 0x40 ) LCD_UpdateIcon( MOON, 1 );   // Moon
      else LCD_UpdateIcon( MOON, 0 ); 
      if ( DisStatus & 0x80 ) LCD_UpdateIcon( SUN, 1 );   // Sun
      else LCD_UpdateIcon( SUN, 0 ); 
      if ( DisStatus & 0x08 ) LCD_UpdateMode( 1 );        // Mode
      else LCD_UpdateMode( 0 );
      
      LCD_Refresh(  );
    }
  }
}

/**
  * @brief  LCD按键检测
  * values.
  * @param none
  * @retval none
  */
void UART2_Handler( void )
{
  GetKeyVal =  UART2_ReceiveData8(  );
  switch ( UartCounts ){
  case 0: 
    if ( GetKeyVal == 0xF1 ) UartCounts++;
    else UartCounts = 0;
    break;
  case 1:
    if ( GetKeyVal == 0xF1 ) UartCounts++;
    else UartCounts = 0;
    break;
  case 2:
    if ( GetKeyVal == 0xF1 ) UartCounts++;
    else UartCounts = 0;
    break;
  case 3:
    if ( GetKeyVal <= 4 ){        // Receive right Key value
      if ( GetKeyVal != KeyVal ){
        KeyVal = GetKeyVal;
        KeyStatus = 1;
      }
    }
    UartCounts = 0;
    break;
  default: UartCounts = 0; break;
  }
}

/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/