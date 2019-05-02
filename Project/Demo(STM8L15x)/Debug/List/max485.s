///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            27/Mar/2016  18:24:25 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\STM8\Software\Libraries\Device\max485.c              /
//    Command line =  E:\STM8\Software\Libraries\Device\max485.c -e -Oh       /
//                    --debug --code_model small --data_model medium -o       /
//                    E:\STM8\Software\Project\Demo\Debug\Obj\ --dlib_config  /
//                    "D:\Program Files\IAR Systems\Embedded Workbench        /
//                    6.5\stm8\LIB\dlstm8smn.h" -D STM8S105 -D XX_V1 -lCN     /
//                    E:\STM8\Software\Project\Demo\Debug\List\ -lB           /
//                    E:\STM8\Software\Project\Demo\Debug\List\ -I            /
//                    E:\STM8\Software\Project\Demo\..\..\Libraries\STM8S_Std /
//                    Periph_Driver\inc\ -I E:\STM8\Software\Project\Demo\..\ /
//                    ..\Libraries\Device\ -I E:\STM8\Software\Project\Demo\. /
//                    .\..\Libraries\HAL\ -I E:\STM8\Software\Project\Demo\.. /
//                    \..\Libraries\Bus\ -I E:\STM8\Software\Project\Demo\..\ /
//                    ..\Libraries\CRC\ -I E:\STM8\Software\Project\Demo\User /
//                    \ --vregs 16                                            /
//    List file    =  E:\STM8\Software\Project\Demo\Debug\List\max485.s       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME max485

        EXTERN ?b0
        EXTERN ?b11
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?epilogue_l2
        EXTERN ?push_l2
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w5
        EXTERN GPIO_Init
        EXTERN uart_cfg
        EXTERN uart_send

        PUBLIC rs485_cfg
        PUBLIC rs485_send

// E:\STM8\Software\Libraries\Device\max485.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    max485.c
//    4   * @author  Darren Tang
//    5   * @version V1.0.0
//    6   * @date    2016-03-13
//    7   * @brief   
//    8   ******************************************************************************
//    9   * @attention
//   10   * 
//   11   * 
//   12   ******************************************************************************
//   13   */
//   14 
//   15 /* Includes ------------------------------------------------------------------*/
//   16 #include "max485.h"
//   17 
//   18 /* Private typedef -----------------------------------------------------------*/
//   19 
//   20 /* Private define ------------------------------------------------------------*/
//   21 
//   22 /* Private macro -------------------------------------------------------------*/
//   23 
//   24 /* Private variables ---------------------------------------------------------*/
//   25 
//   26 /* Private function prototypes -----------------------------------------------*/
//   27 
//   28 /* Private functions ---------------------------------------------------------*/
//   29 
//   30 /* Public functions ----------------------------------------------------------*/
//   31 
//   32 /**
//   33   * @brief  rs485 send buff
//   34   * values.
//   35   * @param  buff, lenth
//   36   * @retval None
//   37   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   38 void rs485_send( uint8_t* buff, uint16_t lenth )
//   39 {
rs485_send:
        CALL      L:?push_l2
        LDW       S:?w4, X
        LDW       S:?w5, Y
//   40   RS485_Tx();
        MOV       S:?b0, #0xf0
        LD        A, #0x80
        LDW       X, #0x500f
        CALL      L:GPIO_Init
//   41   uart_send( uart1, buff, lenth );
        MOV       S:?b0, S:?b11
        LDW       X, S:?w4
        LD        A, #0x1
        CALL      L:uart_send
//   42 }
        JP        L:?epilogue_l2
//   43 
//   44 /**
//   45   * @brief  rs485 configuration
//   46   * values.
//   47   * @param  none
//   48   * @retval None
//   49   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   50 void rs485_cfg( void )
//   51 {
//   52   uart_cfg( uart1, Baud_9600, dat8, stb1, no, no_it );
rs485_cfg:
        CLRW      X
        CLR       S:?b6
        CLR       S:?b5
        CLR       S:?b4
        PUSHW     X
        LDW       X, #0x2580
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        POPW      X
        LD        A, #0x1
        JP        L:uart_cfg
//   53 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   54   
//   55 /************************** (C) COPYRIGHT 2016 DarrenTang *********************/
//   56 /********************************  END OF FILE  *******************************/
// 
// 55 bytes in section .near_func.text
// 
// 55 bytes of CODE memory
//
//Errors: none
//Warnings: none
