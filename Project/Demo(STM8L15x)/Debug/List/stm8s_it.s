///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                09/Jun/2018  22:57:26
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  D:\STM8\Software\Project\Demo(STM8S)\User\stm8s_it.c
//    Command line =  
//        -f C:\Users\ADMINI~1\AppData\Local\Temp\EWF5DD.tmp
//        ("D:\STM8\Software\Project\Demo(STM8S)\User\stm8s_it.c" -e -On
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
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
//        D:\STM8\Software\Project\Demo(STM8S)\Debug\List\stm8s_it.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?pop_l0
        EXTERN ?pop_l1
        EXTERN ?push_l0
        EXTERN ?push_l1
        EXTERN TIM4_ClearITPendingBit
        EXTERN TIM4_UPD_OVF_Handler

        PUBLIC ADC2_IRQHandler
        PUBLIC AWU_IRQHandler
        PUBLIC CLK_IRQHandler
        PUBLIC EEPROM_EEC_IRQHandler
        PUBLIC EXTI_PORTA_IRQHandler
        PUBLIC EXTI_PORTB_IRQHandler
        PUBLIC EXTI_PORTC_IRQHandler
        PUBLIC EXTI_PORTD_IRQHandler
        PUBLIC EXTI_PORTE_IRQHandler
        PUBLIC I2C_IRQHandler
        PUBLIC SPI_IRQHandler
        PUBLIC TIM1_CAP_COM_IRQHandler
        PUBLIC TIM1_UPD_OVF_TRG_BRK_IRQHandler
        PUBLIC TIM2_CAP_COM_IRQHandler
        PUBLIC TIM2_UPD_OVF_BRK_IRQHandler
        PUBLIC TIM3_CAP_COM_IRQHandler
        PUBLIC TIM3_UPD_OVF_BRK_IRQHandler
        PUBLIC TIM4_UPD_OVF_IRQHandler
        PUBLIC TLI_IRQHandler
        PUBLIC TRAP_IRQHandler
        PUBLIC UART1_RX_IRQHandler
        PUBLIC UART1_TX_IRQHandler
        PUBLIC UART3_RX_IRQHandler
        PUBLIC UART3_TX_IRQHandler
        PUBLIC _interrupt_1
        PUBLIC _interrupt_12
        PUBLIC _interrupt_13
        PUBLIC _interrupt_14
        PUBLIC _interrupt_15
        PUBLIC _interrupt_16
        PUBLIC _interrupt_17
        PUBLIC _interrupt_18
        PUBLIC _interrupt_19
        PUBLIC _interrupt_2
        PUBLIC _interrupt_20
        PUBLIC _interrupt_21
        PUBLIC _interrupt_22
        PUBLIC _interrupt_23
        PUBLIC _interrupt_24
        PUBLIC _interrupt_25
        PUBLIC _interrupt_26
        PUBLIC _interrupt_3
        PUBLIC _interrupt_4
        PUBLIC _interrupt_5
        PUBLIC _interrupt_6
        PUBLIC _interrupt_7
        PUBLIC _interrupt_8
        PUBLIC _interrupt_9

// D:\STM8\Software\Project\Demo(STM8S)\User\stm8s_it.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file     stm8s_it.c
//    4   * @author   MCD Application Team
//    5   * @version  V2.1.0
//    6   * @date     18-November-2011
//    7   * @brief    Main Interrupt Service Routines.
//    8   *           This file provides template for all peripherals interrupt service 
//    9   *           routine.
//   10   ******************************************************************************
//   11   * @attention
//   12   *
//   13   * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
//   14   * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
//   15   * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
//   16   * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
//   17   * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
//   18   * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
//   19   *
//   20   * <h2><center>&copy; COPYRIGHT 2011 STMicroelectronics</center></h2>
//   21   ******************************************************************************
//   22   */ 
//   23 
//   24 /* Includes ------------------------------------------------------------------*/
//   25 #include "stm8s_it.h"
//   26 
//   27 /** @addtogroup Template_Project
//   28   * @{
//   29   */
//   30 
//   31 /* Private typedef -----------------------------------------------------------*/
//   32 /* Private define ------------------------------------------------------------*/
//   33 /* Private macro -------------------------------------------------------------*/
//   34 /* Private variables ---------------------------------------------------------*/
//   35 
//   36 /* Private function prototypes -----------------------------------------------*/
//   37 extern void TIM4_UPD_OVF_Handler( void );
//   38 /* Private functions ---------------------------------------------------------*/
//   39 /* Public functions ----------------------------------------------------------*/
//   40 
//   41 #ifdef _COSMIC_
//   42 /**
//   43   * @brief Dummy Interrupt routine
//   44   * @par Parameters:
//   45   * None
//   46   * @retval
//   47   * None
//   48 */
//   49 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
//   50 {
//   51   /* In order to detect unexpected events during development,
//   52      it is recommended to set a breakpoint on the following instruction.
//   53   */
//   54 }
//   55 #endif /*_COSMIC_*/
//   56 
//   57 /**
//   58   * @brief TRAP Interrupt routine
//   59   * @param  None
//   60   * @retval None
//   61   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   62 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
//   63 {
//   64   /* In order to detect unexpected events during development,
//   65      it is recommended to set a breakpoint on the following instruction.
//   66   */
//   67 }
TRAP_IRQHandler:
_interrupt_1:
        IRET
//   68 
//   69 /**
//   70   * @brief Top Level Interrupt routine.
//   71   * @param  None
//   72   * @retval None
//   73   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   74 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
//   75 
//   76 {
//   77   /* In order to detect unexpected events during development,
//   78      it is recommended to set a breakpoint on the following instruction.
//   79   */
//   80 }
TLI_IRQHandler:
_interrupt_2:
        IRET
//   81 
//   82 /**
//   83   * @brief Auto Wake Up Interrupt routine.
//   84   * @param  None
//   85   * @retval None
//   86   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   87 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
//   88 {
//   89   /* In order to detect unexpected events during development,
//   90      it is recommended to set a breakpoint on the following instruction.
//   91   */
//   92 }
AWU_IRQHandler:
_interrupt_3:
        IRET
//   93 
//   94 /**
//   95   * @brief Clock Controller Interrupt routine.
//   96   * @param  None
//   97   * @retval None
//   98   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   99 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
//  100 {
//  101   /* In order to detect unexpected events during development,
//  102      it is recommended to set a breakpoint on the following instruction.
//  103   */
//  104 }
CLK_IRQHandler:
_interrupt_4:
        IRET
//  105 
//  106 /**
//  107   * @brief External Interrupt PORTA Interrupt routine.
//  108   * @param  None
//  109   * @retval None
//  110   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  111 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
//  112 {
//  113   /* In order to detect unexpected events during development,
//  114      it is recommended to set a breakpoint on the following instruction.
//  115   */
//  116 }
EXTI_PORTA_IRQHandler:
_interrupt_5:
        IRET
//  117 
//  118 /**
//  119   * @brief External Interrupt PORTB Interrupt routine.
//  120   * @param  None
//  121   * @retval None
//  122   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  123 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
//  124 {
//  125   /* In order to detect unexpected events during development,
//  126      it is recommended to set a breakpoint on the following instruction.
//  127   */
//  128 }
EXTI_PORTB_IRQHandler:
_interrupt_6:
        IRET
//  129 
//  130 /**
//  131   * @brief External Interrupt PORTC Interrupt routine.
//  132   * @param  None
//  133   * @retval None
//  134   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  135 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
//  136 {
//  137   /* In order to detect unexpected events during development,
//  138      it is recommended to set a breakpoint on the following instruction.
//  139   */
//  140 }
EXTI_PORTC_IRQHandler:
_interrupt_7:
        IRET
//  141 
//  142 /**
//  143   * @brief External Interrupt PORTD Interrupt routine.
//  144   * @param  None
//  145   * @retval None
//  146   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  147 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
//  148 {
//  149   /* In order to detect unexpected events during development,
//  150      it is recommended to set a breakpoint on the following instruction.
//  151   */
//  152 }
EXTI_PORTD_IRQHandler:
_interrupt_8:
        IRET
//  153 
//  154 /**
//  155   * @brief External Interrupt PORTE Interrupt routine.
//  156   * @param  None
//  157   * @retval None
//  158   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  159 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
//  160 {
//  161   /* In order to detect unexpected events during development,
//  162      it is recommended to set a breakpoint on the following instruction.
//  163   */
//  164 }
EXTI_PORTE_IRQHandler:
_interrupt_9:
        IRET
//  165 
//  166 #ifdef STM8S903
//  167 /**
//  168   * @brief External Interrupt PORTF Interrupt routine.
//  169   * @param  None
//  170   * @retval None
//  171   */
//  172  INTERRUPT_HANDLER(EXTI_PORTF_IRQHandler, 8)
//  173  {
//  174   /* In order to detect unexpected events during development,
//  175      it is recommended to set a breakpoint on the following instruction.
//  176   */
//  177  }
//  178 #endif /*STM8S903*/
//  179 
//  180 #if defined (STM8S208) || defined (STM8AF52Ax)
//  181 /**
//  182   * @brief CAN RX Interrupt routine.
//  183   * @param  None
//  184   * @retval None
//  185   */
//  186  INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
//  187  {
//  188   /* In order to detect unexpected events during development,
//  189      it is recommended to set a breakpoint on the following instruction.
//  190   */
//  191  }
//  192 
//  193 /**
//  194   * @brief CAN TX Interrupt routine.
//  195   * @param  None
//  196   * @retval None
//  197   */
//  198  INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
//  199  {
//  200   /* In order to detect unexpected events during development,
//  201      it is recommended to set a breakpoint on the following instruction.
//  202   */
//  203  }
//  204 #endif /*STM8S208 || STM8AF52Ax */
//  205 
//  206 /**
//  207   * @brief SPI Interrupt routine.
//  208   * @param  None
//  209   * @retval None
//  210   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  211 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
//  212 {
//  213   /* In order to detect unexpected events during development,
//  214      it is recommended to set a breakpoint on the following instruction.
//  215   */
//  216 }
SPI_IRQHandler:
_interrupt_12:
        IRET
//  217 
//  218 /**
//  219   * @brief Timer1 Update/Overflow/Trigger/Break Interrupt routine.
//  220   * @param  None
//  221   * @retval None
//  222   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  223 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
//  224 {
//  225   /* In order to detect unexpected events during development,
//  226      it is recommended to set a breakpoint on the following instruction.
//  227   */
//  228 }
TIM1_UPD_OVF_TRG_BRK_IRQHandler:
_interrupt_13:
        IRET
//  229 
//  230 /**
//  231   * @brief Timer1 Capture/Compare Interrupt routine.
//  232   * @param  None
//  233   * @retval None
//  234   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  235 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
//  236 {
//  237   /* In order to detect unexpected events during development,
//  238      it is recommended to set a breakpoint on the following instruction.
//  239   */
//  240 }
TIM1_CAP_COM_IRQHandler:
_interrupt_14:
        IRET
//  241 
//  242 #ifdef STM8S903
//  243 /**
//  244   * @brief Timer5 Update/Overflow/Break/Trigger Interrupt routine.
//  245   * @param  None
//  246   * @retval None
//  247   */
//  248  INTERRUPT_HANDLER(TIM5_UPD_OVF_BRK_TRG_IRQHandler, 13)
//  249  {
//  250   /* In order to detect unexpected events during development,
//  251      it is recommended to set a breakpoint on the following instruction.
//  252   */
//  253  }
//  254  
//  255 /**
//  256   * @brief Timer5 Capture/Compare Interrupt routine.
//  257   * @param  None
//  258   * @retval None
//  259   */
//  260  INTERRUPT_HANDLER(TIM5_CAP_COM_IRQHandler, 14)
//  261  {
//  262   /* In order to detect unexpected events during development,
//  263      it is recommended to set a breakpoint on the following instruction.
//  264   */
//  265  }
//  266 
//  267 #else /*STM8S208, STM8S207, STM8S105 or STM8S103 or STM8AF62Ax or STM8AF52Ax or STM8AF626x */
//  268 /**
//  269   * @brief Timer2 Update/Overflow/Break Interrupt routine.
//  270   * @param  None
//  271   * @retval None
//  272   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  273  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
//  274  {
//  275   /* In order to detect unexpected events during development,
//  276      it is recommended to set a breakpoint on the following instruction.
//  277   */
//  278  }
TIM2_UPD_OVF_BRK_IRQHandler:
_interrupt_15:
        IRET
//  279 
//  280 /**
//  281   * @brief Timer2 Capture/Compare Interrupt routine.
//  282   * @param  None
//  283   * @retval None
//  284   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  285  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
//  286  {
//  287   /* In order to detect unexpected events during development,
//  288      it is recommended to set a breakpoint on the following instruction.
//  289   */
//  290  }
TIM2_CAP_COM_IRQHandler:
_interrupt_16:
        IRET
//  291 #endif /*STM8S903*/
//  292 
//  293 #if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S105) || \ 
//  294     defined(STM8S005) ||  defined (STM8AF62Ax) || defined (STM8AF52Ax) || defined (STM8AF626x)
//  295 /**
//  296   * @brief Timer3 Update/Overflow/Break Interrupt routine.
//  297   * @param  None
//  298   * @retval None
//  299   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  300  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
//  301  {
//  302   /* In order to detect unexpected events during development,
//  303      it is recommended to set a breakpoint on the following instruction.
//  304   */
//  305  }
TIM3_UPD_OVF_BRK_IRQHandler:
_interrupt_17:
        IRET
//  306 
//  307 /**
//  308   * @brief Timer3 Capture/Compare Interrupt routine.
//  309   * @param  None
//  310   * @retval None
//  311   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  312  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
//  313  {
//  314   /* In order to detect unexpected events during development,
//  315      it is recommended to set a breakpoint on the following instruction.
//  316   */
//  317  }
TIM3_CAP_COM_IRQHandler:
_interrupt_18:
        IRET
//  318 #endif /*STM8S208, STM8S207 or STM8S105 or STM8AF62Ax or STM8AF52Ax or STM8AF626x */
//  319 
//  320 #if defined (STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8S103) || \ 
//  321     defined(STM8S003) ||  defined (STM8AF62Ax) || defined (STM8AF52Ax) || defined (STM8S903)
//  322 /**
//  323   * @brief UART1 TX Interrupt routine.
//  324   * @param  None
//  325   * @retval None
//  326   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  327  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
//  328  {
//  329     /* In order to detect unexpected events during development,
//  330        it is recommended to set a breakpoint on the following instruction.
//  331     */
//  332  }
UART1_TX_IRQHandler:
_interrupt_19:
        IRET
//  333 
//  334 /**
//  335   * @brief UART1 RX Interrupt routine.
//  336   * @param  None
//  337   * @retval None
//  338   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  339  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
//  340  {
//  341     /* In order to detect unexpected events during development,
//  342        it is recommended to set a breakpoint on the following instruction.
//  343     */
//  344  }
UART1_RX_IRQHandler:
_interrupt_20:
        IRET
//  345 #endif /*STM8S208 or STM8S207 or STM8S103 or STM8S903 or STM8AF62Ax or STM8AF52Ax */
//  346 
//  347 /**
//  348   * @brief I2C Interrupt routine.
//  349   * @param  None
//  350   * @retval None
//  351   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  352 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
//  353 {
//  354   /* In order to detect unexpected events during development,
//  355      it is recommended to set a breakpoint on the following instruction.
//  356   */
//  357 }
I2C_IRQHandler:
_interrupt_21:
        IRET
//  358 
//  359 #if defined(STM8S105) || defined(STM8S005) ||  defined (STM8AF626x)
//  360 /**
//  361   * @brief UART2 TX interrupt routine.
//  362   * @param  None
//  363   * @retval None
//  364   */
//  365  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
//  366  {
//  367     /* In order to detect unexpected events during development,
//  368        it is recommended to set a breakpoint on the following instruction.
//  369     */
//  370  }
//  371 
//  372 /**
//  373   * @brief UART2 RX interrupt routine.
//  374   * @param  None
//  375   * @retval None
//  376   */
//  377  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
//  378  {
//  379     /* In order to detect unexpected events during development,
//  380        it is recommended to set a breakpoint on the following instruction.
//  381     */
//  382  }
//  383 #endif /* STM8S105 or STM8AF626x */
//  384 
//  385 #if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
//  386 /**
//  387   * @brief UART3 TX interrupt routine.
//  388   * @param  None
//  389   * @retval None
//  390   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  391  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
//  392  {
//  393     /* In order to detect unexpected events during development,
//  394        it is recommended to set a breakpoint on the following instruction.
//  395     */
//  396  }
UART3_TX_IRQHandler:
_interrupt_22:
        IRET
//  397 
//  398 /**
//  399   * @brief UART3 RX interrupt routine.
//  400   * @param  None
//  401   * @retval None
//  402   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  403  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
//  404  {
//  405     /* In order to detect unexpected events during development,
//  406        it is recommended to set a breakpoint on the following instruction.
//  407     */
//  408  }
UART3_RX_IRQHandler:
_interrupt_23:
        IRET
//  409 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
//  410 
//  411 #if defined(STM8S207) || defined(STM8S007) || defined(STM8S208) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
//  412 /**
//  413   * @brief ADC2 interrupt routine.
//  414   * @param  None
//  415   * @retval None
//  416   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  417  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
//  418  {
//  419     /* In order to detect unexpected events during development,
//  420        it is recommended to set a breakpoint on the following instruction.
//  421     */
//  422  }
ADC2_IRQHandler:
_interrupt_24:
        IRET
//  423 #else /*STM8S105, STM8S103 or STM8S903 or STM8AF626x */
//  424 /**
//  425   * @brief ADC1 interrupt routine.
//  426   * @par Parameters:
//  427   * None
//  428   * @retval 
//  429   * None
//  430   */
//  431  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
//  432  {
//  433     /* In order to detect unexpected events during development,
//  434        it is recommended to set a breakpoint on the following instruction.
//  435     */
//  436  }
//  437 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
//  438 
//  439 #ifdef STM8S903
//  440 /**
//  441   * @brief Timer6 Update/Overflow/Trigger Interrupt routine.
//  442   * @param  None
//  443   * @retval None
//  444   */
//  445 INTERRUPT_HANDLER(TIM6_UPD_OVF_TRG_IRQHandler, 23)
//  446  {
//  447   /* In order to detect unexpected events during development,
//  448      it is recommended to set a breakpoint on the following instruction.
//  449   */
//  450  }
//  451 #else /*STM8S208, STM8S207, STM8S105 or STM8S103 or STM8AF52Ax or STM8AF62Ax or STM8AF626x */
//  452 /**
//  453   * @brief Timer4 Update/Overflow Interrupt routine.
//  454   * @param  None
//  455   * @retval None
//  456   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  457  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
//  458  {
TIM4_UPD_OVF_IRQHandler:
_interrupt_25:
        PUSH      CC
        POP       A
        AND       A, #0xbf
        PUSH      A
        POP       CC
        CALL      L:?push_l0
        CALL      L:?push_l1
//  459   /* In order to detect unexpected events during development,
//  460      it is recommended to set a breakpoint on the following instruction.
//  461   */
//  462    TIM4_UPD_OVF_Handler(  );
        CALL      L:TIM4_UPD_OVF_Handler
//  463    TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
        LD        A, #0x1
        CALL      L:TIM4_ClearITPendingBit
//  464  }
        CALL      L:?pop_l1
        CALL      L:?pop_l0
        IRET
//  465 #endif /*STM8S903*/
//  466 
//  467 /**
//  468   * @brief Eeprom EEC Interrupt routine.
//  469   * @param  None
//  470   * @retval None
//  471   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  472 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
//  473 {
//  474   /* In order to detect unexpected events during development,
//  475      it is recommended to set a breakpoint on the following instruction.
//  476   */
//  477 }
EEPROM_EEC_IRQHandler:
_interrupt_26:
        IRET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  478 
//  479 /**
//  480   * @}
//  481   */
//  482 
//  483 /******************* (C) COPYRIGHT 2011 STMicroelectronics *****END OF FILE****/
// 
// 50 bytes in section .near_func.text
// 
// 50 bytes of CODE memory
//
//Errors: none
//Warnings: none
