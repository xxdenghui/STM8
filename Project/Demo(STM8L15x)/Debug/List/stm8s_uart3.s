///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                29/Apr/2018  22:46:07
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\STM8\Software\Libraries\STM8S_StdPeriph_Driver\src\stm8s_uart3.c
//    Command line =  
//        -f C:\Users\ADMINI~1\AppData\Local\Temp\EW1F47.tmp
//        (D:\STM8\Software\Libraries\STM8S_StdPeriph_Driver\src\stm8s_uart3.c
//        -e -On --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_cross_call --debug --code_model small --data_model medium -o
//        "D:\STM8\Software\Project\Demo(STM8S)\Debug\Obj" --dlib_config
//        "C:\Program Files\IAR Systems\Embedded Workbench
//        8.0\stm8\LIB\dlstm8smn.h" -D STM8S -D STM8S207 -lCN
//        "D:\STM8\Software\Project\Demo(STM8S)\Debug\List" -lB
//        "D:\STM8\Software\Project\Demo(STM8S)\Debug\List" -I
//        "D:\STM8\Software\Project\Demo(STM8S)\..\..\Libraries\STM8S_StdPeriph_Driver\inc\"
//        -I "D:\STM8\Software\Project\Demo(STM8S)\..\..\Libraries\Device\" -I
//        "D:\STM8\Software\Project\Demo(STM8S)\..\..\Libraries\HAL\" -I
//        "D:\STM8\Software\Project\Demo(STM8S)\..\..\Libraries\Bus\" -I
//        "D:\STM8\Software\Project\Demo(STM8S)\..\..\Libraries\CRC\" -I
//        "D:\STM8\Software\Project\Demo(STM8S)\User\" --vregs 16)
//    Locale       =  Chinese (Simplified)_CHN.936
//    List file    =  
//        D:\STM8\Software\Project\Demo(STM8S)\Debug\List\stm8s_uart3.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?b15
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_l2_w6
        EXTERN ?epilogue_w4
        EXTERN ?load32_dbsp_l0
        EXTERN ?load32_l0_dbsp
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l1_l0
        EXTERN ?mov_l2_l0
        EXTERN ?mul32_l0_l0_dl
        EXTERN ?pop_l1
        EXTERN ?push_l0
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w4
        EXTERN ?push_w6
        EXTERN ?sll16_x_x_a
        EXTERN ?sll32_l0_l0_a
        EXTERN ?srl16_x_x_4
        EXTERN ?sub32_l0_l0_l1
        EXTERN ?udiv32_l0_l0_dl
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w5
        EXTERN CLK_GetClockFreq
        EXTERN assert_failed

        PUBLIC UART3_ClearFlag
        PUBLIC UART3_ClearITPendingBit
        PUBLIC UART3_Cmd
        PUBLIC UART3_DeInit
        PUBLIC UART3_GetFlagStatus
        PUBLIC UART3_GetITStatus
        PUBLIC UART3_ITConfig
        PUBLIC UART3_Init
        PUBLIC UART3_LINBreakDetectionConfig
        PUBLIC UART3_LINCmd
        PUBLIC UART3_LINConfig
        PUBLIC UART3_ReceiveData8
        PUBLIC UART3_ReceiveData9
        PUBLIC UART3_ReceiverWakeUpCmd
        PUBLIC UART3_SendBreak
        PUBLIC UART3_SendData8
        PUBLIC UART3_SendData9
        PUBLIC UART3_SetAddress
        PUBLIC UART3_WakeUpConfig

// D:\STM8\Software\Libraries\STM8S_StdPeriph_Driver\src\stm8s_uart3.c
//    1 /**
//    2   ********************************************************************************
//    3   * @file    stm8s_uart3.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the uart3 peripheral.
//    8    ******************************************************************************
//    9   * @attention
//   10   *
//   11   * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
//   12   *
//   13   * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
//   14   * You may not use this file except in compliance with the License.
//   15   * You may obtain a copy of the License at:
//   16   *
//   17   *        http://www.st.com/software_license_agreement_liberty_v2
//   18   *
//   19   * Unless required by applicable law or agreed to in writing, software 
//   20   * distributed under the License is distributed on an "AS IS" BASIS, 
//   21   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   22   * See the License for the specific language governing permissions and
//   23   * limitations under the License.
//   24   *
//   25   ******************************************************************************
//   26   */
//   27 
//   28 /* Includes ------------------------------------------------------------------*/
//   29 #include "stm8s_uart3.h"
//   30 
//   31 /** @addtogroup STM8S_StdPeriph_Driver
//   32   * @{
//   33   */
//   34 /* Private typedef -----------------------------------------------------------*/
//   35 /* Private define ------------------------------------------------------------*/
//   36 /* Private macro -------------------------------------------------------------*/
//   37 /* Private variables ---------------------------------------------------------*/
//   38 /* Private function prototypes -----------------------------------------------*/
//   39 
//   40 /* Private functions ---------------------------------------------------------*/
//   41 /* Public functions ----------------------------------------------------------*/
//   42 
//   43 /** @}
//   44   * @addtogroup UART3_Public_Functions
//   45   * @{
//   46   */
//   47 
//   48 /**
//   49   * @brief  Deinitializes the UART peripheral.
//   50   * @param  None
//   51   * @retval None
//   52   */
//   53 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   54 void UART3_DeInit(void)
//   55 {
//   56   /* Clear the Idle Line Detected bit in the status rerister by a read
//   57   to the UART3_SR register followed by a Read to the UART3_DR register */
//   58   (void) UART3->SR;
UART3_DeInit:
        MOV       S:?b0, L:0x5240
//   59   (void) UART3->DR;
        LD        A, L:0x5241
//   60   
//   61   UART3->BRR2 = UART3_BRR2_RESET_VALUE; /*Set UART3_BRR2 to reset value 0x00 */
        CLR       L:0x5243
//   62   UART3->BRR1 = UART3_BRR1_RESET_VALUE; /*Set UART3_BRR1 to reset value 0x00 */
        CLR       L:0x5242
//   63   
//   64   UART3->CR1 = UART3_CR1_RESET_VALUE;  /*Set UART3_CR1 to reset value 0x00  */
        CLR       L:0x5244
//   65   UART3->CR2 = UART3_CR2_RESET_VALUE;  /*Set UART3_CR2 to reset value 0x00  */
        CLR       L:0x5245
//   66   UART3->CR3 = UART3_CR3_RESET_VALUE;  /*Set UART3_CR3 to reset value 0x00  */
        CLR       L:0x5246
//   67   UART3->CR4 = UART3_CR4_RESET_VALUE;  /*Set UART3_CR4 to reset value 0x00  */
        CLR       L:0x5247
//   68   UART3->CR6 = UART3_CR6_RESET_VALUE;  /*Set UART3_CR6 to reset value 0x00  */
        CLR       L:0x5249
//   69 }
        RET
//   70 
//   71 /**
//   72   * @brief  Initializes the UART3 according to the specified parameters.
//   73   * @param  BaudRate: The baudrate.
//   74   * @param  WordLength : This parameter can be any of 
//   75   *         the @ref UART3_WordLength_TypeDef enumeration.
//   76   * @param  StopBits: This parameter can be any of the 
//   77   *         @ref UART3_StopBits_TypeDef enumeration.
//   78   * @param  Parity: This parameter can be any of the 
//   79   *         @ref UART3_Parity_TypeDef enumeration.
//   80   * @param  Mode: This parameter can be any of the @ref UART3_Mode_TypeDef values
//   81   * @retval None
//   82   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   83 void UART3_Init(uint32_t BaudRate, UART3_WordLength_TypeDef WordLength, 
//   84                 UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, 
//   85                 UART3_Mode_TypeDef Mode)
//   86 {
UART3_Init:
        CALL      L:?push_l2
        CALL      L:?push_l3
        SUB       SP, #0xb
        CALL      L:?mov_l2_l0
        LD        S:?b15, A
        MOV       S:?b14, S:?b4
        MOV       S:?b13, S:?b5
        MOV       S:?b12, S:?b6
//   87   uint8_t BRR2_1 = 0, BRR2_2 = 0;
        CLR       (0x2,SP)
        CLR       (0x1,SP)
//   88   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
        CLRW      X
        LDW       (0x3,SP), X
        CLRW      X
        LDW       (0x5,SP), X
        CLRW      X
        LDW       (0x8,SP), X
        CLRW      X
        LDW       (0xa,SP), X
//   89   
//   90   /* Check the parameters */
//   91   assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
        TNZ       S:?b15
        JREQ      L:??UART3_Init_0
        LD        A, S:?b15
        CP        A, #0x10
        JREQ      L:??UART3_Init_0
        LDW       X, #0x5b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   92   assert_param(IS_UART3_STOPBITS_OK(StopBits));
??UART3_Init_0:
        TNZ       S:?b14
        JREQ      L:??UART3_Init_1
        LD        A, S:?b14
        CP        A, #0x20
        JREQ      L:??UART3_Init_1
        LDW       X, #0x5c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   93   assert_param(IS_UART3_PARITY_OK(Parity));
??UART3_Init_1:
        TNZ       S:?b13
        JREQ      L:??UART3_Init_2
        LD        A, S:?b13
        CP        A, #0x4
        JREQ      L:??UART3_Init_2
        LD        A, S:?b13
        CP        A, #0x6
        JREQ      L:??UART3_Init_2
        LDW       X, #0x5d
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   94   assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
??UART3_Init_2:
        LDW       X, S:?w4
        CPW       X, #0x9
        JRNE      L:??UART3_Init_3
        LDW       X, S:?w5
        CPW       X, #0x8969
??UART3_Init_3:
        JRC       L:??UART3_Init_4
        LDW       X, #0x5e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   95   assert_param(IS_UART3_MODE_OK((uint8_t)Mode));
??UART3_Init_4:
        LD        A, S:?b12
        CP        A, #0x8
        JREQ      L:??UART3_Init_5
        LD        A, S:?b12
        CP        A, #0x40
        JREQ      L:??UART3_Init_5
        LD        A, S:?b12
        CP        A, #0x4
        JREQ      L:??UART3_Init_5
        LD        A, S:?b12
        CP        A, #0x80
        JREQ      L:??UART3_Init_5
        LD        A, S:?b12
        CP        A, #0xc
        JREQ      L:??UART3_Init_5
        LD        A, S:?b12
        CP        A, #0xc
        JREQ      L:??UART3_Init_5
        LD        A, S:?b12
        CP        A, #0x44
        JREQ      L:??UART3_Init_5
        LD        A, S:?b12
        CP        A, #0xc0
        JREQ      L:??UART3_Init_5
        LD        A, S:?b12
        CP        A, #0x88
        JREQ      L:??UART3_Init_5
        LDW       X, #0x5f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   96   
//   97   /* Clear the word length bit */
//   98   UART3->CR1 &= (uint8_t)(~UART3_CR1_M);     
??UART3_Init_5:
        BRES      L:0x5244, #0x4
//   99   /* Set the word length bit according to UART3_WordLength value */
//  100   UART3->CR1 |= (uint8_t)WordLength; 
        LD        A, L:0x5244
        OR        A, S:?b15
        LD        L:0x5244, A
//  101   
//  102   /* Clear the STOP bits */
//  103   UART3->CR3 &= (uint8_t)(~UART3_CR3_STOP);  
        LD        A, L:0x5246
        AND       A, #0xcf
        LD        L:0x5246, A
//  104   /* Set the STOP bits number according to UART3_StopBits value  */
//  105   UART3->CR3 |= (uint8_t)StopBits;  
        LD        A, L:0x5246
        OR        A, S:?b14
        LD        L:0x5246, A
//  106   
//  107   /* Clear the Parity Control bit */
//  108   UART3->CR1 &= (uint8_t)(~(UART3_CR1_PCEN | UART3_CR1_PS));  
        LD        A, L:0x5244
        AND       A, #0xf9
        LD        L:0x5244, A
//  109   /* Set the Parity Control bit to UART3_Parity value */
//  110   UART3->CR1 |= (uint8_t)Parity;     
        LD        A, L:0x5244
        OR        A, S:?b13
        LD        L:0x5244, A
//  111   
//  112   /* Clear the LSB mantissa of UART3DIV  */
//  113   UART3->BRR1 &= (uint8_t)(~UART3_BRR1_DIVM);  
        LD        A, L:0x5242
        LD        (0x7,SP), A
        CLR       L:0x5242
//  114   /* Clear the MSB mantissa of UART3DIV  */
//  115   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVM);  
        LD        A, L:0x5243
        AND       A, #0xf
        LD        L:0x5243, A
//  116   /* Clear the Fraction bits of UART3DIV */
//  117   UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVF);  
        LD        A, L:0x5243
        AND       A, #0xf0
        LD        L:0x5243, A
//  118   
//  119   /* Set the UART3 BaudRates in BRR1 and BRR2 registers according to UART3_BaudRate value */
//  120   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
        CALL      L:?mov_l0_l2
        LD        A, #0x4
        CALL      L:?sll32_l0_l0_a
        CALL      L:?push_l0
        CALL      L:CLK_GetClockFreq
        CALL      L:?pop_l1
        CALL      L:?udiv32_l0_l0_l1
        CALL      L:?load32_dbsp_l0
        DATA
        DC8       0x3
        CODE
//  121   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
        CALL      L:?mov_l0_l2
        LD        A, #0x4
        CALL      L:?sll32_l0_l0_a
        CALL      L:?push_l0
        CALL      L:CLK_GetClockFreq
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x64
        CODE
        CALL      L:?pop_l1
        CALL      L:?udiv32_l0_l0_l1
        CALL      L:?load32_dbsp_l0
        DATA
        DC8       0x8
        CODE
//  122   /* The fraction and MSB mantissa should be loaded in one step in the BRR2 register */
//  123   /* Set the fraction of UART3DIV  */
//  124   BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
//  125                                 << 4) / 100) & (uint8_t)0x0F); 
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0x3
        CODE
        CALL      L:?mul32_l0_l0_dl
        DATA
        DC32      0x64
        CODE
        CALL      L:?mov_l1_l0
        CALL      L:?load32_l0_dbsp
        DATA
        DC8       0x8
        CODE
        CALL      L:?sub32_l0_l0_l1
        LD        A, #0x4
        CALL      L:?sll32_l0_l0_a
        CALL      L:?udiv32_l0_l0_dl
        DATA
        DC32      0x64
        CODE
        LD        A, S:?b3
        AND       A, #0xf
        LD        (0x2,SP), A
//  126   BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
        LDW       X, (0x5,SP)
        CALL      L:?srl16_x_x_4
        LD        A, XL
        AND       A, #0xf0
        LD        (0x1,SP), A
//  127   
//  128   UART3->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
        LD        A, (0x1,SP)
        OR        A, (0x2,SP)
        LD        L:0x5243, A
//  129   /* Set the LSB mantissa of UART3DIV  */
//  130   UART3->BRR1 = (uint8_t)BaudRate_Mantissa;           
        LDW       X, (0x5,SP)
        LD        A, XL
        LD        L:0x5242, A
//  131   
//  132   if ((uint8_t)(Mode & UART3_MODE_TX_ENABLE))
        LD        A, S:?b12
        AND       A, #0x4
        CP        A, #0x0
        JREQ      L:??UART3_Init_6
//  133   {
//  134     /* Set the Transmitter Enable bit */
//  135     UART3->CR2 |= UART3_CR2_TEN;  
        BSET      L:0x5245, #0x3
        JRA       L:??UART3_Init_7
//  136   }
//  137   else
//  138   {
//  139     /* Clear the Transmitter Disable bit */
//  140     UART3->CR2 &= (uint8_t)(~UART3_CR2_TEN);  
??UART3_Init_6:
        BRES      L:0x5245, #0x3
//  141   }
//  142   if ((uint8_t)(Mode & UART3_MODE_RX_ENABLE))
??UART3_Init_7:
        LD        A, S:?b12
        AND       A, #0x8
        CP        A, #0x0
        JREQ      L:??UART3_Init_8
//  143   {
//  144     /* Set the Receiver Enable bit */
//  145     UART3->CR2 |= UART3_CR2_REN;  
        BSET      L:0x5245, #0x2
        JRA       L:??UART3_Init_9
//  146   }
//  147   else
//  148   {
//  149     /* Clear the Receiver Disable bit */
//  150     UART3->CR2 &= (uint8_t)(~UART3_CR2_REN);  
??UART3_Init_8:
        BRES      L:0x5245, #0x2
//  151   }
//  152 }
??UART3_Init_9:
        ADD       SP, #0xb
        JP        L:?epilogue_l2_l3
//  153 
//  154 /**
//  155   * @brief  Enable the UART1 peripheral.
//  156   * @param  NewState : The new state of the UART Communication.
//  157   *         This parameter can be any of the @ref FunctionalState enumeration.
//  158   * @retval None
//  159   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  160 void UART3_Cmd(FunctionalState NewState)
//  161 {
//  162   if (NewState != DISABLE)
UART3_Cmd:
        TNZ       A
        JREQ      L:??UART3_Cmd_0
//  163   {
//  164     /* UART3 Enable */
//  165     UART3->CR1 &= (uint8_t)(~UART3_CR1_UARTD); 
        BRES      L:0x5244, #0x5
        JRA       L:??UART3_Cmd_1
//  166   }
//  167   else
//  168   {
//  169     /* UART3 Disable */
//  170     UART3->CR1 |= UART3_CR1_UARTD;  
??UART3_Cmd_0:
        BSET      L:0x5244, #0x5
//  171   }
//  172 }
??UART3_Cmd_1:
        RET
//  173 
//  174 /**
//  175   * @brief  Enables or disables the specified UART3 interrupts.
//  176   * @param  UART3_IT specifies the UART3 interrupt sources to be enabled or disabled.
//  177   *         This parameter can be one of the following values:
//  178   *         - UART3_IT_LBDF:  LIN Break detection interrupt
//  179   *         - UART3_IT_LHDF:  LIN Break detection interrupt
//  180   *         - UART3_IT_TXE:  Transmit Data Register empty interrupt
//  181   *         - UART3_IT_TC:   Transmission complete interrupt
//  182   *         - UART3_IT_RXNE_OR: Receive Data register not empty/Over run error interrupt
//  183   *         - UART3_IT_IDLE: Idle line detection interrupt
//  184   *         - UART3_IT_PE:   Parity Error interrupt
//  185   * @param  NewState new state of the specified UART3 interrupts.
//  186   *         This parameter can be: ENABLE or DISABLE.
//  187   * @retval None
//  188   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  189 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
//  190 {
UART3_ITConfig:
        CALL      L:?push_l2
        PUSH      S:?b12
        LDW       S:?w4, X
        LD        S:?b10, A
//  191   uint8_t uartreg = 0, itpos = 0x00;
        CLR       S:?b11
        CLR       S:?b12
//  192   
//  193   /* Check the parameters */
//  194   assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
        LDW       X, S:?w4
        CPW       X, #0x100
        JREQ      L:??UART3_ITConfig_0
        LDW       X, S:?w4
        CPW       X, #0x277
        JREQ      L:??UART3_ITConfig_0
        LDW       X, S:?w4
        CPW       X, #0x266
        JREQ      L:??UART3_ITConfig_0
        LDW       X, S:?w4
        CPW       X, #0x205
        JREQ      L:??UART3_ITConfig_0
        LDW       X, S:?w4
        CPW       X, #0x244
        JREQ      L:??UART3_ITConfig_0
        LDW       X, S:?w4
        CPW       X, #0x412
        JREQ      L:??UART3_ITConfig_0
        LDW       X, S:?w4
        CPW       X, #0x346
        JREQ      L:??UART3_ITConfig_0
        LDW       X, #0xc2
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  195   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??UART3_ITConfig_0:
        TNZ       S:?b10
        JREQ      L:??UART3_ITConfig_1
        LD        A, S:?b10
        CP        A, #0x1
        JREQ      L:??UART3_ITConfig_1
        LDW       X, #0xc3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  196   
//  197   /* Get the UART3 register index */
//  198   uartreg = (uint8_t)((uint16_t)UART3_IT >> 0x08);
??UART3_ITConfig_1:
        MOV       S:?b11, S:?b8
//  199   
//  200   /* Get the UART3 IT index */
//  201   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
        LD        A, S:?b9
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        LD        S:?b12, A
//  202   
//  203   if (NewState != DISABLE)
        TNZ       S:?b10
        JREQ      L:??UART3_ITConfig_2
//  204   {
//  205     /* Enable the Interrupt bits according to UART3_IT mask */
//  206     if (uartreg == 0x01)
        LD        A, S:?b11
        CP        A, #0x1
        JRNE      L:??UART3_ITConfig_3
//  207     {
//  208       UART3->CR1 |= itpos;
        LD        A, L:0x5244
        OR        A, S:?b12
        LD        L:0x5244, A
        JRA       L:??UART3_ITConfig_4
//  209     }
//  210     else if (uartreg == 0x02)
??UART3_ITConfig_3:
        LD        A, S:?b11
        CP        A, #0x2
        JRNE      L:??UART3_ITConfig_5
//  211     {
//  212       UART3->CR2 |= itpos;
        LD        A, L:0x5245
        OR        A, S:?b12
        LD        L:0x5245, A
        JRA       L:??UART3_ITConfig_4
//  213     }
//  214     else if (uartreg == 0x03)
??UART3_ITConfig_5:
        LD        A, S:?b11
        CP        A, #0x3
        JRNE      L:??UART3_ITConfig_6
//  215     {
//  216       UART3->CR4 |= itpos;
        LD        A, L:0x5247
        OR        A, S:?b12
        LD        L:0x5247, A
        JRA       L:??UART3_ITConfig_4
//  217     }
//  218     else
//  219     {
//  220       UART3->CR6 |= itpos;
??UART3_ITConfig_6:
        LD        A, L:0x5249
        OR        A, S:?b12
        LD        L:0x5249, A
        JRA       L:??UART3_ITConfig_4
//  221     }
//  222   }
//  223   else
//  224   {
//  225     /* Disable the interrupt bits according to UART3_IT mask */
//  226     if (uartreg == 0x01)
??UART3_ITConfig_2:
        LD        A, S:?b11
        CP        A, #0x1
        JRNE      L:??UART3_ITConfig_7
//  227     {
//  228       UART3->CR1 &= (uint8_t)(~itpos);
        LD        A, S:?b12
        CPL       A
        AND       A, L:0x5244
        LD        L:0x5244, A
        JRA       L:??UART3_ITConfig_4
//  229     }
//  230     else if (uartreg == 0x02)
??UART3_ITConfig_7:
        LD        A, S:?b11
        CP        A, #0x2
        JRNE      L:??UART3_ITConfig_8
//  231     {
//  232       UART3->CR2 &= (uint8_t)(~itpos);
        LD        A, S:?b12
        CPL       A
        AND       A, L:0x5245
        LD        L:0x5245, A
        JRA       L:??UART3_ITConfig_4
//  233     }
//  234     else if (uartreg == 0x03)
??UART3_ITConfig_8:
        LD        A, S:?b11
        CP        A, #0x3
        JRNE      L:??UART3_ITConfig_9
//  235     {
//  236       UART3->CR4 &= (uint8_t)(~itpos);
        LD        A, S:?b12
        CPL       A
        AND       A, L:0x5247
        LD        L:0x5247, A
        JRA       L:??UART3_ITConfig_4
//  237     }
//  238     else
//  239     {
//  240       UART3->CR6 &= (uint8_t)(~itpos);
??UART3_ITConfig_9:
        LD        A, S:?b12
        CPL       A
        AND       A, L:0x5249
        LD        L:0x5249, A
//  241     }
//  242   }
//  243 }
??UART3_ITConfig_4:
        POP       S:?b12
        JP        L:?epilogue_l2
//  244 
//  245 /**
//  246   * @brief  Sets the UART3 LIN Break detection length.
//  247   * @param  UART3_LINBreakDetectionLength specifies the LIN break detection length.
//  248   *         This parameter can be any of the 
//  249   *         @ref UART3_LINBreakDetectionLength_TypeDef values.
//  250   * @retval None
//  251   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  252 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
//  253 {
UART3_LINBreakDetectionConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  254   /* Check the parameters */
//  255   assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
        TNZ       S:?b8
        JREQ      L:??UART3_LINBreakDetectionConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??UART3_LINBreakDetectionConfig_0
        LDW       X, #0xff
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  256   
//  257   if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
??UART3_LINBreakDetectionConfig_0:
        TNZ       S:?b8
        JREQ      L:??UART3_LINBreakDetectionConfig_1
//  258   {
//  259     UART3->CR4 |= UART3_CR4_LBDL;
        BSET      L:0x5247, #0x5
        JRA       L:??UART3_LINBreakDetectionConfig_2
//  260   }
//  261   else
//  262   {
//  263     UART3->CR4 &= ((uint8_t)~UART3_CR4_LBDL);
??UART3_LINBreakDetectionConfig_1:
        BRES      L:0x5247, #0x5
//  264   }
//  265 }
??UART3_LINBreakDetectionConfig_2:
        POP       S:?b8
        RET
//  266 
//  267 /**
//  268   * @brief  Configure the UART3 peripheral.
//  269   * @param  UART3_Mode specifies the LIN mode.
//  270   *         This parameter can be any of the @ref UART3_LinMode_TypeDef values.
//  271   * @param  UART3_Autosync specifies the LIN automatic resynchronization mode.
//  272   *         This parameter can be any of the @ref UART3_LinAutosync_TypeDef values.
//  273   * @param  UART3_DivUp specifies the LIN divider update method.
//  274   *         This parameter can be any of the @ref UART3_LinDivUp_TypeDef values.
//  275   * @retval None
//  276   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  277 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode,
//  278                      UART3_LinAutosync_TypeDef UART3_Autosync, 
//  279                      UART3_LinDivUp_TypeDef UART3_DivUp)
//  280 {
UART3_LINConfig:
        CALL      L:?push_w4
        PUSH      S:?b10
        LD        S:?b10, A
        MOV       S:?b9, S:?b0
        MOV       S:?b8, S:?b1
//  281   /* Check the parameters */
//  282   assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
        TNZ       S:?b10
        JREQ      L:??UART3_LINConfig_0
        LD        A, S:?b10
        CP        A, #0x1
        JREQ      L:??UART3_LINConfig_0
        LDW       X, #0x11a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  283   assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
??UART3_LINConfig_0:
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??UART3_LINConfig_1
        TNZ       S:?b9
        JREQ      L:??UART3_LINConfig_1
        LDW       X, #0x11b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  284   assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
??UART3_LINConfig_1:
        TNZ       S:?b8
        JREQ      L:??UART3_LINConfig_2
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??UART3_LINConfig_2
        LDW       X, #0x11c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  285   
//  286   if (UART3_Mode != UART3_LIN_MODE_MASTER)
??UART3_LINConfig_2:
        TNZ       S:?b10
        JREQ      L:??UART3_LINConfig_3
//  287   {
//  288     UART3->CR6 |=  UART3_CR6_LSLV;
        BSET      L:0x5249, #0x5
        JRA       L:??UART3_LINConfig_4
//  289   }
//  290   else
//  291   {
//  292     UART3->CR6 &= ((uint8_t)~UART3_CR6_LSLV);
??UART3_LINConfig_3:
        BRES      L:0x5249, #0x5
//  293   }
//  294   
//  295   if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
??UART3_LINConfig_4:
        TNZ       S:?b9
        JREQ      L:??UART3_LINConfig_5
//  296   {
//  297     UART3->CR6 |=  UART3_CR6_LASE ;
        BSET      L:0x5249, #0x4
        JRA       L:??UART3_LINConfig_6
//  298   }
//  299   else
//  300   {
//  301     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LASE );
??UART3_LINConfig_5:
        BRES      L:0x5249, #0x4
//  302   }
//  303   
//  304   if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
??UART3_LINConfig_6:
        TNZ       S:?b8
        JREQ      L:??UART3_LINConfig_7
//  305   {
//  306     UART3->CR6 |=  UART3_CR6_LDUM;
        BSET      L:0x5249, #0x7
        JRA       L:??UART3_LINConfig_8
//  307   }
//  308   else
//  309   {
//  310     UART3->CR6 &= ((uint8_t)~ UART3_CR6_LDUM);
??UART3_LINConfig_7:
        BRES      L:0x5249, #0x7
//  311   }
//  312 }
??UART3_LINConfig_8:
        POP       S:?b10
        JP        L:?epilogue_w4
//  313 
//  314 /**
//  315   * @brief  Enables or disables the UART3 LIN mode.
//  316   * @param  NewState is new state of the UART3 LIN mode.
//  317   *         This parameter can be ENABLE or DISABLE
//  318   * @retval None
//  319   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  320 void UART3_LINCmd(FunctionalState NewState)
//  321 {
UART3_LINCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  322   /* Check the parameters */
//  323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??UART3_LINCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??UART3_LINCmd_0
        LDW       X, #0x143
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  324   
//  325   if (NewState != DISABLE)
??UART3_LINCmd_0:
        TNZ       S:?b8
        JREQ      L:??UART3_LINCmd_1
//  326   {
//  327     /* Enable the LIN mode by setting the LINE bit in the CR2 register */
//  328     UART3->CR3 |= UART3_CR3_LINEN;
        BSET      L:0x5246, #0x6
        JRA       L:??UART3_LINCmd_2
//  329   }
//  330   else
//  331   {
//  332     /* Disable the LIN mode by clearing the LINE bit in the CR2 register */
//  333     UART3->CR3 &= ((uint8_t)~UART3_CR3_LINEN);
??UART3_LINCmd_1:
        BRES      L:0x5246, #0x6
//  334   }
//  335 }
??UART3_LINCmd_2:
        POP       S:?b8
        RET
//  336 
//  337 /**
//  338   * @brief  Selects the UART3 WakeUp method.
//  339   * @param  UART3_WakeUp: specifies the UART3 wakeup method.
//  340   *         This parameter can be any of the @ref UART3_WakeUp_TypeDef values.
//  341   * @retval None
//  342   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  343 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
//  344 {
UART3_WakeUpConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  345   /* Check the parameters */
//  346   assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
        TNZ       S:?b8
        JREQ      L:??UART3_WakeUpConfig_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??UART3_WakeUpConfig_0
        LDW       X, #0x15a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  347   
//  348   UART3->CR1 &= ((uint8_t)~UART3_CR1_WAKE);
??UART3_WakeUpConfig_0:
        BRES      L:0x5244, #0x3
//  349   UART3->CR1 |= (uint8_t)UART3_WakeUp;
        LD        A, L:0x5244
        OR        A, S:?b8
        LD        L:0x5244, A
//  350 }
        POP       S:?b8
        RET
//  351 
//  352 /**
//  353   * @brief  Determines if the UART3 is in mute mode or not.
//  354   * @param  NewState: new state of the UART3 mode.
//  355   *         This parameter can be ENABLE or DISABLE
//  356   * @retval None
//  357   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  358 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
//  359 {
UART3_ReceiverWakeUpCmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  360   /* Check the parameters */
//  361   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??UART3_ReceiverWakeUpCmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??UART3_ReceiverWakeUpCmd_0
        LDW       X, #0x169
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  362   
//  363   if (NewState != DISABLE)
??UART3_ReceiverWakeUpCmd_0:
        TNZ       S:?b8
        JREQ      L:??UART3_ReceiverWakeUpCmd_1
//  364   {
//  365     /* Enable the mute mode UART3 by setting the RWU bit in the CR2 register */
//  366     UART3->CR2 |= UART3_CR2_RWU;
        BSET      L:0x5245, #0x1
        JRA       L:??UART3_ReceiverWakeUpCmd_2
//  367   }
//  368   else
//  369   {
//  370     /* Disable the mute mode UART3 by clearing the RWU bit in the CR1 register */
//  371     UART3->CR2 &= ((uint8_t)~UART3_CR2_RWU);
??UART3_ReceiverWakeUpCmd_1:
        BRES      L:0x5245, #0x1
//  372   }
//  373 }
??UART3_ReceiverWakeUpCmd_2:
        POP       S:?b8
        RET
//  374 
//  375 /**
//  376   * @brief  Returns the most recent received data by the UART3 peripheral.
//  377   * @param  None
//  378   * @retval Received Data
//  379   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  380 uint8_t UART3_ReceiveData8(void)
//  381 {
//  382   return ((uint8_t)UART3->DR);
UART3_ReceiveData8:
        LD        A, L:0x5241
        RET
//  383 }
//  384 
//  385 /**
//  386   * @brief  Returns the most recent received data by the UART3 peripheral.
//  387   * @param  None
//  388   * @retval Received Data
//  389   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  390 uint16_t UART3_ReceiveData9(void)
//  391 {
//  392   uint16_t temp = 0;
UART3_ReceiveData9:
        CLR       S:?b1
        CLR       S:?b0
//  393   
//  394   temp = (uint16_t)(((uint16_t)((uint16_t)UART3->CR1 & (uint16_t)UART3_CR1_R8)) << 1);
        LD        A, L:0x5244
        CLRW      X
        LD        XL, A
        SLLW      X
        RLWA      X, A
        AND       A, #0x1
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        LDW       S:?w0, X
//  395   return (uint16_t)((((uint16_t)UART3->DR) | temp) & ((uint16_t)0x01FF));
        LD        A, L:0x5241
        CLRW      X
        LD        XL, A
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RLWA      X, A
        AND       A, #0x1
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        RET
//  396 }
//  397 
//  398 /**
//  399   * @brief  Transmits 8 bit data through the UART3 peripheral.
//  400   * @param  Data the data to transmit.
//  401   * @retval None
//  402   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  403 void UART3_SendData8(uint8_t Data)
//  404 {
//  405   /* Transmit Data */
//  406   UART3->DR = Data;
UART3_SendData8:
        LD        L:0x5241, A
//  407 }
        RET
//  408 
//  409 /**
//  410   * @brief  Transmits 9 bit data through the UART3 peripheral.
//  411   * @param   Data: the data to transmit.
//  412   * @retval None
//  413   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  414 void UART3_SendData9(uint16_t Data)
//  415 {
UART3_SendData9:
        LDW       Y, X
//  416   /* Clear the transmit data bit 8 */
//  417   UART3->CR1 &= ((uint8_t)~UART3_CR1_T8);                  
        BRES      L:0x5244, #0x6
//  418   
//  419   /* Write the transmit data bit [8] */
//  420   UART3->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART3_CR1_T8); 
        LDW       X, Y
        SRLW      X
        SRLW      X
        LD        A, XL
        AND       A, #0x40
        OR        A, L:0x5244
        LD        L:0x5244, A
//  421   
//  422   /* Write the transmit data bit [0:7] */
//  423   UART3->DR   = (uint8_t)(Data);                    
        LD        A, YL
        LD        L:0x5241, A
//  424 }
        RET
//  425 
//  426 /**
//  427   * @brief  Transmits break characters.
//  428   * @param  None
//  429   * @retval None
//  430   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  431 void UART3_SendBreak(void)
//  432 {
//  433   UART3->CR2 |= UART3_CR2_SBK;
UART3_SendBreak:
        BSET      L:0x5245, #0x0
//  434 }
        RET
//  435 
//  436 /**
//  437   * @brief  Sets the address of the UART3 node.
//  438   * @param  UART3_Address: Indicates the address of the UART3 node.
//  439   * @retval None
//  440   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  441 void UART3_SetAddress(uint8_t UART3_Address)
//  442 {
UART3_SetAddress:
        PUSH      S:?b8
        LD        S:?b8, A
//  443   /* Check the parameters */
//  444   assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
        LD        A, S:?b8
        CP        A, #0x10
        JRC       L:??UART3_SetAddress_0
        LDW       X, #0x1bc
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  445   
//  446   /* Clear the UART3 address */
//  447   UART3->CR4 &= ((uint8_t)~UART3_CR4_ADD);
??UART3_SetAddress_0:
        LD        A, L:0x5247
        AND       A, #0xf0
        LD        L:0x5247, A
//  448   /* Set the UART3 address node */
//  449   UART3->CR4 |= UART3_Address;
        LD        A, L:0x5247
        OR        A, S:?b8
        LD        L:0x5247, A
//  450 }
        POP       S:?b8
        RET
//  451 
//  452 /**
//  453   * @brief  Checks whether the specified UART3 flag is set or not.
//  454   * @param  UART3_FLAG specifies the flag to check.
//  455   *         This parameter can be any of the @ref UART3_Flag_TypeDef enumeration.
//  456   * @retval FlagStatus (SET or RESET)
//  457   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  458 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
//  459 {
UART3_GetFlagStatus:
        CALL      L:?push_w4
        PUSH      S:?b10
        LDW       S:?w4, X
//  460   FlagStatus status = RESET;
        CLR       S:?b10
//  461   
//  462   /* Check parameters */
//  463   assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
        LDW       X, S:?w4
        CPW       X, #0x80
        JREQ      L:??UART3_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x40
        JREQ      L:??UART3_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x20
        JREQ      L:??UART3_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x10
        JREQ      L:??UART3_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x8
        JREQ      L:??UART3_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x4
        JREQ      L:??UART3_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x2
        JREQ      L:??UART3_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x1
        JREQ      L:??UART3_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x101
        JREQ      L:??UART3_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x301
        JREQ      L:??UART3_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x302
        JREQ      L:??UART3_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x210
        JREQ      L:??UART3_GetFlagStatus_0
        LDW       X, #0x1cf
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  464   
//  465   /* Check the status of the specified UART3 flag*/
//  466   if (UART3_FLAG == UART3_FLAG_LBDF)
??UART3_GetFlagStatus_0:
        LDW       X, S:?w4
        CPW       X, #0x210
        JRNE      L:??UART3_GetFlagStatus_1
//  467   {
//  468     if ((UART3->CR4 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
        LD        A, S:?b9
        AND       A, L:0x5247
        CP        A, #0x0
        JREQ      L:??UART3_GetFlagStatus_2
//  469     {
//  470       /* UART3_FLAG is set*/
//  471       status = SET;
        LD        A, #0x1
        LD        S:?b10, A
        JRA       L:??UART3_GetFlagStatus_3
//  472     }
//  473     else
//  474     {
//  475       /* UART3_FLAG is reset*/
//  476       status = RESET;
??UART3_GetFlagStatus_2:
        CLR       S:?b10
        JRA       L:??UART3_GetFlagStatus_3
//  477     }
//  478   }
//  479   else if (UART3_FLAG == UART3_FLAG_SBK)
??UART3_GetFlagStatus_1:
        LDW       X, S:?w4
        CPW       X, #0x101
        JRNE      L:??UART3_GetFlagStatus_4
//  480   {
//  481     if ((UART3->CR2 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
        LD        A, S:?b9
        AND       A, L:0x5245
        CP        A, #0x0
        JREQ      L:??UART3_GetFlagStatus_5
//  482     {
//  483       /* UART3_FLAG is set*/
//  484       status = SET;
        LD        A, #0x1
        LD        S:?b10, A
        JRA       L:??UART3_GetFlagStatus_3
//  485     }
//  486     else
//  487     {
//  488       /* UART3_FLAG is reset*/
//  489       status = RESET;
??UART3_GetFlagStatus_5:
        CLR       S:?b10
        JRA       L:??UART3_GetFlagStatus_3
//  490     }
//  491   }
//  492   else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
??UART3_GetFlagStatus_4:
        LDW       X, S:?w4
        CPW       X, #0x302
        JREQ      L:??UART3_GetFlagStatus_6
        LDW       X, S:?w4
        CPW       X, #0x301
        JRNE      L:??UART3_GetFlagStatus_7
//  493   {
//  494     if ((UART3->CR6 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
??UART3_GetFlagStatus_6:
        LD        A, S:?b9
        AND       A, L:0x5249
        CP        A, #0x0
        JREQ      L:??UART3_GetFlagStatus_8
//  495     {
//  496       /* UART3_FLAG is set*/
//  497       status = SET;
        LD        A, #0x1
        LD        S:?b10, A
        JRA       L:??UART3_GetFlagStatus_3
//  498     }
//  499     else
//  500     {
//  501       /* UART3_FLAG is reset*/
//  502       status = RESET;
??UART3_GetFlagStatus_8:
        CLR       S:?b10
        JRA       L:??UART3_GetFlagStatus_3
//  503     }
//  504   }
//  505   else
//  506   {
//  507     if ((UART3->SR & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
??UART3_GetFlagStatus_7:
        LD        A, S:?b9
        AND       A, L:0x5240
        CP        A, #0x0
        JREQ      L:??UART3_GetFlagStatus_9
//  508     {
//  509       /* UART3_FLAG is set*/
//  510       status = SET;
        LD        A, #0x1
        LD        S:?b10, A
        JRA       L:??UART3_GetFlagStatus_3
//  511     }
//  512     else
//  513     {
//  514       /* UART3_FLAG is reset*/
//  515       status = RESET;
??UART3_GetFlagStatus_9:
        CLR       S:?b10
//  516     }
//  517   }
//  518   
//  519   /* Return the UART3_FLAG status*/
//  520   return  status;
??UART3_GetFlagStatus_3:
        LD        A, S:?b10
        POP       S:?b10
        JP        L:?epilogue_w4
//  521 }
//  522 
//  523 /**
//  524   * @brief  Clears the UART3 flags.
//  525   * @param  UART3_FLAG specifies the flag to clear
//  526   *         This parameter can be any combination of the following values:
//  527   *         - UART3_FLAG_LBDF: LIN Break detection flag.
//  528   *         - UART3_FLAG_LHDF: LIN Header detection flag.
//  529   *         - UART3_FLAG_LSF: LIN synchrone field flag.
//  530   *         - UART3_FLAG_RXNE: Receive data register not empty flag.
//  531   * @note
//  532   *         - PE (Parity error), FE (Framing error), NF (Noise error), 
//  533   *           OR (OverRun error) and IDLE (Idle line detected) flags are cleared
//  534   *           by software sequence: a read operation to UART3_SR register 
//  535   *           (UART3_GetFlagStatus())followed by a read operation to UART3_DR 
//  536   *           register(UART3_ReceiveData8() or UART3_ReceiveData9()).
//  537   *             
//  538   *         - RXNE flag can be also cleared by a read to the UART3_DR register
//  539   *           (UART3_ReceiveData8()or UART3_ReceiveData9()).
//  540   *             
//  541   *         - TC flag can be also cleared by software sequence: a read operation
//  542   *           to UART3_SR register (UART3_GetFlagStatus()) followed by a write 
//  543   *           operation to UART3_DR register (UART3_SendData8() or UART3_SendData9()).
//  544   *             
//  545   *         - TXE flag is cleared only by a write to the UART3_DR register 
//  546   *           (UART3_SendData8() or UART3_SendData9()).
//  547   *             
//  548   *         - SBK flag is cleared during the stop bit of break.
//  549   * @retval None
//  550   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  551 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
//  552 {
UART3_ClearFlag:
        CALL      L:?push_w4
        LDW       S:?w4, X
//  553   /* Check the parameters */
//  554   assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
        LDW       X, S:?w4
        CPW       X, #0x20
        JREQ      L:??UART3_ClearFlag_0
        LDW       X, S:?w4
        CPW       X, #0x302
        JREQ      L:??UART3_ClearFlag_0
        LDW       X, S:?w4
        CPW       X, #0x301
        JREQ      L:??UART3_ClearFlag_0
        LDW       X, S:?w4
        CPW       X, #0x210
        JREQ      L:??UART3_ClearFlag_0
        LDW       X, #0x22a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  555   
//  556   /*Clear the Receive Register Not Empty flag */
//  557   if (UART3_FLAG == UART3_FLAG_RXNE)
??UART3_ClearFlag_0:
        LDW       X, S:?w4
        CPW       X, #0x20
        JRNE      L:??UART3_ClearFlag_1
//  558   {
//  559     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
        MOV       L:0x5240, #0xdf
        JRA       L:??UART3_ClearFlag_2
//  560   }
//  561   /*Clear the LIN Break Detection flag */
//  562   else if (UART3_FLAG == UART3_FLAG_LBDF)
??UART3_ClearFlag_1:
        LDW       X, S:?w4
        CPW       X, #0x210
        JRNE      L:??UART3_ClearFlag_3
//  563   {
//  564     UART3->CR4 &= (uint8_t)(~UART3_CR4_LBDF);
        BRES      L:0x5247, #0x4
        JRA       L:??UART3_ClearFlag_2
//  565   }
//  566   /*Clear the LIN Header Detection Flag */
//  567   else if (UART3_FLAG == UART3_FLAG_LHDF)
??UART3_ClearFlag_3:
        LDW       X, S:?w4
        CPW       X, #0x302
        JRNE      L:??UART3_ClearFlag_4
//  568   {
//  569     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
        BRES      L:0x5249, #0x1
        JRA       L:??UART3_ClearFlag_2
//  570   }
//  571   /*Clear the LIN Synch Field flag */
//  572   else
//  573   {
//  574     UART3->CR6 &= (uint8_t)(~UART3_CR6_LSF);
??UART3_ClearFlag_4:
        BRES      L:0x5249, #0x0
//  575   }
//  576 }
??UART3_ClearFlag_2:
        JP        L:?epilogue_w4
//  577 
//  578 /**
//  579   * @brief  Checks whether the specified UART3 interrupt has occurred or not.
//  580   * @param  UART3_IT: Specifies the UART3 interrupt pending bit to check.
//  581   *         This parameter can be one of the following values:
//  582   *         - UART3_IT_LBDF:  LIN Break detection interrupt
//  583   *         - UART3_IT_TXE:  Transmit Data Register empty interrupt
//  584   *         - UART3_IT_TC:   Transmission complete interrupt
//  585   *         - UART3_IT_RXNE: Receive Data register not empty interrupt
//  586   *         - UART3_IT_IDLE: Idle line detection interrupt
//  587   *         - UART3_IT_OR:  OverRun Error interrupt
//  588   *         - UART3_IT_PE:   Parity Error interrupt
//  589   * @retval The state of UART3_IT (SET or RESET).
//  590   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  591 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
//  592 {
UART3_GetITStatus:
        CALL      L:?push_l2
        CALL      L:?push_w6
        PUSH      S:?b14
        LDW       S:?w4, X
//  593   ITStatus pendingbitstatus = RESET;
        CLR       S:?b10
//  594   uint8_t itpos = 0;
        CLR       S:?b14
//  595   uint8_t itmask1 = 0;
        CLR       S:?b12
//  596   uint8_t itmask2 = 0;
        CLR       S:?b13
//  597   uint8_t enablestatus = 0;
        CLR       S:?b11
//  598   
//  599   /* Check parameters */
//  600   assert_param(IS_UART3_GET_IT_OK(UART3_IT));
        LDW       X, S:?w4
        CPW       X, #0x277
        JREQ      L:??UART3_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x266
        JREQ      L:??UART3_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x255
        JREQ      L:??UART3_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x244
        JREQ      L:??UART3_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x235
        JREQ      L:??UART3_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x346
        JREQ      L:??UART3_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x412
        JREQ      L:??UART3_GetITStatus_0
        LDW       X, S:?w4
        CPW       X, #0x100
        JREQ      L:??UART3_GetITStatus_0
        LDW       X, #0x258
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  601   
//  602   /* Get the UART3 IT index*/
//  603   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
??UART3_GetITStatus_0:
        LD        A, S:?b9
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        LD        S:?b14, A
//  604   /* Get the UART3 IT index*/
//  605   itmask1 = (uint8_t)((uint8_t)UART3_IT >> (uint8_t)4);
        LD        A, S:?b9
        SWAP      A
        AND       A, #0xf
        LD        S:?b12, A
//  606   /* Set the IT mask*/
//  607   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
        CLRW      X
        INCW      X
        LD        A, S:?b12
        CALL      L:?sll16_x_x_a
        LD        A, XL
        LD        S:?b13, A
//  608   
//  609   /* Check the status of the specified UART3 pending bit*/
//  610   if (UART3_IT == UART3_IT_PE)
        LDW       X, S:?w4
        CPW       X, #0x100
        JRNE      L:??UART3_GetITStatus_1
//  611   {
//  612     /* Get the UART3_ITPENDINGBIT enable bit status*/
//  613     enablestatus = (uint8_t)((uint8_t)UART3->CR1 & itmask2);
        LD        A, L:0x5244
        AND       A, S:?b13
        LD        S:?b11, A
//  614     /* Check the status of the specified UART3 interrupt*/
//  615     
//  616     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
        LD        A, L:0x5240
        AND       A, S:?b14
        CP        A, #0x0
        JREQ      L:??UART3_GetITStatus_2
        TNZ       S:?b11
        JREQ      L:??UART3_GetITStatus_2
//  617     {
//  618       /* Interrupt occurred*/
//  619       pendingbitstatus = SET;
        LD        A, #0x1
        LD        S:?b10, A
        JRA       L:??UART3_GetITStatus_3
//  620     }
//  621     else
//  622     {
//  623       /* Interrupt not occurred*/
//  624       pendingbitstatus = RESET;
??UART3_GetITStatus_2:
        CLR       S:?b10
        JRA       L:??UART3_GetITStatus_3
//  625     }
//  626   }
//  627   else if (UART3_IT == UART3_IT_LBDF)
??UART3_GetITStatus_1:
        LDW       X, S:?w4
        CPW       X, #0x346
        JRNE      L:??UART3_GetITStatus_4
//  628   {
//  629     /* Get the UART3_IT enable bit status*/
//  630     enablestatus = (uint8_t)((uint8_t)UART3->CR4 & itmask2);
        LD        A, L:0x5247
        AND       A, S:?b13
        LD        S:?b11, A
//  631     /* Check the status of the specified UART3 interrupt*/
//  632     if (((UART3->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
        LD        A, L:0x5247
        AND       A, S:?b14
        CP        A, #0x0
        JREQ      L:??UART3_GetITStatus_5
        TNZ       S:?b11
        JREQ      L:??UART3_GetITStatus_5
//  633     {
//  634       /* Interrupt occurred*/
//  635       pendingbitstatus = SET;
        LD        A, #0x1
        LD        S:?b10, A
        JRA       L:??UART3_GetITStatus_3
//  636     }
//  637     else
//  638     {
//  639       /* Interrupt not occurred*/
//  640       pendingbitstatus = RESET;
??UART3_GetITStatus_5:
        CLR       S:?b10
        JRA       L:??UART3_GetITStatus_3
//  641     }
//  642   }
//  643   else if (UART3_IT == UART3_IT_LHDF)
??UART3_GetITStatus_4:
        LDW       X, S:?w4
        CPW       X, #0x412
        JRNE      L:??UART3_GetITStatus_6
//  644   {
//  645     /* Get the UART3_IT enable bit status*/
//  646     enablestatus = (uint8_t)((uint8_t)UART3->CR6 & itmask2);
        LD        A, L:0x5249
        AND       A, S:?b13
        LD        S:?b11, A
//  647     /* Check the status of the specified UART3 interrupt*/
//  648     if (((UART3->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
        LD        A, L:0x5249
        AND       A, S:?b14
        CP        A, #0x0
        JREQ      L:??UART3_GetITStatus_7
        TNZ       S:?b11
        JREQ      L:??UART3_GetITStatus_7
//  649     {
//  650       /* Interrupt occurred*/
//  651       pendingbitstatus = SET;
        LD        A, #0x1
        LD        S:?b10, A
        JRA       L:??UART3_GetITStatus_3
//  652     }
//  653     else
//  654     {
//  655       /* Interrupt not occurred*/
//  656       pendingbitstatus = RESET;
??UART3_GetITStatus_7:
        CLR       S:?b10
        JRA       L:??UART3_GetITStatus_3
//  657     }
//  658   }
//  659   else
//  660   {
//  661     /* Get the UART3_IT enable bit status*/
//  662     enablestatus = (uint8_t)((uint8_t)UART3->CR2 & itmask2);
??UART3_GetITStatus_6:
        LD        A, L:0x5245
        AND       A, S:?b13
        LD        S:?b11, A
//  663     /* Check the status of the specified UART3 interrupt*/
//  664     if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
        LD        A, L:0x5240
        AND       A, S:?b14
        CP        A, #0x0
        JREQ      L:??UART3_GetITStatus_8
        TNZ       S:?b11
        JREQ      L:??UART3_GetITStatus_8
//  665     {
//  666       /* Interrupt occurred*/
//  667       pendingbitstatus = SET;
        LD        A, #0x1
        LD        S:?b10, A
        JRA       L:??UART3_GetITStatus_3
//  668     }
//  669     else
//  670     {
//  671       /* Interrupt not occurred*/
//  672       pendingbitstatus = RESET;
??UART3_GetITStatus_8:
        CLR       S:?b10
//  673     }
//  674   }
//  675   /* Return the UART3_IT status*/
//  676   return  pendingbitstatus;
??UART3_GetITStatus_3:
        LD        A, S:?b10
        POP       S:?b14
        JP        L:?epilogue_l2_w6
//  677 }
//  678 
//  679 /**
//  680   * @brief  Clears the UART3 pending flags.
//  681   * @param  UART3_IT specifies the pending bit to clear
//  682   *         This parameter can be one of the following values:
//  683   *         - UART3_IT_LBDF:  LIN Break detection interrupt
//  684   *         - UART3_IT_LHDF:  LIN Header detection interrupt
//  685   *         - UART3_IT_RXNE: Receive Data register not empty interrupt.
//  686   *
//  687   * @note
//  688   *         - PE (Parity error), FE (Framing error), NF (Noise error), 
//  689   *           OR (OverRun error) and IDLE (Idle line detected) pending bits are 
//  690   *           cleared by software sequence: a read operation to UART3_SR register
//  691   *           (UART3_GetITStatus()) followed by a read operation to UART3_DR register 
//  692   *           (UART3_ReceiveData8() or UART3_ReceiveData9()).
//  693   *             
//  694   *         - RXNE pending bit can be also cleared by a read to the UART3_DR register
//  695   *           (UART3_ReceiveData8() or UART3_ReceiveData9() ).
//  696   *             
//  697   *         - TC (Transmit complete) pending bit can be cleared by software 
//  698   *           sequence: a read operation to UART3_SR register (UART3_GetITStatus())
//  699   *           followed by a write operation to UART3_DR register 
//  700   *           (UART3_SendData8()or UART3_SendData9()).
//  701   *             
//  702   *         - TXE pending bit is cleared only by a write to the UART3_DR register
//  703   *           (UART3_SendData8() or UART3_SendData9()).
//  704   * @retval None
//  705   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  706 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
//  707 {
UART3_ClearITPendingBit:
        CALL      L:?push_w4
        LDW       S:?w4, X
//  708   /* Check the parameters */
//  709   assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
        LDW       X, S:?w4
        CPW       X, #0x255
        JREQ      L:??UART3_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x412
        JREQ      L:??UART3_ClearITPendingBit_0
        LDW       X, S:?w4
        CPW       X, #0x346
        JREQ      L:??UART3_ClearITPendingBit_0
        LDW       X, #0x2c5
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  710   
//  711   /*Clear the Receive Register Not Empty pending bit */
//  712   if (UART3_IT == UART3_IT_RXNE)
??UART3_ClearITPendingBit_0:
        LDW       X, S:?w4
        CPW       X, #0x255
        JRNE      L:??UART3_ClearITPendingBit_1
//  713   {
//  714     UART3->SR = (uint8_t)~(UART3_SR_RXNE);
        MOV       L:0x5240, #0xdf
        JRA       L:??UART3_ClearITPendingBit_2
//  715   }
//  716   /*Clear the LIN Break Detection pending bit */
//  717   else if (UART3_IT == UART3_IT_LBDF)
??UART3_ClearITPendingBit_1:
        LDW       X, S:?w4
        CPW       X, #0x346
        JRNE      L:??UART3_ClearITPendingBit_3
//  718   {
//  719     UART3->CR4 &= (uint8_t)~(UART3_CR4_LBDF);
        BRES      L:0x5247, #0x4
        JRA       L:??UART3_ClearITPendingBit_2
//  720   }
//  721   /*Clear the LIN Header Detection pending bit */
//  722   else
//  723   {
//  724     UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
??UART3_ClearITPendingBit_3:
        BRES      L:0x5249, #0x1
//  725   }
//  726 }
??UART3_ClearITPendingBit_2:
        JP        L:?epilogue_w4

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_0:
        DC8 44H, 3AH, 5CH, 53H, 54H, 4DH, 38H, 5CH
        DC8 53H, 6FH, 66H, 74H, 77H, 61H, 72H, 65H
        DC8 5CH, 4CH, 69H, 62H, 72H, 61H, 72H, 69H
        DC8 65H, 73H, 5CH, 53H, 54H, 4DH, 38H, 53H
        DC8 5FH, 53H, 74H, 64H, 50H, 65H, 72H, 69H
        DC8 70H, 68H, 5FH, 44H, 72H, 69H, 76H, 65H
        DC8 72H, 5CH, 73H, 72H, 63H, 5CH, 73H, 74H
        DC8 6DH, 38H, 73H, 5FH, 75H, 61H, 72H, 74H
        DC8 33H, 2EH, 63H, 0

        END
//  727 
//  728 /**
//  729   * @}
//  730   */
//  731   
//  732 /**
//  733   * @}
//  734   */
//  735   
//  736 
//  737 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//    68 bytes in section .near.rodata
// 1 826 bytes in section .near_func.text
// 
// 1 826 bytes of CODE  memory
//    68 bytes of CONST memory
//
//Errors: none
//Warnings: none
