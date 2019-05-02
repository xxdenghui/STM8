///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            08/Jan/2017  17:20:19 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Documents and Settings\Administrator\桌面\STM8\Softw /
//                    are\Libraries\Device\tm1814.c                           /
//    Command line =  "C:\Documents and Settings\Administrator\桌面\STM8\Soft /
//                    ware\Libraries\Device\tm1814.c" -e -On --no_cse         /
//                    --no_unroll --no_inline --no_code_motion --no_tbaa      /
//                    --no_cross_call --debug --code_model small              /
//                    --data_model medium -o "C:\Documents and                /
//                    Settings\Administrator\桌面\STM8\Software\Project\Water /
//                    ing(CT1501-V1)\Debug\Obj\" --dlib_config "D:\Program    /
//                    Files\IAR Systems\Embedded Workbench                    /
//                    6.5\stm8\LIB\dlstm8smn.h" -D STM8S -D STM8S003 -lCN     /
//                    "C:\Documents and Settings\Administrator\桌面\STM8\Soft /
//                    ware\Project\Watering(CT1501-V1)\Debug\List\" -lB       /
//                    "C:\Documents and Settings\Administrator\桌面\STM8\Soft /
//                    ware\Project\Watering(CT1501-V1)\Debug\List\" -I        /
//                    "C:\Documents and Settings\Administrator\桌面\STM8\Soft /
//                    ware\Project\Watering(CT1501-V1)\..\..\Libraries\STM8S_ /
//                    StdPeriph_Driver\inc\" -I "C:\Documents and             /
//                    Settings\Administrator\桌面\STM8\Software\Project\Water /
//                    ing(CT1501-V1)\..\..\Libraries\Device\" -I              /
//                    "C:\Documents and Settings\Administrator\桌面\STM8\Soft /
//                    ware\Project\Watering(CT1501-V1)\..\..\Libraries\HAL\"  /
//                    -I "C:\Documents and Settings\Administrator\桌面\STM8\S /
//                    oftware\Project\Watering(CT1501-V1)\..\..\Libraries\Bus /
//                    \" -I "C:\Documents and Settings\Administrator\桌面\STM /
//                    8\Software\Project\Watering(CT1501-V1)\..\..\Libraries\ /
//                    CRC\" -I "C:\Documents and                              /
//                    Settings\Administrator\桌面\STM8\Software\Project\Water /
//                    ing(CT1501-V1)\User\" --vregs 16                        /
//    List file    =  C:\Documents and Settings\Administrator\桌面\STM8\Softw /
//                    are\Project\Watering(CT1501-V1)\Debug\List\tm1814.s     /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME tm1814

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b12
        EXTERN ?epilogue_l2
        EXTERN ?push_l2
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w5
        EXTERN delayus

        PUBLIC Color_buff
        PUBLIC TM1814_Refresh
        PUBLIC TM1814_SetColor
        PUBLIC send_byte
        PUBLIC send_reset

// C:\Documents and Settings\Administrator\桌面\STM8\Software\Libraries\Device\tm1814.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file     Project/USER/main.c
//    4   * @author   Darren
//    5   * @version  V1.0.0
//    6   * @date     05-03-2016
//    7   * @brief    Sensor to 0-10V & 0-20mA & RS485
//    8   * @Hardware SS-V1
//    9   ******************************************************************************
//   10   * @attention
//   11   *
//   12   * 
//   13   ******************************************************************************
//   14   */
//   15 
//   16 /* Includes ------------------------------------------------------------------*/
//   17 #include "tm1814.h"
//   18  
//   19 /* Private defines -----------------------------------------------------------*/
//   20                  
//   21 /* Private variables ---------------------------------------------------------*/

        SECTION `.near.data`:DATA:REORDER:NOROOT(0)
//   22 uint8_t Color_buff[MAX_COLOR_CHANNEL+MAX_LENTH*4] = {
Color_buff:
        DC8 63, 63, 63, 63, 255, 255, 255, 255
//   23   0x3f, 0x3f, 0x3f, 0x3f,
//   24   0xff, 0xff, 0xff, 0xff
//   25 };
//   26 
//   27 /* Private function prototypes -----------------------------------------------*/
//   28 
//   29 /* Private functions ---------------------------------------------------------*/
//   30 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   31 void send_byte( uint8_t byte )
//   32 {
send_byte:
        LD        S:?b0, A
//   33   uint8_t i;
//   34   for ( i=0; i<8; i++ ){
        CLR       A
        LD        S:?b1, A
??send_byte_0:
        LD        A, S:?b1
        CP        A, #0x8
        JRNC      L:??send_byte_1
//   35     // 720ns low and 530ns high with 16MHz sysclock
//   36     if ( byte & 0x80 ){
        LD        A, S:?b0
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??send_byte_2
//   37       GPIOB->ODR = 0x00;
        MOV       L:0x5005, #0x0
//   38       __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   39       __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   40       __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   41       __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   42       GPIOB->ODR = 0x01;
        MOV       L:0x5005, #0x1
//   43       __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   44       __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   45       __no_operation();__no_operation();
        NOP
        NOP
        JRA       L:??send_byte_3
//   46     } else {
//   47       // 360ns low and 890ns high with 16MHz sysclock
//   48       GPIOB->ODR = 0x00;
??send_byte_2:
        MOV       L:0x5005, #0x0
//   49       __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   50       __no_operation();__no_operation();
        NOP
        NOP
//   51       GPIOB->ODR = 0x01;
        MOV       L:0x5005, #0x1
//   52       __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   53       __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   54       __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   55       __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   56       __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   57     }
//   58     byte <<= 1;
??send_byte_3:
        LD        A, S:?b0
        SLL       A
        LD        S:?b0, A
//   59   }
        LD        A, S:?b1
        ADD       A, #0x1
        LD        S:?b1, A
        JRA       L:??send_byte_0
//   60 }
??send_byte_1:
        RET
//   61 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   62 void send_reset( void )
//   63 {
//   64   GPIOB->ODR = 0x00;
send_reset:
        MOV       L:0x5005, #0x0
//   65   __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   66   __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   67   __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   68   __no_operation();__no_operation();__no_operation();
        NOP
        NOP
        NOP
//   69   GPIOB->ODR = 0x01;delayus(200);
        MOV       L:0x5005, #0x1
        LDW       X, #0xc8
        CALL      L:delayus
//   70 }
        RET
//   71 
//   72 /* refresh the color buffer, less than 300ms/times ---------------------------*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   73 void TM1814_Refresh( void )
//   74 {
TM1814_Refresh:
        CALL      L:?push_l2
        PUSH      S:?b12
//   75   uint8_t i = 0;
        CLR       S:?b12
//   76   uint8_t *CC_value = Color_buff;
        LDW       X, #Color_buff
        LDW       S:?w5, X
//   77   uint8_t *CCH_value = Color_buff+4;
        LDW       X, #Color_buff + 4
        LDW       S:?w4, X
//   78   disableInterrupts(  );
        SIM
//   79   for ( i=0; i<MAX_COLOR_CHANNEL; i++ ){
        CLR       A
        LD        S:?b12, A
??TM1814_Refresh_0:
        LD        A, S:?b12
        CP        A, #0x4
        JRNC      L:??TM1814_Refresh_1
//   80     send_byte( CC_value[i] );
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        ADDW      X, S:?w5
        LD        A, (X)
        CALL      L:send_byte
//   81   }
        LD        A, S:?b12
        ADD       A, #0x1
        LD        S:?b12, A
        JRA       L:??TM1814_Refresh_0
//   82   for ( i=0; i<MAX_COLOR_CHANNEL; i++ ){
??TM1814_Refresh_1:
        CLR       A
        LD        S:?b12, A
??TM1814_Refresh_2:
        LD        A, S:?b12
        CP        A, #0x4
        JRNC      L:??TM1814_Refresh_3
//   83     send_byte( CC_value[i] ^ 0xff );
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        ADDW      X, S:?w5
        LD        A, (X)
        XOR       A, #0xff
        CALL      L:send_byte
//   84   }
        LD        A, S:?b12
        ADD       A, #0x1
        LD        S:?b12, A
        JRA       L:??TM1814_Refresh_2
//   85   for ( i=0; i<(MAX_LENTH*MAX_COLOR_CHANNEL); i++ ){
??TM1814_Refresh_3:
        CLR       A
        LD        S:?b12, A
??TM1814_Refresh_4:
        LD        A, S:?b12
        CP        A, #0x4
        JRNC      L:??TM1814_Refresh_5
//   86     send_byte( CCH_value[i] );
        CLRW      X
        EXG       A, XL
        LD        A, S:?b12
        EXG       A, XL
        ADDW      X, S:?w4
        LD        A, (X)
        CALL      L:send_byte
//   87   }
        LD        A, S:?b12
        ADD       A, #0x1
        LD        S:?b12, A
        JRA       L:??TM1814_Refresh_4
//   88   send_reset(  );
??TM1814_Refresh_5:
        CALL      L:send_reset
//   89   enableInterrupts(  );
        RIM
//   90 }
        POP       S:?b12
        JP        L:?epilogue_l2
//   91 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   92 void TM1814_SetColor( uint8_t *buff )
//   93 {
TM1814_SetColor:
        LDW       S:?w1, X
//   94   uint8_t i;
//   95   disableInterrupts(  );
        SIM
//   96   for ( i=0; i<BUFF_LENTH; i++ )
        CLR       A
        LD        S:?b0, A
??TM1814_SetColor_0:
        LD        A, S:?b0
        CP        A, #0x8
        JRNC      L:??TM1814_SetColor_1
//   97     Color_buff[i] =  buff[i];
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
        EXG       A, XL
        ADDW      X, S:?w1
        LD        A, (X)
        CLRW      X
        EXG       A, XL
        LD        A, S:?b0
        EXG       A, XL
        LD        (L:Color_buff,X), A
        LD        A, S:?b0
        ADD       A, #0x1
        LD        S:?b0, A
        JRA       L:??TM1814_SetColor_0
//   98   enableInterrupts(  );
??TM1814_SetColor_1:
        RIM
//   99 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  100 
//  101 /************************** (C) COPYRIGHT 2017 DarrenTang *********************/
//  102 /********************************  END OF FILE  *******************************/
//  103 
// 
//   8 bytes in section .near.data
// 279 bytes in section .near_func.text
// 
// 279 bytes of CODE memory
//   8 bytes of DATA memory
//
//Errors: none
//Warnings: none
