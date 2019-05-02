///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                18/Dec/2018  13:43:38
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        G:\Darren\MCU\STM8\Software\Libraries\STM8L15x_StdPeriph_Driver\src\stm8l15x_syscfg.c
//    Command line =  
//        -f C:\Users\new06\AppData\Local\Temp\EWFED.tmp
//        (G:\Darren\MCU\STM8\Software\Libraries\STM8L15x_StdPeriph_Driver\src\stm8l15x_syscfg.c
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
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\Debug\List\stm8l15x_syscfg.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?sll16_x_x_a

        PUBLIC SYSCFG_REMAPDMAChannelConfig
        PUBLIC SYSCFG_REMAPDeInit
        PUBLIC SYSCFG_REMAPPinConfig
        PUBLIC SYSCFG_RIAnalogSwitchConfig
        PUBLIC SYSCFG_RIDeInit
        PUBLIC SYSCFG_RIIOSwitchConfig
        PUBLIC SYSCFG_RIResistorConfig
        PUBLIC SYSCFG_RITIMInputCaptureConfig

// G:\Darren\MCU\STM8\Software\Libraries\STM8L15x_StdPeriph_Driver\src\stm8l15x_syscfg.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_syscfg.c
//    4   * @author  MCD Application Team
//    5   * @version V1.6.1
//    6   * @date    30-September-2014
//    7   * @brief   This file provides firmware functions to manage the following 
//    8   *          functionalities of the RI and SYSCFG:
//    9   *            - RI configuration
//   10   *            - SYSCFG configuration
//   11   *
//   12   *  @verbatim
//   13   *  
//   14   *          ===================================================================
//   15   *                                 How to use this driver
//   16   *          ===================================================================
//   17   *          This driver provides functions to configure the RI and SYSCFG
//   18   *          These functions are split in 2 groups: 
//   19   *   
//   20   *          1. RI configuration: this group includes all needed functions 
//   21   *             to configure the RI:
//   22   *                   - Routing the TIM1 Input capture channels
//   23   *                   - Close and Open the I/O switches
//   24   *                   - Close and Open the analog switches
//   25   *                   - Configure the internal Pull-up and Pull-down resistors
//   26   *           
//   27   *          2. SYSCFG configuration: this group includes all needed functions 
//   28   *             to configure the SYSCFG:
//   29   *                   - Configure the alternate function remapping of some peripherals
//   30   *                     such as: USART, SPI, TIMs...
//   31   *                     Remapping possibilities depends on the device (low-density,
//   32   *                     medium-density or high density) so it is recommended to   
//   33   *                     refer to the product reference manual.
//   34   *                   - Configure the DMA channels remapping of ADC1 and TIM4
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
//   59 #include "stm8l15x_syscfg.h"
//   60 
//   61 /** @addtogroup STM8L15x_StdPeriph_Driver
//   62   * @{
//   63   */
//   64   
//   65 /** @defgroup SYSCFG
//   66   * @brief SYSCFG driver modules
//   67   * @{
//   68   */
//   69   
//   70 /* Private typedef -----------------------------------------------------------*/
//   71 /* Private define ------------------------------------------------------------*/
//   72 /* Private macro -------------------------------------------------------------*/
//   73 /* Private variables ---------------------------------------------------------*/
//   74 /* Private function prototypes -----------------------------------------------*/
//   75 /* Private functions ---------------------------------------------------------*/
//   76 
//   77 /** @defgroup SYSCFG_Private_Functions
//   78   * @{
//   79   */
//   80 
//   81 /** @defgroup SYSCFG_Group1 RI configuration
//   82  *  @brief   RI configuration
//   83  *
//   84 @verbatim   
//   85  ===============================================================================
//   86                            RI configuration functions
//   87  ===============================================================================  
//   88   
//   89        ===================================================================      
//   90                         SYSCFG Driver: how to configure RI
//   91        =================================================================== 
//   92        
//   93          1. By default, TIM1 Input Capture channels 2 and 3 are connected to the
//   94             I/O port assigned in the datasheet pinout (default routing).
//   95             TIM1 Input Capture channels 2 and 3 can be routed by calling 
//   96             SYSCFG_RITIMInputCaptureConfig()
//   97             Refer to the device reference manual for more details about 
//   98             TIM1 input capture routing
//   99           
//  100          2. For more details about using SYSCFG_RIIOSwitchConfig()
//  101             and SYSCFG_RIAnalogSwitchConfig() with COMP1 and COMP2, refer to
//  102             comparators driver
//  103             
//  104          3. To output the Internal reference voltage VREFINT, configure corresponding
//  105             GPIO pin in input mode using GPIO_Init() then use SYSCFG_RIIOSwitchConfig()
//  106        
//  107          4. To use the internal Pull-up and Pull-down resistors call
//  108             SYSCFG_RIResistorConfig()
//  109 
//  110 @endverbatim
//  111   * @{
//  112   */
//  113 
//  114 /**
//  115   * @brief  Deinitializes the RI registers to their default reset values.
//  116   * @param  None
//  117   * @retval None
//  118   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  119 void SYSCFG_RIDeInit(void)
//  120 {
//  121   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
SYSCFG_RIDeInit:
        CLR       L:0x5431
//  122   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
        CLR       L:0x5432
//  123   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
        CLR       L:0x5439
//  124   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
        CLR       L:0x543a
//  125   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
        CLR       L:0x543b
//  126   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
        CLR       L:0x5457
//  127   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
        CLR       L:0x543d
//  128   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
        CLR       L:0x543e
//  129   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
        CLR       L:0x543f
//  130 }
        RET
//  131 
//  132 /**
//  133   * @brief  Configures the routing interface to select which Input Output pin
//  134   *         to be routed to TIM1 Input Capture.
//  135   * @param  RI_InputCapture: selects the TIM1 input capture2 RI_InputCapture_IC2
//  136   *         or the TIM1 input capture3 RI_InputCapture_IC3
//  137   * @param  RI_InputCaptureRouting: selects the value to set in TIM1 Input Capture
//  138   *         routing register ICRx and can be from RI_InputCaptureRouting_0 to
//  139   *         RI_InputCaptureRouting_22.
//  140   * @retval None.
//  141   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  142 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
//  143                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
//  144 {
SYSCFG_RITIMInputCaptureConfig:
        LD        S:?b1, A
//  145   /* Check the parameters */
//  146   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
//  147   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
//  148 
//  149   /* Check whether Input Capture 2 is selected */
//  150   if (RI_InputCapture == RI_InputCapture_IC2)
        LD        A, S:?b1
        CP        A, #0x2
        JRNE      L:??SYSCFG_RITIMInputCaptureConfig_0
//  151   {
//  152     /* Set the value in ICR1 register to route TIM input Capture 2 */
//  153     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
        LD        A, S:?b0
        LD        L:0x5431, A
        JRA       L:??SYSCFG_RITIMInputCaptureConfig_1
//  154   }
//  155 
//  156   else /* The Input Capture 3 is selected */
//  157   {
//  158     /* Set the value in ICR2 register to route TIM input capture 3 */
//  159     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
??SYSCFG_RITIMInputCaptureConfig_0:
        LD        A, S:?b0
        LD        L:0x5432, A
//  160   }
//  161 }
??SYSCFG_RITIMInputCaptureConfig_1:
        RET
//  162 
//  163 /**
//  164   * @brief  Enables or disables the Routing Interface Analog switch.
//  165   * @param  RI_AnalogSwitch: Analog Switch
//  166   *          This parameter can be one of the following values:
//  167   *            @arg RI_AnalogSwitch_0: Analog switch 0
//  168   *            @arg RI_AnalogSwitch_1: Analog switch 1
//  169   *            @arg RI_AnalogSwitch_2: Analog switch 2
//  170   *            @arg RI_AnalogSwitch_3: Analog switch 3
//  171   *            @arg RI_AnalogSwitch_4: Analog switch 4
//  172   *            @arg RI_AnalogSwitch_5: Analog switch 5
//  173   *            @arg RI_AnalogSwitch_6: Analog switch 6
//  174   *            @arg RI_AnalogSwitch_7: Analog switch 7
//  175   *            @arg RI_AnalogSwitch_8: Analog switch 8
//  176   *            @arg RI_AnalogSwitch_9: Analog switch 9
//  177   *            @arg RI_AnalogSwitch_10: Analog switch 10
//  178   *            @arg RI_AnalogSwitch_11: Analog switch 11
//  179   *            @arg RI_AnalogSwitch_12: Analog switch 14                          
//  180   * @param  NewState: new state of the analog switch.
//  181   *         This parameter can be ENABLE or DISABLE.
//  182   * @retval None
//  183   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  184 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
//  185                                  FunctionalState NewState)
//  186 {
SYSCFG_RIAnalogSwitchConfig:
        LD        S:?b2, A
//  187   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
        CLR       S:?b1
//  188 
//  189   /* Check the parameters */
//  190   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
//  191   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  192 
//  193   /* Get the analog switch register ASCR1 or ASCR2 */
//  194   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
        LD        A, S:?b2
        AND       A, #0xf0
        LD        S:?b3, A
//  195 
//  196   /* Get the analog switch bit index in ASCRx register */
//  197   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
        LD        A, S:?b2
        AND       A, #0xf
        LD        S:?b1, A
//  198 
//  199   if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??SYSCFG_RIAnalogSwitchConfig_0
//  200   {
//  201     if (AnalogSwitchRegister == (uint8_t) 0x10)
        LD        A, S:?b3
        CP        A, #0x10
        JRNE      L:??SYSCFG_RIAnalogSwitchConfig_1
//  202     {
//  203       /* Enable the analog switch */
//  204       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
        CLRW      X
        INCW      X
        LD        A, S:?b1
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x543d
        LD        L:0x543d, A
        JRA       L:??SYSCFG_RIAnalogSwitchConfig_2
//  205     }
//  206     else
//  207     {
//  208       /* Enable the analog switch */
//  209       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
??SYSCFG_RIAnalogSwitchConfig_1:
        CLRW      X
        INCW      X
        LD        A, S:?b1
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x543e
        LD        L:0x543e, A
        JRA       L:??SYSCFG_RIAnalogSwitchConfig_2
//  210     }
//  211   }
//  212   else
//  213   {
//  214     if (AnalogSwitchRegister == (uint8_t) 0x10)
??SYSCFG_RIAnalogSwitchConfig_0:
        LD        A, S:?b3
        CP        A, #0x10
        JRNE      L:??SYSCFG_RIAnalogSwitchConfig_3
//  215     {
//  216       /* Disable the analog switch */
//  217       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
        CLRW      X
        INCW      X
        LD        A, S:?b1
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x543d
        LD        L:0x543d, A
        JRA       L:??SYSCFG_RIAnalogSwitchConfig_2
//  218     }
//  219     else
//  220     {
//  221       /* Disable the analog switch */
//  222       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
??SYSCFG_RIAnalogSwitchConfig_3:
        CLRW      X
        INCW      X
        LD        A, S:?b1
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x543e
        LD        L:0x543e, A
//  223     }
//  224   }
//  225 }
??SYSCFG_RIAnalogSwitchConfig_2:
        RET
//  226 
//  227 /**
//  228   * @brief  Closes or Opens the routing interface Input Output switches.
//  229   * @param  RI_IOSwitch: can be one of RI_IOSwitch_1..RI_IOSwitch_24
//  230   * @param  NewState: new state of the Input Output Switch.
//  231   *         This parameter can be ENABLE or DISABLE.
//  232   * @retval None.
//  233   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  234 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
//  235                              FunctionalState NewState)
//  236 {
SYSCFG_RIIOSwitchConfig:
        LD        S:?b2, A
//  237   uint8_t IOSwitchRegister, IOSwitchIndex = 0;
        CLR       S:?b1
//  238 
//  239   /* Check the parameters */
//  240   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
//  241   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  242 
//  243   /* Get the Input Output switch bit index in IOSRx register */
//  244   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
        LD        A, S:?b2
        AND       A, #0xf
        LD        S:?b1, A
//  245 
//  246   /* Get the Input Output switch register IOSR1, IOSR2 or IOSR3 */
//  247   IOSwitchRegister = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
        LD        A, S:?b2
        AND       A, #0xf0
        LD        S:?b3, A
//  248 
//  249   /* Check whether the Input Output switch control bit is in the IOSR1 register */
//  250   if (IOSwitchRegister == (uint8_t) 0x10)
        LD        A, S:?b3
        CP        A, #0x10
        JRNE      L:??SYSCFG_RIIOSwitchConfig_0
//  251   {
//  252     if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??SYSCFG_RIIOSwitchConfig_1
//  253     {
//  254       /* Close the Input Output switch */
//  255       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
        CLRW      X
        INCW      X
        LD        A, S:?b1
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x5439
        LD        L:0x5439, A
        JP        L:??SYSCFG_RIIOSwitchConfig_2
//  256     }
//  257     else
//  258     {
//  259       /* Open the Input Output switch */
//  260       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
??SYSCFG_RIIOSwitchConfig_1:
        CLRW      X
        INCW      X
        LD        A, S:?b1
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x5439
        LD        L:0x5439, A
        JRA       L:??SYSCFG_RIIOSwitchConfig_2
//  261     }
//  262   }
//  263 
//  264   /* Check whether the Input Output switch control bit is in the IOSR2 register */
//  265   else if (IOSwitchRegister == (uint8_t) 0x20)
??SYSCFG_RIIOSwitchConfig_0:
        LD        A, S:?b3
        CP        A, #0x20
        JRNE      L:??SYSCFG_RIIOSwitchConfig_3
//  266   {
//  267     if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??SYSCFG_RIIOSwitchConfig_4
//  268     {
//  269       /* Close the Input Output switch */
//  270       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
        CLRW      X
        INCW      X
        LD        A, S:?b1
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x543a
        LD        L:0x543a, A
        JRA       L:??SYSCFG_RIIOSwitchConfig_2
//  271     }
//  272     else
//  273     {
//  274       /* Open the Input Output switch */
//  275       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
??SYSCFG_RIIOSwitchConfig_4:
        CLRW      X
        INCW      X
        LD        A, S:?b1
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x543a
        LD        L:0x543a, A
        JRA       L:??SYSCFG_RIIOSwitchConfig_2
//  276     }
//  277   }
//  278 
//  279   /* The Input Output switch control bit is in the IOSR3 register */
//  280   else if (IOSwitchRegister == (uint8_t) 0x30)
??SYSCFG_RIIOSwitchConfig_3:
        LD        A, S:?b3
        CP        A, #0x30
        JRNE      L:??SYSCFG_RIIOSwitchConfig_5
//  281   {
//  282     if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??SYSCFG_RIIOSwitchConfig_6
//  283     {
//  284       /* Close the Input Output switch */
//  285       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
        CLRW      X
        INCW      X
        LD        A, S:?b1
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x543b
        LD        L:0x543b, A
        JRA       L:??SYSCFG_RIIOSwitchConfig_2
//  286     }
//  287     else
//  288     {
//  289       /* Open the Input Output switch */
//  290       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
??SYSCFG_RIIOSwitchConfig_6:
        CLRW      X
        INCW      X
        LD        A, S:?b1
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x543b
        LD        L:0x543b, A
        JRA       L:??SYSCFG_RIIOSwitchConfig_2
//  291     }
//  292   }
//  293 
//  294   /* The Input Output switch control bit is in the IOSR4 register */
//  295   else
//  296   {
//  297     if (NewState != DISABLE)
??SYSCFG_RIIOSwitchConfig_5:
        TNZ       S:?b0
        JREQ      L:??SYSCFG_RIIOSwitchConfig_7
//  298     {
//  299       /* Close the Input Output switch */
//  300       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
        CLRW      X
        INCW      X
        LD        A, S:?b1
        CALL      L:?sll16_x_x_a
        LD        A, XL
        OR        A, L:0x5457
        LD        L:0x5457, A
        JRA       L:??SYSCFG_RIIOSwitchConfig_2
//  301     }
//  302     else
//  303     {
//  304       /* Open the Input Output switch */
//  305       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
??SYSCFG_RIIOSwitchConfig_7:
        CLRW      X
        INCW      X
        LD        A, S:?b1
        CALL      L:?sll16_x_x_a
        LD        A, XL
        CPL       A
        AND       A, L:0x5457
        LD        L:0x5457, A
//  306     }
//  307   }
//  308 }
??SYSCFG_RIIOSwitchConfig_2:
        RET
//  309 
//  310 /**
//  311   * @brief  Configures the Pull-up and Pull-down Resistors
//  312   * @param  RI_Resistor: selects the resistor to connect,
//  313   *          This parameter can be one of the following values:
//  314   *            @arg RI_Resistor_10KPU: 10K pull up
//  315   *            @arg RI_Resistor_400KPU: 400K pull up
//  316   *            @arg RI_Resistor_10KPD: 10K pull down
//  317   *            @arg RI_Resistor_400KPD: 400K pull down      
//  318   * @retval None
//  319   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  320 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
//  321 {
SYSCFG_RIResistorConfig:
        LD        S:?b1, A
//  322   /* Check the parameters */
//  323   assert_param(IS_RI_RESISTOR(RI_Resistor));
//  324   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  325 
//  326   if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??SYSCFG_RIResistorConfig_0
//  327   {
//  328     /* Enable the resistor */
//  329     RI->RCR |= (uint8_t) RI_Resistor;
        LD        A, L:0x543f
        OR        A, S:?b1
        LD        L:0x543f, A
        JRA       L:??SYSCFG_RIResistorConfig_1
//  330   }
//  331   else
//  332   {
//  333     /* Disable the Resistor */
//  334     RI->RCR &= (uint8_t) (~RI_Resistor);
??SYSCFG_RIResistorConfig_0:
        LD        A, S:?b1
        CPL       A
        AND       A, L:0x543f
        LD        L:0x543f, A
//  335   }
//  336 }
??SYSCFG_RIResistorConfig_1:
        RET
//  337 
//  338 /**
//  339   * @}
//  340   */
//  341 
//  342 /** @defgroup SYSCFG_Group2 SYSCFG configuration
//  343  *  @brief   SYSCFG configuration
//  344  *
//  345 @verbatim   
//  346  ===============================================================================
//  347                            SYSCFG configuration functions
//  348  ===============================================================================  
//  349   
//  350        ===================================================================      
//  351                         SYSCFG Driver: how to use it for remapping
//  352        =================================================================== 
//  353        
//  354          1. To remap the alternate function of some peripherals (such as: USART,
//  355             SPI, TIMs...), use SYSCFG_REMAPPinConfig()
//  356           
//  357          2. To remap the DMA channels of ADC1 and TIM4, use SYSCFG_REMAPDMAChannelConfig()
//  358 
//  359 @endverbatim
//  360   * @{
//  361   */
//  362 
//  363 /**
//  364   * @brief  Deinitializes the Remapping registers to their default reset values.
//  365   * @param  None
//  366   * @retval None
//  367   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  368 void SYSCFG_REMAPDeInit(void)
//  369 {
//  370   /*!< Set RMPCR1 to reset value */
//  371   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
SYSCFG_REMAPDeInit:
        MOV       L:0x509e, #0xc
//  372 
//  373   /*!< Set RMPCR2 to reset value */
//  374   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
        CLR       L:0x509f
//  375 
//  376   /*!< Set RMPCR3 to reset value */
//  377   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
        CLR       L:0x509d
//  378 }
        RET
//  379 
//  380 /**
//  381   * @brief  Changes the mapping of the specified pins.
//  382   * @param  REMAP_Pin: selects the pin to remap.
//  383   *          This parameter can be one of the following values:
//  384   *            @arg REMAP_Pin_USART1TxRxPortA: USART1 Tx- Rx (PC3- PC2) remapping to PA2- PA3
//  385   *            @arg REMAP_Pin_USART1TxRxPortC: USART1 Tx- Rx (PC3- PC2) remapping to PC5- PC6 
//  386   *            @arg REMAP_Pin_USART1Clk: USART1 CK (PC4) remapping to PA0
//  387   *            @arg REMAP_Pin_SPI1Full: SPI1 MISO- MOSI- SCK- NSS(PB7- PB6- PB5- PB4)
//  388   *                                     remapping to PA2- PA3- PC6- PC5
//  389   *            @arg REMAP_Pin_ADC1ExtTRIG1: ADC1 External Trigger 1 (PA6) remapping to PD0
//  390   *            @arg REMAP_Pin_TIM2TRIGPortA: TIM2 Trigger (PB3) remapping to PA4
//  391   *            @arg REMAP_Pin_TIM3TRIGPortA: TIM3 Trigger (PD1) remapping to PA5
//  392   *            @arg REMAP_Pin_TIM2TRIGLSE: TIM2 Trigger remapping to LSE
//  393   *            @arg REMAP_Pin_TIM3TRIGLSE: TIM3 Trigger remapping to LSE
//  394   *            @arg REMAP_Pin_SPI2Full: SPI2 MISO- MOSI- SCK- NSS(PG7- PG6- PG5- PG4)
//  395   *                                     remapping to PI3- PI2- PI1- PI0
//  396   *            @arg REMAP_Pin_TIM3TRIGPortG: TIM3 Trigger (PD1) remapping to PG3
//  397   *            @arg REMAP_Pin_TIM23BKIN: TIM2 Break Input (PA4) remapping to PG0
//  398   *                                      and TIM3 Break Input (PA5) remapping to PG1
//  399   *            @arg REMAP_Pin_SPI1PortF: SPI1 MISO- MOSI- SCK- NSS(PB7- PB6- PB5- PB4)
//  400   *                                      remapping to PF0- PF1- PF2- PF3
//  401   *            @arg REMAP_Pin_USART3TxRxPortF: USART3 Tx- Rx (PG1- PG0) remapping to PF0- PF1
//  402   *            @arg REMAP_Pin_USART3Clk: USART3 CK (PG2) remapping to PF2
//  403   *            @arg REMAP_Pin_TIM3Channel1: TIM3 Channel 1 (PB1) remapping to PI0 
//  404   *            @arg REMAP_Pin_TIM3Channel2: TIM3 Channel 2 (PD0) remapping to PI3
//  405   *            @arg REMAP_Pin_CCO: CCO (PC4) remapping to PE2
//  406   *            @arg REMAP_Pin_TIM2Channel1: TIM2 Channel 1 (PB0) remapping to PC5
//  407   *            @arg REMAP_Pin_TIM2Channel2: TIM2 Channel 2 (PB2) remapping to PC6                                       
//  408   * @param  NewState: This parameter can be ENABLE or DISABLE.
//  409   * @retval None
//  410   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  411 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
//  412 {
SYSCFG_REMAPPinConfig:
        LD        S:?b0, A
//  413   uint8_t regindex = 0;
        CLR       S:?b1
//  414   /* Check the parameters */
//  415   assert_param(IS_REMAP_PIN(REMAP_Pin));
//  416   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  417 
//  418   /* Read register index */
//  419   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
        LD        A, XH
        LD        S:?b1, A
//  420 
//  421   /* Check if REMAP_Pin is in RMPCR1 register */
//  422   if (regindex == 0x01)
        LD        A, S:?b1
        CP        A, #0x1
        JRNE      L:??SYSCFG_REMAPPinConfig_0
//  423   {
//  424     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
        LD        A, XL
        SWAP      A
        AND       A, #0xf0
        OR        A, #0xf
        AND       A, L:0x509e
        LD        L:0x509e, A
//  425     if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??SYSCFG_REMAPPinConfig_1
//  426     {
//  427       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
        LD        A, XL
        AND       A, #0xf0
        OR        A, L:0x509e
        LD        L:0x509e, A
        JRA       L:??SYSCFG_REMAPPinConfig_1
//  428     }
//  429   }
//  430   /* Check if REMAP_Pin is in RMPCR2 register */
//  431   else if (regindex == 0x02)
??SYSCFG_REMAPPinConfig_0:
        LD        A, S:?b1
        CP        A, #0x2
        JRNE      L:??SYSCFG_REMAPPinConfig_2
//  432   {
//  433     if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??SYSCFG_REMAPPinConfig_3
//  434     {
//  435       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
        LD        A, XL
        OR        A, L:0x509f
        LD        L:0x509f, A
        JRA       L:??SYSCFG_REMAPPinConfig_1
//  436     }
//  437     else
//  438     {
//  439       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
??SYSCFG_REMAPPinConfig_3:
        LD        A, XL
        CPL       A
        AND       A, L:0x509f
        LD        L:0x509f, A
        JRA       L:??SYSCFG_REMAPPinConfig_1
//  440     }
//  441   }
//  442   /* REMAP_Pin is in RMPCR3 register */
//  443   else
//  444   {
//  445     if (NewState != DISABLE)
??SYSCFG_REMAPPinConfig_2:
        TNZ       S:?b0
        JREQ      L:??SYSCFG_REMAPPinConfig_4
//  446     {
//  447       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
        LD        A, XL
        OR        A, L:0x509d
        LD        L:0x509d, A
        JRA       L:??SYSCFG_REMAPPinConfig_1
//  448     }
//  449     else
//  450     {
//  451       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
??SYSCFG_REMAPPinConfig_4:
        LD        A, XL
        CPL       A
        AND       A, L:0x509d
        LD        L:0x509d, A
//  452     }
//  453   }
//  454 }
??SYSCFG_REMAPPinConfig_1:
        RET
//  455 
//  456 /**
//  457   * @brief  Remaps the DMA Channel to the specific peripheral (ADC or TIM4)
//  458   * @param  REMAP_DMAChannel: specifies the DMA Channel to remap.
//  459   *          This parameter can be one of the following values:
//  460   *            @arg REMAP_DMA1Channel_ADC1ToChannel0: ADC1 DMA1 req/ack mapped on DMA1 channel 0
//  461   *            @arg REMAP_DMA1Channel_ADC1ToChannel1: ADC1 DMA1 req/ack mapped on DMA1 channel 1
//  462   *            @arg REMAP_DMA1Channel_ADC1ToChannel2: ADC1 DMA1 req/ack mapped on DMA1 channel 2
//  463   *            @arg REMAP_DMA1Channel_ADC1ToChannel3: ADC1 DMA1 req/ack mapped on DMA1 channel 3
//  464   *            @arg REMAP_DMA1Channel_TIM4ToChannel0: TIM4 DMA1 req/ack mapped on DMA1 channel 0
//  465   *            @arg REMAP_DMA1Channel_TIM4ToChannel1: TIM4 DMA1 req/ack mapped on DMA1 channel 1
//  466   *            @arg REMAP_DMA1Channel_TIM4ToChannel2: TIM4 DMA1 req/ack mapped on DMA1 channel 2
//  467   *            @arg REMAP_DMA1Channel_TIM4ToChannel3: TIM4 DMA1 req/ack mapped on DMA1 channel 3              
//  468   * @retval None
//  469   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  470 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
//  471 {
SYSCFG_REMAPDMAChannelConfig:
        LD        S:?b0, A
//  472   /* Check the parameters */
//  473   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
//  474 
//  475   /* Check if the TIM4 DMA channel is selected: bits 4 --> 7 are set */
//  476   if ((REMAP_DMAChannel & 0xF0) != RESET)
        LD        A, S:?b0
        AND       A, #0xf0
        CP        A, #0x0
        JREQ      L:??SYSCFG_REMAPDMAChannelConfig_0
//  477   {
//  478     /* Reset the TIM4 DMA channels */
//  479     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
        LD        A, L:0x509e
        AND       A, #0xf3
        LD        L:0x509e, A
        JRA       L:??SYSCFG_REMAPDMAChannelConfig_1
//  480   }
//  481   /* ADC DMA channel is selected: bits 4 --> 7 are reset */
//  482   else
//  483   {
//  484     /* Reset the ADC DMA channels */
//  485     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
??SYSCFG_REMAPDMAChannelConfig_0:
        LD        A, L:0x509e
        AND       A, #0xfc
        LD        L:0x509e, A
//  486   }
//  487   /* Set the DMA Channels remapping */
//  488   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
??SYSCFG_REMAPDMAChannelConfig_1:
        LD        A, S:?b0
        AND       A, #0xf
        OR        A, L:0x509e
        LD        L:0x509e, A
//  489 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  490 
//  491 /**
//  492   * @}
//  493   */ 
//  494 
//  495 /**
//  496   * @}
//  497   */ 
//  498   
//  499 /**
//  500   * @}
//  501   */
//  502 
//  503 /**
//  504   * @}
//  505   */
//  506 
//  507 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
// 506 bytes in section .near_func.text
// 
// 506 bytes of CODE memory
//
//Errors: none
//Warnings: none
