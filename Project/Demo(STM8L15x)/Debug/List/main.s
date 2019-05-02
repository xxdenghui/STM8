///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                22/Mar/2019  11:26:16
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\User\main.c
//    Command line =  
//        -f C:\Users\new06\AppData\Local\Temp\EW9A4D.tmp
//        ("G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\User\main.c" -e
//        -On --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_cross_call --debug --code_model small --data_model medium -o
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\Debug\Obj"
//        --dlib_config "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.0\stm8\LIB\dlstm8smn.h" -D STM8L15 -lCN
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\Debug\List" -lB
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\Debug\List" -I
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\..\..\Libraries\STM8L15x_StdPeriph_Driver\inc\"
//        -I
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\..\..\Libraries\Device\"
//        -I
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\..\..\Libraries\HAL\"
//        -I
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\..\..\Libraries\Bus\"
//        -I
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\..\..\Libraries\CRC\"
//        -I "G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\User\" --vregs
//        16)
//    Locale       =  Chinese (Simplified)_CHN.936
//    List file    =  
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\Debug\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b3
        EXTERN ?udiv32_l0_l0_dl
        EXTERN ?w0
        EXTERN ?w1
        EXTERN CLK_ClockSwitchCmd
        EXTERN CLK_DeInit
        EXTERN CLK_GetClockFreq
        EXTERN CLK_GetSYSCLKSource
        EXTERN CLK_HSEConfig
        EXTERN CLK_LSEConfig
        EXTERN CLK_PeripheralClockConfig
        EXTERN CLK_SYSCLKDivConfig
        EXTERN CLK_SYSCLKSourceConfig
        EXTERN Dec2String
        EXTERN GPIO_Init
        EXTERN GPIO_WriteReverse
        EXTERN TIM4_ClearFlag
        EXTERN TIM4_Cmd
        EXTERN TIM4_ITConfig
        EXTERN TIM4_TimeBaseInit
        EXTERN uart_cfg
        EXTERN uart_printf

        PUBLIC SystemInit
        PUBLIC TIme4_CallBack
        PUBLIC main
        PUBLIC sys_status
        PUBLIC sysclock
        PUBLIC sysclockType
        PUBLIC sysclock_string
        PUBLIC systick1
        PUBLIC systick2
        PUBLIC systick_times
        PUBLIC task_key
        PUBLIC task_test_blink
        PUBLIC tasks_ready

// G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\User\main.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file     Project/USER/main.c
//    4   * @author   Darren
//    5   * @version  V1.0.0
//    6   * @date     2017-01-15
//    7   * @brief    watering control
//    8   * @Hardware CT1501-V1
//    9   ******************************************************************************
//   10   * @attention
//   11   *
//   12   * 
//   13   ******************************************************************************
//   14   */
//   15 
//   16 /* Includes ------------------------------------------------------------------*/
//   17 #include "conf.h"
//   18 
//   19 /* Private defines -----------------------------------------------------------*/
//   20 #define SYS_CK                  (uint8_t)0x01   // systick flag
//   21 #define SYS_HOLD                (uint8_t)0x02   // sys hold flag
//   22 
//   23 #define TRG_PORT                GPIOD         
//   24 #define TRG_PIN                 GPIO_PIN_1    
//   25 #define EN_PORT                 GPIOD           
//   26 #define EN_PIN                  GPIO_PIN_0         
//   27 
//   28 #define TURN_PORT				GPIOB
//   29 
//   30 // task ready mark
//   31 #define TASK_KEY_READY			0x01
//   32 #define TASK_TEST_BLINK_READY	0x02
//   33 
//   34 /* Private variables ---------------------------------------------------------*/

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   35 uint8_t sys_status = 0;
sys_status:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   36 uint8_t tasks_ready = 0;
tasks_ready:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   37 uint8_t systick1 = 0;
systick1:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   38 uint8_t systick2 = 0;
systick2:
        DS8 1
//   39 
//   40 /* The system clock information variables */

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   41 uint8_t sysclock = 0;           // systerm clock MHz
sysclock:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   42 uint8_t sysclockType = 0;       // systerm clock source type
sysclockType:
        DS8 1

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   43 char sysclock_string[3] = "00";   // systerm clock string
sysclock_string:
        DC8 "00"

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   44 uint8_t systick_times = 0;      // systick counter
systick_times:
        DS8 1
//   45 
//   46 
//   47 /* Private function prototypes -----------------------------------------------*/
//   48 void SystemInit( void );
//   49 void TIme4_CallBack( void );
//   50 
//   51 void task_key(void);
//   52 void task_test_blink(void);
//   53 
//   54 /* Private functions ---------------------------------------------------------*/
//   55 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   56 int main( void )
//   57 {
//   58 	/* Initialization function */
//   59 	SystemInit(  );
main:
        CALL      L:SystemInit
//   60 
//   61 	/* Interface loop */
//   62 	while ( 1 ){
//   63 		task_key();
??main_0:
        CALL      L:task_key
//   64 		task_test_blink();
        CALL      L:task_test_blink
        JRA       L:??main_0
//   65 	}  
//   66 }
//   67 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   68 void SystemInit( void )
//   69 {
//   70 	disableInterrupts(  );
SystemInit:
        SIM
//   71 	/* clock initialization *******************************************************/
//   72 	/* Systerm clock source init */
//   73 	CLK_DeInit(  ); 
        CALL      L:CLK_DeInit
//   74 	CLK_HSEConfig( CLK_HSE_OFF ); 
        CLR       A
        CALL      L:CLK_HSEConfig
//   75 	CLK_LSEConfig( CLK_LSE_OFF );
        CLR       A
        CALL      L:CLK_LSEConfig
//   76 	CLK_ClockSwitchCmd( ENABLE ); 			// open sysclock choose switch
        LD        A, #0x1
        CALL      L:CLK_ClockSwitchCmd
//   77 	CLK_SYSCLKSourceConfig( CLK_SYSCLKSource_HSI ); // sysclock choose
        LD        A, #0x1
        CALL      L:CLK_SYSCLKSourceConfig
//   78 	CLK_SYSCLKDivConfig( CLK_SYSCLKDiv_1 ); 
        CLR       A
        CALL      L:CLK_SYSCLKDivConfig
//   79 	//sysclockSource = CLK_GetSYSCLKSource(  ); // get sysclock source
//   80 	//sysclockfreq = CLK_GetClockFreq( )/1000;  // get clock frequence KHz
//   81 
//   82 	/* I/O initialization *******************************************************/
//   83 	/* running led pin & fan pin & air pin initialization */
//   84 	GPIO_Init( TURN_PORT, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST );  // turnde port init
        MOV       S:?b0, #0xe0
        LD        A, #0xff
        LDW       X, #0x5005
        CALL      L:GPIO_Init
//   85 	GPIO_Init( GPIOD, GPIO_PIN_2|GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST );  // turnde port init
        MOV       S:?b0, #0xe0
        LD        A, #0xc
        LDW       X, #0x500f
        CALL      L:GPIO_Init
//   86 	GPIO_Init( EN_PORT, EN_PIN, GPIO_MODE_OUT_PP_LOW_FAST );  // EN Pin init
        MOV       S:?b0, #0xe0
        LD        A, #0x1
        LDW       X, #0x500f
        CALL      L:GPIO_Init
//   87 	GPIO_Init( TRG_PORT, TRG_PIN, GPIO_MODE_IN_PU_NO_IT );  // CL Pin init
        MOV       S:?b0, #0x40
        LD        A, #0x2
        LDW       X, #0x500f
        CALL      L:GPIO_Init
//   88 	
//   89 	/* Peripherals initialization ***********************************************/
//   90 	/* usart initialization */
//   91 	uart_cfg( uart3, 9600, no_it );
        CLRW      X
        PUSHW     X
        LDW       X, #0x2580
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        POPW      X
        LD        A, #0x3
        CALL      L:uart_cfg
//   92 	
//   93 	/* systick timer using TIM4 */
//   94 	CLK_PeripheralClockConfig( CLK_Peripheral_TIM4, ENABLE );
        MOV       S:?b0, #0x1
        LD        A, #0x2
        CALL      L:CLK_PeripheralClockConfig
//   95 	TIM4_TimeBaseInit( TIM4_Prescaler_64, 249 );  // 64p=250KHz, 249+1 priod=1ms
        MOV       S:?b0, #0xf9
        LD        A, #0x6
        CALL      L:TIM4_TimeBaseInit
//   96 	TIM4_ClearFlag( TIM4_FLAG_Update );
        LD        A, #0x1
        CALL      L:TIM4_ClearFlag
//   97 	TIM4_ITConfig( TIM4_IT_Update, ENABLE );
        MOV       S:?b0, #0x1
        LD        A, #0x1
        CALL      L:TIM4_ITConfig
//   98 	TIM4_Cmd( ENABLE );
        LD        A, #0x1
        CALL      L:TIM4_Cmd
//   99 
//  100 	/* Initialization information ***********************************************/
//  101 	sysclockType = CLK_GetSYSCLKSource(  );
        CALL      L:CLK_GetSYSCLKSource
        LD        L:sysclockType, A
//  102 	sysclock = CLK_GetClockFreq( )/1000000;
        CALL      L:CLK_GetClockFreq
        CALL      L:?udiv32_l0_l0_dl
        DATA
        DC32      0xf4240
        CODE
        LD        A, S:?b3
        LD        L:sysclock, A
//  103 	Dec2String( sysclock, sysclock_string );
        LDW       X, #sysclock_string
        LD        A, L:sysclock
        CALL      L:Dec2String
//  104 
//  105 	/* Print the initialization information  */
//  106 	uart_printf( uart3, "Start working...\r" );
        LDW       X, #?_0
        LD        A, #0x3
        CALL      L:uart_printf
//  107 	uart_printf( uart3, "Systerm Clock is: " );
        LDW       X, #?_1
        LD        A, #0x3
        CALL      L:uart_printf
//  108 	uart_printf( uart3, sysclock_string );
        LDW       X, #sysclock_string
        LD        A, #0x3
        CALL      L:uart_printf
//  109 	uart_printf( uart3, "MHz\r" );
        LDW       X, #?_2
        LD        A, #0x3
        CALL      L:uart_printf
//  110 	uart_printf( uart3, "Systerm Clock source is: " );
        LDW       X, #?_3
        LD        A, #0x3
        CALL      L:uart_printf
//  111 	switch ( sysclockType ){
        LD        A, L:sysclockType
        DEC       A
        JREQ      L:??SystemInit_0
        DEC       A
        JREQ      L:??SystemInit_1
        SUB       A, #0x2
        JREQ      L:??SystemInit_2
        SUB       A, #0x4
        JREQ      L:??SystemInit_3
        JRA       L:??SystemInit_4
//  112 	case CLK_SYSCLKSource_HSI: uart_printf( uart3, "HSI\r" ); break;
??SystemInit_0:
        LDW       X, #?_4
        LD        A, #0x3
        CALL      L:uart_printf
        JRA       L:??SystemInit_4
//  113 	case CLK_SYSCLKSource_LSI: uart_printf( uart3, "LSI\r" ); break;
??SystemInit_1:
        LDW       X, #?_5
        LD        A, #0x3
        CALL      L:uart_printf
        JRA       L:??SystemInit_4
//  114 	case CLK_SYSCLKSource_HSE: uart_printf( uart3, "HSE\r" ); break;
??SystemInit_2:
        LDW       X, #?_6
        LD        A, #0x3
        CALL      L:uart_printf
        JRA       L:??SystemInit_4
//  115 	case CLK_SYSCLKSource_LSE: uart_printf( uart3, "LSE\r" ); break;
??SystemInit_3:
        LDW       X, #?_7
        LD        A, #0x3
        CALL      L:uart_printf
//  116 	} 
//  117 
//  118 	/* enable Interruput */ 
//  119 	enableInterrupts(  );
??SystemInit_4:
        RIM
//  120 }
        RET
//  121 
//  122 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  123 void task_key(void)
//  124 {
//  125 	if ( tasks_ready & TASK_KEY_READY ){
task_key:
        BTJF      L:tasks_ready, #0x0, L:??task_key_0
//  126 		
//  127 		tasks_ready &= ~TASK_KEY_READY;
        BRES      L:tasks_ready, #0x0
//  128 	}
//  129 }
??task_key_0:
        RET
//  130 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  131 void task_test_blink(void)
//  132 {
//  133 	if ( tasks_ready & TASK_TEST_BLINK_READY ){
task_test_blink:
        BTJF      L:tasks_ready, #0x1, L:??task_test_blink_0
//  134 		GPIO_WriteReverse(TURN_PORT, GPIO_PIN_ALL );
        LD        A, #0xff
        LDW       X, #0x5005
        CALL      L:GPIO_WriteReverse
//  135 		tasks_ready &= ~TASK_TEST_BLINK_READY;
        BRES      L:tasks_ready, #0x1
//  136 	}
//  137 }
??task_test_blink_0:
        RET
//  138 
//  139 /* IRQHandler functions *******************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  140 void TIme4_CallBack( void )
//  141 {
//  142 	if ( systick1++ >= 100 ){	// 1ms*100=100ms
TIme4_CallBack:
        MOV       S:?b0, L:systick1
        LD        A, S:?b0
        INC       A
        LD        L:systick1, A
        LD        A, S:?b0
        CP        A, #0x64
        JRC       L:??TIme4_CallBack_0
//  143 		systick1 = 0;
        CLR       L:systick1
//  144 		
//  145 		tasks_ready |= TASK_KEY_READY;	// task key
        BSET      L:tasks_ready, #0x0
//  146 		
//  147 		if ( systick2++ >= 10 ){	// 100ms*10=1S
        MOV       S:?b0, L:systick2
        LD        A, S:?b0
        INC       A
        LD        L:systick2, A
        LD        A, S:?b0
        CP        A, #0xa
        JRC       L:??TIme4_CallBack_0
//  148 			systick2 = 0;
        CLR       L:systick2
//  149 			
//  150 			tasks_ready |= TASK_TEST_BLINK_READY;	// task test blink
        BSET      L:tasks_ready, #0x1
//  151 		}
//  152 	}
//  153 }
??TIme4_CallBack_0:
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_0:
        DC8 "Start working...\015"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_1:
        DC8 "Systerm Clock is: "

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_2:
        DC8 "MHz\015"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_3:
        DC8 "Systerm Clock source is: "

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_4:
        DC8 "HSI\015"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_5:
        DC8 "LSI\015"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_6:
        DC8 "HSE\015"

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_7:
        DC8 "LSE\015"

        END
//  154 
//  155 
//  156 #ifdef USE_FULL_ASSERT
//  157 
//  158 /**
//  159   * @brief  Reports the name of the source file and the source line number
//  160   *   where the assert_param error has occurred.
//  161   * @param file: pointer to the source file name
//  162   * @param line: assert_param error line source number
//  163   * @retval : None
//  164   */
//  165 void assert_failed(u8* file, u32 line)
//  166 { 
//  167   /* User can add his own implementation to report the file name and line number,
//  168      ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
//  169 
//  170   /* Infinite loop */
//  171   while (1)
//  172   {
//  173   }
//  174 }
//  175 #endif
//  176 
//  177 /************************** (C) COPYRIGHT 2014 DarrenTang *********************/
//  178 /********************************  END OF FILE  *******************************/
//  179 
// 
//   7 bytes in section .near.bss
//   3 bytes in section .near.data
//  88 bytes in section .near.rodata
// 346 bytes in section .near_func.text
// 
// 346 bytes of CODE  memory
//  88 bytes of CONST memory
//  10 bytes of DATA  memory
//
//Errors: none
//Warnings: none
