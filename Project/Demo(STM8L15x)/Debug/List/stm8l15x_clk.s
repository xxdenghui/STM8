///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                22/Mar/2019  11:20:54
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        G:\Darren\MCU\STM8\Software\Libraries\STM8L15x_StdPeriph_Driver\src\stm8l15x_clk.c
//    Command line =  
//        -f C:\Users\new06\AppData\Local\Temp\EWB0F1.tmp
//        (G:\Darren\MCU\STM8\Software\Libraries\STM8L15x_StdPeriph_Driver\src\stm8l15x_clk.c
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
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\Debug\List\stm8l15x_clk.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?epilogue_l2_l3
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l0_l3
        EXTERN ?mov_l2_l0
        EXTERN ?mov_l3_l0
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?sll16_x_x_a
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN ?w7

        PUBLIC CLK_AdjustHSICalibrationValue
        PUBLIC CLK_BEEPClockConfig
        PUBLIC CLK_CCOConfig
        PUBLIC CLK_ClearFlag
        PUBLIC CLK_ClearITPendingBit
        PUBLIC CLK_ClockSecuritySystemEnable
        PUBLIC CLK_ClockSecuritySytemDeglitchCmd
        PUBLIC CLK_ClockSwitchCmd
        PUBLIC CLK_DeInit
        PUBLIC CLK_GetClockFreq
        PUBLIC CLK_GetFlagStatus
        PUBLIC CLK_GetITStatus
        PUBLIC CLK_GetSYSCLKSource
        PUBLIC CLK_HSEConfig
        PUBLIC CLK_HSICmd
        PUBLIC CLK_HaltConfig
        PUBLIC CLK_ITConfig
        PUBLIC CLK_LSEClockSecuritySystemEnable
        PUBLIC CLK_LSEConfig
        PUBLIC CLK_LSICmd
        PUBLIC CLK_MainRegulatorCmd
        PUBLIC CLK_PeripheralClockConfig
        PUBLIC CLK_RTCCLKSwitchOnLSEFailureEnable
        PUBLIC CLK_RTCClockConfig
        PUBLIC CLK_SYSCLKDivConfig
        PUBLIC CLK_SYSCLKSourceConfig
        PUBLIC SYSDivFactor

// G:\Darren\MCU\STM8\Software\Libraries\STM8L15x_StdPeriph_Driver\src\stm8l15x_clk.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_clk.c
//    4   * @author  MCD Application Team
//    5   * @version V1.6.1
//    6   * @date    30-September-2014
//    7   * @brief   This file provides firmware functions to manage the following 
//    8   *          functionalities of the clock controller (CLK) peripheral:
//    9   *           - Internal/external clocks, CSS and CCO configuration
//   10   *           - System clocks configuration
//   11   *           - Peripheral clocks configuration
//   12   *           - CSS on LSE configuration 
//   13   *           - Low power clock configuration  
//   14   *           - Interrupts and flags management
//   15   *
//   16   *  @verbatim
//   17   *               
//   18   *          ===================================================================
//   19   *                               CLK specific features
//   20   *          ===================================================================
//   21   *    
//   22   *          After reset the device is running from Internal High Speed oscillator
//   23   *          divided by 8 (HSI/8 = 2MHz) with all peripherals off.
//   24   *           - The clock for all peripherals is switched off, except for the BootROM 
//   25   *             clock used for bootloader, in which case, the software should be properly 
//   26   *             written to switch off that clock after the bootloader execution.     
//   27   *
//   28   *          Once the device starts from reset, the user application has to:
//   29   *           - Configure the clock source to be used to drive the System clock
//   30   *             (if the application needs higher frequency/performance)
//   31   *           - Configure the System clock frequency  
//   32   *           - Enable the clock for the peripheral(s) to be used
//   33   *           - Configure the clock source(s) for peripherals which clocks are not
//   34   *             derived from the System clock (RTC/LCD, BEEP)
//   35   *
//   36   *  @endverbatim
//   37   *    
//   38   ******************************************************************************
//   39   * @attention
//   40   *
//   41   * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
//   42   *
//   43   * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
//   44   * You may not use this file except in compliance with the License.
//   45   * You may obtain a copy of the License at:
//   46   *
//   47   *        http://www.st.com/software_license_agreement_liberty_v2
//   48   *
//   49   * Unless required by applicable law or agreed to in writing, software 
//   50   * distributed under the License is distributed on an "AS IS" BASIS, 
//   51   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   52   * See the License for the specific language governing permissions and
//   53   * limitations under the License.
//   54   *
//   55   ******************************************************************************
//   56   */
//   57 
//   58 /* Includes ------------------------------------------------------------------*/
//   59 
//   60 #include "stm8l15x_clk.h"
//   61 
//   62 /** @addtogroup STM8L15x_StdPeriph_Driver
//   63   * @{
//   64   */
//   65 
//   66 /** @defgroup CLK 
//   67   * @brief CLK driver modules
//   68   * @{
//   69   */ 
//   70 /* Private typedef -----------------------------------------------------------*/
//   71 /* Private macro -------------------------------------------------------------*/
//   72 /* Private Variables ---------------------------------------------------------*/
//   73 /* Private Constant ---------------------------------------------------------*/

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   74 CONST uint8_t SYSDivFactor[5] = {1, 2, 4, 8, 16}; /*!< Holds the different Master clock Divider factors */
SYSDivFactor:
        DC8 1, 2, 4, 8, 16
//   75 /* Private function prototypes -----------------------------------------------*/
//   76 /* Private functions ---------------------------------------------------------*/
//   77 
//   78 /** @defgroup CLK_Private_Functions
//   79   * @{
//   80   */ 
//   81 
//   82 /** @defgroup CLK_Group1 Internal and external clocks, CSS and CCO configuration functions
//   83  *  @brief   Internal and external clocks, CSS and CCO configuration functions 
//   84  *
//   85 @verbatim   
//   86  ===============================================================================
//   87       Internal/external clocks, CSS and CCO configuration functions
//   88  ===============================================================================  
//   89 
//   90   This section provides functions allowing to configure the internal/external clocks,
//   91   CSS and CCO pins.
//   92   
//   93   1. HSI (high-speed internal), 16 MHz factory-trimmed RC used directly as System 
//   94      clock source.
//   95 
//   96   2. LSI (low-speed internal), 32 KHz low consumption RC used as IWDG and/or RTC
//   97      and/or BEEP clock source.
//   98 
//   99   3. HSE (high-speed external), 1 to 16 MHz crystal oscillator used directly as 
//  100      System clock source. Can be used also as RTC/LCD clock source.
//  101 
//  102   4. LSE (low-speed external), 32 KHz oscillator used as RTC/LCD and/or BEEP clock source.
//  103 
//  104   5. CSS (Clock security system), once enabled and if a HSE clock failure occurs 
//  105      (HSE used as System clock source), the System clock is automatically switched
//  106      to HSI and an interrupt is generated if enabled. 
//  107 
//  108   6. CCO (configurable clock output), used to output HSI, LSE, HSE, HSI, LSI
//  109      clock (through a configurable prescaler) on PC4 pin.
//  110 
//  111 @endverbatim
//  112   * @{
//  113   */
//  114 
//  115 /**
//  116   * @brief  Deinitializes the CLK peripheral registers to their default reset values.
//  117   * @param  None
//  118   * @retval None
//  119   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  120 void CLK_DeInit(void)
//  121 {
//  122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
CLK_DeInit:
        MOV       L:0x50c2, #0x11
//  123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
        CLR       L:0x50c6
//  124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
        CLR       L:0x50c1
//  125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
        CLR       L:0x50cb
//  126   CLK->SWR  = CLK_SWR_RESET_VALUE;
        MOV       L:0x50c8, #0x1
//  127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
        CLR       L:0x50c9
//  128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
        MOV       L:0x50c0, #0x3
//  129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
        CLR       L:0x50c3
//  130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
        MOV       L:0x50c4, #0x80
//  131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
        CLR       L:0x50d0
//  132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
        CLR       L:0x50ca
//  133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
        CLR       L:0x50c5
//  134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
        CLR       L:0x50cd
//  135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
        CLR       L:0x50cc
//  136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
        CLR       L:0x50ce
//  137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
        MOV       L:0x50cf, #0xb9
//  138 }
        RET
//  139 
//  140 /**
//  141   * @brief  Enables or disables the Internal High Speed oscillator (HSI).
//  142   * @note   The HSI is stopped by hardware when entering Halt and active Halt modes.
//  143   *         It is used (enabled by hardware) as system clock source after startup
//  144   *         from Reset, wakeup from Halt and active Halt mode when the FHWU bit is
//  145   *         set in the ICKCR register, or in case of HSE failure used as system clock
//  146   *         (if the Clock Security System CSS is enabled).             
//  147   * @note   HSI can not be stopped if it is used as active CCO source, as active 
//  148   *         RTC clock, if the safe oscillator (AUX) is enabled or as system clock source,
//  149   *         In this case, you have to select another source of the system clock 
//  150   *         then stop the HSI.
//  151   * @note   After enabling the HSI, the application software should wait on HSIRDY
//  152   *         flag to be set indicating that HSI clock is stable and can be used as
//  153   *         system clock source.  
//  154   * @param  NewState: new state of the HSI.
//  155     *         This parameter can be: ENABLE or DISABLE.
//  156   * @note   When the HSI is stopped, HSIRDY flag goes low after 6 HSI oscillator
//  157   *         clock cycles.  
//  158   * @retval None
//  159   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  160 void CLK_HSICmd(FunctionalState NewState)
//  161 {
//  162   /* Check the parameters */
//  163   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  164 
//  165   if (NewState != DISABLE)
CLK_HSICmd:
        TNZ       A
        JREQ      L:??CLK_HSICmd_0
//  166   {
//  167     /* Set HSION bit */
//  168     CLK->ICKCR |= CLK_ICKCR_HSION;
        BSET      L:0x50c2, #0x0
        JRA       L:??CLK_HSICmd_1
//  169   }
//  170   else
//  171   {
//  172     /* Reset HSION bit */
//  173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
??CLK_HSICmd_0:
        BRES      L:0x50c2, #0x0
//  174   }
//  175 }
??CLK_HSICmd_1:
        RET
//  176 
//  177 /**
//  178   * @brief  Adjusts the Internal High Speed oscillator (HSI) calibration value.
//  179   * @note   The calibration is used to compensate for the variations in voltage
//  180   *         and temperature that influence the frequency of the internal HSI RC.  
//  181   * @param  CLK_HSICalibrationValue : calibration trimming value.
//  182   *         This parameter must be a number between [(HSICALR register value) -12]
//  183   *         and [(HSICALR register value) + 8 ]  
//  184   * @note   Once HSITRIMR register configured, its value is used instead of the HSICALR
//  185   *         register values. 
//  186   * @retval None
//  187   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
//  189 {
//  190   /* two consecutive write access to HSIUNLCKR register to unlock HSITRIMR */
//  191   CLK->HSIUNLCKR = 0xAC;
CLK_AdjustHSICalibrationValue:
        MOV       L:0x50ce, #0xac
//  192   CLK->HSIUNLCKR = 0x35;
        MOV       L:0x50ce, #0x35
//  193 
//  194   /* Store the new value */
//  195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
        LD        L:0x50cd, A
//  196 }
        RET
//  197 
//  198 /**
//  199   * @brief  Enables or disables the Internal Low Speed oscillator (LSI).
//  200   * @note   After enabling the LSI, the application software should wait on 
//  201   *         LSIRDY flag to be set indicating that LSI clock is stable and can
//  202   *         be used to clock the IWDG and/or the RTC.
//  203   * @note   LSI can not be disabled if used as system clock source, as active CCO 
//  204   *         source, as BEEP clock source while BEEPAHALT bit is set or, as RTC active 
//  205   *         clock source.     
//  206   * @param  NewState: new state of the LSI.
//  207   *          This parameter can be: ENABLE or DISABLE.
//  208   * @note   When the LSI is stopped, LSIRDY flag goes low after 6 LSI oscillator
//  209   *         clock cycles. 
//  210   * @retval None
//  211   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  212 void CLK_LSICmd(FunctionalState NewState)
//  213 {
//  214 
//  215   /* Check the parameters */
//  216   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  217 
//  218   if (NewState != DISABLE)
CLK_LSICmd:
        TNZ       A
        JREQ      L:??CLK_LSICmd_0
//  219   {
//  220     /* Set LSION bit */
//  221     CLK->ICKCR |= CLK_ICKCR_LSION;
        BSET      L:0x50c2, #0x2
        JRA       L:??CLK_LSICmd_1
//  222   }
//  223   else
//  224   {
//  225     /* Reset LSION bit */
//  226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
??CLK_LSICmd_0:
        BRES      L:0x50c2, #0x2
//  227   }
//  228 }
??CLK_LSICmd_1:
        RET
//  229 
//  230 /**
//  231   * @brief  Configures the External High Speed oscillator (HSE).
//  232   * @note   After enabling the HSE (CLK_HSE_ON or CLK_HSE_Bypass), the application
//  233   *         software should wait on HSERDY flag to be set indicating that HSE clock
//  234   *         is stable and can be used to clock the system.
//  235   * @note   HSE state can not be changed if it is used as system clock. In this case,
//  236   *         you have to select another source of the system clock then change 
//  237   *         the HSE state (ex. disable it).
//  238   * @note   The HSE is stopped by hardware when entering HALT and active HALT modes.  
//  239   * @param  CLK_HSE: specifies the new state of the HSE.
//  240   *         This parameter can be one of the following values:
//  241   *            @arg CLK_HSE_OFF: turn OFF the HSE oscillator, HSERDY flag goes low after
//  242   *                              6 HSE oscillator clock cycles.
//  243   *            @arg CLK_HSE_ON: turn ON the HSE oscillator
//  244   *            @arg CLK_HSE_Bypass: HSE oscillator bypassed with external clock
//  245   * @note   In case of Enabling HSE Bypass make sure that the HSE clock source is
//  246   *         not used by the RTC, output or involved in a switching operation.
//  247   * @retval None
//  248   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
//  250 {
CLK_HSEConfig:
        LD        S:?b0, A
//  251   /* Check the parameters */
//  252   assert_param(IS_CLK_HSE(CLK_HSE));
//  253 
//  254   /* Reset HSEON and HSEBYP bits before configuring the HSE ------------------*/
//  255   /* Reset HSEON bit */
//  256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
        BRES      L:0x50c6, #0x0
//  257 
//  258   /* Reset HSEBYP bit */
//  259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
        BRES      L:0x50c6, #0x4
//  260 
//  261   /* Configure HSE */
//  262   CLK->ECKCR |= (uint8_t)CLK_HSE;
        LD        A, L:0x50c6
        OR        A, S:?b0
        LD        L:0x50c6, A
//  263 }
        RET
//  264 
//  265 /**
//  266   * @brief  Configures the External Low Speed oscillator (LSE).
//  267   * @note   After enabling the LSE (CLK_LSE_ON or CLK_LSE_Bypass), the application
//  268   *         software should wait on LSERDY flag to be set indicating that LSE clock
//  269   *         is stable and can be used to clock the RTC.
//  270   * @param  CLK_LSE: specifies the new state of the LSE.
//  271   *         This parameter can be one of the following values:
//  272   *            @arg CLK_LSE_OFF: turn OFF the LSE oscillator, LSERDY flag goes low after
//  273   *                              6 LSE oscillator clock cycles.
//  274   *            @arg CLK_LSE_ON: turn ON the LSE oscillator
//  275   *            @arg CLK_LSE_Bypass: LSE oscillator bypassed with external clock
//  276   * @note   In case of Enabling LSE Bypass make sure that the LSE clock source is
//  277   *         not used by the RTC, output or involved in a switching operation.  
//  278   * @retval None
//  279   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
//  281 {
CLK_LSEConfig:
        LD        S:?b0, A
//  282   /* Check the parameters */
//  283   assert_param(IS_CLK_LSE(CLK_LSE));
//  284 
//  285   /* Reset LSEON and LSEBYP bits before configuring the LSE ------------------*/
//  286   /* Reset LSEON bit */
//  287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
        BRES      L:0x50c6, #0x2
//  288 
//  289   /* Reset LSEBYP bit */
//  290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
        BRES      L:0x50c6, #0x5
//  291 
//  292   /* Configure LSE */
//  293   CLK->ECKCR |= (uint8_t)CLK_LSE;
        LD        A, L:0x50c6
        OR        A, S:?b0
        LD        L:0x50c6, A
//  294 
//  295 }
        RET
//  296 
//  297 /**
//  298   * @brief  Enables the Clock Security System.
//  299   * @note   If a failure is detected on the HSE oscillator clock, this oscillator
//  300   *         is automatically disabled and an interrupt is generated to inform the
//  301   *         software about the failure allowing the MCU to perform rescue operations.
//  302   * @note   Once CSS is enabled it cannot be disabled until the next reset.  
//  303   * @param  None
//  304   * @retval None
//  305   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  306 void CLK_ClockSecuritySystemEnable(void)
//  307 {
//  308   /* Set CSSEN bit */
//  309   CLK->CSSR |= CLK_CSSR_CSSEN;
CLK_ClockSecuritySystemEnable:
        BSET      L:0x50ca, #0x0
//  310 }
        RET
//  311 
//  312 /**
//  313   * @brief  Enables the Clock Security System deglitcher system.
//  314   * @param  None
//  315   * @retval None
//  316   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
//  318 {
//  319   /* Check the parameters */
//  320   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  321 
//  322   if (NewState != DISABLE)
CLK_ClockSecuritySytemDeglitchCmd:
        TNZ       A
        JREQ      L:??CLK_ClockSecuritySytemDeglitchCmd_0
//  323   {
//  324     /* Set CSSDGON bit */
//  325     CLK->CSSR |= CLK_CSSR_CSSDGON;
        BSET      L:0x50ca, #0x4
        JRA       L:??CLK_ClockSecuritySytemDeglitchCmd_1
//  326   }
//  327   else
//  328   {
//  329     /* Reset CSSDGON  bit */
//  330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
??CLK_ClockSecuritySytemDeglitchCmd_0:
        BRES      L:0x50ca, #0x4
//  331   }
//  332 }
??CLK_ClockSecuritySytemDeglitchCmd_1:
        RET
//  333 
//  334 /**
//  335   * @brief  Selects the clock source to output on CCO pin(PC4).
//  336   * @note   PC4 should be configured output push-pull with the speed that matches 
//  337   *         maximum output speed of the desired clock.
//  338   * @param  CLK_CCOSource: specifies the clock source to output.
//  339   *          This parameter can be one of the following values:
//  340   *            @arg CLK_CCOSource_Off: No clock selected as CCO source
//  341   *            @arg CLK_CCOSource_HSI: HSI clock selected as CCO source
//  342   *            @arg CLK_CCOSource_LSI: LSI clock selected as CCO source
//  343   *            @arg CLK_CCOSource_LSE: LSE clock selected as CCO source
//  344   *            @arg CLK_CCOSource_HSE: HSE clock selected as CCO source
//  345   * @param  CLK_CCODiv: specifies the CCO prescaler.
//  346   *          This parameter can be one of the following values:
//  347   *            @arg CLK_CCODiv_1: no division applied to CCO clock
//  348   *            @arg CLK_CCODiv_2: division by 2 applied to CCO clock
//  349   *            @arg CLK_CCODiv_4: division by 4 applied to CCO clock
//  350   *            @arg CLK_CCODiv_8: division by 8 applied to CCO clock
//  351   *            @arg CLK_CCODiv_16: division by 16 applied to CCO clock
//  352   *            @arg CLK_CCODiv_32: division by 32 applied to CCO clock
//  353   *            @arg CLK_CCODiv_64: division by 64 applied to CCO clock
//  354   * @retval None
//  355   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
//  357 {
CLK_CCOConfig:
        LD        S:?b1, A
//  358   /* check teh parameters */
//  359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
//  360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
//  361 
//  362   /* Selects the source provided on cco_ck output and its divider*/
//  363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
        LD        A, S:?b0
        OR        A, S:?b1
        LD        L:0x50c5, A
//  364 }
        RET
//  365 
//  366 /**
//  367   * @}
//  368   */
//  369 
//  370 /** @defgroup CLK_Group2 System clock configuration functions
//  371  *  @brief   System clock configuration functions
//  372  *
//  373 @verbatim   
//  374  ===============================================================================
//  375                     System clock configuration functions
//  376  ===============================================================================  
//  377 
//  378   This section provides functions allowing to configure the System clock.
//  379   
//  380   1. Several clock sources can be used to drive the System clock (SYSCLK): HSI,
//  381      HSE, LSI and LSE.
//  382      You can use "CLK_GetClocksFreq()" function to retrieve the frequencies of these clocks.  
//  383 
//  384 @note All the peripheral clocks are derived from the System clock (SYSCLK) except:
//  385        - BEEP: the Beeper clock can be derived either from a LSE or LSI clock sources. 
//  386           You have to use CLK_BEEPClockConfig() function to configure this clock. 
//  387        - RTC: the RTC clock can be derived either from the LSI, LSE, HSI or HSE clock
//  388           divided by 1 to 64. You have to use CLK_RTCClockConfig() functions to 
//  389           configure this clock.
//  390        - LCD : LCD clock is the RTC Clock divided by 2. 
//  391        - IWDG clock which is always the LSI clock.
//  392        
//  393   2. The maximum frequency of the SYSCLK is 16 MHz.
//  394 
//  395 @endverbatim
//  396   * @{
//  397   */
//  398   
//  399 /**
//  400   * @brief  Configures the system clock (SYSCLK).
//  401   * @note   The HSI is used (enabled by hardware) as system clock source after
//  402   *         startup from Reset, wake-up from Halt and active Halt modes, or in case
//  403   *         of failure of the HSE used as system clock (if the Clock Security System CSS is enabled).
//  404   * @note   A switch from one clock source to another occurs only if the target
//  405   *         clock source is ready (clock stable after startup delay or PLL locked). 
//  406   *         You can use CLK_GetSYSCLKSource() function to know which clock is
//  407   *         currently used as system clock source. 
//  408   * @param  CLK_SYSCLKSource: specifies the clock source used as system clock.
//  409   *          This parameter can be one of the following values:
//  410   *            @arg CLK_SYSCLKSource_HSI: HSI selected as system clock source
//  411   *            @arg CLK_SYSCLKSource_HSE: HSE selected as system clock source
//  412   *            @arg CLK_SYSCLKSource_LSI: LSI selected as system clock source
//  413   *            @arg CLK_SYSCLKSource_LSE: LSE selected as system clock source
//  414   * @retval None
//  415   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
//  417 {
//  418   /* check teh parameters */
//  419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
//  420 
//  421   /* Selection of the target clock source */
//  422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
CLK_SYSCLKSourceConfig:
        LD        L:0x50c8, A
//  423 }
        RET
//  424 
//  425 /**
//  426   * @brief  Returns the clock source used as system clock.
//  427   * @param  None
//  428   * @retval Clock used as System clock (SYSCLK) source.
//  429   *         The returned value can be one of the following:
//  430   *         - CLK_SYSCLKSource_HSI: HSI used as system clock
//  431   *         - CLK_SYSCLKSource_LSI: LSI used as system clock
//  432   *         - CLK_SYSCLKSource_HSE: HSE used as system clock
//  433   *         - CLK_SYSCLKSource_LSE: LSE used as system clock
//  434   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
//  436 {
//  437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
CLK_GetSYSCLKSource:
        LD        A, L:0x50c7
        RET
//  438 }
//  439 
//  440 /**
//  441   * @brief  Returns the frequencies of different the SYSCLK
//  442   * 
//  443   * @note   The system frequency computed by this function is not the real 
//  444   *         frequency in the chip. It is calculated based on the predefined 
//  445   *         constant and the selected clock source:
//  446   * @note     If SYSCLK source is HSI, function returns values based on HSI_VALUE(*)
//  447   * @note     If SYSCLK source is HSE, function returns values based on HSE_VALUE(**)
//  448   * @note     If SYSCLK source is LSE, function returns values based on LSE_VALUE(***) 
//  449   * @note     If SYSCLK source is LSI, function returns values based on LSI_VALUE(****)
//  450   * @note     (*) HSI_VALUE is a constant defined in stm8l15x.h file (default value
//  451   *               16 MHz) but the real value may vary depending on the variations
//  452   *               in voltage and temperature.
//  453   * @note     (**) HSE_VALUE is a constant defined in stm8l15x.h file (default value
//  454   *                16 MHz), user has to ensure that HSE_VALUE is same as the real
//  455   *                frequency of the crystal used. Otherwise, this function may
//  456   *                have wrong result.
//  457   * @note     (***) LSI_VALUE is a constant defined in stm8l15x.h file (default value
//  458   *               38 KHz) but the real value may vary depending on the variations
//  459   *               in voltage and temperature.
//  460   * @note     (****) LSE_VALUE is a constant defined in stm8l15x.h file (default value
//  461   *                32,768 KHz), user has to ensure that LSE_VALUE is same as the real
//  462   *                frequency of the crystal used. Otherwise, this function may
//  463   *                have wrong result.
//  464   *
//  465   * @note   The result of this function could be not correct when using fractional
//  466   *         value for HSE crystal.
//  467   *   
//  468   * @param  None
//  469   *
//  470   * @note   This function can be used by the user application to compute the 
//  471   *         baudrate for the communication peripherals or configure other parameters.
//  472   * @note   Each time SYSCLK clock changes, this function must be called to update
//  473   *         the returned value. Otherwise, any configuration based on this 
//  474   *         function will be incorrect.
//  475   *
//  476   * @retval System Clock frequency value
//  477   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  478 uint32_t CLK_GetClockFreq(void)
//  479 {
CLK_GetClockFreq:
        CALL      L:?push_l2
        CALL      L:?push_l3
        SUB       SP, #0x3
//  480   uint32_t clockfrequency = 0;
        CLRW      X
        LDW       S:?w5, X
        LDW       S:?w4, X
//  481   uint32_t sourcefrequency = 0;
        CLRW      X
        LDW       S:?w7, X
        LDW       S:?w6, X
//  482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
        LD        A, #0x1
        LD        (0x1,SP), A
//  483   uint8_t tmp = 0, presc = 0;
        CLR       (0x3,SP)
        CLR       (0x2,SP)
//  484 
//  485   /* Get SYSCLK source. */
//  486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
        LD        A, L:0x50c7
        LD        (0x1,SP), A
//  487 
//  488   if ( clocksource == CLK_SYSCLKSource_HSI)
        LD        A, (0x1,SP)
        CP        A, #0x1
        JRNE      L:??CLK_GetClockFreq_0
//  489   {
//  490     sourcefrequency = HSI_VALUE;
        LDW       X, #0x2400
        LDW       S:?w1, X
        LDW       X, #0xf4
        LDW       S:?w0, X
        CALL      L:?mov_l3_l0
        JRA       L:??CLK_GetClockFreq_1
//  491   }
//  492   else if ( clocksource == CLK_SYSCLKSource_LSI)
??CLK_GetClockFreq_0:
        LD        A, (0x1,SP)
        CP        A, #0x2
        JRNE      L:??CLK_GetClockFreq_2
//  493   {
//  494     sourcefrequency = LSI_VALUE;
        LDW       X, #0x9470
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        CALL      L:?mov_l3_l0
        JRA       L:??CLK_GetClockFreq_1
//  495   }
//  496   else if ( clocksource == CLK_SYSCLKSource_HSE)
??CLK_GetClockFreq_2:
        LD        A, (0x1,SP)
        CP        A, #0x4
        JRNE      L:??CLK_GetClockFreq_3
//  497   {
//  498     sourcefrequency = HSE_VALUE;
        LDW       X, #0x2400
        LDW       S:?w1, X
        LDW       X, #0xf4
        LDW       S:?w0, X
        CALL      L:?mov_l3_l0
        JRA       L:??CLK_GetClockFreq_1
//  499   }
//  500   else
//  501   {
//  502     clockfrequency = LSE_VALUE;
??CLK_GetClockFreq_3:
        LDW       X, #0x8000
        LDW       S:?w1, X
        SLLW      X
        LDW       S:?w0, X
        CALL      L:?mov_l2_l0
//  503   }
//  504 
//  505   /* Get System clock divider factor*/
//  506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
??CLK_GetClockFreq_1:
        LD        A, L:0x50c0
        AND       A, #0x7
        LD        (0x3,SP), A
//  507   presc = SYSDivFactor[tmp];
        LD        A, (0x3,SP)
        CLRW      X
        LD        XL, A
        LD        A, (L:SYSDivFactor,X)
        LD        (0x2,SP), A
//  508 
//  509   /* Get System clock frequency */
//  510   clockfrequency = sourcefrequency / presc;
        LD        A, (0x2,SP)
        CLRW      X
        LD        XL, A
        LDW       S:?w3, X
        CLRW      X
        LDW       S:?w2, X
        CALL      L:?mov_l0_l3
        CALL      L:?udiv32_l0_l0_l1
        CALL      L:?mov_l2_l0
//  511 
//  512   return((uint32_t)clockfrequency);
        CALL      L:?mov_l0_l2
        ADD       SP, #0x3
        JP        L:?epilogue_l2_l3
//  513 }
//  514 
//  515 /**
//  516   * @brief  Configures the System clock (SYSCLK) dividers.
//  517   * @param  CLK_SYSCLKDiv : Specifies the system clock divider to apply.
//  518   *          This parameter can be one of the following values:
//  519   *            @arg CLK_SYSCLKDiv_1 
//  520   *            @arg CLK_SYSCLKDiv_2
//  521   *            @arg CLK_SYSCLKDiv_4
//  522   *            @arg CLK_SYSCLKDiv_8
//  523   *            @arg CLK_SYSCLKDiv_16
//  524   *            @arg CLK_SYSCLKDiv_64
//  525   *            @arg CLK_SYSCLKDiv_128
//  526   * @retval None
//  527   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
//  529 {
//  530   /* check the parameters */
//  531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
//  532 
//  533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
CLK_SYSCLKDivConfig:
        LD        L:0x50c0, A
//  534 }
        RET
//  535 
//  536 /**
//  537   * @brief  Enables or disables the clock switch execution.
//  538   * @param  NewState : new state of clock switch, value accepted ENABLE, DISABLE.
//  539   * @retval None
//  540   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  541 void CLK_ClockSwitchCmd(FunctionalState NewState)
//  542 {
//  543   /* Check the parameters */
//  544   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
//  545 
//  546   if (NewState != DISABLE)
CLK_ClockSwitchCmd:
        TNZ       A
        JREQ      L:??CLK_ClockSwitchCmd_0
//  547   {
//  548     /* Set SWEN bit */
//  549     CLK->SWCR |= CLK_SWCR_SWEN;
        BSET      L:0x50c9, #0x1
        JRA       L:??CLK_ClockSwitchCmd_1
//  550   }
//  551   else
//  552   {
//  553     /* Reset SWEN  bit */
//  554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
??CLK_ClockSwitchCmd_0:
        BRES      L:0x50c9, #0x1
//  555   }
//  556 }
??CLK_ClockSwitchCmd_1:
        RET
//  557 
//  558 /**
//  559   * @}
//  560   */
//  561 
//  562 /** @defgroup CLK_Group3 Peripheral clocks configuration functions
//  563  *  @brief   Peripheral clocks configuration functions 
//  564  *
//  565 @verbatim   
//  566  ===============================================================================
//  567                    Peripheral clocks configuration functions
//  568  ===============================================================================  
//  569 
//  570   This section provides functions allowing to configure the Peripheral clocks. 
//  571   
//  572   1. The RTC clock which is derived from the LSI, LSE, HSI or HSE clock divided by 1 to 64.
//  573      
//  574   2. The BEEP clock which is derived from the LSI or LSE clocks.
//  575 
//  576   3. After restart from Reset or wakeup from HALT, all peripherals are off
//  577      Before to start using a peripheral you have to enable its interface clock. 
//  578      You can do this using CLK_AHBPeriphClockCmd()
//  579      , CLK_APB2PeriphClockCmd() and CLK_APB1PeriphClockCmd() functions.
//  580      
//  581   4. To reset the peripherals configuration (to the default state after device reset)
//  582      you can use CLK_PeripheralClockConfig() function.  
//  583 
//  584 @endverbatim
//  585   * @{
//  586   */
//  587 
//  588 /**
//  589   * @brief  Configures the RTC clock (RTCCLK).
//  590   * @param  CLK_RTCCLKSource: specifies the RTC clock source.
//  591   *          This parameter can be one of the following values:
//  592   *            @arg CLK_RTCCLKSource_Off: RTC clock Off  
//  593   *            @arg CLK_RTCCLKSource_LSE: LSE selected as RTC clock
//  594   *            @arg CLK_RTCCLKSource_LSI: LSI selected as RTC clock
//  595   *            @arg CLK_RTCCLKSource_HSE: HSE selected as RTC clock
//  596   *            @arg CLK_RTCCLKSource_HSI: HSI selected as RTC clock  
//  597   *  
//  598   * @param  CLK_RTCCLKDiv: specifies the RTC clock source divider.
//  599   *          This parameter can be one of the following values:
//  600   *            @arg CLK_RTCCLKDiv_1: Clock RTC Div 1  
//  601   *            @arg CLK_RTCCLKDiv_2: Clock RTC Div 2
//  602   *            @arg CLK_RTCCLKDiv_4: Clock RTC Div 4
//  603   *            @arg CLK_RTCCLKDiv_8: Clock RTC Div 8
//  604   *            @arg CLK_RTCCLKDiv_16: Clock RTC Div 16
//  605   *            @arg CLK_RTCCLKDiv_32: Clock RTC Div 32
//  606   *            @arg CLK_RTCCLKDiv_64: Clock RTC Div 64
//  607   *  
//  608   * @note   If the LSE or LSI is used as RTC clock source, the RTC continues to
//  609   *         work in HALT and Active HALT modes, and can be used as wakeup source.
//  610   *         However, when the HSE clock is used as RTC clock source.    
//  611   * @note   The maximum input clock frequency for RTC is 1MHz (when using HSE/HSI as
//  612   *         RTC clock source).
//  613   *  
//  614   * @retval None
//  615   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
//  617 {
CLK_RTCClockConfig:
        LD        S:?b1, A
//  618   /* check the parameters */
//  619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
//  620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
//  621 
//  622   /* Selects the source provided on to RTC and its divider*/
//  623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
        LD        A, S:?b0
        OR        A, S:?b1
        LD        L:0x50c1, A
//  624 }
        RET
//  625 
//  626 /**
//  627   * @brief  Configures the BEEP clock (BEEPCLK).
//  628   * @param  CLK_BEEPCLKSource: specifies the BEEP clock source.
//  629   *          This parameter can be one of the following values:
//  630   *            @arg CLK_BEEPCLKSource_Off: BEEP clock Off  
//  631   *            @arg CLK_BEEPCLKSource_LSE: LSE selected as BEEP clock
//  632   *            @arg CLK_BEEPCLKSource_LSI: LSI selected as BEEP clock  
//  633   * @retval None
//  634   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
//  636 {
//  637   /* check the parameters */
//  638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
//  639 
//  640   /* Selects the source provided to BEEP*/
//  641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
CLK_BEEPClockConfig:
        LD        L:0x50cb, A
//  642 
//  643 }
        RET
//  644 
//  645 /**
//  646 * @brief  Enables or disables the specified peripheral clock.
//  647   * @note   After reset, the peripheral clock (used for registers read/write access)
//  648   *         is disabled and the application software has to enable this clock before 
//  649   *         using it.   
//  650   * @param  CLK_Peripheral: specifies the peripheral to gate its clock.
//  651   *          This parameter can be any combination of the following values:
//  652   *            @arg CLK_Peripheral_TIM2:       TIM2 clock
//  653   *            @arg CLK_Peripheral_TIM3:       TIM3 clock 
//  654   *            @arg CLK_Peripheral_TIM4:       TIM4 clock
//  655   *            @arg CLK_Peripheral_I2C1:       I2C1 clock
//  656   *            @arg CLK_Peripheral_SPI1:       SPI1 clock
//  657   *            @arg CLK_Peripheral_USART1:     USART1 clock
//  658   *            @arg CLK_Peripheral_BEEP:       BEEP clock
//  659   *            @arg CLK_Peripheral_DAC:        DAC clock
//  660   *            @arg CLK_Peripheral_ADC1:       ADC1 clock
//  661   *            @arg CLK_Peripheral_TIM1:       TIM1 clock
//  662   *            @arg CLK_Peripheral_RTC:        RTC clock
//  663   *            @arg CLK_Peripheral_LCD:        LCD clock
//  664   *            @arg CLK_Peripheral_DMA1:       DMA1 clock
//  665   *            @arg CLK_Peripheral_COMP:       COMP clock
//  666   *            @arg CLK_Peripheral_BOOTROM:    BOOTROM clock
//  667   *            @arg CLK_Peripheral_AES:        AES clock
//  668   *            @arg CLK_Peripheral_TIM5:       TIM5 clock
//  669   *            @arg CLK_Peripheral_SPI2:       SPI2 clock
//  670   *            @arg CLK_Peripheral_USART2:     USART2 clock
//  671   *            @arg CLK_Peripheral_USART3:     USART3 clock
//  672   *            @arg CLK_Peripheral_CSSLSE:     CSS on LSE clock
//  673   * @param  NewState: new state of the specified peripheral clock.
//  674   *          This parameter can be: ENABLE or DISABLE.
//  675   * @retval None
//  676   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
//  678 {
CLK_PeripheralClockConfig:
        LD        S:?b2, A
//  679   uint8_t reg = 0;
        CLR       S:?b1
//  680 
//  681   /* Check the parameters */
//  682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
//  683   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  684 
//  685   /* get flag register */
//  686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
        LD        A, S:?b2
        AND       A, #0xf0
        LD        S:?b1, A
//  687 
//  688   if ( reg == 0x00)
        TNZ       S:?b1
        JRNE      L:??CLK_PeripheralClockConfig_0
//  689   {
//  690     if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??CLK_PeripheralClockConfig_1
//  691     {
//  692       /* Enable the peripheral Clock */
//  693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        LD        A, S:?b2
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x50c3
        LD        L:0x50c3, A
        JRA       L:??CLK_PeripheralClockConfig_2
//  694     }
//  695     else
//  696     {
//  697       /* Disable the peripheral Clock */
//  698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
??CLK_PeripheralClockConfig_1:
        LD        A, S:?b2
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x50c3
        LD        L:0x50c3, A
        JRA       L:??CLK_PeripheralClockConfig_2
//  699     }
//  700   }
//  701   else if (reg == 0x10)
??CLK_PeripheralClockConfig_0:
        LD        A, S:?b1
        CP        A, #0x10
        JRNE      L:??CLK_PeripheralClockConfig_3
//  702   {
//  703     if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??CLK_PeripheralClockConfig_4
//  704     {
//  705       /* Enable the peripheral Clock */
//  706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        LD        A, S:?b2
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x50c4
        LD        L:0x50c4, A
        JRA       L:??CLK_PeripheralClockConfig_2
//  707     }
//  708     else
//  709     {
//  710       /* Disable the peripheral Clock */
//  711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
??CLK_PeripheralClockConfig_4:
        LD        A, S:?b2
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x50c4
        LD        L:0x50c4, A
        JRA       L:??CLK_PeripheralClockConfig_2
//  712     }
//  713   }
//  714   else
//  715   {
//  716     if (NewState != DISABLE)
??CLK_PeripheralClockConfig_3:
        TNZ       S:?b0
        JREQ      L:??CLK_PeripheralClockConfig_5
//  717     {
//  718       /* Enable the peripheral Clock */
//  719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
        LD        A, S:?b2
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x50d0
        LD        L:0x50d0, A
        JRA       L:??CLK_PeripheralClockConfig_2
//  720     }
//  721     else
//  722     {
//  723       /* Disable the peripheral Clock */
//  724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
??CLK_PeripheralClockConfig_5:
        LD        A, S:?b2
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x50d0
        LD        L:0x50d0, A
//  725     }
//  726   }
//  727 }
??CLK_PeripheralClockConfig_2:
        RET
//  728 
//  729 /**
//  730   * @}
//  731   */
//  732   
//  733 /** @defgroup CLK_Group4 CSS on LSE configuration functions
//  734  *  @brief   CSS on LSE configuration functions 
//  735  *
//  736 @verbatim   
//  737  ===============================================================================
//  738                         CSS on LSE configuration functions
//  739  ===============================================================================  
//  740 
//  741   This section provides functions allowing to configure the CSS on LSE capability. 
//  742   
//  743   1. The LSE crystal clock source failures can be monitored when used as RTC clock
//  744      by the mean of the LSI oscillator.
//  745      
//  746   2. The CSS on LSE is a feature implemented externally to RTC peripheral and though 
//  747      has no impact the clock controller registers.
//  748 
//  749   3. To enable the CSS on LSE you can use CLK_LSEClockSecuritySystemEnable() function
//  750      
//  751   4. To configure the action to perform at RTC clock failure you can use 
//  752      CLK_RTCCLKSwitchOnLSEFailureEnable() function that allows to switch the RTC clock
//  753      from LSE to LSI.
//  754 
//  755 @endverbatim
//  756   * @{
//  757   */
//  758 
//  759 /**
//  760   * @brief  Enables the clock CSS on LSE.
//  761   * @note   Once Enabled, only POR can Disable it.
//  762   * @param  None
//  763   * @retval None
//  764   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  765 void CLK_LSEClockSecuritySystemEnable(void)
//  766 {
//  767   /* Set CSSEN bit */
//  768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
CLK_LSEClockSecuritySystemEnable:
        BSET      L:0x5190, #0x0
//  769 }
        RET
//  770 
//  771 /**
//  772   * @brief  Enables RTC clock switch to LSI in case of LSE failure.
//  773   * @note   Once Enabled, only POR can Disable it.
//  774   * @param  None
//  775   * @retval None
//  776   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
//  778 {
//  779   /* Set SWITCHEN bit */
//  780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
CLK_RTCCLKSwitchOnLSEFailureEnable:
        BSET      L:0x5190, #0x1
//  781 }
        RET
//  782 
//  783 /**
//  784   * @}
//  785   */
//  786   
//  787 /** @defgroup CLK_Group5 Low power clock configuration functions
//  788  *  @brief   Low power clock configuration functions 
//  789  *
//  790 @verbatim   
//  791  ===============================================================================
//  792                       Low power clock configuration functions
//  793  ===============================================================================
//  794 
//  795 @endverbatim
//  796   * @{
//  797   */
//  798 
//  799 /**
//  800   * @brief  Configures clock during halt and active halt modes.
//  801   * @param  CLK_Halt : Specifies the clock state and wake-up mode from halt way.
//  802   *         This parameter can be a value of @ref CLK_Halt_TypeDef.
//  803   * @param  NewState : Specifies the System clock (SYSCLK) state in active halt mode.
//  804   *         This parameter can be ENABLE or DISABLE.
//  805   * @retval None
//  806   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
//  808 {
CLK_HaltConfig:
        LD        S:?b1, A
//  809   /* check the parameters */
//  810   assert_param(IS_CLK_HALT(CLK_Halt));
//  811   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  812 
//  813   if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??CLK_HaltConfig_0
//  814   {
//  815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
        LD        A, L:0x50c2
        OR        A, S:?b1
        LD        L:0x50c2, A
        JRA       L:??CLK_HaltConfig_1
//  816   }
//  817   else
//  818   {
//  819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
??CLK_HaltConfig_0:
        LD        A, S:?b1
        CPL       A
        AND       A, L:0x50c2
        LD        L:0x50c2, A
//  820   }
//  821 }
??CLK_HaltConfig_1:
        RET
//  822 
//  823 /**
//  824   * @brief  Configures the main voltage regulator
//  825   * @param  NewState: specifies the MVR  state.
//  826   *         This parameter can be one of the following values:
//  827   *         - DISABLE: MVR disabled;
//  828   *         - ENABLE:  MVR enabled.
//  829   * @retval None
//  830   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  831 void CLK_MainRegulatorCmd(FunctionalState NewState)
//  832 {
//  833   /* check the parameters */
//  834   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  835 
//  836   if (NewState != DISABLE)
CLK_MainRegulatorCmd:
        TNZ       A
        JREQ      L:??CLK_MainRegulatorCmd_0
//  837   {
//  838     /* Reset REGUOFF bit */
//  839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
        BRES      L:0x50cf, #0x1
        JRA       L:??CLK_MainRegulatorCmd_1
//  840   }
//  841   else
//  842   {
//  843     /* Set REGUOFF bit */
//  844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
??CLK_MainRegulatorCmd_0:
        BSET      L:0x50cf, #0x1
//  845   }
//  846 }
??CLK_MainRegulatorCmd_1:
        RET
//  847 
//  848 /**
//  849   * @}
//  850   */
//  851 
//  852 /** @defgroup CLK_Group6 Interrupts and flags management functions
//  853  *  @brief   Interrupts and flags management functions 
//  854  *
//  855 @verbatim   
//  856  ===============================================================================
//  857                    Interrupts and flags management functions
//  858  ===============================================================================  
//  859 
//  860 @endverbatim
//  861   * @{
//  862   */
//  863 
//  864  /**
//  865   * @brief  Enables or disables the specified CLK interrupts.
//  866   * @param  CLK_IT: specifies the CLK interrupt sources to be enabled or disabled.
//  867   *          This parameter can be any combination of the following values:
//  868   *            @arg CLK_IT_CSSD: Clock security system detection interrupt
//  869   *            @arg CLK_IT_SWIF: Clock switch interrupt 
//  870   *            @arg CLK_IT_LSECSSF: LSE Clock security system detection interrupt
//  871   * @param  NewState: new state of the specified CLK interrupts.
//  872   *          This parameter can be: ENABLE or DISABLE.
//  873   * @retval None
//  874   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
//  876 {
//  877 
//  878   /* check the parameters */
//  879   assert_param(IS_CLK_IT(CLK_IT));
//  880   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  881 
//  882   if (NewState != DISABLE)
CLK_ITConfig:
        TNZ       S:?b0
        JREQ      L:??CLK_ITConfig_0
//  883   {
//  884     if (CLK_IT == CLK_IT_SWIF)
        CP        A, #0x1c
        JRNE      L:??CLK_ITConfig_1
//  885     {
//  886       /* Enable the clock switch interrupt */
//  887       CLK->SWCR |= CLK_SWCR_SWIEN;
        BSET      L:0x50c9, #0x2
        JRA       L:??CLK_ITConfig_2
//  888     }
//  889     else if (CLK_IT == CLK_IT_LSECSSF)
??CLK_ITConfig_1:
        CP        A, #0x2c
        JRNE      L:??CLK_ITConfig_3
//  890     {
//  891       /* Enable the CSS on LSE  interrupt */
//  892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
        BSET      L:0x5190, #0x2
        JRA       L:??CLK_ITConfig_2
//  893     }
//  894     else
//  895     {
//  896       /* Enable the clock security system detection interrupt */
//  897       CLK->CSSR |= CLK_CSSR_CSSDIE;
??CLK_ITConfig_3:
        BSET      L:0x50ca, #0x2
        JRA       L:??CLK_ITConfig_2
//  898     }
//  899   }
//  900   else  /*(NewState == DISABLE)*/
//  901   {
//  902     if (CLK_IT == CLK_IT_SWIF)
??CLK_ITConfig_0:
        CP        A, #0x1c
        JRNE      L:??CLK_ITConfig_4
//  903 		{
//  904       /* Disable the clock switch interrupt */
//  905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
        BRES      L:0x50c9, #0x2
        JRA       L:??CLK_ITConfig_2
//  906     }
//  907     else if (CLK_IT == CLK_IT_LSECSSF)
??CLK_ITConfig_4:
        CP        A, #0x2c
        JRNE      L:??CLK_ITConfig_5
//  908     {
//  909       /* Disable the CSS on LSE  interrupt */
//  910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
        BRES      L:0x5190, #0x2
        JRA       L:??CLK_ITConfig_2
//  911     }
//  912     else
//  913     {
//  914       /* Disable the clock security system detection interrupt */
//  915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
??CLK_ITConfig_5:
        BRES      L:0x50ca, #0x2
//  916     }
//  917   }
//  918 }
??CLK_ITConfig_2:
        RET
//  919 
//  920 /**
//  921   * @brief  Checks whether the specified CLK flag is set or not.
//  922   * @param  CLK_FLAG: specifies the flag to check.
//  923   *          This parameter can be one of the following values:
//  924   *            @arg CLK_FLAG_LSIRDY: LSI oscillator clock ready
//  925   *            @arg CLK_FLAG_HSIRDY: HSI oscillator clock ready
//  926   *            @arg CLK_FLAG_HSERDY: HSE oscillator clock ready
//  927   *            @arg CLK_FLAG_SWBSY: Switch busy
//  928   *            @arg CLK_FLAG_CSSD: Clock security system detection
//  929   *            @arg CLK_FLAG_AUX: Auxiliary oscillator connected to master clock
//  930   *            @arg CLK_FLAG_LSERDY: LSE oscillator clock ready
//  931   *            @arg CLK_FLAG_CCOBSY: Configurable clock output busy
//  932   *            @arg CLK_FLAG_RTCSWBSY: RTC clock busy in switch
//  933   *            @arg CLK_FLAG_EEREADY: Flash program memory and Data EEPROM ready
//  934   *            @arg CLK_FLAG_EEBUSY: Flash program memory and Data EEPROM busy
//  935   *            @arg CLK_FLAG_LSEPD: LSE power-down
//  936   *            @arg CLK_FLAG_LSIPD: LSI power-down
//  937   *            @arg CLK_FLAG_HSEPD: HSE power-down
//  938   *            @arg CLK_FLAG_HSIPD: HSI power-down
//  939   *            @arg CLK_FLAG_REGREADY: REGREADY
//  940   *            @arg CLK_FLAG_BEEPSWBSY: BEEP clock busy in switch
//  941   *            @arg CLK_FLAG_LSECSSF: CSS on LSE detection
//  942   *            @arg CLK_FLAG_RTCCLKSWF: RTCCLK switch completed on LSE failure
//  943   * @retval The new state of CLK_FLAG (SET or RESET).
//  944   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
//  946 {
CLK_GetFlagStatus:
        LD        S:?b2, A
//  947   uint8_t reg = 0;
        CLR       S:?b3
//  948   uint8_t pos = 0;
        CLR       S:?b1
//  949   FlagStatus bitstatus = RESET;
        CLR       S:?b0
//  950 
//  951   /* check the parameters */
//  952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
//  953 
//  954   /* get flag register */
//  955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
        LD        A, S:?b2
        AND       A, #0xf0
        LD        S:?b3, A
//  956 
//  957   /* get flag position */
//  958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
        LD        A, S:?b2
        AND       A, #0xf
        LD        S:?b1, A
//  959 
//  960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
        TNZ       S:?b3
        JRNE      L:??CLK_GetFlagStatus_0
//  961   {
//  962     reg = CLK->CRTCR;
        LD        A, L:0x50c1
        LD        S:?b3, A
        JRA       L:??CLK_GetFlagStatus_1
//  963   }
//  964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
??CLK_GetFlagStatus_0:
        LD        A, S:?b3
        CP        A, #0x10
        JRNE      L:??CLK_GetFlagStatus_2
//  965   {
//  966     reg = CLK->ICKCR;
        LD        A, L:0x50c2
        LD        S:?b3, A
        JRA       L:??CLK_GetFlagStatus_1
//  967   }
//  968   else if (reg == 0x20) /* The flag to check is in CCOR register */
??CLK_GetFlagStatus_2:
        LD        A, S:?b3
        CP        A, #0x20
        JRNE      L:??CLK_GetFlagStatus_3
//  969   {
//  970     reg = CLK->CCOR;
        LD        A, L:0x50c5
        LD        S:?b3, A
        JRA       L:??CLK_GetFlagStatus_1
//  971   }
//  972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
??CLK_GetFlagStatus_3:
        LD        A, S:?b3
        CP        A, #0x30
        JRNE      L:??CLK_GetFlagStatus_4
//  973   {
//  974     reg = CLK->ECKCR;
        LD        A, L:0x50c6
        LD        S:?b3, A
        JRA       L:??CLK_GetFlagStatus_1
//  975   }
//  976   else if (reg == 0x40) /* The flag to check is in SWCR register */
??CLK_GetFlagStatus_4:
        LD        A, S:?b3
        CP        A, #0x40
        JRNE      L:??CLK_GetFlagStatus_5
//  977   {
//  978     reg = CLK->SWCR;
        LD        A, L:0x50c9
        LD        S:?b3, A
        JRA       L:??CLK_GetFlagStatus_1
//  979   }
//  980   else if (reg == 0x50) /* The flag to check is in CSSR register */
??CLK_GetFlagStatus_5:
        LD        A, S:?b3
        CP        A, #0x50
        JRNE      L:??CLK_GetFlagStatus_6
//  981   {
//  982     reg = CLK->CSSR;
        LD        A, L:0x50ca
        LD        S:?b3, A
        JRA       L:??CLK_GetFlagStatus_1
//  983   }
//  984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
??CLK_GetFlagStatus_6:
        LD        A, S:?b3
        CP        A, #0x70
        JRNE      L:??CLK_GetFlagStatus_7
//  985   {
//  986     reg = CLK->REGCSR;
        LD        A, L:0x50cf
        LD        S:?b3, A
        JRA       L:??CLK_GetFlagStatus_1
//  987   }
//  988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
??CLK_GetFlagStatus_7:
        LD        A, S:?b3
        CP        A, #0x80
        JRNE      L:??CLK_GetFlagStatus_8
//  989   {
//  990     reg = CSSLSE->CSR;
        LD        A, L:0x5190
        LD        S:?b3, A
        JRA       L:??CLK_GetFlagStatus_1
//  991   }
//  992   else /* The flag to check is in CBEEPR register */
//  993   {
//  994     reg = CLK->CBEEPR;
??CLK_GetFlagStatus_8:
        LD        A, L:0x50cb
        LD        S:?b3, A
//  995   }
//  996 
//  997 
//  998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
??CLK_GetFlagStatus_1:
        CLRW      X
        INCW      X
        LD        A, S:?b1
        CALL      L:?sll16_x_x_a
        LD        A, XL
        AND       A, S:?b3
        CP        A, #0x0
        JREQ      L:??CLK_GetFlagStatus_9
//  999   {
// 1000     bitstatus = SET;
        LD        A, #0x1
        LD        S:?b0, A
        JRA       L:??CLK_GetFlagStatus_10
// 1001   }
// 1002   else
// 1003   {
// 1004     bitstatus = RESET;
??CLK_GetFlagStatus_9:
        CLR       S:?b0
// 1005   }
// 1006 
// 1007   /* Return the flag status */
// 1008   return((FlagStatus)bitstatus);
??CLK_GetFlagStatus_10:
        LD        A, S:?b0
        RET
// 1009 }
// 1010 
// 1011 /**
// 1012   * @brief  Clears the CSS LSE Flag.
// 1013   * @param  None
// 1014   * @retval None
// 1015   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1016 void CLK_ClearFlag(void)
// 1017 {
// 1018 
// 1019   /* Clear the clock security system on LSE  detection Flag */
// 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
CLK_ClearFlag:
        BRES      L:0x5190, #0x3
// 1021 }
        RET
// 1022 
// 1023 /**
// 1024   * @brief  Checks whether the specified CLK interrupt has occurred or not.
// 1025   * @param  CLK_IT: specifies the CLK interrupt source to check.
// 1026   *          This parameter can be one of the following values:
// 1027   *            @arg CLK_IT_SWIF: LSI ready interrupt
// 1028   *            @arg CLK_IT_LSECSSF: LSE ready interrupt
// 1029   *            @arg CLK_IT_CSSD: HSI ready interrupt
// 1030   * @retval The new state of CLK_IT (SET or RESET).
// 1031   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
// 1033 {
CLK_GetITStatus:
        LD        S:?b1, A
// 1034 
// 1035   ITStatus bitstatus = RESET;
        CLR       S:?b0
// 1036 
// 1037   /* check the parameters */
// 1038   assert_param(IS_CLK_IT(CLK_IT));
// 1039 
// 1040   if (CLK_IT == CLK_IT_SWIF)
        LD        A, S:?b1
        CP        A, #0x1c
        JRNE      L:??CLK_GetITStatus_0
// 1041   {
// 1042     /* Check the status of the clock switch interrupt */
// 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
        LD        A, L:0x50c9
        AND       A, S:?b1
        CP        A, #0xc
        JRNE      L:??CLK_GetITStatus_1
// 1044     {
// 1045       bitstatus = SET;
        LD        A, #0x1
        LD        S:?b0, A
        JRA       L:??CLK_GetITStatus_2
// 1046     }
// 1047     else
// 1048     {
// 1049       bitstatus = RESET;
??CLK_GetITStatus_1:
        CLR       S:?b0
        JRA       L:??CLK_GetITStatus_2
// 1050     }
// 1051   }
// 1052   else if (CLK_IT == CLK_IT_LSECSSF)
??CLK_GetITStatus_0:
        LD        A, S:?b1
        CP        A, #0x2c
        JRNE      L:??CLK_GetITStatus_3
// 1053   {
// 1054     /* Check the status of the clock security system on LSE interrupt */
// 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
        LD        A, L:0x5190
        AND       A, S:?b1
        CP        A, #0xc
        JRNE      L:??CLK_GetITStatus_4
// 1056     {
// 1057       bitstatus = SET;
        LD        A, #0x1
        LD        S:?b0, A
        JRA       L:??CLK_GetITStatus_2
// 1058     }
// 1059     else
// 1060     {
// 1061       bitstatus = RESET;
??CLK_GetITStatus_4:
        CLR       S:?b0
        JRA       L:??CLK_GetITStatus_2
// 1062     }
// 1063   }
// 1064   else /* CLK_IT == CLK_IT_CSSD */
// 1065   {
// 1066     /* Check the status of the security system detection interrupt */
// 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
??CLK_GetITStatus_3:
        LD        A, L:0x50ca
        AND       A, S:?b1
        CP        A, #0xc
        JRNE      L:??CLK_GetITStatus_5
// 1068     {
// 1069       bitstatus = SET;
        LD        A, #0x1
        LD        S:?b0, A
        JRA       L:??CLK_GetITStatus_2
// 1070     }
// 1071     else
// 1072     {
// 1073       bitstatus = RESET;
??CLK_GetITStatus_5:
        CLR       S:?b0
// 1074     }
// 1075   }
// 1076 
// 1077   /* Return the CLK_IT status */
// 1078   return bitstatus;
??CLK_GetITStatus_2:
        LD        A, S:?b0
        RET
// 1079 }
// 1080 
// 1081 /**
// 1082   * @brief  Clears the CLK's interrupt pending bits.
// 1083   * @param  CLK_IT: specifies the interrupt pending bit to clear.
// 1084   *          This parameter can be any combination of the following values:
// 1085   *            @arg CLK_IT_SWIF: Clock switch interrupt
// 1086   *            @arg CLK_IT_LSECSSF: LSE Clock security system detection interrupt
// 1087   * @retval None
// 1088   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
// 1090 {
CLK_ClearITPendingBit:
        LD        S:?b0, A
// 1091 
// 1092   /* check the parameters */
// 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
// 1094 
// 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
        LD        A, S:?b0
        AND       A, #0xf0
        CP        A, #0x20
        JRNE      L:??CLK_ClearITPendingBit_0
// 1096   {
// 1097     /* Clear the status of the clock security system on LSE interrupt */
// 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
        BRES      L:0x5190, #0x3
        JRA       L:??CLK_ClearITPendingBit_1
// 1099   }
// 1100   else
// 1101   {
// 1102     /* Clear the status of the clock switch interrupt */
// 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
??CLK_ClearITPendingBit_0:
        BRES      L:0x50c9, #0x3
// 1104   }
// 1105 }
??CLK_ClearITPendingBit_1:
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 1106 
// 1107 /**
// 1108   * @}
// 1109   */ 
// 1110 
// 1111 /**
// 1112   * @}
// 1113   */ 
// 1114   
// 1115 /**
// 1116   * @}
// 1117   */
// 1118 
// 1119 /**
// 1120   * @}
// 1121   */
// 1122 
// 1123 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
//   5 bytes in section .near.rodata
// 856 bytes in section .near_func.text
// 
// 856 bytes of CODE  memory
//   5 bytes of CONST memory
//
//Errors: none
//Warnings: none
