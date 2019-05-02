///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                22/Mar/2019  11:20:54
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\User\stm8l15x_it.c
//    Command line =  
//        -f C:\Users\new06\AppData\Local\Temp\EWB21B.tmp
//        ("G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\User\stm8l15x_it.c"
//        -e -On --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
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
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\Debug\List\stm8l15x_it.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?pop_l0
        EXTERN ?pop_l1
        EXTERN ?push_l0
        EXTERN ?push_l1
        EXTERN TIM4_ClearITPendingBit
        EXTERN TIme4_CallBack

        PUBLIC ADC1_COMP_IRQHandler
        PUBLIC DMA1_CHANNEL0_1_IRQHandler
        PUBLIC DMA1_CHANNEL2_3_IRQHandler
        PUBLIC EXTI0_IRQHandler
        PUBLIC EXTI1_IRQHandler
        PUBLIC EXTI2_IRQHandler
        PUBLIC EXTI3_IRQHandler
        PUBLIC EXTI4_IRQHandler
        PUBLIC EXTI5_IRQHandler
        PUBLIC EXTI6_IRQHandler
        PUBLIC EXTI7_IRQHandler
        PUBLIC EXTIB_G_IRQHandler
        PUBLIC EXTID_H_IRQHandler
        PUBLIC EXTIE_F_PVD_IRQHandler
        PUBLIC FLASH_IRQHandler
        PUBLIC I2C1_SPI2_IRQHandler
        PUBLIC LCD_AES_IRQHandler
        PUBLIC RTC_CSSLSE_IRQHandler
        PUBLIC SPI1_IRQHandler
        PUBLIC SWITCH_CSS_BREAK_DAC_IRQHandler
        PUBLIC TIM1_CC_IRQHandler
        PUBLIC TIM1_UPD_OVF_TRG_COM_IRQHandler
        PUBLIC TIM2_CC_USART2_RX_IRQHandler
        PUBLIC TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
        PUBLIC TIM3_CC_USART3_RX_IRQHandler
        PUBLIC TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
        PUBLIC TIM4_UPD_OVF_TRG_IRQHandler
        PUBLIC TRAP_IRQHandler
        PUBLIC USART1_RX_TIM5_CC_IRQHandler
        PUBLIC USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
        PUBLIC _interrupt_1
        PUBLIC _interrupt_10
        PUBLIC _interrupt_11
        PUBLIC _interrupt_12
        PUBLIC _interrupt_13
        PUBLIC _interrupt_14
        PUBLIC _interrupt_15
        PUBLIC _interrupt_16
        PUBLIC _interrupt_17
        PUBLIC _interrupt_18
        PUBLIC _interrupt_19
        PUBLIC _interrupt_20
        PUBLIC _interrupt_21
        PUBLIC _interrupt_22
        PUBLIC _interrupt_23
        PUBLIC _interrupt_24
        PUBLIC _interrupt_25
        PUBLIC _interrupt_26
        PUBLIC _interrupt_27
        PUBLIC _interrupt_28
        PUBLIC _interrupt_29
        PUBLIC _interrupt_3
        PUBLIC _interrupt_30
        PUBLIC _interrupt_31
        PUBLIC _interrupt_4
        PUBLIC _interrupt_5
        PUBLIC _interrupt_6
        PUBLIC _interrupt_7
        PUBLIC _interrupt_8
        PUBLIC _interrupt_9

// G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\User\stm8l15x_it.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    GPIO/GPIO_Toggle/stm8l15x_it.c
//    4   * @author  MCD Application Team
//    5   * @version V1.5.2
//    6   * @date    30-September-2014
//    7   * @brief   Main Interrupt Service Routines.
//    8   *          This file provides template for all peripherals interrupt service routine.
//    9   ******************************************************************************
//   10   * @attention
//   11   *
//   12   * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
//   13   *
//   14   * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
//   15   * You may not use this file except in compliance with the License.
//   16   * You may obtain a copy of the License at:
//   17   *
//   18   *        http://www.st.com/software_license_agreement_liberty_v2
//   19   *
//   20   * Unless required by applicable law or agreed to in writing, software 
//   21   * distributed under the License is distributed on an "AS IS" BASIS, 
//   22   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   23   * See the License for the specific language governing permissions and
//   24   * limitations under the License.
//   25   *
//   26   ******************************************************************************
//   27   */ 
//   28 
//   29 /* Includes ------------------------------------------------------------------*/
//   30 #include "stm8l15x_it.h"
//   31 
//   32 extern void TIme4_CallBack( void );
//   33 /* Private typedef -----------------------------------------------------------*/
//   34 /* Private define ------------------------------------------------------------*/
//   35 /* Private macro -------------------------------------------------------------*/
//   36 /* Private variables ---------------------------------------------------------*/
//   37 /* Private function prototypes -----------------------------------------------*/
//   38 /* Private functions ---------------------------------------------------------*/
//   39 /* Public functions ----------------------------------------------------------*/
//   40 
//   41 #ifdef _COSMIC_
//   42 /**
//   43   * @brief Dummy interrupt routine
//   44   * @param  None
//   45   * @retval None
//   46   */
//   47 INTERRUPT_HANDLER(NonHandledInterrupt, 0)
//   48 {
//   49   /* In order to detect unexpected events during development,
//   50      it is recommended to set a breakpoint on the following instruction.
//   51   */
//   52 }
//   53 #endif
//   54 
//   55 /**
//   56   * @brief TRAP interrupt routine
//   57   * @param  None
//   58   * @retval None
//   59   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   60 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
//   61 {
//   62   /* In order to detect unexpected events during development,
//   63      it is recommended to set a breakpoint on the following instruction.
//   64   */
//   65 }
TRAP_IRQHandler:
_interrupt_1:
        IRET
//   66 /**
//   67   * @brief FLASH Interrupt routine.
//   68   * @param  None
//   69   * @retval None
//   70   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   71 INTERRUPT_HANDLER(FLASH_IRQHandler, 1)
//   72 {
//   73   /* In order to detect unexpected events during development,
//   74      it is recommended to set a breakpoint on the following instruction.
//   75   */
//   76 }
FLASH_IRQHandler:
_interrupt_3:
        IRET
//   77 /**
//   78   * @brief DMA1 channel0 and channel1 Interrupt routine.
//   79   * @param  None
//   80   * @retval None
//   81   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   82 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler, 2)
//   83 {
//   84   /* In order to detect unexpected events during development,
//   85      it is recommended to set a breakpoint on the following instruction.
//   86   */
//   87 }
DMA1_CHANNEL0_1_IRQHandler:
_interrupt_4:
        IRET
//   88 /**
//   89   * @brief DMA1 channel2 and channel3 Interrupt routine.
//   90   * @param  None
//   91   * @retval None
//   92   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   93 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler, 3)
//   94 {
//   95   /* In order to detect unexpected events during development,
//   96      it is recommended to set a breakpoint on the following instruction.
//   97   */
//   98 }
DMA1_CHANNEL2_3_IRQHandler:
_interrupt_5:
        IRET
//   99 /**
//  100   * @brief RTC / CSS_LSE Interrupt routine.
//  101   * @param  None
//  102   * @retval None
//  103   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  104 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler, 4)
//  105 {
//  106   /* In order to detect unexpected events during development,
//  107      it is recommended to set a breakpoint on the following instruction.
//  108   */
//  109 }
RTC_CSSLSE_IRQHandler:
_interrupt_6:
        IRET
//  110 /**
//  111   * @brief External IT PORTE/ PORTF and PVD Interrupt routine.
//  112   * @param  None
//  113   * @retval None
//  114   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  115 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler, 5)
//  116 {
//  117   /* In order to detect unexpected events during development,
//  118      it is recommended to set a breakpoint on the following instruction.
//  119   */
//  120 }
EXTIE_F_PVD_IRQHandler:
_interrupt_7:
        IRET
//  121 
//  122 /**
//  123   * @brief External IT PORTB / PORTG Interrupt routine.
//  124   * @param  None
//  125   * @retval None
//  126   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  127 INTERRUPT_HANDLER(EXTIB_G_IRQHandler, 6)
//  128 {
//  129   /* In order to detect unexpected events during development,
//  130      it is recommended to set a breakpoint on the following instruction.
//  131   */
//  132 }
EXTIB_G_IRQHandler:
_interrupt_8:
        IRET
//  133 
//  134 /**
//  135   * @brief External IT PORTD /PORTH Interrupt routine.
//  136   * @param  None
//  137   * @retval None
//  138   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  139 INTERRUPT_HANDLER(EXTID_H_IRQHandler, 7)
//  140 {
//  141   /* In order to detect unexpected events during development,
//  142      it is recommended to set a breakpoint on the following instruction.
//  143   */
//  144 }
EXTID_H_IRQHandler:
_interrupt_9:
        IRET
//  145 
//  146 /**
//  147   * @brief External IT PIN0 Interrupt routine.
//  148   * @param  None
//  149   * @retval None
//  150   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  151 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
//  152 {
//  153   /* In order to detect unexpected events during development,
//  154      it is recommended to set a breakpoint on the following instruction.
//  155   */
//  156 }
EXTI0_IRQHandler:
_interrupt_10:
        IRET
//  157 
//  158 /**
//  159   * @brief External IT PIN1 Interrupt routine.
//  160   * @param  None
//  161   * @retval None
//  162   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  163 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
//  164 {
//  165   /* In order to detect unexpected events during development,
//  166      it is recommended to set a breakpoint on the following instruction.
//  167   */
//  168 }
EXTI1_IRQHandler:
_interrupt_11:
        IRET
//  169 
//  170 /**
//  171   * @brief External IT PIN2 Interrupt routine.
//  172   * @param  None
//  173   * @retval None
//  174   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  175 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
//  176 {
//  177   /* In order to detect unexpected events during development,
//  178      it is recommended to set a breakpoint on the following instruction.
//  179   */
//  180 }
EXTI2_IRQHandler:
_interrupt_12:
        IRET
//  181 
//  182 /**
//  183   * @brief External IT PIN3 Interrupt routine.
//  184   * @param  None
//  185   * @retval None
//  186   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  187 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
//  188 {
//  189   /* In order to detect unexpected events during development,
//  190      it is recommended to set a breakpoint on the following instruction.
//  191   */
//  192 }
EXTI3_IRQHandler:
_interrupt_13:
        IRET
//  193 
//  194 /**
//  195   * @brief External IT PIN4 Interrupt routine.
//  196   * @param  None
//  197   * @retval None
//  198   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  199 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
//  200 {
//  201   /* In order to detect unexpected events during development,
//  202      it is recommended to set a breakpoint on the following instruction.
//  203   */
//  204 }
EXTI4_IRQHandler:
_interrupt_14:
        IRET
//  205 
//  206 /**
//  207   * @brief External IT PIN5 Interrupt routine.
//  208   * @param  None
//  209   * @retval None
//  210   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  211 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
//  212 {
//  213   /* In order to detect unexpected events during development,
//  214      it is recommended to set a breakpoint on the following instruction.
//  215   */
//  216 }
EXTI5_IRQHandler:
_interrupt_15:
        IRET
//  217 
//  218 /**
//  219   * @brief External IT PIN6 Interrupt routine.
//  220   * @param  None
//  221   * @retval None
//  222   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  223 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
//  224 {
//  225   /* In order to detect unexpected events during development,
//  226      it is recommended to set a breakpoint on the following instruction.
//  227   */
//  228 }
EXTI6_IRQHandler:
_interrupt_16:
        IRET
//  229 
//  230 /**
//  231   * @brief External IT PIN7 Interrupt routine.
//  232   * @param  None
//  233   * @retval None
//  234   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  235 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
//  236 {
//  237   /* In order to detect unexpected events during development,
//  238      it is recommended to set a breakpoint on the following instruction.
//  239   */
//  240 }
EXTI7_IRQHandler:
_interrupt_17:
        IRET
//  241 /**
//  242   * @brief LCD /AES Interrupt routine.
//  243   * @param  None
//  244   * @retval None
//  245   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  246 INTERRUPT_HANDLER(LCD_AES_IRQHandler, 16)
//  247 {
//  248   /* In order to detect unexpected events during development,
//  249      it is recommended to set a breakpoint on the following instruction.
//  250   */
//  251 }
LCD_AES_IRQHandler:
_interrupt_18:
        IRET
//  252 /**
//  253   * @brief CLK switch/CSS/TIM1 break Interrupt routine.
//  254   * @param  None
//  255   * @retval None
//  256   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  257 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler, 17)
//  258 {
//  259   /* In order to detect unexpected events during development,
//  260      it is recommended to set a breakpoint on the following instruction.
//  261   */
//  262 }
SWITCH_CSS_BREAK_DAC_IRQHandler:
_interrupt_19:
        IRET
//  263 
//  264 /**
//  265   * @brief ADC1/Comparator Interrupt routine.
//  266   * @param  None
//  267   * @retval None
//  268   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  269 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler, 18)
//  270 {
//  271   /* In order to detect unexpected events during development,
//  272      it is recommended to set a breakpoint on the following instruction.
//  273   */
//  274 }
ADC1_COMP_IRQHandler:
_interrupt_20:
        IRET
//  275 
//  276 /**
//  277   * @brief TIM2 Update/Overflow/Trigger/Break /USART2 TX Interrupt routine.
//  278   * @param  None
//  279   * @retval None
//  280   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  281 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler, 19)
//  282 {
//  283   /* In order to detect unexpected events during development,
//  284      it is recommended to set a breakpoint on the following instruction.
//  285   */
//  286 }
TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
_interrupt_21:
        IRET
//  287 
//  288 /**
//  289   * @brief Timer2 Capture/Compare / USART2 RX Interrupt routine.
//  290   * @param  None
//  291   * @retval None
//  292   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  293 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler, 20)
//  294 {
//  295   /* In order to detect unexpected events during development,
//  296      it is recommended to set a breakpoint on the following instruction.
//  297   */
//  298 }
TIM2_CC_USART2_RX_IRQHandler:
_interrupt_22:
        IRET
//  299 
//  300 
//  301 /**
//  302   * @brief Timer3 Update/Overflow/Trigger/Break Interrupt routine.
//  303   * @param  None
//  304   * @retval None
//  305   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  306 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler, 21)
//  307 {
//  308   /* In order to detect unexpected events during development,
//  309      it is recommended to set a breakpoint on the following instruction.
//  310   */
//  311 }
TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
_interrupt_23:
        IRET
//  312 /**
//  313   * @brief Timer3 Capture/Compare /USART3 RX Interrupt routine.
//  314   * @param  None
//  315   * @retval None
//  316   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  317 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler, 22)
//  318 {
//  319   /* In order to detect unexpected events during development,
//  320      it is recommended to set a breakpoint on the following instruction.
//  321   */
//  322 }
TIM3_CC_USART3_RX_IRQHandler:
_interrupt_24:
        IRET
//  323 /**
//  324   * @brief TIM1 Update/Overflow/Trigger/Commutation Interrupt routine.
//  325   * @param  None
//  326   * @retval None
//  327   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  328 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler, 23)
//  329 {
//  330   /* In order to detect unexpected events during development,
//  331      it is recommended to set a breakpoint on the following instruction.
//  332   */
//  333 }
TIM1_UPD_OVF_TRG_COM_IRQHandler:
_interrupt_25:
        IRET
//  334 /**
//  335   * @brief TIM1 Capture/Compare Interrupt routine.
//  336   * @param  None
//  337   * @retval None
//  338   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  339 INTERRUPT_HANDLER(TIM1_CC_IRQHandler, 24)
//  340 {
//  341   /* In order to detect unexpected events during development,
//  342      it is recommended to set a breakpoint on the following instruction.
//  343   */
//  344 }
TIM1_CC_IRQHandler:
_interrupt_26:
        IRET
//  345 
//  346 /**
//  347   * @brief TIM4 Update/Overflow/Trigger Interrupt routine.
//  348   * @param  None
//  349   * @retval None
//  350   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  351 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25)
//  352 {
TIM4_UPD_OVF_TRG_IRQHandler:
_interrupt_27:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALL      L:?push_l0
        CALL      L:?push_l1
//  353   /* In order to detect unexpected events during development,
//  354      it is recommended to set a breakpoint on the following instruction.
//  355   */
//  356   TIme4_CallBack();
        CALL      L:TIme4_CallBack
//  357   TIM4_ClearITPendingBit( TIM4_IT_Update );
        LD        A, #0x1
        CALL      L:TIM4_ClearITPendingBit
//  358 }
        CALL      L:?pop_l1
        CALL      L:?pop_l0
        IRET
//  359 /**
//  360   * @brief SPI1 Interrupt routine.
//  361   * @param  None
//  362   * @retval None
//  363   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  364 INTERRUPT_HANDLER(SPI1_IRQHandler, 26)
//  365 {
//  366   /* In order to detect unexpected events during development,
//  367      it is recommended to set a breakpoint on the following instruction.
//  368   */
//  369 }
SPI1_IRQHandler:
_interrupt_28:
        IRET
//  370 
//  371 /**
//  372   * @brief USART1 TX / TIM5 Update/Overflow/Trigger/Break Interrupt  routine.
//  373   * @param  None
//  374   * @retval None
//  375   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  376 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler, 27)
//  377 {
//  378   /* In order to detect unexpected events during development,
//  379      it is recommended to set a breakpoint on the following instruction.
//  380   */
//  381 }
USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
_interrupt_29:
        IRET
//  382 
//  383 /**
//  384   * @brief USART1 RX / Timer5 Capture/Compare Interrupt routine.
//  385   * @param  None
//  386   * @retval None
//  387   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  388 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler, 28)
//  389 {
//  390   /* In order to detect unexpected events during development,
//  391      it is recommended to set a breakpoint on the following instruction.
//  392   */
//  393 }
USART1_RX_TIM5_CC_IRQHandler:
_interrupt_30:
        IRET
//  394 
//  395 /**
//  396   * @brief I2C1 / SPI2 Interrupt routine.
//  397   * @param  None
//  398   * @retval None
//  399   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  400 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler, 29)
//  401 {
//  402   /* In order to detect unexpected events during development,
//  403      it is recommended to set a breakpoint on the following instruction.
//  404   */
//  405 }
I2C1_SPI2_IRQHandler:
_interrupt_31:
        IRET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  406 
//  407 /**
//  408   * @}
//  409   */
//  410 
//  411 /**
//  412   * @}
//  413   */
//  414 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
// 56 bytes in section .near_func.text
// 
// 56 bytes of CODE memory
//
//Errors: none
//Warnings: none
