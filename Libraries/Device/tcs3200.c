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

/*******************************************************************************
 * brief: WhiteBalance
 * param: none
 * retval: none
 * remark: WhiteBalance
 ******************************************************************************/
void WhiteBalance(void)
{
	EXTI_SetExtIntSensitivity( EXTI_PORT_GPIOB, EXTI_SENSITIVITY_FALL_ONLY );
	S2=0;S3=0;//��ɫͨ��
	amount=0;			 //��ʼ����
	delay_ms(10);
	Rgena = amount;   //�����ɫ����      
	amount=0;
//----------------------------------
	S2=1;S3=1;//��ɫͨ��
	amount=0;
	delay_ms(10);
	Ggena = amount;	 //�����ɫ����
	amount=0;
//----------------------------------
	S2=0;S3=1;//��ɫͨ��
	amount=0;
	delay_ms(10);
	Bgena = amount;	  //�����ɫ����
	amount=0;
	S2=1;S3=0;//�ر�ͨ��  	  
}  


/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
