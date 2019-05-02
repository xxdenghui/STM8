///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                18/Dec/2018  15:34:31
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  G:\Darren\MCU\STM8\Software\Libraries\HAL\hal_pwm.c
//    Command line =  
//        -f C:\Users\new06\AppData\Local\Temp\EW9578.tmp
//        (G:\Darren\MCU\STM8\Software\Libraries\HAL\hal_pwm.c -e -On --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_cross_call
//        --debug --code_model small --data_model medium -o
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
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\Debug\List\hal_pwm.s
//
///////////////////////////////////////////////////////////////////////////////

        PUBLIC hal_pwm_set

// G:\Darren\MCU\STM8\Software\Libraries\HAL\hal_pwm.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    hal_pwm.c
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
//   16 #include "hal_pwm.h"
//   17 
//   18 /* Private typedef -----------------------------------------------------------*/
//   19 
//   20 /* Private define ------------------------------------------------------------*/
//   21 
//   22 /* Private macro -------------------------------------------------------------*/
//   23 
//   24 /* Private variables ---------------------------------------------------------*/
//   25 
//   26 /* Private function prototypes -----------------------------------------------*/
//   27 
//   28 /* Private functions ---------------------------------------------------------*/ 
//   29 
//   30 /* Public functions ----------------------------------------------------------*/
//   31 
//   32 /**
//   33   * @brief  uart print string
//   34   * values 
//   35   * @param  
//   36   *     string
//   37   * @retval None
//   38   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   39 void hal_pwm_set( HAL_PWMCH_TypeDef channel, uint16_t PWM_value, uint16_t maxvalue )
//   40 {
//   41   switch ( channel >> 4 ){
//   42 #ifdef __STM8S_TIM1_H
//   43   case 1: 
//   44     CLK_PeripheralClockConfig( CLK_PERIPHERAL_TIMER1, ENABLE );
//   45     TIM1_TimeBaseInit( 64, TIM1_COUNTERMODE_UP, maxvalue-1, 0 );
//   46     switch ( channel & 0x0F ){
//   47     case 1:
//   48       TIM1_OC1Init( TIM1_OCMODE_PWM2, 
//   49                     TIM1_OUTPUTSTATE_ENABLE, 
//   50                     TIM1_OUTPUTNSTATE_DISABLE, 
//   51                     PWM_value,
//   52                     TIM1_OCPOLARITY_LOW,
//   53                     TIM1_OCNPOLARITY_HIGH, 
//   54                     TIM1_OCIDLESTATE_SET,
//   55                     TIM1_OCNIDLESTATE_RESET );
//   56       break;
//   57     case 2:
//   58       TIM1_OC2Init( TIM1_OCMODE_PWM2, 
//   59                     TIM1_OUTPUTSTATE_ENABLE, 
//   60                     TIM1_OUTPUTNSTATE_DISABLE, 
//   61                     PWM_value,
//   62                     TIM1_OCPOLARITY_LOW,
//   63                     TIM1_OCNPOLARITY_HIGH, 
//   64                     TIM1_OCIDLESTATE_SET,
//   65                     TIM1_OCNIDLESTATE_RESET );
//   66       break;
//   67     case 3:
//   68       TIM1_OC3Init( TIM1_OCMODE_PWM2, 
//   69                     TIM1_OUTPUTSTATE_ENABLE, 
//   70                     TIM1_OUTPUTNSTATE_DISABLE, 
//   71                     PWM_value,
//   72                     TIM1_OCPOLARITY_LOW,
//   73                     TIM1_OCNPOLARITY_HIGH, 
//   74                     TIM1_OCIDLESTATE_SET,
//   75                     TIM1_OCNIDLESTATE_RESET );
//   76       break;
//   77     case 4:
//   78       TIM1_OC4Init( TIM1_OCMODE_PWM2, 
//   79                     TIM1_OUTPUTSTATE_ENABLE,  
//   80                     PWM_value,
//   81                     TIM1_OCPOLARITY_LOW,
//   82                     TIM1_OCIDLESTATE_SET );
//   83       break;
//   84     default:
//   85       break;
//   86     }
//   87     TIM1_CtrlPWMOutputs( ENABLE );
//   88     TIM1_Cmd( ENABLE );
//   89     break;
//   90 #endif
//   91 #ifdef __STM8S_TIM2_H    
//   92   case 2:
//   93     CLK_PeripheralClockConfig( CLK_PERIPHERAL_TIMER2, ENABLE );
//   94     TIM2_TimeBaseInit( TIM2_PRESCALER_1, maxvalue-1 );
//   95     switch ( channel & 0x0F ){
//   96     case 1:
//   97        TIM2_OC1Init( TIM2_OCMODE_PWM1, 
//   98                      TIM2_OUTPUTSTATE_ENABLE, 
//   99                      PWM_value, 
//  100                      TIM2_OCPOLARITY_HIGH );
//  101       TIM2_OC1PreloadConfig(ENABLE);
//  102       break;
//  103     case 2:
//  104       TIM2_OC2Init( TIM2_OCMODE_PWM1, 
//  105                     TIM2_OUTPUTSTATE_ENABLE,
//  106                     PWM_value, 
//  107                     TIM2_OCPOLARITY_HIGH );
//  108       TIM2_OC2PreloadConfig(ENABLE);
//  109       break;
//  110     case 3:
//  111       TIM2_OC3Init( TIM2_OCMODE_PWM1, 
//  112                     TIM2_OUTPUTSTATE_ENABLE, 
//  113                     PWM_value, 
//  114                     TIM2_OCPOLARITY_HIGH );
//  115       TIM2_OC3PreloadConfig(ENABLE);
//  116       break;
//  117     default:
//  118       break;
//  119     }
//  120     TIM2_ARRPreloadConfig(ENABLE);
//  121     TIM2_Cmd( ENABLE );
//  122     break;
//  123 #endif
//  124 #ifdef __STM8S_TIM3_H    
//  125   case 3:
//  126     CLK_PeripheralClockConfig( CLK_PERIPHERAL_TIMER3, ENABLE );
//  127     TIM3_TimeBaseInit( TIM3_PRESCALER_1, maxvalue-1 );
//  128     TIM3_Cmd( ENABLE );
//  129     switch ( channel & 0x0F ){
//  130     case 1:
//  131       TIM3_OC1Init( TIM3_OCMODE_PWM1, 
//  132                     TIM3_OUTPUTSTATE_ENABLE, 
//  133                     PWM_value, 
//  134                     TIM3_OCPOLARITY_HIGH );
//  135       break;
//  136     case 2:
//  137       TIM3_OC2Init( TIM3_OCMODE_PWM1, 
//  138                     TIM3_OUTPUTSTATE_ENABLE, 
//  139                     PWM_value, 
//  140                     TIM3_OCPOLARITY_HIGH );
//  141       break;
//  142     default:
//  143       break;
//  144     }
//  145     break;
//  146 #endif
//  147   default:
//  148     break;
//  149   }
//  150 }
hal_pwm_set:
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  151 
//  152 /************************** (C) COPYRIGHT 2014 DarrenTang *********************/
//  153 /********************************  END OF FILE  *******************************/
// 
// 1 byte in section .near_func.text
// 
// 1 byte of CODE memory
//
//Errors: none
//Warnings: none
