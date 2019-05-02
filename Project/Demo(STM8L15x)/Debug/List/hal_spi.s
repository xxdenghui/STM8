///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            03/Jan/2017  19:39:45 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Documents and Settings\Administrator\桌面\STM8\Softw /
//                    are\Libraries\HAL\hal_spi.c                             /
//    Command line =  "C:\Documents and Settings\Administrator\桌面\STM8\Soft /
//                    ware\Libraries\HAL\hal_spi.c" -e -Oh --debug            /
//                    --code_model small --data_model medium -o               /
//                    "C:\Documents and Settings\Administrator\桌面\STM8\Soft /
//                    ware\Project\Watering(CT1501-V1)\Debug\Obj\"            /
//                    --dlib_config "D:\Program Files\IAR Systems\Embedded    /
//                    Workbench 6.5\stm8\LIB\dlstm8smn.h" -D STM8S -D         /
//                    STM8S003 -lCN "C:\Documents and                         /
//                    Settings\Administrator\桌面\STM8\Software\Project\Water /
//                    ing(CT1501-V1)\Debug\List\" -lB "C:\Documents and       /
//                    Settings\Administrator\桌面\STM8\Software\Project\Water /
//                    ing(CT1501-V1)\Debug\List\" -I "C:\Documents and        /
//                    Settings\Administrator\桌面\STM8\Software\Project\Water /
//                    ing(CT1501-V1)\..\..\Libraries\STM8S_StdPeriph_Driver\i /
//                    nc\" -I "C:\Documents and Settings\Administrator\桌面\S /
//                    TM8\Software\Project\Watering(CT1501-V1)\..\..\Librarie /
//                    s\Device\" -I "C:\Documents and                         /
//                    Settings\Administrator\桌面\STM8\Software\Project\Water /
//                    ing(CT1501-V1)\..\..\Libraries\HAL\" -I "C:\Documents   /
//                    and Settings\Administrator\桌面\STM8\Software\Project\W /
//                    atering(CT1501-V1)\..\..\Libraries\Bus\" -I             /
//                    "C:\Documents and Settings\Administrator\桌面\STM8\Soft /
//                    ware\Project\Watering(CT1501-V1)\..\..\Libraries\CRC\"  /
//                    -I "C:\Documents and Settings\Administrator\桌面\STM8\S /
//                    oftware\Project\Watering(CT1501-V1)\User\" --vregs 16   /
//    List file    =  C:\Documents and Settings\Administrator\桌面\STM8\Softw /
//                    are\Project\Watering(CT1501-V1)\Debug\List\hal_spi.s    /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME hal_spi

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?epilogue_l2
        EXTERN ?push_l2
        EXTERN ?w4
        EXTERN ?w5
        EXTERN CLK_PeripheralClockConfig
        EXTERN SPI_Cmd
        EXTERN SPI_GetFlagStatus
        EXTERN SPI_Init
        EXTERN SPI_ReceiveData
        EXTERN SPI_SendData

        PUBLIC hal_spi_cfg
        PUBLIC hal_spi_read
        PUBLIC hal_spi_send

// C:\Documents and Settings\Administrator\桌面\STM8\Software\Libraries\HAL\hal_spi.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    hal_spi.c
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
//   16 #include "hal_spi.h"
//   17 
//   18 /* Private typedef -----------------------------------------------------------*/
//   19 
//   20 /* Private define ------------------------------------------------------------*/
//   21 
//   22 /* Private macro -------------------------------------------------------------*/
//   23 #define SPI_FLAG_TIMEOUT  ((uint16_t)0x1000)
//   24 /* Private variables ---------------------------------------------------------*/
//   25 
//   26 /* Private function prototypes -----------------------------------------------*/
//   27 
//   28 /* Private functions ---------------------------------------------------------*/ 
//   29 
//   30 /**
//   31   * @brief  Send a byte to Tx DR
//   32   * values 
//   33   * @param  
//   34   * -byte The data will be send
//   35   * @retval None
//   36   */
//   37 
//   38 
//   39 
//   40 /* Public functions ----------------------------------------------------------*/
//   41 
//   42 /**
//   43   * @brief  uart print string
//   44   * values 
//   45   * @param  
//   46   *     string
//   47   * @retval None
//   48   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   49 void hal_spi_cfg( HAL_SPI_Mode_TypeDef mode, HAL_SPI_FirstBit_TypeDef firstbit )
//   50 {
hal_spi_cfg:
        LD        S:?b1, A
        LD        A, S:?b0
//   51   SPI_Init( firstbit, SPI_BAUDRATEPRESCALER_2, mode, \ 
//   52             SPI_CLOCKPOLARITY_HIGH, SPI_CLOCKPHASE_1EDGE, \ 
//   53             SPI_DATADIRECTION_2LINES_FULLDUPLEX, SPI_NSS_HARD, (uint8_t)0x07 );
        MOV       S:?b6, #0x7
        CLR       S:?b5
        CLR       S:?b4
        CLR       S:?b3
        MOV       S:?b2, #0x2
        CLR       S:?b0
        CALL      L:SPI_Init
//   54   CLK_PeripheralClockConfig( CLK_PERIPHERAL_SPI, ENABLE );
        MOV       S:?b0, #0x1
        LD        A, #0x1
        CALL      L:CLK_PeripheralClockConfig
//   55   SPI_Cmd( ENABLE );
        LD        A, #0x1
        JP        L:SPI_Cmd
//   56 }
//   57 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   58 void hal_spi_send( uint8_t* data, uint16_t lenth )
//   59 {
hal_spi_send:
        CALL      L:?push_l2
//   60   for ( uint8_t i=0; i<lenth; i++ )
        TNZW      Y
        JREQ      L:??hal_spi_send_0
        LDW       S:?w5, X
        LDW       S:?w4, Y
//   61   {
//   62     SPI_SendData( data[i] );
??hal_spi_send_1:
        LD        A, [S:?w5.w]
        CALL      L:SPI_SendData
//   63     while ( SET != SPI_GetFlagStatus( SPI_FLAG_TXE ) );
??hal_spi_send_2:
        LD        A, #0x2
        CALL      L:SPI_GetFlagStatus
        CP        A, #0x1
        JRNE      L:??hal_spi_send_2
//   64   }
        CALL      L:?Subroutine0
??CrossCallReturnLabel_1:
        JRNE      L:??hal_spi_send_1
//   65 }
??hal_spi_send_0:
        JP        L:?epilogue_l2

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LDW       X, S:?w5
        INCW      X
        LDW       S:?w5, X
        LDW       X, S:?w4
        DECW      X
        LDW       S:?w4, X
        RET
//   66 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   67 void hal_spi_read( uint8_t* data, uint16_t lenth )
//   68 {
hal_spi_read:
        CALL      L:?push_l2
//   69   for ( uint8_t i=0; i<lenth; i++ )
        TNZW      Y
        JREQ      L:??hal_spi_read_0
        LDW       S:?w5, X
        LDW       S:?w4, Y
//   70   {
//   71     while ( SET != SPI_GetFlagStatus( SPI_FLAG_RXNE ) );
??hal_spi_read_1:
        LD        A, #0x1
        CALL      L:SPI_GetFlagStatus
        CP        A, #0x1
        JRNE      L:??hal_spi_read_1
//   72     data[i] = SPI_ReceiveData(  );
        CALL      L:SPI_ReceiveData
        LD        [S:?w5.w], A
//   73   }
        CALL      L:?Subroutine0
??CrossCallReturnLabel_0:
        JRNE      L:??hal_spi_read_1
//   74 }
??hal_spi_read_0:
        JP        L:?epilogue_l2

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//   75   
//   76 /************************** (C) COPYRIGHT 2014 DarrenTang *********************/
//   77 /********************************  END OF FILE  *******************************/
// 
// 118 bytes in section .near_func.text
// 
// 118 bytes of CODE memory
//
//Errors: none
//Warnings: 2
