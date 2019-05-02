///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                22/Mar/2019  11:20:54
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        G:\Darren\MCU\STM8\Software\Libraries\STM8L15x_StdPeriph_Driver\src\stm8l15x_tim4.c
//    Command line =  
//        -f C:\Users\new06\AppData\Local\Temp\EWB2E7.tmp
//        (G:\Darren\MCU\STM8\Software\Libraries\STM8L15x_StdPeriph_Driver\src\stm8l15x_tim4.c
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
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\Debug\List\stm8l15x_tim4.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3

        PUBLIC TIM4_ARRPreloadConfig
        PUBLIC TIM4_ClearFlag
        PUBLIC TIM4_ClearITPendingBit
        PUBLIC TIM4_Cmd
        PUBLIC TIM4_DMACmd
        PUBLIC TIM4_DeInit
        PUBLIC TIM4_GenerateEvent
        PUBLIC TIM4_GetCounter
        PUBLIC TIM4_GetFlagStatus
        PUBLIC TIM4_GetITStatus
        PUBLIC TIM4_GetPrescaler
        PUBLIC TIM4_ITConfig
        PUBLIC TIM4_InternalClockConfig
        PUBLIC TIM4_PrescalerConfig
        PUBLIC TIM4_SelectInputTrigger
        PUBLIC TIM4_SelectMasterSlaveMode
        PUBLIC TIM4_SelectOnePulseMode
        PUBLIC TIM4_SelectOutputTrigger
        PUBLIC TIM4_SelectSlaveMode
        PUBLIC TIM4_SetAutoreload
        PUBLIC TIM4_SetCounter
        PUBLIC TIM4_TimeBaseInit
        PUBLIC TIM4_UpdateDisableConfig
        PUBLIC TIM4_UpdateRequestConfig

// G:\Darren\MCU\STM8\Software\Libraries\STM8L15x_StdPeriph_Driver\src\stm8l15x_tim4.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_tim4.c
//    4   * @author  MCD Application Team
//    5   * @version V1.6.1
//    6   * @date    30-September-2014
//    7   * @brief   This file provides firmware functions to manage the following 
//    8   *          functionalities of the TIM4 peripheral:
//    9   *            - TimeBase management
//   10   *            - Interrupts, DMA and flags management
//   11   *            - Clocks management
//   12   *            - Synchronization management
//   13   *
//   14   *  @verbatim
//   15   *  
//   16   *          ===================================================================
//   17   *                                 How to use this driver
//   18   *          ===================================================================
//   19   *          This driver provides functions to configure and initialize the TIM4 
//   20   *          peripheral
//   21   *          These functions are split in 4 groups: 
//   22   *   
//   23   *          1. TIM4 TimeBase management: this group includes all needed functions 
//   24   *             to configure the TIM Timebase unit:
//   25   *                   - Set/Get Prescaler
//   26   *                   - Set/Get Autoreload  
//   27   *                   - Select the One Pulse mode
//   28   *                   - Update Request Configuration
//   29   *                   - Update Disable Configuration
//   30   *                   - Auto-Preload Configuration 
//   31   *                   - Enable/Disable the counter
//   32   *                         
//   33   *          2. TIM4 interrupts, DMA and flags management
//   34   *                   - Enable/Disable interrupt sources
//   35   *                   - Get flags status
//   36   *                   - Clear flags/ Pending bits
//   37   *                   - Enable/Disable DMA requests 
//   38   *              
//   39   *          3. TIM4 clocks management: this group includes all needed functions 
//   40   *             to configure the clock controller unit:
//   41   *                   - Select internal clock
//   42   *         
//   43   *          4. TIM4 synchronization management: this group includes all needed 
//   44   *             functions to configure the Synchronization unit:
//   45   *                   - Select Input Trigger  
//   46   *                   - Select Output Trigger  
//   47   *                   - Select Master Slave Mode    
//   48   *      
//   49   *   
//   50   *  @endverbatim
//   51   *    
//   52   ******************************************************************************
//   53   * @attention
//   54   *
//   55   * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
//   56   *
//   57   * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
//   58   * You may not use this file except in compliance with the License.
//   59   * You may obtain a copy of the License at:
//   60   *
//   61   *        http://www.st.com/software_license_agreement_liberty_v2
//   62   *
//   63   * Unless required by applicable law or agreed to in writing, software 
//   64   * distributed under the License is distributed on an "AS IS" BASIS, 
//   65   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   66   * See the License for the specific language governing permissions and
//   67   * limitations under the License.
//   68   *
//   69   ******************************************************************************
//   70   */
//   71 
//   72 
//   73 /* Includes ------------------------------------------------------------------*/
//   74 #include "stm8l15x_tim4.h"
//   75 
//   76 /** @addtogroup STM8L15x_StdPeriph_Driver
//   77   * @{
//   78   */
//   79 
//   80 /** @defgroup TIM4
//   81   * @brief TIM4 driver modules
//   82   * @{
//   83   */
//   84   
//   85 /* Private typedef -----------------------------------------------------------*/
//   86 /* Private define ------------------------------------------------------------*/
//   87 /* Private macro -------------------------------------------------------------*/
//   88 /* Private variables ---------------------------------------------------------*/
//   89 /* Private function prototypes -----------------------------------------------*/
//   90 /** @defgroup TIM4_Private_Functions
//   91   * @{
//   92   */
//   93 
//   94 /** @defgroup TIM4_Group1 TimeBase management functions
//   95  *  @brief   TimeBase management functions 
//   96  *
//   97 @verbatim   
//   98  ===============================================================================
//   99                        TimeBase management functions
//  100  ===============================================================================  
//  101   
//  102        ===================================================================      
//  103               TIM4 Driver: how to use it in Timing(Time base) Mode
//  104        =================================================================== 
//  105        To use the Timer in Timing(Time base) mode, the following steps are mandatory:
//  106        
//  107        1. Enable TIM4 clock using CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE) function.
//  108         
//  109        2. Call TIM4_TimeBaseInit() to configure the Time Base unit with the
//  110           corresponding configuration.
//  111           
//  112        3. Enable global interrupts if you need to generate the update interrupt.
//  113           
//  114        4. Enable the corresponding interrupt using the function TIM4_ITConfig(TIM4_IT_Update) 
//  115           
//  116        5. Call the TIM4_Cmd(ENABLE) function to enable the TIM4 counter.
//  117        
//  118        Note1: All other functions can be used separately to modify, if needed,
//  119           a specific feature of the Timer. 
//  120 
//  121 @endverbatim
//  122   * @{
//  123   */
//  124 
//  125 /**
//  126   * @brief  Deinitializes the TIM4 peripheral registers to their default reset values.
//  127   * @param  None
//  128   * @retval None
//  129   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  130 void TIM4_DeInit(void)
//  131 {
//  132   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
TIM4_DeInit:
        CLR       L:0x52e0
//  133   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
        CLR       L:0x52e1
//  134   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
        CLR       L:0x52e2
//  135   TIM4->IER   = TIM4_IER_RESET_VALUE;
        CLR       L:0x52e4
//  136   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
        CLR       L:0x52e7
//  137   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
        CLR       L:0x52e8
//  138   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
        MOV       L:0x52e9, #0xff
//  139   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
        CLR       L:0x52e5
//  140 }
        RET
//  141 
//  142 /**
//  143   * @brief  Initializes the TIM4 Time Base Unit according to the specified parameters.
//  144   * @param  TIM4_Prescaler: Prescaler
//  145   *          This parameter can be one of the following values:
//  146   *            @arg TIM4_Prescaler_1: Time base Prescaler = 1 (No effect)
//  147   *            @arg TIM4_Prescaler_2: Time base Prescaler = 2
//  148   *            @arg TIM4_Prescaler_4: Time base Prescaler = 4
//  149   *            @arg TIM4_Prescaler_8: Time base Prescaler = 8
//  150   *            @arg TIM4_Prescaler_16: Time base Prescaler = 16
//  151   *            @arg TIM4_Prescaler_32: Time base Prescaler = 32
//  152   *            @arg TIM4_Prescaler_64: Time base Prescaler = 64
//  153   *            @arg TIM4_Prescaler_128: Time base Prescaler = 128
//  154   *            @arg TIM4_Prescaler_256: Time base Prescaler = 256
//  155   *            @arg TIM4_Prescaler_512: Time base Prescaler = 512
//  156   *            @arg TIM4_Prescaler_1024: Time base Prescaler = 1024
//  157   *            @arg TIM4_Prescaler_2048: Time base Prescaler = 2048
//  158   *            @arg TIM4_Prescaler_4096: Time base Prescaler = 4096
//  159   *            @arg TIM4_Prescaler_8192: Time base Prescaler = 8192
//  160   *            @arg TIM4_Prescaler_16384: Time base Prescaler = 16384
//  161   *            @arg TIM4_Prescaler_32768: Time base Prescaler = 32768                              
//  162   * @param  TIM4_Period: This parameter must be a value between 0x00 and 0xFF.
//  163   * @retval None
//  164   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  165 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
//  166                        uint8_t TIM4_Period)
//  167 {
TIM4_TimeBaseInit:
        LD        S:?b1, A
//  168   /* Check TIM4 prescaler value */
//  169   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
//  170   /* Set the Autoreload value */
//  171   TIM4->ARR = (uint8_t)(TIM4_Period);
        LD        A, S:?b0
        LD        L:0x52e9, A
//  172   /* Set the Prescaler value */
//  173   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
        LD        A, S:?b1
        LD        L:0x52e8, A
//  174 
//  175   /* Generate an update event to reload the Prescaler value immediately */
//  176   TIM4->EGR = TIM4_EventSource_Update;
        MOV       L:0x52e6, #0x1
//  177 }
        RET
//  178 
//  179 /**
//  180   * @brief  Configures the TIM4 Prescaler.
//  181   * @param  Prescaler: Specifies the Prescaler Register value
//  182   *          This parameter can be one of the following values:
//  183   *            @arg TIM4_Prescaler_1: Time base Prescaler = 1 (No effect)
//  184   *            @arg TIM4_Prescaler_2: Time base Prescaler = 2
//  185   *            @arg TIM4_Prescaler_4: Time base Prescaler = 4
//  186   *            @arg TIM4_Prescaler_8: Time base Prescaler = 8
//  187   *            @arg TIM4_Prescaler_16: Time base Prescaler = 16
//  188   *            @arg TIM4_Prescaler_32: Time base Prescaler = 32
//  189   *            @arg TIM4_Prescaler_64: Time base Prescaler = 64
//  190   *            @arg TIM4_Prescaler_128: Time base Prescaler = 128
//  191   *            @arg TIM4_Prescaler_256: Time base Prescaler = 256
//  192   *            @arg TIM4_Prescaler_512: Time base Prescaler = 512
//  193   *            @arg TIM4_Prescaler_1024: Time base Prescaler = 1024
//  194   *            @arg TIM4_Prescaler_2048: Time base Prescaler = 2048
//  195   *            @arg TIM4_Prescaler_4096: Time base Prescaler = 4096
//  196   *            @arg TIM4_Prescaler_8192: Time base Prescaler = 8192
//  197   *            @arg TIM4_Prescaler_16384: Time base Prescaler = 16384
//  198   *            @arg TIM4_Prescaler_32768: Time base Prescaler = 32768 
//  199   * @param  TIM4_PSCReloadMode: Specifies the TIM4 Prescaler Reload mode.
//  200   *          This parameter can be one of the following values:
//  201   *            @arg TIM4_PSCReloadMode_Update: Prescaler value is reloaded at every update
//  202   *            @arg TIM4_PSCReloadMode_Immediate: Prescaler value is reloaded immediately
//  203   * @retval None
//  204   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  205 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
//  206                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
//  207 {
TIM4_PrescalerConfig:
        LD        S:?b1, A
//  208   /* Check the parameters */
//  209   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
//  210   assert_param(IS_TIM4_Prescaler(Prescaler));
//  211 
//  212   /* Set the Prescaler value */
//  213   TIM4->PSCR = (uint8_t) Prescaler;
        LD        A, S:?b1
        LD        L:0x52e8, A
//  214 
//  215   /* Set or reset the UG Bit */
//  216   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
        LD        A, S:?b0
        CP        A, #0x1
        JRNE      L:??TIM4_PrescalerConfig_0
//  217   {
//  218     TIM4->EGR |= TIM4_EGR_UG ;
        BSET      L:0x52e6, #0x0
        JRA       L:??TIM4_PrescalerConfig_1
//  219   }
//  220   else
//  221   {
//  222     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
??TIM4_PrescalerConfig_0:
        BRES      L:0x52e6, #0x0
//  223   }
//  224 }
??TIM4_PrescalerConfig_1:
        RET
//  225 
//  226 /**
//  227   * @brief  Sets the TIM4 Counter Register value.
//  228   * @param  Counter: Specifies the Counter register new value.
//  229   *          This parameter is between 0x00 and 0xFF.
//  230   * @retval None
//  231   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  232 void TIM4_SetCounter(uint8_t Counter)
//  233 {
//  234   /* Set the Counter Register value */
//  235   TIM4->CNTR = (uint8_t)(Counter);
TIM4_SetCounter:
        LD        L:0x52e7, A
//  236 }
        RET
//  237 
//  238 /**
//  239   * @brief  Sets the TIM4 Autoreload Register value.
//  240   * @param  Autoreload: Specifies the Autoreload register new value.
//  241   *          This parameter is between 0x00 and 0xFF.
//  242   * @retval None
//  243   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  244 void TIM4_SetAutoreload(uint8_t Autoreload)
//  245 {
//  246   /* Set the Autoreload Register value */
//  247   TIM4->ARR = (uint8_t)(Autoreload);
TIM4_SetAutoreload:
        LD        L:0x52e9, A
//  248 }
        RET
//  249 
//  250 /**
//  251   * @brief  Gets the TIM4 Counter value.
//  252   * @param  None
//  253   * @retval Counter Register value.
//  254   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  255 uint8_t TIM4_GetCounter(void)
//  256 {
//  257   uint8_t tmpcntr = 0;
TIM4_GetCounter:
        CLR       A
//  258   tmpcntr = TIM4->CNTR;
        MOV       S:?b0, L:0x52e7
        LD        A, S:?b0
//  259   /* Get the Counter Register value */
//  260   return ((uint8_t)tmpcntr);
        RET
//  261 }
//  262 
//  263 /**
//  264   * @brief  Gets the TIM4 Prescaler value.
//  265   * @param  None
//  266   * @retval TIM4 Prescaler can be one of the following values:
//  267   *            - TIM4_Prescaler_1: Time base Prescaler = 1 (No effect)
//  268   *            - TIM4_Prescaler_2: Time base Prescaler = 2
//  269   *            - TIM4_Prescaler_4: Time base Prescaler = 4
//  270   *            - TIM4_Prescaler_8: Time base Prescaler = 8
//  271   *            - TIM4_Prescaler_16: Time base Prescaler = 16
//  272   *            - TIM4_Prescaler_32: Time base Prescaler = 32
//  273   *            - TIM4_Prescaler_64: Time base Prescaler = 64
//  274   *            - TIM4_Prescaler_128: Time base Prescaler = 128
//  275   *            - TIM4_Prescaler_256: Time base Prescaler = 256
//  276   *            - TIM4_Prescaler_512: Time base Prescaler = 512
//  277   *            - TIM4_Prescaler_1024: Time base Prescaler = 1024
//  278   *            - TIM4_Prescaler_2048: Time base Prescaler = 2048
//  279   *            - TIM4_Prescaler_4096: Time base Prescaler = 4096
//  280   *            - TIM4_Prescaler_8192: Time base Prescaler = 8192
//  281   *            - TIM4_Prescaler_16384: Time base Prescaler = 16384
//  282   *            - TIM4_Prescaler_32768: Time base Prescaler = 32768  
//  283   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  284 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
//  285 {
//  286   /* Get the Prescaler Register value */
//  287   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
TIM4_GetPrescaler:
        LD        A, L:0x52e8
        RET
//  288 }
//  289 
//  290 /**
//  291   * @brief  Enables or Disables the TIM4 Update event.
//  292   * @param  NewState: The new state of the TIM4 peripheral Preload register.
//  293   *          This parameter can be ENABLE or DISABLE
//  294   * @retval None
//  295   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  296 void TIM4_UpdateDisableConfig(FunctionalState NewState)
//  297 {
//  298   /* Check the parameters */
//  299   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  300 
//  301   /* Set or Reset the UDIS Bit */
//  302   if (NewState != DISABLE)
TIM4_UpdateDisableConfig:
        TNZ       A
        JREQ      L:??TIM4_UpdateDisableConfig_0
//  303   {
//  304     TIM4->CR1 |= TIM4_CR1_UDIS ;
        BSET      L:0x52e0, #0x1
        JRA       L:??TIM4_UpdateDisableConfig_1
//  305   }
//  306   else
//  307   {
//  308     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
??TIM4_UpdateDisableConfig_0:
        BRES      L:0x52e0, #0x1
//  309   }
//  310 }
??TIM4_UpdateDisableConfig_1:
        RET
//  311 
//  312 /**
//  313   * @brief  Selects the TIM4 Update Request Interrupt source.
//  314   * @param  TIM4_UpdateSource: Specifies the Update source.
//  315   *          This parameter can be one of the following values:
//  316   *            @arg TIM4_UpdateSource_Global: Global Update request source
//  317   *            @arg TIM4_UpdateSource_Regular: Regular Update request source
//  318   * @retval None
//  319   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  320 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
//  321 {
//  322   /* Check the parameters */
//  323   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
//  324 
//  325   /* Set or Reset the URS Bit */
//  326   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
TIM4_UpdateRequestConfig:
        CP        A, #0x1
        JRNE      L:??TIM4_UpdateRequestConfig_0
//  327   {
//  328     TIM4->CR1 |= TIM4_CR1_URS ;
        BSET      L:0x52e0, #0x2
        JRA       L:??TIM4_UpdateRequestConfig_1
//  329   }
//  330   else
//  331   {
//  332     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
??TIM4_UpdateRequestConfig_0:
        BRES      L:0x52e0, #0x2
//  333   }
//  334 }
??TIM4_UpdateRequestConfig_1:
        RET
//  335 
//  336 /**
//  337   * @brief  Enables or disables TIM4 peripheral Preload register on ARR.
//  338   * @param  NewState: The new state of the TIM4 peripheral Preload register.
//  339   *          This parameter can be ENABLE or DISABLE
//  340   * @retval None
//  341   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  342 void TIM4_ARRPreloadConfig(FunctionalState NewState)
//  343 {
//  344   /* Check the parameters */
//  345   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  346 
//  347   /* Set or Reset the ARPE Bit */
//  348   if (NewState != DISABLE)
TIM4_ARRPreloadConfig:
        TNZ       A
        JREQ      L:??TIM4_ARRPreloadConfig_0
//  349   {
//  350     TIM4->CR1 |= TIM4_CR1_ARPE ;
        BSET      L:0x52e0, #0x7
        JRA       L:??TIM4_ARRPreloadConfig_1
//  351   }
//  352   else
//  353   {
//  354     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
??TIM4_ARRPreloadConfig_0:
        BRES      L:0x52e0, #0x7
//  355   }
//  356 }
??TIM4_ARRPreloadConfig_1:
        RET
//  357 
//  358 /**
//  359   * @brief  Selects the TIM4’s One Pulse Mode.
//  360   * @param  TIM4_OPMode: Specifies the OPM Mode to be used.
//  361   *          This parameter can be one of the following values:
//  362   *            @arg TIM4_OPMode_Single: Single one Pulse mode (OPM Active)
//  363   *            @arg TIM4_OPMode_Repetitive: Repetitive Pulse mode (OPM inactive)
//  364   * @retval None
//  365   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  366 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
//  367 {
//  368   /* Check the parameters */
//  369   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
//  370 
//  371   /* Set or Reset the OPM Bit */
//  372   if (TIM4_OPMode == TIM4_OPMode_Single)
TIM4_SelectOnePulseMode:
        CP        A, #0x1
        JRNE      L:??TIM4_SelectOnePulseMode_0
//  373   {
//  374     TIM4->CR1 |= TIM4_CR1_OPM ;
        BSET      L:0x52e0, #0x3
        JRA       L:??TIM4_SelectOnePulseMode_1
//  375   }
//  376   else
//  377   {
//  378     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
??TIM4_SelectOnePulseMode_0:
        BRES      L:0x52e0, #0x3
//  379   }
//  380 }
??TIM4_SelectOnePulseMode_1:
        RET
//  381 
//  382 /**
//  383   * @brief  Enables or disables the TIM4 peripheral.
//  384   * @param  NewState: The new state of the TIM4 peripheral.
//  385   *          This parameter can be ENABLE or DISABLE
//  386   * @retval None
//  387   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  388 void TIM4_Cmd(FunctionalState NewState)
//  389 {
//  390   /* Check the parameters */
//  391   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  392 
//  393   /* set or Reset the CEN Bit */
//  394   if (NewState != DISABLE)
TIM4_Cmd:
        TNZ       A
        JREQ      L:??TIM4_Cmd_0
//  395   {
//  396     TIM4->CR1 |= TIM4_CR1_CEN ;
        BSET      L:0x52e0, #0x0
        JRA       L:??TIM4_Cmd_1
//  397   }
//  398   else
//  399   {
//  400     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
??TIM4_Cmd_0:
        BRES      L:0x52e0, #0x0
//  401   }
//  402 }
??TIM4_Cmd_1:
        RET
//  403 
//  404 /**
//  405   * @}
//  406   */
//  407 
//  408 /** @defgroup TIM4_Group2 Interrupts DMA and flags management functions
//  409  *  @brief    Interrupts, DMA and flags management functions 
//  410  *
//  411 @verbatim   
//  412  ===============================================================================
//  413                  Interrupts, DMA and flags management functions
//  414  ===============================================================================  
//  415 
//  416 @endverbatim
//  417   * @{
//  418   */
//  419 
//  420 /**
//  421   * @brief  Enables or disables the specified TIM4 interrupts.
//  422   * @param  TIM4_IT: Specifies the TIM4 interrupts sources to be enabled or disabled.
//  423   *          This parameter can be one of the following values:
//  424   *            @arg TIM4_IT_Update: Update
//  425   *            @arg TIM4_IT_Trigger: Trigger
//  426   * @param  NewState: The new state of the TIM4 peripheral.
//  427   *          This parameter can be ENABLE or DISABLE
//  428   * @retval None
//  429   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  430 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
//  431 {
TIM4_ITConfig:
        LD        S:?b1, A
//  432   /* Check the parameters */
//  433   assert_param(IS_TIM4_IT(TIM4_IT));
//  434   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  435 
//  436   if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??TIM4_ITConfig_0
//  437   {
//  438     /* Enable the Interrupt sources */
//  439     TIM4->IER |= (uint8_t)TIM4_IT;
        LD        A, L:0x52e4
        OR        A, S:?b1
        LD        L:0x52e4, A
        JRA       L:??TIM4_ITConfig_1
//  440   }
//  441   else
//  442   {
//  443     /* Disable the Interrupt sources */
//  444     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
??TIM4_ITConfig_0:
        LD        A, S:?b1
        CPL       A
        AND       A, L:0x52e4
        LD        L:0x52e4, A
//  445   }
//  446 }
??TIM4_ITConfig_1:
        RET
//  447 
//  448 /**
//  449   * @brief  Configures the TIM4 event to be generated by software.
//  450   * @param  TIM4_EventSource: Specifies the event source.
//  451   *          This parameter can be one of the following values:
//  452   *            @arg TIM4_EventSource_Update: Update
//  453   *            @arg TIM4_EventSource_Trigger: Trigger
//  454   * @retval None
//  455   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  456 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
//  457 {
TIM4_GenerateEvent:
        LD        S:?b0, A
//  458   /* Check the parameters */
//  459   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
//  460 
//  461   /* Set the event sources */
//  462   TIM4->EGR |= (uint8_t)TIM4_EventSource;
        LD        A, L:0x52e6
        OR        A, S:?b0
        LD        L:0x52e6, A
//  463 }
        RET
//  464 
//  465 /**
//  466   * @brief  Checks whether the specified TIM4 flag is set or not.
//  467   * @param  TIM4_FLAG: Specifies the flag to check.
//  468   *          This parameter can be one of the following values:
//  469   *            @arg TIM4_FLAG_Update: Update
//  470   *            @arg TIM4_FLAG_Trigger: Trigger
//  471   * @retval FlagStatus: The new state of TIM4_FLAG.
//  472   *          This parameter can be SET or RESET.
//  473   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  474 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
//  475 {
TIM4_GetFlagStatus:
        LD        S:?b1, A
//  476   FlagStatus bitstatus = RESET;
        CLR       S:?b0
//  477 
//  478   /* Check the parameters */
//  479   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
//  480 
//  481   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
        LD        A, L:0x52e5
        AND       A, S:?b1
        CP        A, #0x0
        JREQ      L:??TIM4_GetFlagStatus_0
//  482   {
//  483     bitstatus = SET;
        LD        A, #0x1
        LD        S:?b0, A
        JRA       L:??TIM4_GetFlagStatus_1
//  484   }
//  485   else
//  486   {
//  487     bitstatus = RESET;
??TIM4_GetFlagStatus_0:
        CLR       S:?b0
//  488   }
//  489   return ((FlagStatus)bitstatus);
??TIM4_GetFlagStatus_1:
        LD        A, S:?b0
        RET
//  490 }
//  491 
//  492 /**
//  493   * @brief  Clears the TIM’s pending flags.
//  494   * @param  TIM4_FLAG: Specifies the flag to clear.
//  495   *          This parameter can be one of the following values:
//  496   *            @arg TIM4_FLAG_Update: Update
//  497   *            @arg TIM4_FLAG_Trigger: Trigger
//  498   * @retval None
//  499   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  500 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
//  501 {
TIM4_ClearFlag:
        LD        S:?b0, A
//  502   /* Check the parameters */
//  503   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
//  504   /* Clear the flags (rc_w0) clear this bit by writing 0. Writing ‘1’ has no effect*/
//  505   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
        LD        A, S:?b0
        CPL       A
        LD        L:0x52e5, A
//  506 }
        RET
//  507 
//  508 /**
//  509   * @brief  Checks whether the TIM4 interrupt has occurred or not.
//  510   * @param  TIM4_IT: Specifies the TIM4 interrupt source to check.
//  511   *          This parameter can be one of the following values:
//  512   *            @arg TIM4_IT_Update: Update
//  513   *            @arg TIM4_IT_Trigger: Trigger
//  514   * @retval ITStatus: The new state of the TIM4_IT.
//  515   *          This parameter can be SET or RESET
//  516   */
//  517 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  518 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
//  519 {
TIM4_GetITStatus:
        LD        S:?b3, A
//  520   ITStatus bitstatus = RESET;
        CLR       S:?b2
//  521 
//  522   uint8_t itStatus = 0x0, itEnable = 0x0;
        CLR       S:?b1
        CLR       S:?b0
//  523 
//  524   /* Check the parameters */
//  525   assert_param(IS_TIM4_GET_IT(TIM4_IT));
//  526 
//  527   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
        LD        A, L:0x52e5
        AND       A, S:?b3
        LD        S:?b1, A
//  528 
//  529   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
        LD        A, L:0x52e4
        AND       A, S:?b3
        LD        S:?b0, A
//  530 
//  531   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
        TNZ       S:?b1
        JREQ      L:??TIM4_GetITStatus_0
        TNZ       S:?b0
        JREQ      L:??TIM4_GetITStatus_0
//  532   {
//  533     bitstatus = (ITStatus)SET;
        LD        A, #0x1
        LD        S:?b2, A
        JRA       L:??TIM4_GetITStatus_1
//  534   }
//  535   else
//  536   {
//  537     bitstatus = (ITStatus)RESET;
??TIM4_GetITStatus_0:
        CLR       S:?b2
//  538   }
//  539   return ((ITStatus)bitstatus);
??TIM4_GetITStatus_1:
        LD        A, S:?b2
        RET
//  540 }
//  541 
//  542 /**
//  543   * @brief  Clears the TIM4's interrupt pending bits.
//  544   * @param  TIM4_IT: Specifies the pending bit to clear.
//  545   *          This parameter can be one of the following values:
//  546   *            @arg TIM4_IT_Update: Update
//  547   *            @arg TIM4_IT_Trigger: Trigger
//  548   * @retval None
//  549   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  550 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
//  551 {
TIM4_ClearITPendingBit:
        LD        S:?b0, A
//  552   /* Check the parameters */
//  553   assert_param(IS_TIM4_IT(TIM4_IT));
//  554 
//  555   /* Clear the IT pending Bit */
//  556   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
        LD        A, S:?b0
        CPL       A
        LD        L:0x52e5, A
//  557 }
        RET
//  558 
//  559 /**
//  560   * @brief  Enables or disables the TIMx’s DMA Requests.
//  561   * @param  TIM4_DMASources: specifies the DMA Request sources.
//  562   *          This parameter can be one of the following values:
//  563   *            @arg TIM4_DMASource_Update: Update
//  564   * @param  NewState: new state of the DMA Request sources.
//  565   *          This parameter can be: ENABLE or DISABLE.
//  566   * @retval None
//  567   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  568 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
//  569 {
TIM4_DMACmd:
        LD        S:?b1, A
//  570   /* Check the parameters */
//  571   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  572   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
//  573 
//  574   if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??TIM4_DMACmd_0
//  575   {
//  576     /* Enable the DMA sources */
//  577     TIM4->DER |= (uint8_t)TIM4_DMASource;
        LD        A, L:0x52e3
        OR        A, S:?b1
        LD        L:0x52e3, A
        JRA       L:??TIM4_DMACmd_1
//  578   }
//  579   else
//  580   {
//  581     /* Disable the DMA sources */
//  582     TIM4->DER &= (uint8_t)~TIM4_DMASource;
??TIM4_DMACmd_0:
        LD        A, S:?b1
        CPL       A
        AND       A, L:0x52e3
        LD        L:0x52e3, A
//  583   }
//  584 }
??TIM4_DMACmd_1:
        RET
//  585 
//  586 /**
//  587   * @}
//  588   */
//  589 
//  590 /** @defgroup TIM4_Group3 Clocks management functions
//  591  *  @brief    Clocks management functions
//  592  *
//  593 @verbatim   
//  594  ===============================================================================
//  595                          Clocks management functions
//  596  ===============================================================================  
//  597 
//  598 @endverbatim
//  599   * @{
//  600   */
//  601 
//  602 /**
//  603   * @brief  Enables the TIM4 internal Clock.
//  604   * @param  None
//  605   * @retval None
//  606   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  607 void TIM4_InternalClockConfig(void)
//  608 {
//  609   /* Disable slave mode to clock the prescaler directly with the internal clock */
//  610   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
TIM4_InternalClockConfig:
        LD        A, L:0x52e2
        AND       A, #0xf8
        LD        L:0x52e2, A
//  611 }
        RET
//  612 
//  613 /**
//  614   * @}
//  615   */
//  616 
//  617 /** @defgroup TIM4_Group4 Synchronization management functions
//  618  *  @brief    Synchronization management functions 
//  619  *
//  620 @verbatim   
//  621  ===============================================================================
//  622                        Synchronization management functions
//  623  ===============================================================================  
//  624                    
//  625        ===================================================================      
//  626               TIM4 Driver: how to use it in synchronization Mode
//  627        =================================================================== 
//  628        Case of two/several Timers
//  629        **************************
//  630        1. If TIM4 is used as master to other timers use the following functions:
//  631           - TIM4_SelectOutputTrigger()
//  632           - TIM4_SelectMasterSlaveMode()
//  633        2. If TIM4 is used as slave to other timers use the following functions:
//  634           - TIM4_SelectInputTrigger()
//  635           - TIM4_SelectSlaveMode()
//  636           
//  637 @endverbatim
//  638   * @{
//  639   */
//  640 
//  641 /**
//  642   * @brief  Selects the TIM4 Input Trigger source.
//  643   * @param  TIM4_InputTriggerSource: Specifies Input Trigger source.
//  644   *          This parameter can be one of the following values:
//  645   *            @arg TIM4_TRGSelection_TIM5: TRIG Input source =  TIM5 TRIG Output
//  646   *            @arg TIM4_TRGSelection_TIM1: TRIG Input source =  TIM1 TRIG Output
//  647   *            @arg TIM4_TRGSelection_TIM3: TRIG Input source =  TIM3 TRIG Output
//  648   *            @arg TIM4_TRGSelection_TIM2: TRIG Input source =  TIM2 TRIG Output
//  649   * @retval None
//  650   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  651 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
//  652 {
TIM4_SelectInputTrigger:
        LD        S:?b0, A
//  653   uint8_t tmpsmcr = 0;
        CLR       S:?b1
//  654 
//  655   /* Check the parameters */
//  656   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
//  657 
//  658   tmpsmcr = TIM4->SMCR;
        LD        A, L:0x52e2
        LD        S:?b1, A
//  659 
//  660   /* Select the Trigger Source */
//  661   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
        LD        A, S:?b1
        AND       A, #0x8f
        LD        S:?b1, A
//  662   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
        LD        A, S:?b0
        OR        A, S:?b1
        LD        S:?b1, A
//  663 
//  664   TIM4->SMCR = (uint8_t)tmpsmcr;
        LD        A, S:?b1
        LD        L:0x52e2, A
//  665 }
        RET
//  666 
//  667 /**
//  668   * @brief  Selects the TIM4 Trigger Output Mode.
//  669   * @param  TIM4_TRGOSource: Specifies the Trigger Output source.
//  670   *          This parameter can be one of the following values:
//  671   *            @arg TIM4_TRGOSource_Reset: Trigger Output source = Reset
//  672   *            @arg TIM4_TRGOSource_Enable: Trigger Output source = TIM4 is enabled
//  673   *            @arg TIM4_TRGOSource_Update: Trigger Output source = Update event
//  674   * @retval None
//  675   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  676 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
//  677 {
TIM4_SelectOutputTrigger:
        LD        S:?b0, A
//  678   uint8_t tmpcr2 = 0;
        CLR       S:?b1
//  679 
//  680   /* Check the parameters */
//  681   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
//  682 
//  683   tmpcr2 = TIM4->CR2;
        LD        A, L:0x52e1
        LD        S:?b1, A
//  684 
//  685   /* Reset the MMS Bits */
//  686   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
        LD        A, S:?b1
        AND       A, #0x8f
        LD        S:?b1, A
//  687 
//  688   /* Select the TRGO source */
//  689   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
        LD        A, S:?b0
        OR        A, S:?b1
        LD        S:?b1, A
//  690 
//  691   TIM4->CR2 = tmpcr2;
        LD        A, S:?b1
        LD        L:0x52e1, A
//  692 }
        RET
//  693 
//  694 /**
//  695   * @brief  Selects the TIM4 Slave Mode.
//  696   * @param  TIM4_SlaveMode: Specifies the TIM4 Slave Mode.
//  697   *          This parameter can be one of the following values:
//  698   *            @arg TIM4_SlaveMode_Disable: Disable slave mode to clock the prescaler
//  699                                             directly with the internal clock
//  700   *            @arg TIM4_SlaveMode_Reset: Slave Mode Selection  = Reset
//  701   *            @arg TIM4_SlaveMode_Gated: Slave Mode Selection  = Gated
//  702   *            @arg TIM4_SlaveMode_Trigger: Slave Mode Selection  = Trigger
//  703   *            @arg TIM4_SlaveMode_External1: Slave Mode Selection  = External 1  
//  704   * @retval None
//  705   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  706 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
//  707 {
TIM4_SelectSlaveMode:
        LD        S:?b0, A
//  708   uint8_t tmpsmcr = 0;
        CLR       S:?b1
//  709 
//  710   /* Check the parameters */
//  711   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
//  712 
//  713   tmpsmcr = TIM4->SMCR;
        LD        A, L:0x52e2
        LD        S:?b1, A
//  714 
//  715   /* Reset the SMS Bits */
//  716   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
        LD        A, S:?b1
        AND       A, #0xf8
        LD        S:?b1, A
//  717 
//  718   /* Select the Slave Mode */
//  719   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
        LD        A, S:?b0
        OR        A, S:?b1
        LD        S:?b1, A
//  720 
//  721   TIM4->SMCR = tmpsmcr;
        LD        A, S:?b1
        LD        L:0x52e2, A
//  722 }
        RET
//  723 
//  724 /**
//  725   * @brief  Sets or Resets the TIM4 Master/Slave Mode.
//  726   * @param NewState: The new state of the synchronization between TIM4 and its slaves (through TRGO).
//  727   *          This parameter can be ENABLE or DISABLE
//  728   * @retval None
//  729   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  730 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
//  731 {
//  732   /* Check the parameters */
//  733   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  734 
//  735   /* Set or Reset the MSM Bit */
//  736   if (NewState != DISABLE)
TIM4_SelectMasterSlaveMode:
        TNZ       A
        JREQ      L:??TIM4_SelectMasterSlaveMode_0
//  737   {
//  738     TIM4->SMCR |= TIM4_SMCR_MSM;
        BSET      L:0x52e2, #0x7
        JRA       L:??TIM4_SelectMasterSlaveMode_1
//  739   }
//  740   else
//  741   {
//  742     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
??TIM4_SelectMasterSlaveMode_0:
        BRES      L:0x52e2, #0x7
//  743   }
//  744 }
??TIM4_SelectMasterSlaveMode_1:
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  745 
//  746 /**
//  747   * @}
//  748   */ 
//  749 
//  750 /**
//  751   * @}
//  752   */ 
//  753   
//  754 /**
//  755   * @}
//  756   */
//  757 
//  758 /**
//  759   * @}
//  760   */
//  761 
//  762 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
// 417 bytes in section .near_func.text
// 
// 417 bytes of CODE memory
//
//Errors: none
//Warnings: none
