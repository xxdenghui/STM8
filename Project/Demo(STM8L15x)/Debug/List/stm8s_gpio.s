///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                29/Apr/2018  22:46:05
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        D:\STM8\Software\Libraries\STM8S_StdPeriph_Driver\src\stm8s_gpio.c
//    Command line =  
//        -f C:\Users\ADMINI~1\AppData\Local\Temp\EW1A54.tmp
//        (D:\STM8\Software\Libraries\STM8S_StdPeriph_Driver\src\stm8s_gpio.c
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
//        D:\STM8\Software\Project\Demo(STM8S)\Debug\List\stm8s_gpio.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?epilogue_l2
        EXTERN ?push_l2
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w4
        EXTERN assert_failed

        PUBLIC GPIO_DeInit
        PUBLIC GPIO_ExternalPullUpConfig
        PUBLIC GPIO_Init
        PUBLIC GPIO_ReadInputData
        PUBLIC GPIO_ReadInputPin
        PUBLIC GPIO_ReadOutputData
        PUBLIC GPIO_Write
        PUBLIC GPIO_WriteHigh
        PUBLIC GPIO_WriteLow
        PUBLIC GPIO_WriteReverse

// D:\STM8\Software\Libraries\STM8S_StdPeriph_Driver\src\stm8s_gpio.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_gpio.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the GPIO peripheral.
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
//   29 #include "stm8s_gpio.h"
//   30 
//   31 /** @addtogroup STM8S_StdPeriph_Driver
//   32   * @{
//   33   */
//   34 /* Private typedef -----------------------------------------------------------*/
//   35 /* Private define ------------------------------------------------------------*/
//   36 /* Private macro -------------------------------------------------------------*/
//   37 /* Private variables ---------------------------------------------------------*/
//   38 /* Private function prototypes -----------------------------------------------*/
//   39 /* Private functions ---------------------------------------------------------*/
//   40 
//   41 /* Public functions ----------------------------------------------------------*/
//   42 
//   43 /**
//   44   * @addtogroup GPIO_Public_Functions
//   45   * @{
//   46   */
//   47 
//   48 /**
//   49   * @brief  Deinitializes the GPIOx peripheral registers to their default reset values.
//   50   * @param  GPIOx: Select the GPIO peripheral number (x = A to I).
//   51   * @retval None
//   52   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   53 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
//   54 {
GPIO_DeInit:
        LDW       Y, X
//   55   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
        CLR       (Y)
//   56   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
        LDW       X, Y
        INCW      X
        INCW      X
        CLR       (X)
//   57   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
        LDW       X, Y
        ADDW      X, #0x3
        CLR       (X)
//   58   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
        LDW       X, Y
        ADDW      X, #0x4
        CLR       (X)
//   59 }
        RET
//   60 
//   61 /**
//   62   * @brief  Initializes the GPIOx according to the specified parameters.
//   63   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//   64   * @param  GPIO_Pin : This parameter contains the pin number, it can be any value
//   65   *         of the @ref GPIO_Pin_TypeDef enumeration.
//   66   * @param  GPIO_Mode : This parameter can be a value of the
//   67   *         @Ref GPIO_Mode_TypeDef enumeration.
//   68   * @retval None
//   69   */
//   70 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   71 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
//   72 {
GPIO_Init:
        CALL      L:?push_l2
        LDW       S:?w4, X
        LD        S:?b11, A
        MOV       S:?b10, S:?b0
//   73   /*----------------------*/
//   74   /* Check the parameters */
//   75   /*----------------------*/
//   76   
//   77   assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
        TNZ       S:?b10
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b10
        CP        A, #0x40
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b10
        CP        A, #0x20
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b10
        CP        A, #0x60
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b10
        CP        A, #0xa0
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b10
        CP        A, #0xe0
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b10
        CP        A, #0x80
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b10
        CP        A, #0xc0
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b10
        CP        A, #0xb0
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b10
        CP        A, #0xf0
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b10
        CP        A, #0x90
        JREQ      L:??GPIO_Init_0
        LD        A, S:?b10
        CP        A, #0xd0
        JREQ      L:??GPIO_Init_0
        LDW       X, #0x4d
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   78   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
??GPIO_Init_0:
        TNZ       S:?b11
        JRNE      L:??GPIO_Init_1
        LDW       X, #0x4e
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//   79   
//   80   /* Reset corresponding bit to GPIO_Pin in CR2 register */
//   81   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_1:
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        A, S:?b11
        CPL       A
        AND       A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        (X), A
//   82   
//   83   /*-----------------------------*/
//   84   /* Input/Output mode selection */
//   85   /*-----------------------------*/
//   86   
//   87   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
        LD        A, S:?b10
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??GPIO_Init_2
//   88   {
//   89     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
        LD        A, S:?b10
        AND       A, #0x10
        CP        A, #0x0
        JREQ      L:??GPIO_Init_3
//   90     {
//   91       GPIOx->ODR |= (uint8_t)GPIO_Pin;
        LD        A, [S:?w4.w]
        OR        A, S:?b11
        LD        [S:?w4.w], A
        JRA       L:??GPIO_Init_4
//   92     } 
//   93     else /* Low level */
//   94     {
//   95       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_3:
        LD        A, S:?b11
        CPL       A
        AND       A, [S:?w4.w]
        LD        [S:?w4.w], A
//   96     }
//   97     /* Set Output mode */
//   98     GPIOx->DDR |= (uint8_t)GPIO_Pin;
??GPIO_Init_4:
        LDW       X, S:?w4
        INCW      X
        INCW      X
        LD        A, (X)
        OR        A, S:?b11
        LDW       X, S:?w4
        INCW      X
        INCW      X
        LD        (X), A
        JRA       L:??GPIO_Init_5
//   99   } 
//  100   else /* Input mode */
//  101   {
//  102     /* Set Input mode */
//  103     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_2:
        LDW       X, S:?w4
        INCW      X
        INCW      X
        LD        A, S:?b11
        CPL       A
        AND       A, (X)
        LDW       X, S:?w4
        INCW      X
        INCW      X
        LD        (X), A
//  104   }
//  105   
//  106   /*------------------------------------------------------------------------*/
//  107   /* Pull-Up/Float (Input) or Push-Pull/Open-Drain (Output) modes selection */
//  108   /*------------------------------------------------------------------------*/
//  109   
//  110   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
??GPIO_Init_5:
        LD        A, S:?b10
        AND       A, #0x40
        CP        A, #0x0
        JREQ      L:??GPIO_Init_6
//  111   {
//  112     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        A, (X)
        OR        A, S:?b11
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        (X), A
        JRA       L:??GPIO_Init_7
//  113   } 
//  114   else /* Float or Open-Drain */
//  115   {
//  116     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_6:
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        A, S:?b11
        CPL       A
        AND       A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        (X), A
//  117   }
//  118   
//  119   /*-----------------------------------------------------*/
//  120   /* Interrupt (Input) or Slope (Output) modes selection */
//  121   /*-----------------------------------------------------*/
//  122   
//  123   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
??GPIO_Init_7:
        LD        A, S:?b10
        AND       A, #0x20
        CP        A, #0x0
        JREQ      L:??GPIO_Init_8
//  124   {
//  125     GPIOx->CR2 |= (uint8_t)GPIO_Pin;
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        A, (X)
        OR        A, S:?b11
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        (X), A
        JRA       L:??GPIO_Init_9
//  126   } 
//  127   else /* No external interrupt or No slope control */
//  128   {
//  129     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_8:
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        A, S:?b11
        CPL       A
        AND       A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        (X), A
//  130   }
//  131 }
??GPIO_Init_9:
        JP        L:?epilogue_l2
//  132 
//  133 /**
//  134   * @brief  Writes data to the specified GPIO data port.
//  135   * @note   The port must be configured in output mode.
//  136   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  137   * @param  GPIO_PortVal : Specifies the value to be written to the port output
//  138   *         data register.
//  139   * @retval None
//  140   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  141 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
//  142 {
//  143   GPIOx->ODR = PortVal;
GPIO_Write:
        LD        (X), A
//  144 }
        RET
//  145 
//  146 /**
//  147   * @brief  Writes high level to the specified GPIO pins.
//  148   * @note   The port must be configured in output mode.  
//  149   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  150   * @param  PortPins : Specifies the pins to be turned high to the port output.
//  151   *         data register.
//  152   * @retval None
//  153   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  154 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, uint8_t PortPins)
//  155 {
GPIO_WriteHigh:
        LD        S:?b0, A
//  156   GPIOx->ODR |= (uint8_t)PortPins;
        LD        A, (X)
        OR        A, S:?b0
        LD        (X), A
//  157 }
        RET
//  158 
//  159 /**
//  160   * @brief  Writes low level to the specified GPIO pins.
//  161   * @note   The port must be configured in output mode.  
//  162   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  163   * @param  PortPins : Specifies the pins to be turned low to the port output.
//  164   *         data register.
//  165   * @retval None
//  166   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  167 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, uint8_t PortPins)
//  168 {
GPIO_WriteLow:
        LD        S:?b0, A
//  169   GPIOx->ODR &= (uint8_t)(~PortPins);
        LD        A, S:?b0
        CPL       A
        AND       A, (X)
        LD        (X), A
//  170 }
        RET
//  171 
//  172 /**
//  173   * @brief  Writes reverse level to the specified GPIO pins.
//  174   * @note   The port must be configured in output mode.
//  175   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  176   * @param  PortPins : Specifies the pins to be reversed to the port output.
//  177   *         data register.
//  178   * @retval None
//  179   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  180 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, uint8_t PortPins)
//  181 {
GPIO_WriteReverse:
        LD        S:?b0, A
//  182   GPIOx->ODR ^= (uint8_t)PortPins;
        LD        A, (X)
        XOR       A, S:?b0
        LD        (X), A
//  183 }
        RET
//  184 
//  185 /**
//  186   * @brief  Reads the specified GPIO output data port.
//  187   * @note   The port must be configured in input mode.  
//  188   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  189   * @retval GPIO output data port value.
//  190   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  191 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
//  192 {
//  193   return ((uint8_t)GPIOx->ODR);
GPIO_ReadOutputData:
        LD        A, (X)
        RET
//  194 }
//  195 
//  196 /**
//  197   * @brief  Reads the specified GPIO input data port.
//  198   * @note   The port must be configured in input mode.   
//  199   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  200   * @retval GPIO input data port value.
//  201   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  202 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
//  203 {
//  204   return ((uint8_t)GPIOx->IDR);
GPIO_ReadInputData:
        INCW      X
        LD        A, (X)
        RET
//  205 }
//  206 
//  207 /**
//  208   * @brief  Reads the specified GPIO input data pin.
//  209   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  210   * @param  GPIO_Pin : Specifies the pin number.
//  211   * @retval BitStatus : GPIO input pin status.
//  212   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  213 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
//  214 {
GPIO_ReadInputPin:
        LD        S:?b0, A
//  215   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
        INCW      X
        LD        A, (X)
        AND       A, S:?b0
        RET
//  216 }
//  217 
//  218 /**
//  219   * @brief  Configures the external pull-up on GPIOx pins.
//  220   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  221   * @param  GPIO_Pin : Specifies the pin number
//  222   * @param  NewState : The new state of the pull up pin.
//  223   * @retval None
//  224   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  225 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
//  226 {
GPIO_ExternalPullUpConfig:
        CALL      L:?push_l2
        LDW       S:?w4, X
        LD        S:?b11, A
        MOV       S:?b10, S:?b0
//  227   /* Check the parameters */
//  228   assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
        TNZ       S:?b11
        JRNE      L:??GPIO_ExternalPullUpConfig_0
        LDW       X, #0xe4
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  229   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??GPIO_ExternalPullUpConfig_0:
        TNZ       S:?b10
        JREQ      L:??GPIO_ExternalPullUpConfig_1
        LD        A, S:?b10
        CP        A, #0x1
        JREQ      L:??GPIO_ExternalPullUpConfig_1
        LDW       X, #0xe5
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #?_0
        CALL      L:assert_failed
//  230   
//  231   if (NewState != DISABLE) /* External Pull-Up Set*/
??GPIO_ExternalPullUpConfig_1:
        TNZ       S:?b10
        JREQ      L:??GPIO_ExternalPullUpConfig_2
//  232   {
//  233     GPIOx->CR1 |= (uint8_t)GPIO_Pin;
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        A, (X)
        OR        A, S:?b11
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        (X), A
        JRA       L:??GPIO_ExternalPullUpConfig_3
//  234   } else /* External Pull-Up Reset*/
//  235   {
//  236     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
??GPIO_ExternalPullUpConfig_2:
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        A, S:?b11
        CPL       A
        AND       A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        (X), A
//  237   }
//  238 }
??GPIO_ExternalPullUpConfig_3:
        JP        L:?epilogue_l2

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
        DC8 6DH, 38H, 73H, 5FH, 67H, 70H, 69H, 6FH
        DC8 2EH, 63H, 0

        END
//  239 
//  240 /**
//  241   * @}
//  242   */
//  243   
//  244 /**
//  245   * @}
//  246   */
//  247   
//  248 
//  249 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//  67 bytes in section .near.rodata
// 415 bytes in section .near_func.text
// 
// 415 bytes of CODE  memory
//  67 bytes of CONST memory
//
//Errors: none
//Warnings: none
