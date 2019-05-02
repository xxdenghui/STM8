///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            27/Mar/2016  18:24:24 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  E:\STM8\Software\Libraries\Device\mcp4822.c             /
//    Command line =  E:\STM8\Software\Libraries\Device\mcp4822.c -e -Oh      /
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
//    List file    =  E:\STM8\Software\Project\Demo\Debug\List\mcp4822.s      /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME mcp4822

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?move1616_v_x_y_a
        EXTERN ?w0
        EXTERN GPIO_WriteHigh
        EXTERN GPIO_WriteLow
        EXTERN delayus
        EXTERN hal_spi_cfg
        EXTERN hal_spi_send

        PUBLIC Init_MCP4822
        PUBLIC Set_MCP4822

// E:\STM8\Software\Libraries\Device\mcp4822.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    mcp4822.c
//    4   * @author  Darren Tang
//    5   * @version V1.0.0
//    6   * @date    2016-03-15
//    7   * @brief   
//    8   ******************************************************************************
//    9   * @attention
//   10   * 
//   11   * 
//   12   ******************************************************************************
//   13   */
//   14 
//   15 /* Includes ------------------------------------------------------------------*/
//   16 #include "mcp4822.h"
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
//   33   * @brief  Device Init
//   34   * values.
//   35   * @param  none
//   36   * @retval None
//   37   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   38 void Init_MCP4822( void )
//   39 {
//   40   hal_spi_cfg( master, msb );
Init_MCP4822:
        CLR       S:?b0
        LD        A, #0x4
        JP        L:hal_spi_cfg
//   41 }
//   42 /**
//   43   * @brief  set DAC value
//   44   * values.
//   45   * @param  chennel(0,1), value(0~4096)
//   46   * @retval None
//   47   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   48 void Set_MCP4822( uint8_t ch, uint16_t value )
//   49 {
Set_MCP4822:
        SUB       SP, #0x2
        LD        S:?b2, A
        LDW       S:?w0, X
//   50   uint8_t SendCode[2] = {0};
        LDW       Y, #`?<Constant {0}>`
        LDW       X, SP
        INCW      X
        PUSHW     X
        LD        A, #0x2
        CALL      L:?move1616_v_x_y_a
        POPW      X
//   51   SendCode[0] = (uint8_t)(value>>8);
        LDW       X, S:?w0
        RRWA      X, A
        LD        A, XL
        LD        (0x1,SP), A
//   52   SendCode[1] = (uint8_t)value; 
        LD        A, S:?b1
        LD        (0x2,SP), A
//   53   switch ( ch ){
        LD        A, S:?b2
        DEC       A
        JREQ      L:??Set_MCP4822_0
        DEC       A
        JREQ      L:??Set_MCP4822_1
        JRA       L:??Set_MCP4822_2
//   54   case 1: SendCode[0] |= 0x10; break;
??Set_MCP4822_0:
        LD        A, (0x1,SP)
        OR        A, #0x10
        JRA       L:??Set_MCP4822_3
//   55   case 2: SendCode[0] |= 0x90; break;
??Set_MCP4822_1:
        LD        A, (0x1,SP)
        OR        A, #0x90
??Set_MCP4822_3:
        LD        (0x1,SP), A
//   56   default: break;
//   57   }
//   58   CS1_Low( );
??Set_MCP4822_2:
        LD        A, #0x10
        LDW       X, #0x500a
        CALL      L:GPIO_WriteLow
//   59   hal_spi_send( SendCode, 2 );
        LDW       Y, #0x2
        LDW       X, SP
        INCW      X
        CALL      L:hal_spi_send
//   60   CS1_High(  );
        LD        A, #0x10
        LDW       X, #0x500a
        CALL      L:GPIO_WriteHigh
//   61   delayus( 5 );
        CALL      L:?Subroutine0
//   62   LD_Low( );
??CrossCallReturnLabel_0:
        CALL      L:GPIO_WriteLow
//   63   delayus( 5 );
        CALL      L:?Subroutine0
//   64   LD_High( ); 
??CrossCallReturnLabel_1:
        CALL      L:GPIO_WriteHigh
//   65 }
        ADD       SP, #0x2
        RET

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LDW       X, #0x5
        CALL      L:delayus
        LD        A, #0x8
        LDW       X, #0x500a
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant {0}>`:
        DC8 0, 0

        END
//   66 /************************** (C) COPYRIGHT 2016 DarrenTang *********************/
//   67 /********************************  END OF FILE  *******************************/
// 
//   2 bytes in section .near.rodata
// 110 bytes in section .near_func.text
// 
// 110 bytes of CODE  memory
//   2 bytes of CONST memory
//
//Errors: none
//Warnings: 1
