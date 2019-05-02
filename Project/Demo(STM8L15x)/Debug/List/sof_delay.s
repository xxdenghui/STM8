///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                18/Dec/2018  13:43:38
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  G:\Darren\MCU\STM8\Software\Libraries\HAL\sof_delay.c
//    Command line =  
//        -f C:\Users\new06\AppData\Local\Temp\EWE44.tmp
//        (G:\Darren\MCU\STM8\Software\Libraries\HAL\sof_delay.c -e -On
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
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
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\Debug\List\sof_delay.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?w0

        PUBLIC delayms
        PUBLIC delayus

// G:\Darren\MCU\STM8\Software\Libraries\HAL\sof_delay.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    delay.c
//    4   * @author  Darren Tang
//    5   * @version V1.0.0
//    6   * @date    2014-11-10
//    7   * @brief   This is the delay source file.
//    8   ******************************************************************************
//    9   * @attention
//   10   * The Sysclock must be 24MHz
//   11   * 
//   12   ******************************************************************************
//   13   */
//   14 
//   15 /* Includes ------------------------------------------------------------------*/
//   16 #include "sof_delay.h"
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
//   33   * @brief  delayms fuctions
//   34   * values.
//   35   * @param  ms
//   36   * @retval None
//   37   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   38 void delayms( unsigned int ms )
//   39 {
delayms:
        LDW       S:?w0, X
//   40     for( ; ms > 0; ms-- )
??delayms_0:
        LDW       X, S:?w0
        TNZW      X
        JREQ      L:??delayms_1
//   41     {
//   42       delayus( 1000 );
        LDW       X, #0x3e8
        CALL      L:delayus
//   43     }
        LDW       X, S:?w0
        DECW      X
        LDW       S:?w0, X
        JRA       L:??delayms_0
//   44 }
??delayms_1:
        RET
//   45 
//   46 /**
//   47   * @brief  delayus fuctions
//   48   * values.
//   49   * @param  us
//   50   * @retval None
//   51   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   52 void delayus( unsigned int us )
//   53 {
//   54   us-=3;
delayus:
        ADDW      X, #0xfffd
//   55   while ( us-- )
??delayus_0:
        LDW       Y, X
        LDW       X, Y
        DECW      X
        TNZW      Y
        JREQ      L:??delayus_1
//   56   {
//   57     asm("nop");
        nop
//   58     asm("nop");
        nop
//   59     asm("nop");
        nop
//   60     asm("nop");
        nop
//   61     asm("nop");
        nop
//   62     asm("nop");
        nop
//   63     asm("nop");
        nop
//   64     asm("nop"); 
        nop
//   65     asm("nop");
        nop
//   66     asm("nop"); // 16MHz
        nop
        JRA       L:??delayus_0
//   67     //asm("nop");
//   68     //asm("nop");
//   69     //asm("nop"); // 24MHz
//   70   }
//   71 }
??delayus_1:
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   72 
//   73   
//   74 /************************** (C) COPYRIGHT 2014 DarrenTang *********************/
//   75 /********************************  END OF FILE  *******************************/
// 
// 45 bytes in section .near_func.text
// 
// 45 bytes of CODE memory
//
//Errors: none
//Warnings: none
