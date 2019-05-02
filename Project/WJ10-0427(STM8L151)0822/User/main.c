/**
  ******************************************************************************
  * @file     Project/USER/main.c
  * @author   Darren
  * @version  V1.0.0
  * @date     02-11-2016
  * @brief    Mlink-demo
  * @Hardware Mlink
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */ 

/* Includes ------------------------------------------------------------------*/
#include "conf.h"
 
/* Private defines -----------------------------------------------------------*/
#define TRG_PORT                GPIOD           // �źŶ˿�
#define TRG_PIN                 GPIO_PIN_1      // �ź�����
#define EN_PORT                 GPIOD           // ���еƶ˿�
#define EN_PIN                  GPIO_PIN_0      // ���е�����
#define LED_PORT                GPIOB          
#define LED_PIN                 GPIO_PIN_0      

#define TURN_PORT               GPIOB           // ת��ƶ˿�

#define TEST_MODE	 	 	255
#define	SINGLE_MOVE_MODE 	1
//#define DOUBLE_MOVE_MODE 	2
//#define SINGLE_COVER_MODE	3
//#define DOUBLE_PILE_MODE 	4
//#define STATIC_MODE	 	5
//#define DOUBLE_COVER_MODE	6
//#define FLASH_MODE 	 	7
//#define FADE_MODE			8


#define SYS_CK                  0x01    		// ϵͳ��ʱ�ӱ�־(1ms)
#define	SYS_DELAY				0x02
#define TRG_STD					0x04			// �����źű�־λ


/* Private variables ---------------------------------------------------------*/
uint8_t	sys_status;     						// ϵͳ״̬��
uint8_t ticks_1ms;      	   					// 1ms��ѭ������

uint8_t hold_time;	 	 	 					// ��ʱ������
uint8_t scan_mode;      	   					// ��������
uint8_t delay_count;


uint8_t x_way;	 	 	 	 					// �仯�������1
uint8_t times;	 	 	 	 					// ��̬ģʽѭ������
uint8_t pescal; 	 	 	 					// ��̬ģʽ��Ƶϵ��
uint8_t pescal_count;							// ��Ƶϵ��������

uint16_t highlevel;


const uint8_t round_data[9] = { 0x80, 0x81, 0x83, 0x87, 0x8f, 0x9f, 0xbf, 0xff };

/* Private function prototypes -----------------------------------------------*/
void SystemInit(void);
void ModeScan(void);
void KeyScan(void);
void Trun_OFF(void);
void TIme4_CallBack( void );

/* Private functions ---------------------------------------------------------*/

int main(void)
{
  
	SystemInit(  );
	// Interface loop
 
	while ( 1 )
	{
		if ( sys_status & SYS_CK )
		{ // ��ѭ������
			disableInterrupts(  );    		// ���жϣ������ٽ�״̬
			sys_status ^= SYS_CK;
			KeyScan( );
			if ( times ) ModeScan( );	 	// ģʽɨ��
			ticks_1ms++;
			if ( ticks_1ms >= 100 ){
				ticks_1ms = 0;

				if ( sys_status & SYS_DELAY ){
					if ( delay_count ) delay_count--;
					else {
						sys_status ^= SYS_DELAY;
						GPIO_WriteHigh( EN_PORT, EN_PIN );		// �������е�
					}
				}
			}
			
			enableInterrupts(  );     		// �˳��ٽ�״̬�����ж�
		}
	} 
}
 
void SystemInit( void ) 
{
	disableInterrupts(  );    				// ���жϣ������ٽ�״̬
	/* Clock Initialization */
	CLK_DeInit(  ); 
	CLK_HSEConfig( CLK_HSE_OFF ); 
	CLK_LSEConfig( CLK_LSE_OFF );
	CLK_ClockSwitchCmd( ENABLE ); 			// open sysclock choose switch
	CLK_SYSCLKSourceConfig( CLK_SYSCLKSource_HSI ); // sysclock choose
	CLK_SYSCLKDivConfig( CLK_SYSCLKDiv_1 ); 
	//sysclockSource = CLK_GetSYSCLKSource(  ); // get sysclock source
	//sysclockfreq = CLK_GetClockFreq( )/1000;  // get clock frequence KHz
  
	/* GPIO Initialization */
	GPIO_Init( TURN_PORT, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST );  // turnde port init
	GPIO_Init( GPIOD, GPIO_PIN_2|GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST );  // turnde port init
	GPIO_Init( EN_PORT, EN_PIN, GPIO_MODE_OUT_PP_LOW_FAST );  // EN Pin init
	GPIO_Init( LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST );  // LED Pin init
	GPIO_Init( TRG_PORT, TRG_PIN, GPIO_MODE_IN_PU_NO_IT );  // CL Pin init
  
	/* ADC Initialization */ 
	/*CLK_PeripheralClockConfig( CLK_Peripheral_ADC1, ENABLE );  // enable adc clock
	ADC_Init( ADC1, ADC_ConversionMode_Single, ADC_Resolution_12Bit, ADC_Prescaler_1 );
	ADC_ChannelCmd( ADC1, ADC_Channel_0, ENABLE );
	ADC_Cmd( ADC1, ENABLE ); 
	GPIO_Init( GPIOA, GPIO_PIN_6, GPIO_MODE_IN_FL_NO_IT );*/
   
	/* USART Initialization */
        
	/*uart_cfg( uart1, Baud_9600, dat8, stb1, no, no_it );
	GPIO_Init( GPIOC, GPIO_PIN_3, GPIO_MODE_OUT_PP_HIGH_FAST );  // USART Tx PORT
	GPIO_Init( GPIOC, GPIO_PIN_2, GPIO_MODE_IN_PU_NO_IT );  // USART Rx PORT
	Dec2String( sysclock, sysclock_string );
	uart_printf( uart1, "Start working...\n" );
	uart_printf( uart1, "Systerm Clock is: " );
	uart_printf( uart1, sysclock_string );
	uart_printf( uart1, "MHz\n" );*/
  
	/* TIM4_Init */
	CLK_PeripheralClockConfig( CLK_Peripheral_TIM4, ENABLE );
	TIM4_TimeBaseInit( TIM4_Prescaler_64, 249 );  // 64��Ƶ=250KHz, 249+1����=1ms
	TIM4_ClearFlag( TIM4_FLAG_Update );
	TIM4_ITConfig( TIM4_IT_Update, ENABLE );
	TIM4_Cmd( ENABLE );


	//GPIO_WriteHigh( EN_PORT, EN_PIN );		// �������е�

	sys_status|=SYS_DELAY;					// ������ʱ��־
	delay_count = 5;						// ��ʱ100ms*10
	
	/* Interrupts Initialization */
	enableInterrupts(  );
}

void TIme4_CallBack( void )
{
	sys_status |= SYS_CK;
	GPIO_WriteReverse( LED_PORT, LED_PIN );     // ��ѭ�����ڲ���
}

/*******************************************************************************
 * brief:��������
 * param: none
 * retval: none
 * 
 ******************************************************************************/
void KeyScan(void) 	// ������ֵ����
{
	if ( GPIO_ReadInputPin(TRG_PORT, TRG_PIN) ){
		if ( !(sys_status&TRG_STD) ){
			sys_status|=TRG_STD;
			pescal = 40;
			pescal_count = pescal;
			times = 1;
			//scan_mode = SINGLE_MOVE_MODE;
			GPIO_WriteLow( EN_PORT, EN_PIN );		// �ر����е�
			highlevel = 0;
		}
		else {
			highlevel++;
			if ( highlevel >= 500 ){
				highlevel = 0;
				GPIO_WriteHigh( EN_PORT, EN_PIN );		// �������е�
                                //GPIO_WriteLow( EN_PORT, EN_PIN );		// �ر����е� 2018/08/22
				Trun_OFF();                                     // �ر�ת��Ƶ�
			}
		}
	}
	else {
		if ( sys_status&TRG_STD ){
			sys_status^=TRG_STD;					// ���ת��ߵ�ƽ��־ 
			sys_status|=SYS_DELAY;					// ������ʱ��־
			delay_count = 10;						// ��ʱ100ms*10
		}
		Trun_OFF();
		times = 0;
	}
}

/*******************************************************************************
 * brief: ModeScan
 * param: none
 * retval: none
 * remark: ģʽ����
 ******************************************************************************/
void ModeScan(void)
{
 	//if ( scan_mode == SINGLE_MOVE_MODE ){	 	 	// ����ƽ��ģʽ
 		if ( pescal_count ) pescal_count--;
 	 	else {
 	 	 	pescal_count = pescal;
 	 	 	GPIO_Write( TURN_PORT, round_data[x_way] );
			GPIO_WriteBit( GPIOD, GPIO_PIN_2, (0x01 & round_data[x_way]) );
			GPIO_WriteBit( GPIOD, GPIO_PIN_3, (0x10 & round_data[x_way]) );
 	 	 	if ( ++x_way>=8 ) { 	 	 	 	 	// ��̬֡��ʼ�����
 	 	 	 	x_way = 0; 	
 	 	 	 	times = 0;
 	 	 	}
 	 	}	
 	//}
}      

void Trun_OFF(void)
{
	GPIO_Write( TURN_PORT, 0 );
	GPIO_WriteBit( GPIOD, GPIO_PIN_2, RESET );
	GPIO_WriteBit( GPIOD, GPIO_PIN_3, RESET );
}
#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval : None
  */
void assert_failed(u8* file, u32 line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/

