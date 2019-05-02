///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                22/Mar/2019  11:20:54
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        G:\Darren\MCU\STM8\Software\Libraries\STM8L15x_StdPeriph_Driver\src\stm8l15x_gpio.c
//    Command line =  
//        -f C:\Users\new06\AppData\Local\Temp\EWB1DC.tmp
//        (G:\Darren\MCU\STM8\Software\Libraries\STM8L15x_StdPeriph_Driver\src\stm8l15x_gpio.c
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
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\Debug\List\stm8l15x_gpio.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1

        PUBLIC GPIO_DeInit
        PUBLIC GPIO_ExternalPullUpConfig
        PUBLIC GPIO_Init
        PUBLIC GPIO_ReadInputData
        PUBLIC GPIO_ReadInputPin
        PUBLIC GPIO_ReadOutputData
        PUBLIC GPIO_ReadOutputPin
        PUBLIC GPIO_Write
        PUBLIC GPIO_WriteBit
        PUBLIC GPIO_WriteHigh
        PUBLIC GPIO_WriteLow
        PUBLIC GPIO_WriteReverse

// G:\Darren\MCU\STM8\Software\Libraries\STM8L15x_StdPeriph_Driver\src\stm8l15x_gpio.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_gpio.c
//    4   * @author  MCD Application Team
//    5   * @version V1.6.1
//    6   * @date    30-September-2014
//    7   * @brief   This file provides firmware functions to manage the following 
//    8   *          functionalities of the GPIO peripheral:
//    9   *           - Initialization and Configuration
//   10   *           - GPIO Read and Write
//   11   *
//   12   *          ===================================================================
//   13   *                                 How to use this driver
//   14   *          ===================================================================       
//   15   *           1. Configure the GPIO pin(s) using GPIO_Init()
//   16   *              Two main configuration are available for each pin:
//   17   *                - Input: Floating 
//   18   *                         Pull-up.
//   19   *                  In Input mode, external interrupt can be enabled or disabled
//   20   *                - Output: Push-Pull
//   21   *                          Open Drain.
//   22   *                  In output mode, the GPIO pin speed is configurable: 
//   23   *                  Slow (2 MHz) or Fast (10MHz).
//   24   *  
//   25   *           2. To get the level of a pin configured in input mode use GPIO_ReadInputDataBit()
//   26   * 
//   27   *           3. To set/reset GPIO pins sharing the same GPIO port use
//   28   *              GPIO_SetBits() / GPIO_ResetBits()
//   29   *
//   30   *           4. To enable external interrupt, the GPIO pin must be configured
//   31   *              in input mode with interrupt enabled. Interrupt sensitivity
//   32   *              (rising, falling...) is configurable using 
//   33   *              EXTI_SetPinSensitivity() in the EXTI peripheral driver "stm8l15x_exti.c"
//   34   *  
//   35   ******************************************************************************
//   36   * @attention
//   37   *
//   38   * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
//   39   *
//   40   * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
//   41   * You may not use this file except in compliance with the License.
//   42   * You may obtain a copy of the License at:
//   43   *
//   44   *        http://www.st.com/software_license_agreement_liberty_v2
//   45   *
//   46   * Unless required by applicable law or agreed to in writing, software 
//   47   * distributed under the License is distributed on an "AS IS" BASIS, 
//   48   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   49   * See the License for the specific language governing permissions and
//   50   * limitations under the License.
//   51   *
//   52   ******************************************************************************
//   53   */
//   54 
//   55 /* Includes ------------------------------------------------------------------*/
//   56 #include "stm8l15x_gpio.h"
//   57 
//   58 /** @addtogroup STM8L15x_StdPeriph_Driver
//   59   * @{
//   60   */
//   61 
//   62 /** @defgroup CLK 
//   63   * @brief CLK driver modules
//   64   * @{
//   65   */ 
//   66   
//   67 /* Private typedef -----------------------------------------------------------*/
//   68 /* Private define ------------------------------------------------------------*/
//   69 /* Private macro -------------------------------------------------------------*/
//   70 /* Private variables ---------------------------------------------------------*/
//   71 /* Private function prototypes -----------------------------------------------*/
//   72 /* Private functions ---------------------------------------------------------*/
//   73 
//   74 /** @defgroup GPIO_Private_Functions
//   75   * @{
//   76   */ 
//   77 
//   78 
//   79 /** @defgroup GPIO_Group1 Initialization and Configuration
//   80  *  @brief   Initialization and Configuration
//   81  *
//   82 @verbatim   
//   83  ===============================================================================
//   84                         Initialization and Configuration
//   85  ===============================================================================  
//   86 
//   87 @endverbatim
//   88   * @{
//   89   */
//   90 
//   91 /**
//   92   * @brief  Deinitializes the GPIOx peripheral registers to their default reset values.
//   93   * @param  GPIOx: Select the GPIO peripheral number (x = A to I).
//   94   * @retval None
//   95   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   96 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
//   97 {
GPIO_DeInit:
        LDW       Y, X
//   98   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
        LDW       X, Y
        ADDW      X, #0x4
        CLR       (X)
//   99   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
        CLR       (Y)
//  100   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
        LDW       X, Y
        INCW      X
        INCW      X
        CLR       (X)
//  101   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
        LDW       X, Y
        ADDW      X, #0x3
        CLR       (X)
//  102 }
        RET
//  103 
//  104 /**
//  105   * @brief  Initializes the GPIOx according to the specified parameters.
//  106   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  107   * @param  GPIO_Pin : This parameter contains the pin number
//  108   *           This parameter can be one of the following values:
//  109   *            @arg GPIO_Pin_0: Pin 0
//  110   *            @arg GPIO_Pin_1: Pin 1
//  111   *            @arg GPIO_Pin_2: Pin 2
//  112   *            @arg GPIO_Pin_3: Pin 3
//  113   *            @arg GPIO_Pin_4: Pin 4
//  114   *            @arg GPIO_Pin_5: Pin 5
//  115   *            @arg GPIO_Pin_6: Pin 6
//  116   *            @arg GPIO_Pin_7: Pin 7              
//  117   * @param  GPIO_Mode : This parameter can be a value of the
//  118   *           This parameter can be one of the following values:
//  119   *            @arg GPIO_Mode_In_FL_No_IT: Input floating, no external interrupt
//  120   *            @arg GPIO_Mode_In_PU_No_IT: Input pull-up, no external interrupt
//  121   *            @arg GPIO_Mode_In_FL_IT: Input pull-up, external interrupt
//  122   *            @arg GPIO_Mode_Out_OD_Low_Fast: Output open-drain, low level, 10MHz
//  123   *            @arg GPIO_Mode_Out_PP_Low_Fast: Output push-pull, low level, 10MHz
//  124   *            @arg GPIO_Mode_Out_OD_Low_Slow: Output open-drain, low level, 2MHz
//  125   *            @arg GPIO_Mode_Out_PP_Low_Slow: Output push-pull, low level, 2MHz
//  126   *            @arg GPIO_Mode_Out_OD_HiZ_Fast: Output open-drain, high-impedance level, 10MHz
//  127   *            @arg GPIO_Mode_Out_PP_High_Fast: Output push-pull, high level, 10MHz
//  128   *            @arg GPIO_Mode_Out_OD_HiZ_Slow: Output open-drain, high-impedance level, 2MHz
//  129   *            @arg GPIO_Mode_Out_PP_High_Slow: Output push-pull, high level, 2MHz
//  130   * @retval None
//  131   */
//  132 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  133 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
//  134 {
GPIO_Init:
        LDW       Y, X
        LD        S:?b1, A
//  135   /*----------------------*/
//  136   /* Check the parameters */
//  137   /*----------------------*/
//  138 
//  139   assert_param(IS_GPIO_MODE(GPIO_Mode));
//  140   assert_param(IS_GPIO_PIN(GPIO_Pin));
//  141 
//  142   /* Reset corresponding bit to GPIO_Pin in CR2 register */
//  143   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
        LDW       X, Y
        ADDW      X, #0x4
        LD        A, S:?b1
        CPL       A
        AND       A, (X)
        LDW       X, Y
        ADDW      X, #0x4
        LD        (X), A
//  144 
//  145   /*-----------------------------*/
//  146   /* Input/Output mode selection */
//  147   /*-----------------------------*/
//  148 
//  149   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
        LD        A, S:?b0
        AND       A, #0x80
        CP        A, #0x0
        JREQ      L:??GPIO_Init_0
//  150   {
//  151     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
        LD        A, S:?b0
        AND       A, #0x10
        CP        A, #0x0
        JREQ      L:??GPIO_Init_1
//  152     {
//  153       GPIOx->ODR |= GPIO_Pin;
        LD        A, (Y)
        OR        A, S:?b1
        LD        (Y), A
        JRA       L:??GPIO_Init_2
//  154     } else /* Low level */
//  155     {
//  156       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_1:
        LD        A, S:?b1
        CPL       A
        AND       A, (Y)
        LD        (Y), A
//  157     }
//  158     /* Set Output mode */
//  159     GPIOx->DDR |= GPIO_Pin;
??GPIO_Init_2:
        LDW       X, Y
        INCW      X
        INCW      X
        LD        A, (X)
        OR        A, S:?b1
        LDW       X, Y
        INCW      X
        INCW      X
        LD        (X), A
        JRA       L:??GPIO_Init_3
//  160   } else /* Input mode */
//  161   {
//  162     /* Set Input mode */
//  163     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_0:
        LDW       X, Y
        INCW      X
        INCW      X
        LD        A, S:?b1
        CPL       A
        AND       A, (X)
        LDW       X, Y
        INCW      X
        INCW      X
        LD        (X), A
//  164   }
//  165 
//  166   /*------------------------------------------------------------------------*/
//  167   /* Pull-Up/Float (Input) or Push-Pull/Open-Drain (Output) modes selection */
//  168   /*------------------------------------------------------------------------*/
//  169 
//  170   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
??GPIO_Init_3:
        LD        A, S:?b0
        AND       A, #0x40
        CP        A, #0x0
        JREQ      L:??GPIO_Init_4
//  171   {
//  172     GPIOx->CR1 |= GPIO_Pin;
        LDW       X, Y
        ADDW      X, #0x3
        LD        A, (X)
        OR        A, S:?b1
        LDW       X, Y
        ADDW      X, #0x3
        LD        (X), A
        JRA       L:??GPIO_Init_5
//  173   } else /* Float or Open-Drain */
//  174   {
//  175     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_4:
        LDW       X, Y
        ADDW      X, #0x3
        LD        A, S:?b1
        CPL       A
        AND       A, (X)
        LDW       X, Y
        ADDW      X, #0x3
        LD        (X), A
//  176   }
//  177 
//  178   /*-----------------------------------------------------*/
//  179   /* Interrupt (Input) or Slope (Output) modes selection */
//  180   /*-----------------------------------------------------*/
//  181 
//  182   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
??GPIO_Init_5:
        LD        A, S:?b0
        AND       A, #0x20
        CP        A, #0x0
        JREQ      L:??GPIO_Init_6
//  183   {
//  184     GPIOx->CR2 |= GPIO_Pin;
        LDW       X, Y
        ADDW      X, #0x4
        LD        A, (X)
        OR        A, S:?b1
        LDW       X, Y
        ADDW      X, #0x4
        LD        (X), A
        JRA       L:??GPIO_Init_7
//  185   } else /* No external interrupt or No slope control */
//  186   {
//  187     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
??GPIO_Init_6:
        LDW       X, Y
        ADDW      X, #0x4
        LD        A, S:?b1
        CPL       A
        AND       A, (X)
        LDW       X, Y
        ADDW      X, #0x4
        LD        (X), A
//  188   }
//  189 
//  190 }
??GPIO_Init_7:
        RET
//  191 
//  192 /**
//  193   * @brief  Configures the external pull-up on GPIOx pins.
//  194   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  195   * @param  GPIO_Pin : Specifies the pin number
//  196   *           This parameter can be one of the following values:
//  197   *            @arg GPIO_Pin_0: Pin 0
//  198   *            @arg GPIO_Pin_1: Pin 1
//  199   *            @arg GPIO_Pin_2: Pin 2
//  200   *            @arg GPIO_Pin_3: Pin 3
//  201   *            @arg GPIO_Pin_4: Pin 4
//  202   *            @arg GPIO_Pin_5: Pin 5
//  203   *            @arg GPIO_Pin_6: Pin 6
//  204   *            @arg GPIO_Pin_7: Pin 7     
//  205   * @param  NewState : The new state of the pull up pin.
//  206   *           Can be ENABLE or DISABLE  
//  207   * @retval None
//  208   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  209 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
//  210 {
GPIO_ExternalPullUpConfig:
        LD        S:?b1, A
//  211   /* Check the parameters */
//  212   assert_param(IS_GPIO_PIN(GPIO_Pin));
//  213   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  214 
//  215   if (NewState != DISABLE) /* External Pull-Up Set*/
        TNZ       S:?b0
        JREQ      L:??GPIO_ExternalPullUpConfig_0
//  216   {
//  217     GPIOx->CR1 |= GPIO_Pin;
        LDW       Y, X
        ADDW      Y, #0x3
        LD        A, (Y)
        OR        A, S:?b1
        ADDW      X, #0x3
        LD        (X), A
        SUBW      X, #0x3
        JRA       L:??GPIO_ExternalPullUpConfig_1
//  218   } else /* External Pull-Up Reset*/
//  219   {
//  220     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
??GPIO_ExternalPullUpConfig_0:
        LDW       Y, X
        ADDW      Y, #0x3
        LD        A, S:?b1
        CPL       A
        AND       A, (Y)
        ADDW      X, #0x3
        LD        (X), A
        SUBW      X, #0x3
//  221   }
//  222 }
??GPIO_ExternalPullUpConfig_1:
        RET
//  223 
//  224 /**
//  225   * @}
//  226   */
//  227 
//  228 /** @defgroup GPIO_Group2 GPIO Read and Write
//  229  *  @brief   GPIO Read and Write
//  230  *
//  231 @verbatim   
//  232  ===============================================================================
//  233                               GPIO Read and Write
//  234  ===============================================================================  
//  235 
//  236 @endverbatim
//  237   * @{
//  238   */
//  239 
//  240 /**
//  241   * @brief  Writes data to the specified GPIO data port.
//  242   * @note   The port must be configured in output mode.
//  243   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  244   * @param  GPIO_PortVal : Specifies the value to be written to the port output
//  245   *         data register.
//  246   * @retval None
//  247   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  248 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
//  249 {
//  250   GPIOx->ODR = GPIO_PortVal;
GPIO_Write:
        LD        (X), A
//  251 }
        RET
//  252 
//  253 /**
//  254   * @brief  Sets or clears the selected data port bit.
//  255   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  256   * @param  GPIO_Pin: Specifies the port bit to be written.
//  257   *           This parameter can be one of the following values:
//  258   *            @arg GPIO_Pin_0: Pin 0
//  259   *            @arg GPIO_Pin_1: Pin 1
//  260   *            @arg GPIO_Pin_2: Pin 2
//  261   *            @arg GPIO_Pin_3: Pin 3
//  262   *            @arg GPIO_Pin_4: Pin 4
//  263   *            @arg GPIO_Pin_5: Pin 5
//  264   *            @arg GPIO_Pin_6: Pin 6
//  265   *            @arg GPIO_Pin_7: Pin 7   
//  266   * @param  GPIO_BitVal: specifies the desired status to be written.
//  267   *         This parameter can be SET or RESET
//  268   * @retval None
//  269   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  270 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
//  271 {
GPIO_WriteBit:
        LD        S:?b1, A
//  272   /* Check the parameters */
//  273   assert_param(IS_GPIO_PIN(GPIO_Pin));
//  274   assert_param(IS_STATE_VALUE(GPIO_BitVal));
//  275 
//  276   if (GPIO_BitVal != RESET)
        TNZ       S:?b0
        JREQ      L:??GPIO_WriteBit_0
//  277   {
//  278     GPIOx->ODR |= GPIO_Pin;
        LD        A, (X)
        OR        A, S:?b1
        LD        (X), A
        JRA       L:??GPIO_WriteBit_1
//  279 
//  280   }
//  281   else
//  282   {
//  283     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
??GPIO_WriteBit_0:
        LD        A, S:?b1
        CPL       A
        AND       A, (X)
        LD        (X), A
//  284   }
//  285 }
??GPIO_WriteBit_1:
        RET
//  286 
//  287 /**
//  288   * @brief  Writes high level to the specified GPIO pins.
//  289   * @note   The port must be configured in output mode.
//  290   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  291   * @param  GPIO_Pin : Specifies the pins to be turned high.
//  292   *           This parameter can be one of the following values:
//  293   *            @arg GPIO_Pin_0: Pin 0
//  294   *            @arg GPIO_Pin_1: Pin 1
//  295   *            @arg GPIO_Pin_2: Pin 2
//  296   *            @arg GPIO_Pin_3: Pin 3
//  297   *            @arg GPIO_Pin_4: Pin 4
//  298   *            @arg GPIO_Pin_5: Pin 5
//  299   *            @arg GPIO_Pin_6: Pin 6
//  300   *            @arg GPIO_Pin_7: Pin 7   
//  301   * @retval None
//  302   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  303 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
//  304 {
GPIO_WriteHigh:
        LD        S:?b0, A
//  305   GPIOx->ODR |= GPIO_Pin;
        LD        A, (X)
        OR        A, S:?b0
        LD        (X), A
//  306 }
        RET
//  307 
//  308 /**
//  309   * @brief  Writes low level to the specified GPIO pins.
//  310   * @note   The port must be configured in output mode.
//  311   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  312   * @param  GPIO_Pin : Specifies the pins to be turned low
//  313   *           This parameter can be one of the following values:
//  314   *            @arg GPIO_Pin_0: Pin 0
//  315   *            @arg GPIO_Pin_1: Pin 1
//  316   *            @arg GPIO_Pin_2: Pin 2
//  317   *            @arg GPIO_Pin_3: Pin 3
//  318   *            @arg GPIO_Pin_4: Pin 4
//  319   *            @arg GPIO_Pin_5: Pin 5
//  320   *            @arg GPIO_Pin_6: Pin 6
//  321   *            @arg GPIO_Pin_7: Pin 7 
//  322   * @retval None
//  323   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  324 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
//  325 {
GPIO_WriteLow:
        LD        S:?b0, A
//  326   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
        LD        A, S:?b0
        CPL       A
        AND       A, (X)
        LD        (X), A
//  327 }
        RET
//  328 
//  329 /**
//  330   * @brief  Toggles the specified GPIO pins.
//  331   * @note   The port must be configured in output mode.
//  332   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  333   * @param  GPIO_Pin : Specifies the pins to be toggled.
//  334   * @retval None
//  335   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  336 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
//  337 {
GPIO_WriteReverse:
        LD        S:?b0, A
//  338   GPIOx->ODR ^= GPIO_Pin;
        LD        A, (X)
        XOR       A, S:?b0
        LD        (X), A
//  339 }
        RET
//  340 
//  341 /**
//  342   * @brief  Reads the specified GPIO input data port.
//  343   * @note   The port must be configured in input mode.
//  344   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  345   * @retval The GPIOx input data port value.
//  346   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  347 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
//  348 {
//  349   return ((uint8_t)GPIOx->IDR);
GPIO_ReadInputData:
        INCW      X
        LD        A, (X)
        RET
//  350 }
//  351 
//  352 /**
//  353   * @brief  Reads the specified GPIO output data port.
//  354   * @note   The port must be configured in input mode.
//  355   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  356   * @retval The GPIOx  output data port value.
//  357   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  358 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
//  359 {
//  360   return ((uint8_t)GPIOx->ODR);
GPIO_ReadOutputData:
        LD        A, (X)
        RET
//  361 }
//  362 
//  363 /**
//  364   * @brief  Reads the specified GPIO input data pin.
//  365   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  366   * @param  GPIO_Pin : Specifies the pin number.
//  367   *           This parameter can be one of the following values:
//  368   *            @arg GPIO_Pin_0: Pin 0
//  369   *            @arg GPIO_Pin_1: Pin 1
//  370   *            @arg GPIO_Pin_2: Pin 2
//  371   *            @arg GPIO_Pin_3: Pin 3
//  372   *            @arg GPIO_Pin_4: Pin 4
//  373   *            @arg GPIO_Pin_5: Pin 5
//  374   *            @arg GPIO_Pin_6: Pin 6
//  375   *            @arg GPIO_Pin_7: Pin 7 
//  376   * @retval BitStatus : GPIO input pin status.
//  377   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  378 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
//  379 {
GPIO_ReadInputPin:
        LD        S:?b0, A
//  380   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
        INCW      X
        LD        A, (X)
        AND       A, S:?b0
        RET
//  381 }
//  382 
//  383 /**
//  384   * @brief  Reads the specified GPIO Output data pin.
//  385   * @param  GPIOx : Select the GPIO peripheral number (x = A to I).
//  386   * @param  GPIO_Pin : Specifies the pin number
//  387   * @retval BitStatus : GPIO output pin status.
//  388   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  389 BitStatus GPIO_ReadOutputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
//  390 {
GPIO_ReadOutputPin:
        LD        S:?b0, A
//  391   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
        LD        A, (X)
        AND       A, S:?b0
        RET
//  392 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  393 
//  394 /**
//  395   * @}
//  396   */ 
//  397 
//  398 /**
//  399   * @}
//  400   */ 
//  401   
//  402 /**
//  403   * @}
//  404   */
//  405 
//  406 /**
//  407   * @}
//  408   */
//  409 
//  410 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
// 265 bytes in section .near_func.text
// 
// 265 bytes of CODE memory
//
//Errors: none
//Warnings: none
