/**
  ******************************************************************************
  * @file    ssd1306.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-05-23
  * @brief   OLEDs seouce file
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "ssd1306.h"
#include "font.h"

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
void Write_Dat( uint8_t dat )
{
  uint8_t i;
  CS_Low(  );
  DC_High(  );
  for ( i=0; i<8; i++ )
  {
    SCLK_Low(  );
    delayus( 3 );
    if ( dat & 0x80 )
      SDIN_High(  );
    else
      SDIN_Low(  );
    dat = dat << 1;
    SCLK_High(  );
    delayus( 3 );
  }
  CS_High(  );
}


/**
  * @brief  Write command with soft SPI
  * values.
  * @param  com
  * @retval None
  */
void Write_Com( uint8_t com )
{
  uint8_t i;
  CS_Low(  );
  DC_Low(  );
  for ( i=0; i<8; i++ )
  {
    SCLK_Low(  );
    delayus( 3 );
    if ( com & 0x80 )
      SDIN_High(  );
    else
      SDIN_Low(  );
    com = com << 1;
    SCLK_High(  );
    delayus( 3 );
  }
  CS_High(  );
}

/* Public functions ----------------------------------------------------------*/
 
/**
  * @brief  OLEDs power on
  * values.
  * @param  None
  * @retval None
  */
void Power_On( void )
{
  RES_Low();
  delayus( 5 );
  RES_High();
}

/**
  * @brief  Reset the OLEDs
  * values.
  * @param  None
  * @retval None
  */
void LCD_Reset( void )
{
  GPIO_Init( GPIOC, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_HIGH_FAST );
  Power_On(  );
  delayms(1);
  Write_Com(0xae);//--turn off oled panel
  Write_Com(0x00);//---set low column address
  Write_Com(0x10);//---set high column address
  Write_Com(0x40);//--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
  Write_Com(0x81);//--set contrast control register
  Write_Com(0xcf); // Set SEG Output Current Brightness
  Write_Com(0xa1);//--Set SEG/Column Mapping     0xa0左右反置 0xa1正常
  Write_Com(0xc8);//Set COM/Row Scan Direction   0xc0上下反置 0xc8正常
  Write_Com(0xa6);//--set normal display
  Write_Com(0xa8);//--set multiplex ratio(1 to 64)
  Write_Com(0x3f);//--1/64 duty
  Write_Com(0xd3);//-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
  Write_Com(0x00);//-not offset
  Write_Com(0xd5);//--set display clock divide ratio/oscillator frequency
  Write_Com(0x80);//--set divide ratio, Set Clock as 100 Frames/Sec
  Write_Com(0xd9);//--set pre-charge period
  Write_Com(0xf1);//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
  Write_Com(0xda);//--set com pins hardware configuration
  Write_Com(0x12);
  Write_Com(0xdb);//--set vcomh
  Write_Com(0x40);//Set VCOM Deselect Level
  Write_Com(0x20);//-Set Page Addressing Mode (0x00/0x01/0x02)
  Write_Com(0x02);//
  Write_Com(0x8d);//--set Charge Pump enable/disable
  Write_Com(0x14);//--set(0x10) disable
  Write_Com(0xa4);// Disable Entire Display On (0xa4/0xa5)
  Write_Com(0xa6);// Disable Inverse Display On (0xa6/a7) 
  Write_Com(0xaf);//--turn on oled panel
  LCD_Fill(0xff);
  LCD_CLS();
  LCD_Set_Pos( 0, 0 );
}

/**
  * @brief  Clear OLEDs
  * values.
  * @param  None
  * @retval None
  */
void LCD_CLS( void )
{
  uint8_t y,x;	
  for(y=0;y<8;y++)
  {
    Write_Com(0xb0+y);
    Write_Com(0x01);
    Write_Com(0x10); 
    for(x=0;x<X_WIDTH;x++)
    Write_Dat(0);
  }
}

/**
  * @brief  Fill OLEDs
  * values.
  * @param  bmp_dat
  * @retval None
  */
void LCD_Fill( uint8_t bmp_dat )
{
  uint8_t y,x;
  for(y=0;y<8;y++)
  {
    Write_Com(0xb0+y);
    Write_Com(0x01);
    Write_Com(0x10);
    for(x=0;x<X_WIDTH;x++)
    Write_Dat(bmp_dat);
  }  
}

/**
  * @brief  Set pos
  * values.
  * @param  x, y
  * @retval None
  */
void LCD_Set_Pos( uint8_t x, uint8_t y )
{
  Write_Com(0xb0+y);
  Write_Com(((x&0xf0)>>4)|0x10);
  Write_Com((x&0x0f)|0x01); 
}

/**
  * @brief  显示6*8一组标准ASCII字符串	显示的坐标（x,y），y为页范围0-7
  * values.
  * @param  x, y, *ch
  * @retval None
  */
void LCD_P6x8Str( uint8_t x, uint8_t y, uint8_t *ch )
{
  uint8_t c=0,i=0,j=0;      
  while (ch[j]!='\0')
  {    
    c =ch[j]-32; 
    if(x>126){x=0;y++;}
    LCD_Set_Pos(x,y);    
    for(i=0;i<6;i++)     
    Write_Dat(F6x8[c][i]);  
    x+=6;
    j++;
  }
}

/**
  * @brief  显示8*16一组标准ASCII字符串	 显示的坐标（x,y），y为页范围0-7
  * values.
  * @param  x, y, *ch
  * @retval None
  */
void LCD_P8x16Str( uint8_t x, uint8_t y, uint8_t *ch )
{
  uint8_t c=0,i=0,j=0;
  while (ch[j]!='\0')
  {    
    c =ch[j]-32;                        //切换到ASCII可显示字符段 - 32(0x20)
    if(x>120){x=0;y++;}                 //行溢出，换行
    LCD_Set_Pos(x,y);                   //
    for(i=0;i<8;i++)                    //横向写8列
    Write_Dat(F8X16[c*16+i]);           //写一列数据 每个字符数组个数16个  列行式-阴码 低位-高位
    LCD_Set_Pos(x,y+1);         
    for(i=0;i<8;i++)     
    Write_Dat(F8X16[c*16+i+8]);  
    x+=8;                               //切换至下一个字符起点位置
    j++;
  }
}


/**
  * @brief  显示16*32一组数字	 显示的坐标（x,y），y为页范围0-7
  * values.
  * @param  x, y, *ch
  * @retval None
  */
void LCD_P16x32Str( uint8_t x, uint8_t y, uint8_t *ch )
{
  uint8_t c=0,i=0,j=0;
  while (ch[j]!='\0')
  {    
    c =ch[j]-48;                        //切换到ASCII可显示数字字符段 - 32(0x20)
    if(x>112){x=0;y+=2;}                //行溢出，换行
    LCD_Set_Pos(x,y);                   //
    for(i=0;i<16;i++)                   //横向写16列
    Write_Dat(F16X32[c*64+i]);           //写一列数据 每个字符数组个数64个 列行式-阴码 低位-高位
    LCD_Set_Pos(x,y+1);         
    for(i=0;i<16;i++)     
    Write_Dat(F16X32[c*64+i+16]);  
    LCD_Set_Pos(x,y+2);         
    for(i=0;i<16;i++)     
    Write_Dat(F16X32[c*64+i+32]); 
    LCD_Set_Pos(x,y+3);         
    for(i=0;i<16;i++)     
    Write_Dat(F16X32[c*64+i+48]); 
    x+=16;                               //切换至下一个字符起点位置
    j++;
  }
}


/**
  * @brief  显示16*16点阵  显示的坐标（x,y），y为页范围0-7
  * values.
  * @param  x, y, N
  * @retval None
  */
void LCD_P16x16Ch( uint8_t x, uint8_t y, uint8_t N )
{
  uint8_t wm=0;
  uint16_t adder=32*N;   	
  LCD_Set_Pos(x , y);
  for(wm = 0;wm < 16;wm++)              
  {
    Write_Dat(F16x16[adder]);	
    adder += 1;
  }      
  LCD_Set_Pos(x,y + 1); 
  for(wm = 0;wm < 16;wm++)         
  {
    Write_Dat(F16x16[adder]);
    adder += 1;
  } 	
}

/**
  * @brief  显示显示BMP图片128×64起始点坐标(x,y),x的范围0-127，y为页的范围0-7
  * values.
  * @param  x, y, *BMP
  * @retval None
  */
void Draw_BMP( uint8_t x0, uint8_t y0, uint8_t x1, uint8_t y1, uint8_t set )
{
  uint16_t j=0;
  uint8_t x,y;
  if(y1%8==0) y=y1/8;      
  else y=y1/8+1;
  for(y=y0;y<y1;y++)
  {
    LCD_Set_Pos(x0,y);				
	for(x=x0;x<x1;x++) {   
	  if ( set )
			Write_Dat(bmp_battery[j++]);	
	  else 
			Write_Dat(0);	
	}
  }
}



/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
