///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                18/Dec/2018  14:39:15
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\User\led_mode.c
//    Command line =  
//        -f C:\Users\new06\AppData\Local\Temp\EWFC74.tmp
//        ("G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\User\led_mode.c"
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
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\Debug\List\led_mode.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN GPIO_WriteHigh
        EXTERN GPIO_WriteLow
        EXTERN hal_pwm_set

        PUBLIC Breath_Mode
        PUBLIC Bright_Reset
        PUBLIC Clear_Color
        PUBLIC Fantasy_Mode
        PUBLIC Flash_Mode
        PUBLIC LED_Color
        PUBLIC Mix_color
        PUBLIC Mode_Reset
        PUBLIC blue1
        PUBLIC blue2
        PUBLIC change_times
        PUBLIC change_way
        PUBLIC color_std
        PUBLIC green1
        PUBLIC green2
        PUBLIC holdtimes
        PUBLIC pescal
        PUBLIC pescal_count
        PUBLIC red1
        PUBLIC red2
        PUBLIC scan_mode

// G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\User\led_mode.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file     Project/USER/led_mode.c
//    4   * @author   Darren
//    5   * @version  V1.0.0
//    6   * @date     2018-05-03
//    7   * @brief    led_modes
//    8   * @Hardware 
//    9   ******************************************************************************
//   10   * @attention
//   11   *
//   12   * 
//   13   ******************************************************************************
//   14   */
//   15 
//   16 /* Includes ------------------------------------------------------------------*/
//   17 #include "led_mode.h"
//   18  
//   19 /* Private defines -----------------------------------------------------------*/
//   20 #define OFF_LEDS()              GPIO_WriteHigh( OUT_Port, OUTA_Pin|OUTB_Pin|OUTC_Pin )
//   21 #define ON_OUTA()               GPIO_WriteLow( OUT_Port, OUTA_Pin )
//   22 #define ON_OUTB()               GPIO_WriteLow( OUT_Port, OUTB_Pin )
//   23 #define ON_OUTC()               GPIO_WriteLow( OUT_Port, OUTC_Pin )
//   24 #define MAX_BRIGHT              (uint8_t)250
//   25 /* Private variables ---------------------------------------------------------*/

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   26 uint8_t scan_mode;               
scan_mode:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   27 uint16_t pescal_count;
pescal_count:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   28 uint8_t change_way;
change_way:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   29 uint16_t pescal;
pescal:
        DS8 2

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   30 uint8_t change_times;
change_times:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   31 uint8_t color_std;
color_std:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   32 uint8_t red1;
red1:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   33 uint8_t red2;
red2:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   34 uint8_t green1;
green1:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   35 uint8_t green2;
green2:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   36 uint8_t blue1;
blue1:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   37 uint8_t blue2;
blue2:
        DS8 1

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   38 uint8_t holdtimes;
holdtimes:
        DS8 1
//   39 
//   40 /* Private function prototypes -----------------------------------------------*/
//   41 
//   42 /* Private functions ---------------------------------------------------------*/
//   43 
//   44 /*******************************************************************************
//   45  * brief: ModeScan
//   46  * param: none
//   47  * retval: none
//   48  * remark: 
//   49  ******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   50 void LED_Color(void)
//   51 {
//   52   if ( pescal_count ) pescal_count--;                                           
LED_Color:
        LDW       X, L:pescal_count
        TNZW      X
        JREQ      L:??LED_Color_0
        LDW       X, L:pescal_count
        DECW      X
        LDW       L:pescal_count, X
        JRA       L:??LED_Color_1
//   53   else {
//   54     pescal_count = pescal;  
??LED_Color_0:
        LDW       X, L:pescal
        LDW       L:pescal_count, X
//   55     if ( change_times ) { 
        LD        A, L:change_times
        TNZ       A
        JREQ      L:??LED_Color_2
//   56       switch ( scan_mode ){
        LD        A, L:scan_mode
        DEC       A
        JREQ      L:??LED_Color_3
        DEC       A
        JREQ      L:??LED_Color_4
        DEC       A
        JREQ      L:??LED_Color_5
        JRA       L:??LED_Color_6
//   57       case FLASH_MODE:
//   58         Flash_Mode();
??LED_Color_3:
        CALL      L:Flash_Mode
//   59         break;
        JRA       L:??LED_Color_1
//   60       case BREATH_MODE:
//   61         Breath_Mode();
??LED_Color_4:
        CALL      L:Breath_Mode
//   62         break;
        JRA       L:??LED_Color_1
//   63       case FANTASY_MODE:
//   64         Fantasy_Mode();
??LED_Color_5:
        CALL      L:Fantasy_Mode
//   65         break;
        JRA       L:??LED_Color_1
//   66       default:
//   67         OFF_LEDS();
??LED_Color_6:
        LD        A, #0x7
        LDW       X, #0x5005
        CALL      L:GPIO_WriteHigh
//   68         break;
        JRA       L:??LED_Color_1
//   69       }
//   70     }
//   71     else OFF_LEDS();
??LED_Color_2:
        LD        A, #0x7
        LDW       X, #0x5005
        CALL      L:GPIO_WriteHigh
//   72   }
//   73   Mix_color();
??LED_Color_1:
        CALL      L:Mix_color
//   74 }
        RET
//   75 
//   76 /*******************************************************************************
//   77  * brief: Mix_color
//   78  * param: none
//   79  * retval: none
//   80  * remark: 
//   81  ******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   82 void Mix_color( void )
//   83 {
//   84   OFF_LEDS();
Mix_color:
        LD        A, #0x7
        LDW       X, #0x5005
        CALL      L:GPIO_WriteHigh
//   85   Bright_Reset();
        CALL      L:Bright_Reset
//   86   /*switch ( color_std ){
//   87   case 0: 
//   88     if ( blue1 ){
//   89       hal_pwm_set( t1ch2, blue1, MAX_BRIGHT );
//   90       ON_OUTA();
//   91       break;
//   92     }
//   93     else color_std++;
//   94   case 1:
//   95     if ( green1 ){
//   96       hal_pwm_set( t1ch3, green1, MAX_BRIGHT );
//   97       ON_OUTA();
//   98       break;
//   99     }
//  100     else color_std++;
//  101   case 2:
//  102     if ( green2 ){
//  103       hal_pwm_set( t1ch1, green2, MAX_BRIGHT );
//  104       ON_OUTB();
//  105       break;
//  106     }
//  107     else color_std++;
//  108   case 3:
//  109     if ( blue2 ){
//  110       hal_pwm_set( t1ch3, blue2, MAX_BRIGHT );
//  111       ON_OUTB();
//  112       break;
//  113     }
//  114     else color_std++;
//  115   case 4:
//  116     if ( red1 ){
//  117       hal_pwm_set( t1ch1, red1, MAX_BRIGHT );
//  118       ON_OUTC();
//  119       break;
//  120     }
//  121     else color_std++;
//  122   case 5:
//  123     if ( red2 ){
//  124       hal_pwm_set( t1ch2, red2, MAX_BRIGHT );
//  125       ON_OUTC();
//  126       break;
//  127     }
//  128   }
//  129   color_std++;
//  130   if ( color_std>5 ) color_std = 0;*/
//  131   if ( color_std == 0 ){
        LD        A, L:color_std
        TNZ       A
        JRNE      L:??Mix_color_0
//  132     if ( red1 ){
        LD        A, L:red1
        TNZ       A
        JRNE      ??lb_0
        JP        L:??Mix_color_1
//  133       hal_pwm_set( t1ch1, red1, MAX_BRIGHT );
??lb_0:
        LDW       Y, #0xfa
        LD        A, L:red1
        CLRW      X
        LD        XL, A
        LD        A, #0x11
        CALL      L:hal_pwm_set
//  134       ON_OUTC();
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_WriteLow
        JP        L:??Mix_color_1
//  135     }
//  136   }
//  137   else if ( color_std == 1 ){
??Mix_color_0:
        LD        A, L:color_std
        CP        A, #0x1
        JRNE      L:??Mix_color_2
//  138     if ( red2 ){
        LD        A, L:red2
        TNZ       A
        JRNE      ??lb_1
        JP        L:??Mix_color_1
//  139       hal_pwm_set( t1ch2, red2, MAX_BRIGHT );
??lb_1:
        LDW       Y, #0xfa
        LD        A, L:red2
        CLRW      X
        LD        XL, A
        LD        A, #0x12
        CALL      L:hal_pwm_set
//  140       ON_OUTC();
        LD        A, #0x4
        LDW       X, #0x5005
        CALL      L:GPIO_WriteLow
        JP        L:??Mix_color_1
//  141     }
//  142   }
//  143   else if ( color_std == 2 ){
??Mix_color_2:
        LD        A, L:color_std
        CP        A, #0x2
        JRNE      L:??Mix_color_3
//  144     if ( green1 ){
        LD        A, L:green1
        TNZ       A
        JRNE      ??lb_2
        JP        L:??Mix_color_1
//  145       hal_pwm_set( t1ch3, green1, MAX_BRIGHT );
??lb_2:
        LDW       Y, #0xfa
        LD        A, L:green1
        CLRW      X
        LD        XL, A
        LD        A, #0x13
        CALL      L:hal_pwm_set
//  146       ON_OUTA();
        LD        A, #0x1
        LDW       X, #0x5005
        CALL      L:GPIO_WriteLow
        JRA       L:??Mix_color_1
//  147     }
//  148   }
//  149   else if ( color_std == 3 ){
??Mix_color_3:
        LD        A, L:color_std
        CP        A, #0x3
        JRNE      L:??Mix_color_4
//  150     if ( green2 ){
        LD        A, L:green2
        TNZ       A
        JREQ      L:??Mix_color_1
//  151       hal_pwm_set( t1ch1, green2, MAX_BRIGHT );
        LDW       Y, #0xfa
        LD        A, L:green2
        CLRW      X
        LD        XL, A
        LD        A, #0x11
        CALL      L:hal_pwm_set
//  152       ON_OUTB();
        LD        A, #0x2
        LDW       X, #0x5005
        CALL      L:GPIO_WriteLow
        JRA       L:??Mix_color_1
//  153     }
//  154   }
//  155   else if ( color_std == 4 ){
??Mix_color_4:
        LD        A, L:color_std
        CP        A, #0x4
        JRNE      L:??Mix_color_5
//  156     if ( blue1 ){
        LD        A, L:blue1
        TNZ       A
        JREQ      L:??Mix_color_1
//  157       hal_pwm_set( t1ch2, blue1, MAX_BRIGHT );
        LDW       Y, #0xfa
        LD        A, L:blue1
        CLRW      X
        LD        XL, A
        LD        A, #0x12
        CALL      L:hal_pwm_set
//  158       ON_OUTA();
        LD        A, #0x1
        LDW       X, #0x5005
        CALL      L:GPIO_WriteLow
        JRA       L:??Mix_color_1
//  159     }
//  160   }
//  161   else if ( color_std == 5 ){
??Mix_color_5:
        LD        A, L:color_std
        CP        A, #0x5
        JRNE      L:??Mix_color_1
//  162     if ( blue2 ){
        LD        A, L:blue2
        TNZ       A
        JREQ      L:??Mix_color_1
//  163       hal_pwm_set( t1ch3, blue2, MAX_BRIGHT );
        LDW       Y, #0xfa
        LD        A, L:blue2
        CLRW      X
        LD        XL, A
        LD        A, #0x13
        CALL      L:hal_pwm_set
//  164       ON_OUTB();
        LD        A, #0x2
        LDW       X, #0x5005
        CALL      L:GPIO_WriteLow
//  165     }
//  166   }
//  167   color_std++;
??Mix_color_1:
        INC       L:color_std
//  168   if ( color_std>5 ) color_std = 0;
        LD        A, L:color_std
        CP        A, #0x6
        JRC       L:??Mix_color_6
        CLR       L:color_std
//  169 }
??Mix_color_6:
        RET
//  170 
//  171 /*******************************************************************************
//  172  * brief: Flash_Mode
//  173  * param: none
//  174  * retval: none
//  175  * remark: 
//  176  ******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  177 void Flash_Mode(void)
//  178 {
//  179   Clear_Color();
Flash_Mode:
        CALL      L:Clear_Color
//  180   switch ( change_way ){
        LD        A, L:change_way
        TNZ       A
        JREQ      L:??Flash_Mode_0
        DEC       A
        JREQ      L:??Flash_Mode_1
        DEC       A
        JREQ      L:??Flash_Mode_2
        DEC       A
        JREQ      L:??Flash_Mode_3
        DEC       A
        JREQ      L:??Flash_Mode_4
        DEC       A
        JREQ      L:??Flash_Mode_5
        DEC       A
        JREQ      L:??Flash_Mode_6
        DEC       A
        JREQ      L:??Flash_Mode_7
        DEC       A
        JREQ      L:??Flash_Mode_8
        DEC       A
        JREQ      L:??Flash_Mode_9
        DEC       A
        JREQ      L:??Flash_Mode_10
        DEC       A
        JREQ      L:??Flash_Mode_11
        DEC       A
        JREQ      L:??Flash_Mode_12
        DEC       A
        JREQ      L:??Flash_Mode_13
        JRA       L:??Flash_Mode_14
//  181   case 0:
//  182     red1 = MAX_BRIGHT;
??Flash_Mode_0:
        MOV       L:red1, #0xfa
//  183     break;
        JRA       L:??Flash_Mode_15
//  184   case 1:
//  185     red2 = MAX_BRIGHT;
??Flash_Mode_1:
        MOV       L:red2, #0xfa
//  186     break;
        JRA       L:??Flash_Mode_15
//  187   case 2:
//  188     green1 = MAX_BRIGHT;
??Flash_Mode_2:
        MOV       L:green1, #0xfa
//  189     break;
        JRA       L:??Flash_Mode_15
//  190   case 3:
//  191     green2 = MAX_BRIGHT;
??Flash_Mode_3:
        MOV       L:green2, #0xfa
//  192     break;
        JRA       L:??Flash_Mode_15
//  193   case 4:
//  194     blue1 = MAX_BRIGHT;
??Flash_Mode_4:
        MOV       L:blue1, #0xfa
//  195     break;
        JRA       L:??Flash_Mode_15
//  196   case 5:
//  197     blue2 = MAX_BRIGHT;
??Flash_Mode_5:
        MOV       L:blue2, #0xfa
//  198     break;
        JRA       L:??Flash_Mode_15
//  199   case 6:
//  200     red1 = 200;
??Flash_Mode_6:
        MOV       L:red1, #0xc8
//  201     green1 = 50;
        MOV       L:green1, #0x32
//  202     break;
        JRA       L:??Flash_Mode_15
//  203   case 7:
//  204     red2 = 200;
??Flash_Mode_7:
        MOV       L:red2, #0xc8
//  205     green2 = 50;
        MOV       L:green2, #0x32
//  206     break;
        JRA       L:??Flash_Mode_15
//  207   case 8:
//  208     red1 = 200;
??Flash_Mode_8:
        MOV       L:red1, #0xc8
//  209     blue1 = 100;
        MOV       L:blue1, #0x64
//  210     break;
        JRA       L:??Flash_Mode_15
//  211   case 9:
//  212     red2 = 200;
??Flash_Mode_9:
        MOV       L:red2, #0xc8
//  213     blue2 = 100;
        MOV       L:blue2, #0x64
//  214     break;
        JRA       L:??Flash_Mode_15
//  215   case 10:
//  216     green1 = blue1 = MAX_BRIGHT;
??Flash_Mode_10:
        MOV       L:blue1, #0xfa
        MOV       L:green1, L:blue1
//  217     break;
        JRA       L:??Flash_Mode_15
//  218   case 11:
//  219     green2 = blue2 = MAX_BRIGHT;
??Flash_Mode_11:
        MOV       L:blue2, #0xfa
        MOV       L:green2, L:blue2
//  220     break;
        JRA       L:??Flash_Mode_15
//  221   case 12:
//  222     red1 = green1 = blue1 = MAX_BRIGHT;
??Flash_Mode_12:
        LD        A, #0xfa
        LD        L:blue1, A
        LD        L:green1, A
        LD        L:red1, A
//  223     break;
        JRA       L:??Flash_Mode_15
//  224   case 13:
//  225     red2 = green2 = blue2 = MAX_BRIGHT;
??Flash_Mode_13:
        LD        A, #0xfa
        LD        L:blue2, A
        LD        L:green2, A
        LD        L:red2, A
//  226     break;
        JRA       L:??Flash_Mode_15
//  227   default:
//  228     break;
//  229   }
//  230   change_way++;
??Flash_Mode_14:
??Flash_Mode_15:
        INC       L:change_way
//  231   if ( change_way>13 ) change_way = 0;
        LD        A, L:change_way
        CP        A, #0xe
        JRC       L:??Flash_Mode_16
        CLR       L:change_way
//  232 }
??Flash_Mode_16:
        RET
//  233 
//  234 /*******************************************************************************
//  235  * brief: Flicker_Mode
//  236  * param: none
//  237  * retval: none
//  238  * remark: 
//  239  ******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  240 void Breath_Mode(void)
//  241 {
//  242   if ( holdtimes<MAX_BRIGHT ){
Breath_Mode:
        LD        A, L:holdtimes
        CP        A, #0xfa
        JRC       ??lb_4
        JP        L:??Breath_Mode_0
//  243     holdtimes++;
??lb_4:
        INC       L:holdtimes
//  244     switch ( change_way ){
        LD        A, L:change_way
        TNZ       A
        JRNE      ??lb_5
        JP        L:??Breath_Mode_1
??lb_5:
        DEC       A
        JRNE      ??lb_6
        JP        L:??Breath_Mode_2
??lb_6:
        DEC       A
        JRNE      ??lb_7
        JP        L:??Breath_Mode_3
??lb_7:
        DEC       A
        JRNE      ??lb_8
        JP        L:??Breath_Mode_4
??lb_8:
        DEC       A
        JRNE      ??lb_9
        JP        L:??Breath_Mode_5
??lb_9:
        DEC       A
        JRNE      ??lb_10
        JP        L:??Breath_Mode_6
??lb_10:
        DEC       A
        JRNE      ??lb_11
        JP        L:??Breath_Mode_7
??lb_11:
        DEC       A
        JRNE      ??lb_12
        JP        L:??Breath_Mode_8
??lb_12:
        DEC       A
        JRNE      ??lb_13
        JP        L:??Breath_Mode_9
??lb_13:
        DEC       A
        JRNE      ??lb_14
        JP        L:??Breath_Mode_10
??lb_14:
        DEC       A
        JRNE      ??lb_15
        JP        L:??Breath_Mode_11
??lb_15:
        DEC       A
        JRNE      ??lb_16
        JP        L:??Breath_Mode_12
??lb_16:
        DEC       A
        JRNE      ??lb_17
        JP        L:??Breath_Mode_13
??lb_17:
        DEC       A
        JRNE      ??lb_18
        JP        L:??Breath_Mode_14
??lb_18:
        DEC       A
        JRNE      ??lb_19
        JP        L:??Breath_Mode_15
??lb_19:
        DEC       A
        JRNE      ??lb_20
        JP        L:??Breath_Mode_16
??lb_20:
        DEC       A
        JRNE      ??lb_21
        JP        L:??Breath_Mode_17
??lb_21:
        DEC       A
        JRNE      ??lb_22
        JP        L:??Breath_Mode_18
??lb_22:
        DEC       A
        JRNE      ??lb_23
        JP        L:??Breath_Mode_19
??lb_23:
        DEC       A
        JRNE      ??lb_24
        JP        L:??Breath_Mode_20
??lb_24:
        DEC       A
        JRNE      ??lb_25
        JP        L:??Breath_Mode_21
??lb_25:
        DEC       A
        JRNE      ??lb_26
        JP        L:??Breath_Mode_22
??lb_26:
        DEC       A
        JRNE      ??lb_27
        JP        L:??Breath_Mode_23
??lb_27:
        DEC       A
        JRNE      ??lb_28
        JP        L:??Breath_Mode_24
??lb_28:
        JP        L:??Breath_Mode_25
//  245     case 0:
//  246       red1 = holdtimes;
??Breath_Mode_1:
        MOV       L:red1, L:holdtimes
//  247       break;
        JP        L:??Breath_Mode_26
//  248     case 1:
//  249       red1 = MAX_BRIGHT-holdtimes;
??Breath_Mode_2:
        LD        A, #0xfa
        SUB       A, L:holdtimes
        LD        L:red1, A
//  250       break;
        JP        L:??Breath_Mode_26
//  251     case 2:
//  252       holdtimes++;
??Breath_Mode_3:
        INC       L:holdtimes
//  253       break;
        JP        L:??Breath_Mode_26
//  254     case 3:
//  255       red2 = holdtimes;
??Breath_Mode_4:
        MOV       L:red2, L:holdtimes
//  256       green2 = red2>>3;
        LD        A, L:red2
        SRL       A
        SRL       A
        SRL       A
        LD        L:green2, A
//  257       break;
        JP        L:??Breath_Mode_26
//  258     case 4:
//  259       red2 = MAX_BRIGHT-holdtimes;
??Breath_Mode_5:
        LD        A, #0xfa
        SUB       A, L:holdtimes
        LD        L:red2, A
//  260       green2 = red2>>3;
        LD        A, L:red2
        SRL       A
        SRL       A
        SRL       A
        LD        L:green2, A
//  261       break;
        JP        L:??Breath_Mode_26
//  262     case 5:
//  263       holdtimes++;
??Breath_Mode_6:
        INC       L:holdtimes
//  264       break;
        JP        L:??Breath_Mode_26
//  265     case 6:
//  266       red1 = holdtimes;
??Breath_Mode_7:
        MOV       L:red1, L:holdtimes
//  267       green1 = red1>>2;
        LD        A, L:red1
        SRL       A
        SRL       A
        LD        L:green1, A
//  268       break;
        JP        L:??Breath_Mode_26
//  269     case 7:
//  270       red1 = MAX_BRIGHT-holdtimes;
??Breath_Mode_8:
        LD        A, #0xfa
        SUB       A, L:holdtimes
        LD        L:red1, A
//  271       green1 = red1>>2;
        LD        A, L:red1
        SRL       A
        SRL       A
        LD        L:green1, A
//  272       break;
        JP        L:??Breath_Mode_26
//  273     case 8:
//  274       holdtimes++;
??Breath_Mode_9:
        INC       L:holdtimes
//  275       break;
        JP        L:??Breath_Mode_26
//  276     case 9:
//  277       green2 = holdtimes;
??Breath_Mode_10:
        MOV       L:green2, L:holdtimes
//  278       break;
        JP        L:??Breath_Mode_26
//  279     case 10:
//  280       green2 = MAX_BRIGHT-holdtimes;
??Breath_Mode_11:
        LD        A, #0xfa
        SUB       A, L:holdtimes
        LD        L:green2, A
//  281       break;
        JP        L:??Breath_Mode_26
//  282     case 11:
//  283       holdtimes++;
??Breath_Mode_12:
        INC       L:holdtimes
//  284       break;
        JP        L:??Breath_Mode_26
//  285     case 12:
//  286       green1 = holdtimes;
??Breath_Mode_13:
        MOV       L:green1, L:holdtimes
//  287       blue1 = green1>>1;
        LD        A, L:green1
        SRL       A
        LD        L:blue1, A
//  288       break;
        JP        L:??Breath_Mode_26
//  289     case 13:
//  290       green1 = MAX_BRIGHT-holdtimes;
??Breath_Mode_14:
        LD        A, #0xfa
        SUB       A, L:holdtimes
        LD        L:green1, A
//  291       blue1 = green1>>1;
        LD        A, L:green1
        SRL       A
        LD        L:blue1, A
//  292       break;
        JRA       L:??Breath_Mode_26
//  293     case 14:
//  294       holdtimes++;
??Breath_Mode_15:
        INC       L:holdtimes
//  295       break;
        JRA       L:??Breath_Mode_26
//  296     case 15:
//  297       blue2 = holdtimes;
??Breath_Mode_16:
        MOV       L:blue2, L:holdtimes
//  298       break;
        JRA       L:??Breath_Mode_26
//  299     case 16:
//  300       blue2 = MAX_BRIGHT-holdtimes;
??Breath_Mode_17:
        LD        A, #0xfa
        SUB       A, L:holdtimes
        LD        L:blue2, A
//  301       break;
        JRA       L:??Breath_Mode_26
//  302     case 17:
//  303       holdtimes++;
??Breath_Mode_18:
        INC       L:holdtimes
//  304       break;
        JRA       L:??Breath_Mode_26
//  305     case 18:
//  306       red1 = holdtimes;
??Breath_Mode_19:
        MOV       L:red1, L:holdtimes
//  307       blue1 = red1>>2;
        LD        A, L:red1
        SRL       A
        SRL       A
        LD        L:blue1, A
//  308       break;
        JRA       L:??Breath_Mode_26
//  309     case 19:
//  310       red1 = MAX_BRIGHT-holdtimes;
??Breath_Mode_20:
        LD        A, #0xfa
        SUB       A, L:holdtimes
        LD        L:red1, A
//  311       blue1 = red1>>2;
        LD        A, L:red1
        SRL       A
        SRL       A
        LD        L:blue1, A
//  312       break;
        JRA       L:??Breath_Mode_26
//  313     case 20:
//  314       holdtimes++;
??Breath_Mode_21:
        INC       L:holdtimes
//  315       break;
        JRA       L:??Breath_Mode_26
//  316     case 21:
//  317       red2 = holdtimes;
??Breath_Mode_22:
        MOV       L:red2, L:holdtimes
//  318       green2 = blue2 = red2;
        MOV       L:blue2, L:red2
        MOV       L:green2, L:blue2
//  319       break;
        JRA       L:??Breath_Mode_26
//  320     case 22:
//  321       red2 = MAX_BRIGHT-holdtimes;
??Breath_Mode_23:
        LD        A, #0xfa
        SUB       A, L:holdtimes
        LD        L:red2, A
//  322       green2 = blue2 = red2;
        MOV       L:blue2, L:red2
        MOV       L:green2, L:blue2
//  323       break;
        JRA       L:??Breath_Mode_26
//  324     case 23:
//  325       holdtimes++;
??Breath_Mode_24:
        INC       L:holdtimes
//  326       break;
        JRA       L:??Breath_Mode_26
//  327     default:
//  328       change_way = 0;
??Breath_Mode_25:
        CLR       L:change_way
//  329       break;
        JRA       L:??Breath_Mode_26
//  330     }
//  331   }
//  332   else {
//  333     holdtimes = 0;
??Breath_Mode_0:
        CLR       L:holdtimes
//  334     change_way++;
        INC       L:change_way
//  335   }
//  336 }
??Breath_Mode_26:
        RET
//  337 
//  338 /*******************************************************************************
//  339  * brief: Fantasy_Mode
//  340  * param: none
//  341  * retval: none
//  342  * remark: full color change mode
//  343  ******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  344 void Fantasy_Mode( void )
//  345 {
//  346   if ( holdtimes<MAX_BRIGHT ){
Fantasy_Mode:
        LD        A, L:holdtimes
        CP        A, #0xfa
        JRC       ??lb_3
        JP        L:??Fantasy_Mode_0
//  347     holdtimes++;
??lb_3:
        INC       L:holdtimes
//  348     switch ( change_way ){
        LD        A, L:change_way
        TNZ       A
        JREQ      L:??Fantasy_Mode_1
        DEC       A
        JREQ      L:??Fantasy_Mode_2
        DEC       A
        JREQ      L:??Fantasy_Mode_3
        DEC       A
        JREQ      L:??Fantasy_Mode_4
        DEC       A
        JREQ      L:??Fantasy_Mode_5
        DEC       A
        JREQ      L:??Fantasy_Mode_6
        DEC       A
        JREQ      L:??Fantasy_Mode_7
        JRA       L:??Fantasy_Mode_8
//  349     case 0:
//  350       green1 = green2 = holdtimes;
??Fantasy_Mode_1:
        MOV       L:green2, L:holdtimes
        MOV       L:green1, L:green2
//  351       red1 = red2 = MAX_BRIGHT;
        MOV       L:red2, #0xfa
        MOV       L:red1, L:red2
//  352       break;
        JRA       L:??Fantasy_Mode_9
//  353     case 1:
//  354       red1 = red2 = MAX_BRIGHT-holdtimes;
??Fantasy_Mode_2:
        LD        A, #0xfa
        SUB       A, L:holdtimes
        LD        L:red2, A
        MOV       L:red1, L:red2
//  355       break;
        JRA       L:??Fantasy_Mode_9
//  356     case 2:
//  357       blue1 = blue2 = holdtimes;
??Fantasy_Mode_3:
        MOV       L:blue2, L:holdtimes
        MOV       L:blue1, L:blue2
//  358       break;
        JRA       L:??Fantasy_Mode_9
//  359     case 3:
//  360       green1 = green2 = MAX_BRIGHT-holdtimes;
??Fantasy_Mode_4:
        LD        A, #0xfa
        SUB       A, L:holdtimes
        LD        L:green2, A
        MOV       L:green1, L:green2
//  361       break;
        JRA       L:??Fantasy_Mode_9
//  362     case 4:
//  363       red1 = red2 = holdtimes;
??Fantasy_Mode_5:
        MOV       L:red2, L:holdtimes
        MOV       L:red1, L:red2
//  364       break;
        JRA       L:??Fantasy_Mode_9
//  365     case 5:
//  366       green1 = green2 = holdtimes;
??Fantasy_Mode_6:
        MOV       L:green2, L:holdtimes
        MOV       L:green1, L:green2
//  367       break;
        JRA       L:??Fantasy_Mode_9
//  368     case 6:
//  369       blue1 = blue2 = green1 = green2 = MAX_BRIGHT-holdtimes;
??Fantasy_Mode_7:
        LD        A, #0xfa
        SUB       A, L:holdtimes
        LD        L:green2, A
        LD        L:green1, A
        LD        L:blue2, A
        LD        L:blue1, A
//  370       break;
        JRA       L:??Fantasy_Mode_9
//  371     default:
//  372       change_way = 0;
??Fantasy_Mode_8:
        CLR       L:change_way
//  373       break;
        JRA       L:??Fantasy_Mode_9
//  374     }
//  375   }
//  376   else {
//  377     holdtimes = 0;
??Fantasy_Mode_0:
        CLR       L:holdtimes
//  378     change_way++;
        INC       L:change_way
//  379   }
//  380 }
??Fantasy_Mode_9:
        RET
//  381 
//  382 /*******************************************************************************
//  383  * brief: Bright_Reset
//  384  * param: none
//  385  * retval: none
//  386  * remark: reset the pwm value
//  387  ******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  388 void Bright_Reset( void )
//  389 {
//  390   hal_pwm_set( t1ch1, 0, MAX_BRIGHT );
Bright_Reset:
        LDW       Y, #0xfa
        CLRW      X
        LD        A, #0x11
        CALL      L:hal_pwm_set
//  391   hal_pwm_set( t1ch2, 0, MAX_BRIGHT );
        LDW       Y, #0xfa
        CLRW      X
        LD        A, #0x12
        CALL      L:hal_pwm_set
//  392   hal_pwm_set( t1ch3, 0, MAX_BRIGHT );
        LDW       Y, #0xfa
        CLRW      X
        LD        A, #0x13
        CALL      L:hal_pwm_set
//  393 }
        RET
//  394 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  395 void Clear_Color( void )
//  396 {
//  397   red1 = red2 = green1 = green2 = blue1 = blue2 = 0;
Clear_Color:
        CLR       A
        LD        L:blue2, A
        LD        L:blue1, A
        LD        L:green2, A
        LD        L:green1, A
        LD        L:red2, A
        LD        L:red1, A
//  398 }
        RET
//  399 
//  400 /*******************************************************************************
//  401  * brief: Mode_Reset
//  402  * param: none
//  403  * retval: none
//  404  * remark: reset the mode
//  405  ******************************************************************************/

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  406 void Mode_Reset( void )
//  407 {
//  408   pescal = 200;
Mode_Reset:
        LDW       X, #0xc8
        LDW       L:pescal, X
//  409   change_times = 1;
        MOV       L:change_times, #0x1
//  410   scan_mode = FLASH_MODE;
        MOV       L:scan_mode, #0x1
//  411   Clear_Color();
        CALL      L:Clear_Color
//  412   pescal_count = pescal;
        LDW       X, L:pescal
        LDW       L:pescal_count, X
//  413 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  414 /************************** (C) COPYRIGHT 2014 DarrenTang *********************/
//  415 /********************************  END OF FILE  *******************************/
//  416 
// 
//    15 bytes in section .near.bss
// 1 221 bytes in section .near_func.text
// 
// 1 221 bytes of CODE memory
//    15 bytes of DATA memory
//
//Errors: none
//Warnings: none
