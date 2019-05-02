///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            31/Oct/2016  20:19:32 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  H:\STM8\Software\Libraries\Device\delay.c               /
//    Command line =  H:\STM8\Software\Libraries\Device\delay.c -e -Oh        /
//                    --debug --code_model small --data_model medium -o       /
//                    H:\STM8\Software\Project\Demo\Debug\Obj\ --dlib_config  /
//                    "D:\Program Files\IAR Systems\Embedded Workbench        /
//                    6.5\stm8\LIB\dlstm8smn.h" -D STM8S207 -D SPACE_V1 -lCN  /
//                    H:\STM8\Software\Project\Demo\Debug\List\ -lB           /
//                    H:\STM8\Software\Project\Demo\Debug\List\ -I            /
//                    H:\STM8\Software\Project\Demo\..\..\Libraries\STM8S_Std /
//                    Periph_Driver\inc\ -I H:\STM8\Software\Project\Demo\..\ /
//                    ..\Libraries\Device\ -I H:\STM8\Software\Project\Demo\. /
//                    .\..\Libraries\HAL\ -I H:\STM8\Software\Project\Demo\.. /
//                    \..\Libraries\Bus\ -I H:\STM8\Software\Project\Demo\..\ /
//                    ..\Libraries\CRC\ -I H:\STM8\Software\Project\Demo\User /
//                    \ --vregs 16                                            /
//    List file    =  H:\STM8\Software\Project\Demo\Debug\List\delay.s        /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME delay

        PUBLIC delayms
        PUBLIC delayus

// H:\STM8\Software\Libraries\Device\delay.c
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
//   16 #include "delay.h"
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
        LDW       Y, X
        TNZW      Y
        JREQ      L:??delayms_0
//   40     for( ; ms > 0; ms-- )
//   41     {
//   42       delayus( 1000 );
??delayms_1:
        LDW       X, #0x3e8
        CALL      L:delayus
//   43     }
        LDW       X, Y
        DECW      X
        LDW       Y, X
        JRNE      L:??delayms_1
//   44 }
??delayms_0:
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
        JREQ      L:??delayus_0
//   55   while ( us-- )
//   56   {
//   57     asm("nop");
??delayus_1:
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
//   67     asm("nop");
        nop
//   68     asm("nop");
        nop
//   69     asm("nop"); // 24MHz
        nop
        DECW      X
//   70   }
        JRNE      L:??delayus_1
//   71 }
??delayus_0:
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   72 
//   73   
//   74 /************************** (C) COPYRIGHT 2014 DarrenTang *********************/
//   75 /********************************  END OF FILE  *******************************/
// 
// 41 bytes in section .near_func.text
// 
// 41 bytes of CODE memory
//
//Errors: none
//Warnings: none
