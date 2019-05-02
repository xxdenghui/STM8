///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                25/Sep/2018  14:03:54
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        G:\Darren\MCU\STM8\Software\Libraries\STM8S_StdPeriph_Driver\src\stm8s_tim3.c
//    Command line =  
//        -f C:\Users\new06\AppData\Local\Temp\EW6E94.tmp
//        (G:\Darren\MCU\STM8\Software\Libraries\STM8S_StdPeriph_Driver\src\stm8s_tim3.c
//        -e -On --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_cross_call --debug --code_model small --data_model medium -o
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8S)\Debug\Obj"
//        --dlib_config "D:\Program Files (x86)\IAR Systems\Embedded Workbench
//        8.0\stm8\LIB\dlstm8smn.h" -D STM8S -D STM8S207 -lCN
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8S)\Debug\List" -lB
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8S)\Debug\List" -I
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8S)\..\..\Libraries\STM8S_StdPeriph_Driver\inc\"
//        -I
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8S)\..\..\Libraries\Device\"
//        -I
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8S)\..\..\Libraries\HAL\"
//        -I
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8S)\..\..\Libraries\Bus\"
//        -I
//        "G:\Darren\MCU\STM8\Software\Project\Demo(STM8S)\..\..\Libraries\CRC\"
//        -I "G:\Darren\MCU\STM8\Software\Project\Demo(STM8S)\User\" --vregs
//        16)
//    Locale       =  Chinese (Simplified)_CHN.936
//    List file    =  
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8S)\Debug\List\stm8s_tim3.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?and16_x_x_dw
        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_l2_w6
        EXTERN ?epilogue_w4
        EXTERN ?pop_w6
        EXTERN ?push_l2
        EXTERN ?push_w4
        EXTERN ?push_w6
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN ?w6
        EXTERN assert_failed

        PUBLIC TIM3_ARRPreloadConfig
        PUBLIC TIM3_CCxCmd
        PUBLIC TIM3_ClearFlag
        PUBLIC TIM3_ClearITPendingBit
        PUBLIC TIM3_Cmd
        PUBLIC TIM3_DeInit
        PUBLIC TIM3_ForcedOC1Config
        PUBLIC TIM3_ForcedOC2Config
        PUBLIC TIM3_GenerateEvent
        PUBLIC TIM3_GetCapture1
        PUBLIC TIM3_GetCapture2
        PUBLIC TIM3_GetCounter
        PUBLIC TIM3_GetFlagStatus
        PUBLIC TIM3_GetITStatus
        PUBLIC TIM3_GetPrescaler
        PUBLIC TIM3_ICInit
        PUBLIC TIM3_ITConfig
        PUBLIC TIM3_OC1Init
        PUBLIC TIM3_OC1PolarityConfig
        PUBLIC TIM3_OC1PreloadConfig
        PUBLIC TIM3_OC2Init
        PUBLIC TIM3_OC2PolarityConfig
        PUBLIC TIM3_OC2PreloadConfig
        PUBLIC TIM3_PWMIConfig
        PUBLIC TIM3_PrescalerConfig
        PUBLIC TIM3_SelectOCxM
        PUBLIC TIM3_SelectOnePulseMode
        PUBLIC TIM3_SetAutoreload
        PUBLIC TIM3_SetCompare1
        PUBLIC TIM3_SetCompare2
        PUBLIC TIM3_SetCounter
        PUBLIC TIM3_SetIC1Prescaler
        PUBLIC TIM3_SetIC2Prescaler
        PUBLIC TIM3_TimeBaseInit
        PUBLIC TIM3_UpdateDisableConfig
        PUBLIC TIM3_UpdateRequestConfig

// G:\Darren\MCU\STM8\Software\Libraries\STM8S_StdPeriph_Driver\src\stm8s_tim3.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_tim3.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the TIM3 peripheral.
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
//   29 #include "stm8s_tim3.h"
//   30 
//   31 /** @addtogroup STM8S_StdPeriph_Driver
//   32   * @{
//   33   */
//   34 /* Private typedef -----------------------------------------------------------*/
//   35 /* Private define ------------------------------------------------------------*/
//   36 /* Private macro -------------------------------------------------------------*/
//   37 /* Private variables ---------------------------------------------------------*/
//   38 /* Private function prototypes -----------------------------------------------*/
//   39 static void TI1_Config(uint8_t TIM3_ICPolarity, uint8_t TIM3_ICSelection, uint8_t TIM3_ICFilter);
//   40 static void TI2_Config(uint8_t TIM3_ICPolarity, uint8_t TIM3_ICSelection, uint8_t TIM3_ICFilter);
//   41 /**
//   42   * @addtogroup TIM3_Public_Functions
//   43   * @{
//   44   */
//   45 
//   46 /**
//   47   * @brief  Deinitializes the TIM3 peripheral registers to their default reset values.
//   48   * @param  None
//   49   * @retval None
//   50   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   51 void TIM3_DeInit(void)
//   52 {
//   53   TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
TIM3_DeInit:
        CLR       L:0x5320
//   54   TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
        CLR       L:0x5321
//   55   TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
        CLR       L:0x5323
//   56   
//   57   /* Disable channels */
//   58   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
        CLR       L:0x5327
//   59   
//   60   /* Then reset channel registers: it also works if lock level is equal to 2 or 3 */
//   61   TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
        CLR       L:0x5327
//   62   TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
        CLR       L:0x5325
//   63   TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
        CLR       L:0x5326
//   64   TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
        CLR       L:0x5328
//   65   TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
        CLR       L:0x5329
//   66   TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
        CLR       L:0x532a
//   67   TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
        MOV       L:0x532b, #0xff
//   68   TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
        MOV       L:0x532c, #0xff
//   69   TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
        CLR       L:0x532d
//   70   TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
        CLR       L:0x532e
//   71   TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
        CLR       L:0x532f
//   72   TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
        CLR       L:0x5330
//   73   TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
        CLR       L:0x5322
//   74 }
        RET
//   75 
//   76 /**
//   77   * @brief  Initializes the TIM3 Time Base Unit according to the specified parameters.
//   78   * @param    TIM3_Prescaler specifies the Prescaler from TIM3_Prescaler_TypeDef.
//   79   * @param    TIM3_Period specifies the Period value.
//   80   * @retval None
//   81   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   82 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
//   83                         uint16_t TIM3_Period)
//   84 {
TIM3_TimeBaseInit:
        LD        S:?b0, A
//   85   /* Set the Prescaler value */
//   86   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
        LD        A, S:?b0
        LD        L:0x532a, A
//   87   /* Set the Autoreload value */
//   88   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
        LD        A, XH
        LD        L:0x532b, A
//   89   TIM3->ARRL = (uint8_t)(TIM3_Period);
        LD        A, XL
        LD        L:0x532c, A
//   90 }
        RET
//   91 
//   92 /**
//   93   * @brief  Initializes the TIM3 Channel1 according to the specified parameters.
//   94   * @param   TIM3_OCMode specifies the Output Compare mode  from @ref TIM3_OCMode_TypeDef.
//   95   * @param   TIM3_OutputState specifies the Output State  from @ref TIM3_OutputState_TypeDef.
//   96   * @param   TIM3_Pulse specifies the Pulse width  value.
//   97   * @param   TIM3_OCPolarity specifies the Output Compare Polarity  from @ref TIM3_OCPolarity_TypeDef.
//   98   * @retval None
//   99   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  100 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
//  101                   TIM3_OutputState_TypeDef TIM3_OutputState,
//  102                   uint16_t TIM3_Pulse,
//  103                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
//  104 {
TIM3_OC1Init:
        CALL      L:?push_w4
        CALL      L:?push_w6
        PUSH      S:?b10
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        LDW       S:?w6, X
        MOV       S:?b10, S:?b1
//  105   /* Check the parameters */
//  106   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
        TNZ       S:?b8
        JREQ      L:??TIM3_OC1Init_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??TIM3_OC1Init_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??TIM3_OC1Init_0
        LD        A, S:?b8
        CP        A, #0x30
        JREQ      L:??TIM3_OC1Init_0
        LD        A, S:?b8
        CP        A, #0x60
        JREQ      L:??TIM3_OC1Init_0
        LD        A, S:?b8
        CP        A, #0x70
        JREQ      L:??TIM3_OC1Init_0
        LDW       X, #0x6a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  107   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
??TIM3_OC1Init_0:
        TNZ       S:?b9
        JREQ      L:??TIM3_OC1Init_1
        LD        A, S:?b9
        CP        A, #0x11
        JREQ      L:??TIM3_OC1Init_1
        LDW       X, #0x6b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  108   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
??TIM3_OC1Init_1:
        TNZ       S:?b10
        JREQ      L:??TIM3_OC1Init_2
        LD        A, S:?b10
        CP        A, #0x22
        JREQ      L:??TIM3_OC1Init_2
        LDW       X, #0x6c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  109   
//  110   /* Disable the Channel 1: Reset the CCE Bit, Set the Output State , the Output Polarity */
//  111   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
??TIM3_OC1Init_2:
        LD        A, L:0x5327
        AND       A, #0xfc
        LD        L:0x5327, A
//  112   /* Set the Output State &  Set the Output Polarity  */
//  113   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
        LD        A, S:?b10
        AND       A, #0x2
        PUSH      A
        LD        A, S:?b9
        AND       A, #0x1
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        OR        A, L:0x5327
        LD        L:0x5327, A
//  114   
//  115   /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  116   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
        LD        A, L:0x5325
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5325, A
//  117   
//  118   /* Set the Pulse value */
//  119   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
        LD        A, S:?b12
        LD        L:0x532d, A
//  120   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
        LD        A, S:?b13
        LD        L:0x532e, A
//  121 }
        POP       S:?b10
        CALL      L:?pop_w6
        JP        L:?epilogue_w4
//  122 
//  123 /**
//  124   * @brief  Initializes the TIM3 Channel2 according to the specified parameters.
//  125   * @param   TIM3_OCMode specifies the Output Compare mode  from @ref TIM3_OCMode_TypeDef.
//  126   * @param   TIM3_OutputState specifies the Output State  from @ref TIM3_OutputState_TypeDef.
//  127   * @param   TIM3_Pulse specifies the Pulse width  value.
//  128   * @param   TIM3_OCPolarity specifies the Output Compare Polarity  from @ref TIM3_OCPolarity_TypeDef.
//  129   * @retval None
//  130   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  131 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
//  132                   TIM3_OutputState_TypeDef TIM3_OutputState,
//  133                   uint16_t TIM3_Pulse,
//  134                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
//  135 {
TIM3_OC2Init:
        CALL      L:?push_w4
        CALL      L:?push_w6
        PUSH      S:?b10
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        LDW       S:?w6, X
        MOV       S:?b10, S:?b1
//  136   /* Check the parameters */
//  137   assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
        TNZ       S:?b8
        JREQ      L:??TIM3_OC2Init_0
        LD        A, S:?b8
        CP        A, #0x10
        JREQ      L:??TIM3_OC2Init_0
        LD        A, S:?b8
        CP        A, #0x20
        JREQ      L:??TIM3_OC2Init_0
        LD        A, S:?b8
        CP        A, #0x30
        JREQ      L:??TIM3_OC2Init_0
        LD        A, S:?b8
        CP        A, #0x60
        JREQ      L:??TIM3_OC2Init_0
        LD        A, S:?b8
        CP        A, #0x70
        JREQ      L:??TIM3_OC2Init_0
        LDW       X, #0x89
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  138   assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
??TIM3_OC2Init_0:
        TNZ       S:?b9
        JREQ      L:??TIM3_OC2Init_1
        LD        A, S:?b9
        CP        A, #0x11
        JREQ      L:??TIM3_OC2Init_1
        LDW       X, #0x8a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  139   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
??TIM3_OC2Init_1:
        TNZ       S:?b10
        JREQ      L:??TIM3_OC2Init_2
        LD        A, S:?b10
        CP        A, #0x22
        JREQ      L:??TIM3_OC2Init_2
        LDW       X, #0x8b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  140   
//  141   
//  142   /* Disable the Channel 1: Reset the CCE Bit, Set the Output State, the Output Polarity */
//  143   TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
??TIM3_OC2Init_2:
        LD        A, L:0x5327
        AND       A, #0xcf
        LD        L:0x5327, A
//  144   /* Set the Output State & Set the Output Polarity */
//  145   TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
        LD        A, S:?b10
        AND       A, #0x20
        PUSH      A
        LD        A, S:?b9
        AND       A, #0x10
        LD        S:?b1, A
        POP       A
        OR        A, S:?b1
        OR        A, L:0x5327
        LD        L:0x5327, A
//  146   
//  147   
//  148   /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  149   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
        LD        A, L:0x5326
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5326, A
//  150   
//  151   
//  152   /* Set the Pulse value */
//  153   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
        LD        A, S:?b12
        LD        L:0x532f, A
//  154   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
        LD        A, S:?b13
        LD        L:0x5330, A
//  155 }
        POP       S:?b10
        CALL      L:?pop_w6
        JP        L:?epilogue_w4
//  156 
//  157 /**
//  158   * @brief  Initializes the TIM3 peripheral according to the specified parameters.
//  159   * @param    TIM3_Channel specifies the Input Capture Channel from @ref TIM3_Channel_TypeDef.
//  160   * @param   TIM3_ICPolarity specifies the Input Capture Polarity from @ref TIM3_ICPolarity_TypeDef.
//  161   * @param   TIM3_ICSelection specifies the Input Capture Selection from @ref TIM3_ICSelection_TypeDef.
//  162   * @param   TIM3_ICPrescaler specifies the Input Capture Prescaler from @ref TIM3_ICPSC_TypeDef.
//  163   * @param   TIM3_ICFilter specifies the Input Capture Filter value (value can be an integer from 0x00 to 0x0F).
//  164   * @retval None
//  165   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  166 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
//  167                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
//  168                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
//  169                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
//  170                  uint8_t TIM3_ICFilter)
//  171 {
TIM3_ICInit:
        CALL      L:?push_l2
        PUSH      S:?b12
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
        MOV       S:?b11, S:?b1
        MOV       S:?b10, S:?b2
        MOV       S:?b12, S:?b3
//  172   /* Check the parameters */
//  173   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
        TNZ       S:?b8
        JREQ      L:??TIM3_ICInit_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM3_ICInit_0
        LDW       X, #0xad
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  174   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
??TIM3_ICInit_0:
        TNZ       S:?b9
        JREQ      L:??TIM3_ICInit_1
        LD        A, S:?b9
        CP        A, #0x44
        JREQ      L:??TIM3_ICInit_1
        LDW       X, #0xae
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  175   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
??TIM3_ICInit_1:
        LD        A, S:?b11
        CP        A, #0x1
        JREQ      L:??TIM3_ICInit_2
        LD        A, S:?b11
        CP        A, #0x2
        JREQ      L:??TIM3_ICInit_2
        LD        A, S:?b11
        CP        A, #0x3
        JREQ      L:??TIM3_ICInit_2
        LDW       X, #0xaf
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  176   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
??TIM3_ICInit_2:
        TNZ       S:?b10
        JREQ      L:??TIM3_ICInit_3
        LD        A, S:?b10
        CP        A, #0x4
        JREQ      L:??TIM3_ICInit_3
        LD        A, S:?b10
        CP        A, #0x8
        JREQ      L:??TIM3_ICInit_3
        LD        A, S:?b10
        CP        A, #0xc
        JREQ      L:??TIM3_ICInit_3
        LDW       X, #0xb0
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  177   assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
??TIM3_ICInit_3:
        LD        A, S:?b12
        CP        A, #0x10
        JRC       L:??TIM3_ICInit_4
        LDW       X, #0xb1
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  178   
//  179   if (TIM3_Channel != TIM3_CHANNEL_2)
??TIM3_ICInit_4:
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM3_ICInit_5
//  180   {
//  181     /* TI1 Configuration */
//  182     TI1_Config((uint8_t)TIM3_ICPolarity,
//  183                (uint8_t)TIM3_ICSelection,
//  184                (uint8_t)TIM3_ICFilter);
        MOV       S:?b1, S:?b12
        MOV       S:?b0, S:?b11
        LD        A, S:?b9
        CALL      L:TI1_Config
//  185     
//  186     /* Set the Input Capture Prescaler value */
//  187     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM3_SetIC1Prescaler
        JRA       L:??TIM3_ICInit_6
//  188   }
//  189   else
//  190   {
//  191     /* TI2 Configuration */
//  192     TI2_Config((uint8_t)TIM3_ICPolarity,
//  193                (uint8_t)TIM3_ICSelection,
//  194                (uint8_t)TIM3_ICFilter);
??TIM3_ICInit_5:
        MOV       S:?b1, S:?b12
        MOV       S:?b0, S:?b11
        LD        A, S:?b9
        CALL      L:TI2_Config
//  195     
//  196     /* Set the Input Capture Prescaler value */
//  197     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
        LD        A, S:?b10
        CALL      L:TIM3_SetIC2Prescaler
//  198   }
//  199 }
??TIM3_ICInit_6:
        POP       S:?b12
        JP        L:?epilogue_l2
//  200 
//  201 /**
//  202   * @brief  Configures the TIM3 peripheral in PWM Input Mode according to the specified parameters.
//  203   * @param    TIM3_Channel specifies the Input Capture Channel from @ref TIM3_Channel_TypeDef.
//  204   * @param   TIM3_ICPolarity specifies the Input Capture Polarity from @ref TIM3_ICPolarity_TypeDef.
//  205   * @param   TIM3_ICSelection specifies the Input Capture Selection from @ref TIM3_ICSelection_TypeDef.
//  206   * @param   TIM3_ICPrescaler specifies the Input Capture Prescaler from @ref TIM3_ICPSC_TypeDef.
//  207   * @param   TIM3_ICFilter specifies the Input Capture Filter value (value can be an integer from 0x00 to 0x0F).
//  208   * @retval None
//  209   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  210 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
//  211                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
//  212                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
//  213                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
//  214                      uint8_t TIM3_ICFilter)
//  215 {
TIM3_PWMIConfig:
        CALL      L:?push_l2
        CALL      L:?push_w6
        PUSH      S:?b14
        LD        S:?b12, A
        MOV       S:?b8, S:?b0
        MOV       S:?b10, S:?b1
        MOV       S:?b9, S:?b2
        MOV       S:?b11, S:?b3
//  216   uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
        CLR       S:?b14
//  217   uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
        MOV       S:?b13, #0x1
//  218   
//  219   /* Check the parameters */
//  220   assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
        TNZ       S:?b12
        JREQ      L:??TIM3_PWMIConfig_0
        LD        A, S:?b12
        CP        A, #0x1
        JREQ      L:??TIM3_PWMIConfig_0
        LDW       X, #0xdc
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  221   assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
??TIM3_PWMIConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM3_PWMIConfig_1
        LD        A, S:?b8
        CP        A, #0x44
        JREQ      L:??TIM3_PWMIConfig_1
        LDW       X, #0xdd
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  222   assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
??TIM3_PWMIConfig_1:
        LD        A, S:?b10
        CP        A, #0x1
        JREQ      L:??TIM3_PWMIConfig_2
        LD        A, S:?b10
        CP        A, #0x2
        JREQ      L:??TIM3_PWMIConfig_2
        LD        A, S:?b10
        CP        A, #0x3
        JREQ      L:??TIM3_PWMIConfig_2
        LDW       X, #0xde
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  223   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
??TIM3_PWMIConfig_2:
        TNZ       S:?b9
        JREQ      L:??TIM3_PWMIConfig_3
        LD        A, S:?b9
        CP        A, #0x4
        JREQ      L:??TIM3_PWMIConfig_3
        LD        A, S:?b9
        CP        A, #0x8
        JREQ      L:??TIM3_PWMIConfig_3
        LD        A, S:?b9
        CP        A, #0xc
        JREQ      L:??TIM3_PWMIConfig_3
        LDW       X, #0xdf
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  224   
//  225   /* Select the Opposite Input Polarity */
//  226   if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
??TIM3_PWMIConfig_3:
        LD        A, S:?b8
        CP        A, #0x44
        JREQ      L:??TIM3_PWMIConfig_4
//  227   {
//  228     icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
        LD        A, #0x44
        LD        S:?b14, A
        JRA       L:??TIM3_PWMIConfig_5
//  229   }
//  230   else
//  231   {
//  232     icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
??TIM3_PWMIConfig_4:
        CLR       S:?b14
//  233   }
//  234   
//  235   /* Select the Opposite Input */
//  236   if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
??TIM3_PWMIConfig_5:
        LD        A, S:?b10
        CP        A, #0x1
        JRNE      L:??TIM3_PWMIConfig_6
//  237   {
//  238     icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
        LD        A, #0x2
        LD        S:?b13, A
        JRA       L:??TIM3_PWMIConfig_7
//  239   }
//  240   else
//  241   {
//  242     icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
??TIM3_PWMIConfig_6:
        LD        A, #0x1
        LD        S:?b13, A
//  243   }
//  244   
//  245   if (TIM3_Channel != TIM3_CHANNEL_2)
??TIM3_PWMIConfig_7:
        LD        A, S:?b12
        CP        A, #0x1
        JREQ      L:??TIM3_PWMIConfig_8
//  246   {
//  247     /* TI1 Configuration */
//  248     TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
//  249                (uint8_t)TIM3_ICFilter);
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b10
        LD        A, S:?b8
        CALL      L:TI1_Config
//  250     
//  251     /* Set the Input Capture Prescaler value */
//  252     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
        LD        A, S:?b9
        CALL      L:TIM3_SetIC1Prescaler
//  253     
//  254     /* TI2 Configuration */
//  255     TI2_Config(icpolarity, icselection, TIM3_ICFilter);
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b13
        LD        A, S:?b14
        CALL      L:TI2_Config
//  256     
//  257     /* Set the Input Capture Prescaler value */
//  258     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
        LD        A, S:?b9
        CALL      L:TIM3_SetIC2Prescaler
        JRA       L:??TIM3_PWMIConfig_9
//  259   }
//  260   else
//  261   {
//  262     /* TI2 Configuration */
//  263     TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
//  264                (uint8_t)TIM3_ICFilter);
??TIM3_PWMIConfig_8:
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b10
        LD        A, S:?b8
        CALL      L:TI2_Config
//  265     
//  266     /* Set the Input Capture Prescaler value */
//  267     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
        LD        A, S:?b9
        CALL      L:TIM3_SetIC2Prescaler
//  268     
//  269     /* TI1 Configuration */
//  270     TI1_Config(icpolarity, icselection, TIM3_ICFilter);
        MOV       S:?b1, S:?b11
        MOV       S:?b0, S:?b13
        LD        A, S:?b14
        CALL      L:TI1_Config
//  271     
//  272     /* Set the Input Capture Prescaler value */
//  273     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
        LD        A, S:?b9
        CALL      L:TIM3_SetIC1Prescaler
//  274   }
//  275 }
??TIM3_PWMIConfig_9:
        POP       S:?b14
        JP        L:?epilogue_l2_w6
//  276 
//  277 /**
//  278   * @brief  Enables or disables the TIM3 peripheral.
//  279   * @param   NewState new state of the TIM3 peripheral. This parameter can
//  280   * be ENABLE or DISABLE.
//  281   * @retval None
//  282   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  283 void TIM3_Cmd(FunctionalState NewState)
//  284 {
TIM3_Cmd:
        PUSH      S:?b8
        LD        S:?b8, A
//  285   /* Check the parameters */
//  286   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM3_Cmd_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM3_Cmd_0
        LDW       X, #0x11e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  287   
//  288   /* set or Reset the CEN Bit */
//  289   if (NewState != DISABLE)
??TIM3_Cmd_0:
        TNZ       S:?b8
        JREQ      L:??TIM3_Cmd_1
//  290   {
//  291     TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
        BSET      L:0x5320, #0x0
        JRA       L:??TIM3_Cmd_2
//  292   }
//  293   else
//  294   {
//  295     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
??TIM3_Cmd_1:
        BRES      L:0x5320, #0x0
//  296   }
//  297 }
??TIM3_Cmd_2:
        POP       S:?b8
        RET
//  298 
//  299 /**
//  300   * @brief  Enables or disables the specified TIM3 interrupts.
//  301   * @param   NewState new state of the TIM3 peripheral.
//  302   * This parameter can be: ENABLE or DISABLE.
//  303   * @param   TIM3_IT specifies the TIM3 interrupts sources to be enabled or disabled.
//  304   * This parameter can be any combination of the following values:
//  305   *                       - TIM3_IT_UPDATE: TIM3 update Interrupt source
//  306   *                       - TIM3_IT_CC1: TIM3 Capture Compare 1 Interrupt source
//  307   *                       - TIM3_IT_CC2: TIM3 Capture Compare 2 Interrupt source
//  308   *                       - TIM3_IT_CC3: TIM3 Capture Compare 3 Interrupt source
//  309   * @param   NewState new state of the TIM3 peripheral.  * @retval None
//  310   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  311 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
//  312 {
TIM3_ITConfig:
        CALL      L:?push_w4
        LD        S:?b9, A
        MOV       S:?b8, S:?b0
//  313   /* Check the parameters */
//  314   assert_param(IS_TIM3_IT_OK(TIM3_IT));
        TNZ       S:?b9
        JREQ      L:??TIM3_ITConfig_0
        LD        A, S:?b9
        CP        A, #0x8
        JRC       L:??TIM3_ITConfig_1
??TIM3_ITConfig_0:
        LDW       X, #0x13a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  315   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??TIM3_ITConfig_1:
        TNZ       S:?b8
        JREQ      L:??TIM3_ITConfig_2
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM3_ITConfig_2
        LDW       X, #0x13b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  316   
//  317   if (NewState != DISABLE)
??TIM3_ITConfig_2:
        TNZ       S:?b8
        JREQ      L:??TIM3_ITConfig_3
//  318   {
//  319     /* Enable the Interrupt sources */
//  320     TIM3->IER |= (uint8_t)TIM3_IT;
        LD        A, L:0x5321
        OR        A, S:?b9
        LD        L:0x5321, A
        JRA       L:??TIM3_ITConfig_4
//  321   }
//  322   else
//  323   {
//  324     /* Disable the Interrupt sources */
//  325     TIM3->IER &= (uint8_t)(~TIM3_IT);
??TIM3_ITConfig_3:
        LD        A, S:?b9
        CPL       A
        AND       A, L:0x5321
        LD        L:0x5321, A
//  326   }
//  327 }
??TIM3_ITConfig_4:
        JP        L:?epilogue_w4
//  328 
//  329 /**
//  330   * @brief  Enables or Disables the TIM3 Update event.
//  331   * @param   NewState new state of the TIM3 peripheral Preload register. This parameter can
//  332   * be ENABLE or DISABLE.
//  333   * @retval None
//  334   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  335 void TIM3_UpdateDisableConfig(FunctionalState NewState)
//  336 {
TIM3_UpdateDisableConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  337   /* Check the parameters */
//  338   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM3_UpdateDisableConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM3_UpdateDisableConfig_0
        LDW       X, #0x152
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  339   
//  340   /* Set or Reset the UDIS Bit */
//  341   if (NewState != DISABLE)
??TIM3_UpdateDisableConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM3_UpdateDisableConfig_1
//  342   {
//  343     TIM3->CR1 |= TIM3_CR1_UDIS;
        BSET      L:0x5320, #0x1
        JRA       L:??TIM3_UpdateDisableConfig_2
//  344   }
//  345   else
//  346   {
//  347     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
??TIM3_UpdateDisableConfig_1:
        BRES      L:0x5320, #0x1
//  348   }
//  349 }
??TIM3_UpdateDisableConfig_2:
        POP       S:?b8
        RET
//  350 
//  351 /**
//  352   * @brief  Selects the TIM3 Update Request Interrupt source.
//  353   * @param   TIM3_UpdateSource specifies the Update source.
//  354   * This parameter can be one of the following values
//  355   *                       - TIM3_UPDATESOURCE_REGULAR
//  356   *                       - TIM3_UPDATESOURCE_GLOBAL
//  357   * @retval None
//  358   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  359 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
//  360 {
TIM3_UpdateRequestConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  361   /* Check the parameters */
//  362   assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
        TNZ       S:?b8
        JREQ      L:??TIM3_UpdateRequestConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM3_UpdateRequestConfig_0
        LDW       X, #0x16a
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  363   
//  364   /* Set or Reset the URS Bit */
//  365   if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
??TIM3_UpdateRequestConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM3_UpdateRequestConfig_1
//  366   {
//  367     TIM3->CR1 |= TIM3_CR1_URS;
        BSET      L:0x5320, #0x2
        JRA       L:??TIM3_UpdateRequestConfig_2
//  368   }
//  369   else
//  370   {
//  371     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
??TIM3_UpdateRequestConfig_1:
        BRES      L:0x5320, #0x2
//  372   }
//  373 }
??TIM3_UpdateRequestConfig_2:
        POP       S:?b8
        RET
//  374 
//  375 /**
//  376   * @brief  Selects the TIM3’s One Pulse Mode.
//  377   * @param   TIM3_OPMode specifies the OPM Mode to be used.
//  378   * This parameter can be one of the following values
//  379   *                    - TIM3_OPMODE_SINGLE
//  380   *                    - TIM3_OPMODE_REPETITIVE
//  381   * @retval None
//  382   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
//  384 {
TIM3_SelectOnePulseMode:
        PUSH      S:?b8
        LD        S:?b8, A
//  385   /* Check the parameters */
//  386   assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM3_SelectOnePulseMode_0
        TNZ       S:?b8
        JREQ      L:??TIM3_SelectOnePulseMode_0
        LDW       X, #0x182
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  387   
//  388   /* Set or Reset the OPM Bit */
//  389   if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
??TIM3_SelectOnePulseMode_0:
        TNZ       S:?b8
        JREQ      L:??TIM3_SelectOnePulseMode_1
//  390   {
//  391     TIM3->CR1 |= TIM3_CR1_OPM;
        BSET      L:0x5320, #0x3
        JRA       L:??TIM3_SelectOnePulseMode_2
//  392   }
//  393   else
//  394   {
//  395     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
??TIM3_SelectOnePulseMode_1:
        BRES      L:0x5320, #0x3
//  396   }
//  397 }
??TIM3_SelectOnePulseMode_2:
        POP       S:?b8
        RET
//  398 
//  399 /**
//  400   * @brief  Configures the TIM3 Prescaler.
//  401   * @param   Prescaler specifies the Prescaler Register value
//  402   * This parameter can be one of the following values
//  403   *                       -  TIM3_PRESCALER_1
//  404   *                       -  TIM3_PRESCALER_2
//  405   *                       -  TIM3_PRESCALER_4
//  406   *                       -  TIM3_PRESCALER_8
//  407   *                       -  TIM3_PRESCALER_16
//  408   *                       -  TIM3_PRESCALER_32
//  409   *                       -  TIM3_PRESCALER_64
//  410   *                       -  TIM3_PRESCALER_128
//  411   *                       -  TIM3_PRESCALER_256
//  412   *                       -  TIM3_PRESCALER_512
//  413   *                       -  TIM3_PRESCALER_1024
//  414   *                       -  TIM3_PRESCALER_2048
//  415   *                       -  TIM3_PRESCALER_4096
//  416   *                       -  TIM3_PRESCALER_8192
//  417   *                       -  TIM3_PRESCALER_16384
//  418   *                       -  TIM3_PRESCALER_32768
//  419   * @param   TIM3_PSCReloadMode specifies the TIM3 Prescaler Reload mode.
//  420   * This parameter can be one of the following values
//  421   *                       - TIM3_PSCRELOADMODE_IMMEDIATE: The Prescaler is loaded
//  422   *                         immediately.
//  423   *                       - TIM3_PSCRELOADMODE_UPDATE: The Prescaler is loaded at
//  424   *                         the update event.
//  425   * @retval None
//  426   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  427 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
//  428                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
//  429 {
TIM3_PrescalerConfig:
        CALL      L:?push_w4
        LD        S:?b9, A
        MOV       S:?b8, S:?b0
//  430   /* Check the parameters */
//  431   assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
        TNZ       S:?b8
        JREQ      L:??TIM3_PrescalerConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM3_PrescalerConfig_0
        LDW       X, #0x1af
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  432   assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
??TIM3_PrescalerConfig_0:
        TNZ       S:?b9
        JREQ      L:??TIM3_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM3_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x2
        JREQ      L:??TIM3_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x3
        JREQ      L:??TIM3_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x4
        JREQ      L:??TIM3_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x5
        JREQ      L:??TIM3_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x6
        JREQ      L:??TIM3_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x7
        JREQ      L:??TIM3_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x8
        JREQ      L:??TIM3_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0x9
        JREQ      L:??TIM3_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0xa
        JREQ      L:??TIM3_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0xb
        JREQ      L:??TIM3_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0xc
        JREQ      L:??TIM3_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0xd
        JREQ      L:??TIM3_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0xe
        JREQ      L:??TIM3_PrescalerConfig_1
        LD        A, S:?b9
        CP        A, #0xf
        JREQ      L:??TIM3_PrescalerConfig_1
        LDW       X, #0x1b0
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  433   
//  434   /* Set the Prescaler value */
//  435   TIM3->PSCR = (uint8_t)Prescaler;
??TIM3_PrescalerConfig_1:
        LD        A, S:?b9
        LD        L:0x532a, A
//  436   
//  437   /* Set or reset the UG Bit */
//  438   TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
        LD        A, S:?b8
        LD        L:0x5324, A
//  439 }
        JP        L:?epilogue_w4
//  440 
//  441 /**
//  442   * @brief  Forces the TIM3 Channel1 output waveform to active or inactive level.
//  443   * @param   TIM3_ForcedAction specifies the forced Action to be set to the output waveform.
//  444   * This parameter can be one of the following values:
//  445   *                       - TIM3_FORCEDACTION_ACTIVE: Force active level on OC1REF
//  446   *                       - TIM3_FORCEDACTION_INACTIVE: Force inactive level on
//  447   *                         OC1REF.
//  448   * @retval None
//  449   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  450 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
//  451 {
TIM3_ForcedOC1Config:
        PUSH      S:?b8
        LD        S:?b8, A
//  452   /* Check the parameters */
//  453   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
        LD        A, S:?b8
        CP        A, #0x50
        JREQ      L:??TIM3_ForcedOC1Config_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??TIM3_ForcedOC1Config_0
        LDW       X, #0x1c5
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  454   
//  455   /* Reset the OCM Bits & Configure the Forced output Mode */
//  456   TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
??TIM3_ForcedOC1Config_0:
        LD        A, L:0x5325
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5325, A
//  457 }
        POP       S:?b8
        RET
//  458 
//  459 /**
//  460   * @brief  Forces the TIM3 Channel2 output waveform to active or inactive level.
//  461   * @param   TIM3_ForcedAction specifies the forced Action to be set to the output waveform.
//  462   * This parameter can be one of the following values:
//  463   *                       - TIM3_FORCEDACTION_ACTIVE: Force active level on OC2REF
//  464   *                       - TIM3_FORCEDACTION_INACTIVE: Force inactive level on
//  465   *                         OC2REF.
//  466   * @retval None
//  467   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  468 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
//  469 {
TIM3_ForcedOC2Config:
        PUSH      S:?b8
        LD        S:?b8, A
//  470   /* Check the parameters */
//  471   assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
        LD        A, S:?b8
        CP        A, #0x50
        JREQ      L:??TIM3_ForcedOC2Config_0
        LD        A, S:?b8
        CP        A, #0x40
        JREQ      L:??TIM3_ForcedOC2Config_0
        LDW       X, #0x1d7
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  472   
//  473   /* Reset the OCM Bits & Configure the Forced output Mode */
//  474   TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
??TIM3_ForcedOC2Config_0:
        LD        A, L:0x5326
        AND       A, #0x8f
        OR        A, S:?b8
        LD        L:0x5326, A
//  475 }
        POP       S:?b8
        RET
//  476 
//  477 /**
//  478   * @brief  Enables or disables TIM3 peripheral Preload register on ARR.
//  479   * @param   NewState new state of the TIM3 peripheral Preload register.
//  480   * This parameter can be ENABLE or DISABLE.
//  481   * @retval None
//  482   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  483 void TIM3_ARRPreloadConfig(FunctionalState NewState)
//  484 {
TIM3_ARRPreloadConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  485   /* Check the parameters */
//  486   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM3_ARRPreloadConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM3_ARRPreloadConfig_0
        LDW       X, #0x1e6
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  487   
//  488   /* Set or Reset the ARPE Bit */
//  489   if (NewState != DISABLE)
??TIM3_ARRPreloadConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM3_ARRPreloadConfig_1
//  490   {
//  491     TIM3->CR1 |= TIM3_CR1_ARPE;
        BSET      L:0x5320, #0x7
        JRA       L:??TIM3_ARRPreloadConfig_2
//  492   }
//  493   else
//  494   {
//  495     TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
??TIM3_ARRPreloadConfig_1:
        BRES      L:0x5320, #0x7
//  496   }
//  497 }
??TIM3_ARRPreloadConfig_2:
        POP       S:?b8
        RET
//  498 
//  499 /**
//  500   * @brief  Enables or disables the TIM3 peripheral Preload Register on CCR1.
//  501   * @param   NewState new state of the Capture Compare Preload register.
//  502   * This parameter can be ENABLE or DISABLE.
//  503   * @retval None
//  504   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  505 void TIM3_OC1PreloadConfig(FunctionalState NewState)
//  506 {
TIM3_OC1PreloadConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  507   /* Check the parameters */
//  508   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM3_OC1PreloadConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM3_OC1PreloadConfig_0
        LDW       X, #0x1fc
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  509   
//  510   /* Set or Reset the OC1PE Bit */
//  511   if (NewState != DISABLE)
??TIM3_OC1PreloadConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM3_OC1PreloadConfig_1
//  512   {
//  513     TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
        BSET      L:0x5325, #0x3
        JRA       L:??TIM3_OC1PreloadConfig_2
//  514   }
//  515   else
//  516   {
//  517     TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
??TIM3_OC1PreloadConfig_1:
        BRES      L:0x5325, #0x3
//  518   }
//  519 }
??TIM3_OC1PreloadConfig_2:
        POP       S:?b8
        RET
//  520 
//  521 /**
//  522   * @brief  Enables or disables the TIM3 peripheral Preload Register on CCR2.
//  523   * @param   NewState new state of the Capture Compare Preload register.
//  524   * This parameter can be ENABLE or DISABLE.
//  525   * @retval None
//  526   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  527 void TIM3_OC2PreloadConfig(FunctionalState NewState)
//  528 {
TIM3_OC2PreloadConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  529   /* Check the parameters */
//  530   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
        TNZ       S:?b8
        JREQ      L:??TIM3_OC2PreloadConfig_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM3_OC2PreloadConfig_0
        LDW       X, #0x212
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  531   
//  532   /* Set or Reset the OC2PE Bit */
//  533   if (NewState != DISABLE)
??TIM3_OC2PreloadConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM3_OC2PreloadConfig_1
//  534   {
//  535     TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
        BSET      L:0x5326, #0x3
        JRA       L:??TIM3_OC2PreloadConfig_2
//  536   }
//  537   else
//  538   {
//  539     TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
??TIM3_OC2PreloadConfig_1:
        BRES      L:0x5326, #0x3
//  540   }
//  541 }
??TIM3_OC2PreloadConfig_2:
        POP       S:?b8
        RET
//  542 
//  543 /**
//  544   * @brief  Configures the TIM3 event to be generated by software.
//  545   * @param   TIM3_EventSource specifies the event source.
//  546   * This parameter can be one of the following values:
//  547   *                       - TIM3_EVENTSOURCE_UPDATE: TIM3 update Event source
//  548   *                       - TIM3_EVENTSOURCE_CC1: TIM3 Capture Compare 1 Event source
//  549   *                       - TIM3_EVENTSOURCE_CC2: TIM3 Capture Compare 2 Event source
//  550   * @retval None
//  551   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  552 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
//  553 {
TIM3_GenerateEvent:
        PUSH      S:?b8
        LD        S:?b8, A
//  554   /* Check the parameters */
//  555   assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
        TNZ       S:?b8
        JRNE      L:??TIM3_GenerateEvent_0
        LDW       X, #0x22b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  556   
//  557   /* Set the event sources */
//  558   TIM3->EGR = (uint8_t)TIM3_EventSource;
??TIM3_GenerateEvent_0:
        LD        A, S:?b8
        LD        L:0x5324, A
//  559 }
        POP       S:?b8
        RET
//  560 
//  561 /**
//  562   * @brief  Configures the TIM3 Channel 1 polarity.
//  563   * @param   TIM3_OCPolarity specifies the OC1 Polarity.
//  564   * This parameter can be one of the following values:
//  565   *                       - TIM3_OCPOLARITY_LOW: Output Compare active low
//  566   *                       - TIM3_OCPOLARITY_HIGH: Output Compare active high
//  567   * @retval None
//  568   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  569 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
//  570 {
TIM3_OC1PolarityConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  571   /* Check the parameters */
//  572   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
        TNZ       S:?b8
        JREQ      L:??TIM3_OC1PolarityConfig_0
        LD        A, S:?b8
        CP        A, #0x22
        JREQ      L:??TIM3_OC1PolarityConfig_0
        LDW       X, #0x23c
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  573   
//  574   /* Set or Reset the CC1P Bit */
//  575   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
??TIM3_OC1PolarityConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM3_OC1PolarityConfig_1
//  576   {
//  577     TIM3->CCER1 |= TIM3_CCER1_CC1P;
        BSET      L:0x5327, #0x1
        JRA       L:??TIM3_OC1PolarityConfig_2
//  578   }
//  579   else
//  580   {
//  581     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
??TIM3_OC1PolarityConfig_1:
        BRES      L:0x5327, #0x1
//  582   }
//  583 }
??TIM3_OC1PolarityConfig_2:
        POP       S:?b8
        RET
//  584 
//  585 /**
//  586   * @brief  Configures the TIM3 Channel 2 polarity.
//  587   * @param   TIM3_OCPolarity specifies the OC2 Polarity.
//  588   * This parameter can be one of the following values:
//  589   *                       - TIM3_OCPOLARITY_LOW: Output Compare active low
//  590   *                       - TIM3_OCPOLARITY_HIGH: Output Compare active high
//  591   * @retval None
//  592   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  593 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
//  594 {
TIM3_OC2PolarityConfig:
        PUSH      S:?b8
        LD        S:?b8, A
//  595   /* Check the parameters */
//  596   assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
        TNZ       S:?b8
        JREQ      L:??TIM3_OC2PolarityConfig_0
        LD        A, S:?b8
        CP        A, #0x22
        JREQ      L:??TIM3_OC2PolarityConfig_0
        LDW       X, #0x254
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  597   
//  598   /* Set or Reset the CC2P Bit */
//  599   if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
??TIM3_OC2PolarityConfig_0:
        TNZ       S:?b8
        JREQ      L:??TIM3_OC2PolarityConfig_1
//  600   {
//  601     TIM3->CCER1 |= TIM3_CCER1_CC2P;
        BSET      L:0x5327, #0x5
        JRA       L:??TIM3_OC2PolarityConfig_2
//  602   }
//  603   else
//  604   {
//  605     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
??TIM3_OC2PolarityConfig_1:
        BRES      L:0x5327, #0x5
//  606   }
//  607 }
??TIM3_OC2PolarityConfig_2:
        POP       S:?b8
        RET
//  608 
//  609 /**
//  610   * @brief  Enables or disables the TIM3 Capture Compare Channel x.
//  611   * @param   TIM3_Channel specifies the TIM3 Channel.
//  612   * This parameter can be one of the following values:
//  613   *                       - TIM3_CHANNEL_1: TIM3 Channel1
//  614   *                       - TIM3_CHANNEL_2: TIM3 Channel2
//  615   * @param   NewState specifies the TIM3 Channel CCxE bit new state.
//  616   * This parameter can be: ENABLE or DISABLE.
//  617   * @retval None
//  618   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  619 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
//  620 {
TIM3_CCxCmd:
        CALL      L:?push_w4
        LD        S:?b9, A
        MOV       S:?b8, S:?b0
//  621   /* Check the parameters */
//  622   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
        TNZ       S:?b9
        JREQ      L:??TIM3_CCxCmd_0
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??TIM3_CCxCmd_0
        LDW       X, #0x26e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  623   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??TIM3_CCxCmd_0:
        TNZ       S:?b8
        JREQ      L:??TIM3_CCxCmd_1
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM3_CCxCmd_1
        LDW       X, #0x26f
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  624   
//  625   if (TIM3_Channel == TIM3_CHANNEL_1)
??TIM3_CCxCmd_1:
        TNZ       S:?b9
        JRNE      L:??TIM3_CCxCmd_2
//  626   {
//  627     /* Set or Reset the CC1E Bit */
//  628     if (NewState != DISABLE)
        TNZ       S:?b8
        JREQ      L:??TIM3_CCxCmd_3
//  629     {
//  630       TIM3->CCER1 |= TIM3_CCER1_CC1E;
        BSET      L:0x5327, #0x0
        JRA       L:??TIM3_CCxCmd_4
//  631     }
//  632     else
//  633     {
//  634       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
??TIM3_CCxCmd_3:
        BRES      L:0x5327, #0x0
        JRA       L:??TIM3_CCxCmd_4
//  635     }
//  636     
//  637   }
//  638   else
//  639   {
//  640     /* Set or Reset the CC2E Bit */
//  641     if (NewState != DISABLE)
??TIM3_CCxCmd_2:
        TNZ       S:?b8
        JREQ      L:??TIM3_CCxCmd_5
//  642     {
//  643       TIM3->CCER1 |= TIM3_CCER1_CC2E;
        BSET      L:0x5327, #0x4
        JRA       L:??TIM3_CCxCmd_4
//  644     }
//  645     else
//  646     {
//  647       TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
??TIM3_CCxCmd_5:
        BRES      L:0x5327, #0x4
//  648     }
//  649   }
//  650 }
??TIM3_CCxCmd_4:
        JP        L:?epilogue_w4
//  651 
//  652 /**
//  653   * @brief  Selects the TIM3 Output Compare Mode. This function disables the
//  654   * selected channel before changing the Output Compare Mode. User has to
//  655   * enable this channel using TIM3_CCxCmd and TIM3_CCxNCmd functions.
//  656   * @param   TIM3_Channel specifies the TIM3 Channel.
//  657   * This parameter can be one of the following values:
//  658   *                       - TIM3_CHANNEL_1: TIM3 Channel1
//  659   *                       - TIM3_CHANNEL_2: TIM3 Channel2
//  660   * @param   TIM3_OCMode specifies the TIM3 Output Compare Mode.
//  661   * This parameter can be one of the following values:
//  662   *                       - TIM3_OCMODE_TIMING
//  663   *                       - TIM3_OCMODE_ACTIVE
//  664   *                       - TIM3_OCMODE_TOGGLE
//  665   *                       - TIM3_OCMODE_PWM1
//  666   *                       - TIM3_OCMODE_PWM2
//  667   *                       - TIM3_FORCEDACTION_ACTIVE
//  668   *                       - TIM3_FORCEDACTION_INACTIVE
//  669   * @retval None
//  670   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  671 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
//  672 {
TIM3_SelectOCxM:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  673   /* Check the parameters */
//  674   assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
        TNZ       S:?b8
        JREQ      L:??TIM3_SelectOCxM_0
        LD        A, S:?b8
        CP        A, #0x1
        JREQ      L:??TIM3_SelectOCxM_0
        LDW       X, #0x2a2
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  675   assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
??TIM3_SelectOCxM_0:
        TNZ       S:?b9
        JREQ      L:??TIM3_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x10
        JREQ      L:??TIM3_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x20
        JREQ      L:??TIM3_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x30
        JREQ      L:??TIM3_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x60
        JREQ      L:??TIM3_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x70
        JREQ      L:??TIM3_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x50
        JREQ      L:??TIM3_SelectOCxM_1
        LD        A, S:?b9
        CP        A, #0x40
        JREQ      L:??TIM3_SelectOCxM_1
        LDW       X, #0x2a3
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  676   
//  677   if (TIM3_Channel == TIM3_CHANNEL_1)
??TIM3_SelectOCxM_1:
        TNZ       S:?b8
        JRNE      L:??TIM3_SelectOCxM_2
//  678   {
//  679     /* Disable the Channel 1: Reset the CCE Bit */
//  680     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
        BRES      L:0x5327, #0x0
//  681     
//  682     /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  683     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
        LD        A, L:0x5325
        AND       A, #0x8f
        OR        A, S:?b9
        LD        L:0x5325, A
        JRA       L:??TIM3_SelectOCxM_3
//  684   }
//  685   else
//  686   {
//  687     /* Disable the Channel 2: Reset the CCE Bit */
//  688     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
??TIM3_SelectOCxM_2:
        BRES      L:0x5327, #0x4
//  689     
//  690     /* Reset the Output Compare Bits & Set the Output Compare Mode */
//  691     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
        LD        A, L:0x5326
        AND       A, #0x8f
        OR        A, S:?b9
        LD        L:0x5326, A
//  692   }
//  693 }
??TIM3_SelectOCxM_3:
        JP        L:?epilogue_w4
//  694 
//  695 /**
//  696   * @brief  Sets the TIM3 Counter Register value.
//  697   * @param   Counter specifies the Counter register new value.
//  698   * This parameter is between 0x0000 and 0xFFFF.
//  699   * @retval None
//  700   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  701 void TIM3_SetCounter(uint16_t Counter)
//  702 {
//  703   /* Set the Counter Register value */
//  704   TIM3->CNTRH = (uint8_t)(Counter >> 8);
TIM3_SetCounter:
        LD        A, XH
        LD        L:0x5328, A
//  705   TIM3->CNTRL = (uint8_t)(Counter);
        LD        A, XL
        LD        L:0x5329, A
//  706 }
        RET
//  707 
//  708 /**
//  709   * @brief  Sets the TIM3 Autoreload Register value.
//  710   * @param   Autoreload specifies the Autoreload register new value.
//  711   * This parameter is between 0x0000 and 0xFFFF.
//  712   * @retval None
//  713   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  714 void TIM3_SetAutoreload(uint16_t Autoreload)
//  715 {
//  716   /* Set the Autoreload Register value */
//  717   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
TIM3_SetAutoreload:
        LD        A, XH
        LD        L:0x532b, A
//  718   TIM3->ARRL = (uint8_t)(Autoreload);
        LD        A, XL
        LD        L:0x532c, A
//  719 }
        RET
//  720 
//  721 /**
//  722   * @brief  Sets the TIM3 Capture Compare1 Register value.
//  723   * @param   Compare1 specifies the Capture Compare1 register new value.
//  724   * This parameter is between 0x0000 and 0xFFFF.
//  725   * @retval None
//  726   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  727 void TIM3_SetCompare1(uint16_t Compare1)
//  728 {
//  729   /* Set the Capture Compare1 Register value */
//  730   TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
TIM3_SetCompare1:
        LD        A, XH
        LD        L:0x532d, A
//  731   TIM3->CCR1L = (uint8_t)(Compare1);
        LD        A, XL
        LD        L:0x532e, A
//  732 }
        RET
//  733 
//  734 /**
//  735   * @brief  Sets the TIM3 Capture Compare2 Register value.
//  736   * @param   Compare2 specifies the Capture Compare2 register new value.
//  737   * This parameter is between 0x0000 and 0xFFFF.
//  738   * @retval None
//  739   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  740 void TIM3_SetCompare2(uint16_t Compare2)
//  741 {
//  742   /* Set the Capture Compare2 Register value */
//  743   TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
TIM3_SetCompare2:
        LD        A, XH
        LD        L:0x532f, A
//  744   TIM3->CCR2L = (uint8_t)(Compare2);
        LD        A, XL
        LD        L:0x5330, A
//  745 }
        RET
//  746 
//  747 /**
//  748   * @brief  Sets the TIM3 Input Capture 1 prescaler.
//  749   * @param   TIM3_IC1Prescaler specifies the Input Capture prescaler new value
//  750   * This parameter can be one of the following values:
//  751   *                       - TIM3_ICPSC_DIV1: no prescaler
//  752   *                       - TIM3_ICPSC_DIV2: capture is done once every 2 events
//  753   *                       - TIM3_ICPSC_DIV4: capture is done once every 4 events
//  754   *                       - TIM3_ICPSC_DIV8: capture is done once every 8 events
//  755   * @retval None
//  756   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  757 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
//  758 {
TIM3_SetIC1Prescaler:
        PUSH      S:?b8
        LD        S:?b8, A
//  759   /* Check the parameters */
//  760   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
        TNZ       S:?b8
        JREQ      L:??TIM3_SetIC1Prescaler_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??TIM3_SetIC1Prescaler_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??TIM3_SetIC1Prescaler_0
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??TIM3_SetIC1Prescaler_0
        LDW       X, #0x2f8
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  761   
//  762   /* Reset the IC1PSC Bits & Set the IC1PSC value */
//  763   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
??TIM3_SetIC1Prescaler_0:
        LD        A, L:0x5325
        AND       A, #0xf3
        OR        A, S:?b8
        LD        L:0x5325, A
//  764 }
        POP       S:?b8
        RET
//  765 
//  766 /**
//  767   * @brief  Sets the TIM3 Input Capture 2 prescaler.
//  768   * @param   TIM3_IC2Prescaler specifies the Input Capture prescaler new value
//  769   * This parameter can be one of the following values:
//  770   *                       - TIM3_ICPSC_DIV1: no prescaler
//  771   *                       - TIM3_ICPSC_DIV2: capture is done once every 2 events
//  772   *                       - TIM3_ICPSC_DIV4: capture is done once every 4 events
//  773   *                       - TIM3_ICPSC_DIV8: capture is done once every 8 events
//  774   * @retval None
//  775   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  776 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
//  777 {
TIM3_SetIC2Prescaler:
        PUSH      S:?b8
        LD        S:?b8, A
//  778   /* Check the parameters */
//  779   assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
        TNZ       S:?b8
        JREQ      L:??TIM3_SetIC2Prescaler_0
        LD        A, S:?b8
        CP        A, #0x4
        JREQ      L:??TIM3_SetIC2Prescaler_0
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??TIM3_SetIC2Prescaler_0
        LD        A, S:?b8
        CP        A, #0xc
        JREQ      L:??TIM3_SetIC2Prescaler_0
        LDW       X, #0x30b
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  780   
//  781   /* Reset the IC1PSC Bits & Set the IC1PSC value */
//  782   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
??TIM3_SetIC2Prescaler_0:
        LD        A, L:0x5326
        AND       A, #0xf3
        OR        A, S:?b8
        LD        L:0x5326, A
//  783 }
        POP       S:?b8
        RET
//  784 
//  785 /**
//  786   * @brief  Gets the TIM3 Input Capture 1 value.
//  787   * @param  None
//  788   * @retval Capture Compare 1 Register value.
//  789   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  790 uint16_t TIM3_GetCapture1(void)
//  791 {
//  792   /* Get the Capture 1 Register value */
//  793   uint16_t tmpccr1 = 0;
TIM3_GetCapture1:
        CLRW      Y
//  794   uint8_t tmpccr1l=0, tmpccr1h=0;
        CLR       S:?b1
        CLR       S:?b0
//  795   
//  796   tmpccr1h = TIM3->CCR1H;
        LD        A, L:0x532d
        LD        S:?b0, A
//  797   tmpccr1l = TIM3->CCR1L;
        LD        A, L:0x532e
        LD        S:?b1, A
//  798   
//  799   tmpccr1 = (uint16_t)(tmpccr1l);
        CLRW      X
        LD        A, S:?b1
        LD        XL, A
        LDW       Y, X
//  800   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        RLWA      X, A
        LDW       S:?w1, X
        RRWA      Y, A
        OR        A, S:?b3
        RRWA      Y, A
        OR        A, S:?b2
        RRWA      Y, A
//  801   /* Get the Capture 1 Register value */
//  802   return (uint16_t)tmpccr1;
        LDW       X, Y
        RET
//  803 }
//  804 
//  805 /**
//  806   * @brief  Gets the TIM3 Input Capture 2 value.
//  807   * @param  None
//  808   * @retval Capture Compare 2 Register value.
//  809   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  810 uint16_t TIM3_GetCapture2(void)
//  811 {
//  812   /* Get the Capture 2 Register value */
//  813   uint16_t tmpccr2 = 0;
TIM3_GetCapture2:
        CLRW      Y
//  814   uint8_t tmpccr2l=0, tmpccr2h=0;
        CLR       S:?b1
        CLR       S:?b0
//  815   
//  816   tmpccr2h = TIM3->CCR2H;
        LD        A, L:0x532f
        LD        S:?b0, A
//  817   tmpccr2l = TIM3->CCR2L;
        LD        A, L:0x5330
        LD        S:?b1, A
//  818   
//  819   tmpccr2 = (uint16_t)(tmpccr2l);
        CLRW      X
        LD        A, S:?b1
        LD        XL, A
        LDW       Y, X
//  820   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        CLR       A
        RLWA      X, A
        LDW       S:?w1, X
        RRWA      Y, A
        OR        A, S:?b3
        RRWA      Y, A
        OR        A, S:?b2
        RRWA      Y, A
//  821   /* Get the Capture 2 Register value */
//  822   return (uint16_t)tmpccr2;
        LDW       X, Y
        RET
//  823 }
//  824 
//  825 /**
//  826   * @brief  Gets the TIM3 Counter value.
//  827   * @param  None
//  828   * @retval Counter Register value.
//  829   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  830 uint16_t TIM3_GetCounter(void)
//  831 {
//  832   uint16_t tmpcntr = 0;
TIM3_GetCounter:
        CLRW      Y
//  833   
//  834   tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
        LD        A, L:0x5328
        CLRW      X
        LD        XL, A
        CLR       A
        RLWA      X, A
        LDW       Y, X
//  835   /* Get the Counter Register value */
//  836   return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
        LD        A, L:0x5329
        CLR       S:?b0
        LD        S:?b1, A
        LDW       X, Y
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RET
//  837 }
//  838 
//  839 /**
//  840   * @brief  Gets the TIM3 Prescaler value.
//  841   * @param  None
//  842   * @retval Prescaler Register configuration value @ref TIM3_Prescaler_TypeDef.
//  843   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  844 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
//  845 {
//  846   /* Get the Prescaler Register value */
//  847   return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
TIM3_GetPrescaler:
        LD        A, L:0x532a
        RET
//  848 }
//  849 
//  850 /**
//  851   * @brief  Checks whether the specified TIM3 flag is set or not.
//  852   * @param   TIM3_FLAG specifies the flag to check.
//  853   * This parameter can be one of the following values:
//  854   *                       - TIM3_FLAG_UPDATE: TIM3 update Flag
//  855   *                       - TIM3_FLAG_CC1: TIM3 Capture Compare 1 Flag
//  856   *                       - TIM3_FLAG_CC2: TIM3 Capture Compare 2 Flag
//  857   *                       - TIM3_FLAG_CC1OF: TIM3 Capture Compare 1 over capture Flag
//  858   *                       - TIM3_FLAG_CC2OF: TIM3 Capture Compare 2 over capture Flag
//  859   * @retval FlagStatus The new state of TIM3_FLAG (SET or RESET).
//  860   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  861 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
//  862 {
TIM3_GetFlagStatus:
        CALL      L:?push_l2
        PUSH      S:?b12
        LDW       S:?w4, X
//  863   FlagStatus bitstatus = RESET;
        CLR       S:?b10
//  864   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
        CLR       S:?b12
        CLR       S:?b11
//  865   
//  866   /* Check the parameters */
//  867   assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
        LDW       X, S:?w4
        CPW       X, #0x1
        JREQ      L:??TIM3_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x2
        JREQ      L:??TIM3_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x4
        JREQ      L:??TIM3_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x200
        JREQ      L:??TIM3_GetFlagStatus_0
        LDW       X, S:?w4
        CPW       X, #0x400
        JREQ      L:??TIM3_GetFlagStatus_0
        LDW       X, #0x363
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  868   
//  869   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
??TIM3_GetFlagStatus_0:
        LD        A, S:?b9
        AND       A, L:0x5322
        LD        S:?b12, A
//  870   tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
        MOV       S:?b11, S:?b8
//  871   
//  872   if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
        LD        A, L:0x5323
        AND       A, S:?b11
        OR        A, S:?b12
        CP        A, #0x0
        JREQ      L:??TIM3_GetFlagStatus_1
//  873   {
//  874     bitstatus = SET;
        LD        A, #0x1
        LD        S:?b10, A
        JRA       L:??TIM3_GetFlagStatus_2
//  875   }
//  876   else
//  877   {
//  878     bitstatus = RESET;
??TIM3_GetFlagStatus_1:
        CLR       S:?b10
//  879   }
//  880   return (FlagStatus)bitstatus;
??TIM3_GetFlagStatus_2:
        LD        A, S:?b10
        POP       S:?b12
        JP        L:?epilogue_l2
//  881 }
//  882 
//  883 /**
//  884   * @brief  Clears the TIM3’s pending flags.
//  885   * @param   TIM3_FLAG specifies the flag to clear.
//  886   * This parameter can be one of the following values:
//  887   *                       - TIM3_FLAG_UPDATE: TIM3 update Flag
//  888   *                       - TIM3_FLAG_CC1: TIM3 Capture Compare 1 Flag
//  889   *                       - TIM3_FLAG_CC2: TIM3 Capture Compare 2 Flag
//  890   *                       - TIM3_FLAG_CC1OF: TIM3 Capture Compare 1 over capture Flag
//  891   *                       - TIM3_FLAG_CC2OF: TIM3 Capture Compare 2 over capture Flag
//  892   * @retval None.
//  893   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  894 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
//  895 {
TIM3_ClearFlag:
        CALL      L:?push_w4
        LDW       S:?w4, X
//  896   /* Check the parameters */
//  897   assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
        LDW       X, S:?w4
        CALL      L:?and16_x_x_dw
        DATA
        DC16      0xf9f8
        CODE
        TNZW      X
        JRNE      L:??TIM3_ClearFlag_0
        LDW       X, S:?w4
        TNZW      X
        JRNE      L:??TIM3_ClearFlag_1
??TIM3_ClearFlag_0:
        LDW       X, #0x381
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  898   
//  899   /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ‘1’ has no effect*/
//  900   TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
??TIM3_ClearFlag_1:
        LD        A, S:?b9
        CPL       A
        LD        L:0x5322, A
//  901   TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
        LD        A, S:?b8
        CPL       A
        LD        L:0x5323, A
//  902 }
        JP        L:?epilogue_w4
//  903 
//  904 /**
//  905   * @brief  Checks whether the TIM3 interrupt has occurred or not.
//  906   * @param   TIM3_IT specifies the TIM3 interrupt source to check.
//  907   * This parameter can be one of the following values:
//  908   *                       - TIM3_IT_UPDATE: TIM3 update Interrupt source
//  909   *                       - TIM3_IT_CC1: TIM3 Capture Compare 1 Interrupt source
//  910   *                       - TIM3_IT_CC2: TIM3 Capture Compare 2 Interrupt source
//  911   * @retval ITStatus The new state of the TIM3_IT(SET or RESET).
//  912   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  913 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
//  914 {
TIM3_GetITStatus:
        CALL      L:?push_l2
        LD        S:?b11, A
//  915   ITStatus bitstatus = RESET;
        CLR       S:?b8
//  916   uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
        CLR       S:?b9
        CLR       S:?b10
//  917   
//  918   /* Check the parameters */
//  919   assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
        LD        A, S:?b11
        CP        A, #0x1
        JREQ      L:??TIM3_GetITStatus_0
        LD        A, S:?b11
        CP        A, #0x2
        JREQ      L:??TIM3_GetITStatus_0
        LD        A, S:?b11
        CP        A, #0x4
        JREQ      L:??TIM3_GetITStatus_0
        LDW       X, #0x397
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  920   
//  921   TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
??TIM3_GetITStatus_0:
        LD        A, L:0x5322
        AND       A, S:?b11
        LD        S:?b9, A
//  922   
//  923   TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
        LD        A, L:0x5321
        AND       A, S:?b11
        LD        S:?b10, A
//  924   
//  925   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
        TNZ       S:?b9
        JREQ      L:??TIM3_GetITStatus_1
        TNZ       S:?b10
        JREQ      L:??TIM3_GetITStatus_1
//  926   {
//  927     bitstatus = SET;
        LD        A, #0x1
        LD        S:?b8, A
        JRA       L:??TIM3_GetITStatus_2
//  928   }
//  929   else
//  930   {
//  931     bitstatus = RESET;
??TIM3_GetITStatus_1:
        CLR       S:?b8
//  932   }
//  933   return (ITStatus)(bitstatus);
??TIM3_GetITStatus_2:
        LD        A, S:?b8
        JP        L:?epilogue_l2
//  934 }
//  935 
//  936 /**
//  937   * @brief  Clears the TIM3's interrupt pending bits.
//  938   * @param   TIM3_IT specifies the pending bit to clear.
//  939   * This parameter can be one of the following values:
//  940   *                       - TIM3_IT_UPDATE: TIM3 update Interrupt source
//  941   *                       - TIM3_IT_CC1: TIM3 Capture Compare 1 Interrupt source
//  942   *                       - TIM3_IT_CC2: TIM3 Capture Compare 2 Interrupt source
//  943   * @retval None.
//  944   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  945 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
//  946 {
TIM3_ClearITPendingBit:
        PUSH      S:?b8
        LD        S:?b8, A
//  947   /* Check the parameters */
//  948   assert_param(IS_TIM3_IT_OK(TIM3_IT));
        TNZ       S:?b8
        JREQ      L:??TIM3_ClearITPendingBit_0
        LD        A, S:?b8
        CP        A, #0x8
        JRC       L:??TIM3_ClearITPendingBit_1
??TIM3_ClearITPendingBit_0:
        LDW       X, #0x3b4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  949   
//  950   /* Clear the IT pending Bit */
//  951   TIM3->SR1 = (uint8_t)(~TIM3_IT);
??TIM3_ClearITPendingBit_1:
        LD        A, S:?b8
        CPL       A
        LD        L:0x5322, A
//  952 }
        POP       S:?b8
        RET
//  953 
//  954 /**
//  955   * @brief  Configure the TI1 as Input.
//  956   * @param   TIM3_ICPolarity  The Input Polarity.
//  957   * This parameter can be one of the following values:
//  958   *                       - TIM3_ICPOLARITY_FALLING
//  959   *                       - TIM3_ICPOLARITY_RISING
//  960   * @param   TIM3_ICSelection specifies the input to be used.
//  961   * This parameter can be one of the following values:
//  962   *                       - TIM3_ICSELECTION_DIRECTTI: TIM3 Input 1 is selected to
//  963   *                         be connected to IC1.
//  964   *                       - TIM3_ICSELECTION_INDIRECTTI: TIM3 Input 1 is selected to
//  965   *                         be connected to IC2.
//  966   * @param   TIM3_ICFilter Specifies the Input Capture Filter.
//  967   * This parameter must be a value between 0x00 and 0x0F.
//  968   * @retval None
//  969   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  970 static void TI1_Config(uint8_t TIM3_ICPolarity,
//  971                        uint8_t TIM3_ICSelection,
//  972                        uint8_t TIM3_ICFilter)
//  973 {
TI1_Config:
        LD        S:?b2, A
//  974   /* Disable the Channel 1: Reset the CCE Bit */
//  975   TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
        BRES      L:0x5327, #0x0
//  976   
//  977   /* Select the Input and set the filter */
//  978   TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
        LD        A, S:?b1
        SWAP      A
        AND       A, #0xf0
        OR        A, S:?b0
        PUSH      A
        LD        A, L:0x5325
        AND       A, #0xc
        LD        S:?b4, A
        POP       A
        OR        A, S:?b4
        LD        L:0x5325, A
//  979   
//  980   /* Select the Polarity */
//  981   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI1_Config_0
//  982   {
//  983     TIM3->CCER1 |= TIM3_CCER1_CC1P;
        BSET      L:0x5327, #0x1
        JRA       L:??TI1_Config_1
//  984   }
//  985   else
//  986   {
//  987     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
??TI1_Config_0:
        BRES      L:0x5327, #0x1
//  988   }
//  989   /* Set the CCE Bit */
//  990   TIM3->CCER1 |= TIM3_CCER1_CC1E;
??TI1_Config_1:
        BSET      L:0x5327, #0x0
//  991 }
        RET
//  992 
//  993 /**
//  994   * @brief  Configure the TI2 as Input.
//  995   * @param   TIM3_ICPolarity  The Input Polarity.
//  996   * This parameter can be one of the following values:
//  997   *                       - TIM3_ICPOLARITY_FALLING
//  998   *                       - TIM3_ICPOLARITY_RISING
//  999   * @param   TIM3_ICSelection specifies the input to be used.
// 1000   * This parameter can be one of the following values:
// 1001   *                       - TIM3_ICSELECTION_DIRECTTI: TIM3 Input 2 is selected to
// 1002   *                         be connected to IC2.
// 1003   *                       - TIM3_ICSELECTION_INDIRECTTI: TIM3 Input 2 is selected to
// 1004   *                         be connected to IC1.
// 1005   * @param   TIM3_ICFilter Specifies the Input Capture Filter.
// 1006   * This parameter must be a value between 0x00 and 0x0F.
// 1007   * @retval None
// 1008   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1009 static void TI2_Config(uint8_t TIM3_ICPolarity,
// 1010                        uint8_t TIM3_ICSelection,
// 1011                        uint8_t TIM3_ICFilter)
// 1012 {
TI2_Config:
        LD        S:?b2, A
// 1013   /* Disable the Channel 2: Reset the CCE Bit */
// 1014   TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
        BRES      L:0x5327, #0x4
// 1015   
// 1016   /* Select the Input and set the filter */
// 1017   TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
// 1018                                                               TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
// 1019                                                                                                 ((uint8_t)( TIM3_ICFilter << 4))));
        LD        A, S:?b1
        SWAP      A
        AND       A, #0xf0
        OR        A, S:?b0
        PUSH      A
        LD        A, L:0x5326
        AND       A, #0xc
        LD        S:?b4, A
        POP       A
        OR        A, S:?b4
        LD        L:0x5326, A
// 1020   
// 1021   /* Select the Polarity */
// 1022   if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
        TNZ       S:?b2
        JREQ      L:??TI2_Config_0
// 1023   {
// 1024     TIM3->CCER1 |= TIM3_CCER1_CC2P;
        BSET      L:0x5327, #0x5
        JRA       L:??TI2_Config_1
// 1025   }
// 1026   else
// 1027   {
// 1028     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
??TI2_Config_0:
        BRES      L:0x5327, #0x5
// 1029   }
// 1030   
// 1031   /* Set the CCE Bit */
// 1032   TIM3->CCER1 |= TIM3_CCER1_CC2E;
??TI2_Config_1:
        BSET      L:0x5327, #0x4
// 1033 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
?_0:
        DC8 47H, 3AH, 5CH, 44H, 61H, 72H, 72H, 65H
        DC8 6EH, 5CH, 4DH, 43H, 55H, 5CH, 53H, 54H
        DC8 4DH, 38H, 5CH, 53H, 6FH, 66H, 74H, 77H
        DC8 61H, 72H, 65H, 5CH, 4CH, 69H, 62H, 72H
        DC8 61H, 72H, 69H, 65H, 73H, 5CH, 53H, 54H
        DC8 4DH, 38H, 53H, 5FH, 53H, 74H, 64H, 50H
        DC8 65H, 72H, 69H, 70H, 68H, 5FH, 44H, 72H
        DC8 69H, 76H, 65H, 72H, 5CH, 73H, 72H, 63H
        DC8 5CH, 73H, 74H, 6DH, 38H, 73H, 5FH, 74H
        DC8 69H, 6DH, 33H, 2EH, 63H, 0

        END
// 1034 
// 1035 /**
// 1036   * @}
// 1037   */
// 1038   
// 1039   /**
// 1040   * @}
// 1041   */
// 1042   
// 1043 
// 1044 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//    78 bytes in section .near.rodata
// 2 505 bytes in section .near_func.text
// 
// 2 505 bytes of CODE  memory
//    78 bytes of CONST memory
//
//Errors: none
//Warnings: none
