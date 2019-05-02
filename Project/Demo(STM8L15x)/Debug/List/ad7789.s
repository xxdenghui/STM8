///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            27/Mar/2016  18:24:25 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\STM8\Software\Libraries\Device\ad7789.c              /
//    Command line =  E:\STM8\Software\Libraries\Device\ad7789.c -e -Oh       /
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
//    List file    =  E:\STM8\Software\Project\Demo\Debug\List\ad7789.s       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME ad7789

        EXTERN ?b0
        EXTERN ?b12
        EXTERN ?epilogue_l2
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l2_l0
        EXTERN ?move1616_v_x_y_a
        EXTERN ?or32_l0_l0_l1
        EXTERN ?push_l2
        EXTERN ?sll32_l0_l0_db
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5
        EXTERN GPIO_WriteHigh
        EXTERN GPIO_WriteLow
        EXTERN SCLK_High
        EXTERN SCLK_Low
        EXTERN SO_Read
        EXTERN delayus
        EXTERN hal_spi_send

        PUBLIC Init_AD7789
        PUBLIC ReadADC_AD7789
        PUBLIC Reset_AD7789
        PUBLIC WriteCMD_AD7789

// E:\STM8\Software\Libraries\Device\ad7789.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    AD7789.c
//    4   * @author  Darren Tang
//    5   * @version V1.0.0
//    6   * @date    2016-01-24
//    7   * @brief   AD7789 ADC Chip Driver seouce file
//    8   ******************************************************************************
//    9   * @attention
//   10   *
//   11   * 
//   12   ******************************************************************************
//   13   */
//   14 
//   15 /* Includes ------------------------------------------------------------------*/
//   16 #include "ad7789.h"
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

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   30 void Reset_AD7789( void )
//   31 {
Reset_AD7789:
        SUB       SP, #0x4
//   32   uint8_t ResetData[4] = { 0xff, 0xff, 0xff, 0xff };
        LDW       Y, #`?<Constant {255, 255, 255, 255}>`
        LDW       X, SP
        INCW      X
        CALL      L:?Subroutine0
//   33   hal_spi_send( ResetData, 4 );
??CrossCallReturnLabel_1:
        LDW       X, SP
        INCW      X
        CALL      L:hal_spi_send
//   34 }
        ADD       SP, #0x4
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        PUSHW     X
        LD        A, #0x4
        CALL      L:?move1616_v_x_y_a
        POPW      X
        LDW       Y, #0x4
        RET
//   35 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   36 void WriteCMD_AD7789( uint8_t cmd, uint8_t reg )
//   37 {
WriteCMD_AD7789:
        PUSH      A
        PUSH      S:?b0
//   38   hal_spi_send( &cmd, 1 );
        LDW       Y, #0x1
        LDW       X, SP
        ADDW      X, #0x2
        CALL      L:hal_spi_send
//   39   hal_spi_send( &reg, 1 );
        LDW       Y, #0x1
        LDW       X, SP
        INCW      X
        CALL      L:hal_spi_send
//   40 }
        ADD       SP, #0x2
        RET
//   41 
//   42 /* Public functions ----------------------------------------------------------*/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   43 void Init_AD7789( void )
//   44 {
Init_AD7789:
        SUB       SP, #0x6
//   45   CS2_Low( );
        CALL      L:?Subroutine1
//   46   Reset_AD7789( );
??CrossCallReturnLabel_2:
        LDW       Y, #`?<Constant {255, 255, 255, 255}>`
        LDW       X, SP
        ADDW      X, #0x3
        CALL      L:?Subroutine0
??CrossCallReturnLabel_0:
        LDW       X, SP
        ADDW      X, #0x3
        CALL      L:hal_spi_send
//   47   WriteCMD_AD7789( CMD_WR_MODE_REG, 0x06 );
        LD        A, #0x6
        LD        (0x2,SP), A
        LD        A, #0x18
        LD        (0x1,SP), A
        LDW       Y, #0x1
        LDW       X, SP
        INCW      X
        CALL      L:hal_spi_send
        LDW       Y, #0x1
        LDW       X, SP
        ADDW      X, #0x2
        CALL      L:hal_spi_send
//   48   CS2_High( );
        CALL      L:?Subroutine2
//   49 }
??CrossCallReturnLabel_4:
        ADD       SP, #0x6
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine2:
        LD        A, #0x2
        LDW       X, #0x500a
        JP        L:GPIO_WriteHigh

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine1:
        LD        A, #0x2
        LDW       X, #0x500a
        JP        L:GPIO_WriteLow
//   50 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   51 unsigned long ReadADC_AD7789( void )
//   52 {
ReadADC_AD7789:
        CALL      L:?push_l2
        PUSH      S:?b12
        SUB       SP, #0x1
//   53   uint8_t i;
//   54   uint8_t cmd;
//   55   unsigned long adc_value = 0;
        CLRW      X
        LDW       S:?w5, X
        LDW       S:?w4, X
//   56   
//   57   CS2_Low( );
        CALL      L:?Subroutine1
//   58   cmd = CMD_WR_DATA_REG; 
??CrossCallReturnLabel_3:
        LD        A, #0x38
        LD        (0x1,SP), A
//   59   hal_spi_send( &cmd, 1 ); 
        LDW       Y, #0x1
        LDW       X, SP
        INCW      X
        CALL      L:hal_spi_send
//   60   while ( SO_Read( ) );
??ReadADC_AD7789_0:
        CALL      L:SO_Read
        TNZW      X
        JRNE      L:??ReadADC_AD7789_0
//   61   for ( i=0; i<24; i++ ){
        MOV       S:?b12, #0x18
//   62     adc_value <<= 1;
??ReadADC_AD7789_1:
        CALL      L:?mov_l0_l2
        CALL      L:?sll32_l0_l0_db
        DATA
        DC8       0x1
        CODE
        CALL      L:?mov_l2_l0
//   63     SCLK_Low(  );
        CALL      L:SCLK_Low
//   64     delayus( 10 );
        LDW       X, #0xa
        CALL      L:delayus
//   65     if ( SO_Read( ) ) adc_value |= 1;
        CALL      L:SO_Read
        TNZW      X
        JREQ      L:??ReadADC_AD7789_2
        CALL      L:?mov_l0_l2
        CLRW      X
        LDW       S:?w2, X
        INCW      X
        LDW       S:?w3, X
        CALL      L:?or32_l0_l0_l1
        CALL      L:?mov_l2_l0
//   66     SCLK_High(  );
??ReadADC_AD7789_2:
        CALL      L:SCLK_High
//   67     delayus( 10 );
        LDW       X, #0xa
        CALL      L:delayus
//   68   }
        LD        A, S:?b12
        DEC       A
        LD        S:?b12, A
        JRNE      L:??ReadADC_AD7789_1
//   69   CS2_High( );
        CALL      L:?Subroutine2
//   70   return adc_value;
??CrossCallReturnLabel_5:
        CALL      L:?mov_l0_l2
        ADD       SP, #0x1
        POP       S:?b12
        JP        L:?epilogue_l2
//   71 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant {255, 255, 255, 255}>`:
        DC8 255, 255, 255, 255

        END
//   72 
//   73 /**
//   74   * @brief  OLEDs power on
//   75   * values.
//   76   * @param  None
//   77   * @retval None
//   78   */
//   79 
//   80 
//   81 
//   82 /************************** (C) COPYRIGHT 2014 DarrenTang *********************/
//   83 /********************************  END OF FILE  *******************************/
// 
//   4 bytes in section .near.rodata
// 240 bytes in section .near_func.text
// 
// 240 bytes of CODE  memory
//   4 bytes of CONST memory
//
//Errors: none
//Warnings: 5
