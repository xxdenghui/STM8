///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                22/Mar/2019  11:25:50
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  G:\Darren\MCU\STM8\Software\Libraries\HAL\hal_uart.c
//    Command line =  
//        -f C:\Users\new06\AppData\Local\Temp\EW349D.tmp
//        (G:\Darren\MCU\STM8\Software\Libraries\HAL\hal_uart.c -e -On --no_cse
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
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\Debug\List\hal_uart.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2
        EXTERN ?epilogue_w4
        EXTERN ?mov_l0_l2
        EXTERN ?mov_l2_l0
        EXTERN ?mov_w4_w5
        EXTERN ?pop_w7
        EXTERN ?push_l2
        EXTERN ?push_w4
        EXTERN ?push_w7
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w7
        EXTERN CLK_PeripheralClockConfig
        EXTERN USART_Cmd
        EXTERN USART_GetFlagStatus
        EXTERN USART_Init
        EXTERN USART_SendData8

        PUBLIC UART_Timeout
        PUBLIC USART1_SendByte
        PUBLIC USART2_SendByte
        PUBLIC USART3_SendByte
        PUBLIC uart_cfg
        PUBLIC uart_printf
        PUBLIC uart_send_buff

// G:\Darren\MCU\STM8\Software\Libraries\HAL\hal_uart.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    hal_uart.c
//    4   * @author  Darren Tang
//    5   * @version V1.0.1
//    6   * @date    2019-01-25
//    7   * @brief   This is the uart configration source file.
//    8   ******************************************************************************
//    9   * @attention
//   10   * 
//   11   * 
//   12   ******************************************************************************
//   13   */
//   14 
//   15 /* Includes ------------------------------------------------------------------*/
//   16 #include "hal_uart.h"
//   17 
//   18 /* Private typedef -----------------------------------------------------------*/
//   19 
//   20 /* Private define ------------------------------------------------------------*/
//   21 
//   22 /* Private macro -------------------------------------------------------------*/
//   23 #define UART_FLAG_TIMEOUT  ((uint16_t)0x1000)
//   24 /* Private variables ---------------------------------------------------------*/

        SECTION `.near.bss`:DATA:REORDER:NOROOT(0)
//   25 uint16_t UART_Timeout;
UART_Timeout:
        DS8 2
//   26 /* Private function prototypes -----------------------------------------------*/
//   27 
//   28 /* Private functions ---------------------------------------------------------*/ 
//   29 
//   30 /**
//   31   * @brief  Send a byte to Tx DR
//   32   * values 
//   33   * @param  
//   34   * -byte The data will be send
//   35   * @retval None
//   36   */
//   37 
//   38 /* STM8S UART1 send byte */
//   39 #ifdef __STM8S_UART1_H
//   40 ErrorStatus UART1_SendByte( uint8_t byte )
//   41 {
//   42   ErrorStatus ErrStatus = SUCCESS;
//   43   UART1_SendData8( byte );
//   44   UART_Timeout = UART_FLAG_TIMEOUT;
//   45   while ( UART1_GetFlagStatus( UART1_FLAG_TXE ) == RESET ){
//   46     if((UART_Timeout--) == 0){
//   47       ErrStatus = ERROR;
//   48       break;
//   49     }
//   50   }
//   51   return ErrStatus;
//   52 }
//   53 #endif	// __STM8S_UART1_H
//   54 
//   55 
//   56 /* STM8S UART2 send byte */
//   57 #ifdef __STM8S_UART2_H
//   58 ErrorStatus UART2_SendByte( uint8_t byte )
//   59 {
//   60   ErrorStatus ErrStatus = SUCCESS;
//   61   UART2_SendData8( byte );
//   62   UART_Timeout = UART_FLAG_TIMEOUT;
//   63   while ( UART2_GetFlagStatus( UART2_FLAG_TXE ) == RESET ){
//   64     if((UART_Timeout--) == 0){
//   65       ErrStatus = ERROR;
//   66       break;
//   67     }
//   68   }
//   69   return ErrStatus;
//   70 }
//   71 #endif	// __STM8S_UART2_H
//   72 
//   73 /* STM8S UART3 send byte */
//   74 #ifdef __STM8S_UART3_H
//   75 ErrorStatus UART3_SendByte( uint8_t byte )
//   76 {
//   77   ErrorStatus ErrStatus = SUCCESS;
//   78   UART3_SendData8( byte );
//   79   UART_Timeout = UART_FLAG_TIMEOUT;
//   80   while ( UART3_GetFlagStatus( UART3_FLAG_TXE ) == RESET ){
//   81     if((UART_Timeout--) == 0){
//   82       ErrStatus = ERROR;
//   83       break;
//   84     }
//   85   }
//   86   return ErrStatus;
//   87 }
//   88 #endif	// __STM8S_UART3_H
//   89 
//   90 /* STM8L USART1 send byte */
//   91 #if defined USART1

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   92 ErrorStatus USART1_SendByte( uint8_t byte )
//   93 {
USART1_SendByte:
        CALL      L:?push_w4
        LD        S:?b9, A
//   94   ErrorStatus ErrStatus = SUCCESS;
        MOV       S:?b8, #0x1
//   95   USART_SendData8( USART1, byte );
        LD        A, S:?b9
        LDW       X, #0x5230
        CALL      L:USART_SendData8
//   96   UART_Timeout = UART_FLAG_TIMEOUT;
        LDW       X, #0x1000
        LDW       L:UART_Timeout, X
//   97   while ( USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET ){
??USART1_SendByte_0:
        LDW       Y, #0x40
        LDW       X, #0x5230
        CALL      L:USART_GetFlagStatus
        CP        A, #0x0
        JRNE      L:??USART1_SendByte_1
//   98     if((UART_Timeout--) == 0){
        LDW       X, L:UART_Timeout
        LDW       Y, X
        LDW       X, Y
        DECW      X
        LDW       L:UART_Timeout, X
        TNZW      Y
        JRNE      L:??USART1_SendByte_0
//   99       ErrStatus = ERROR;
        CLR       S:?b8
//  100       break;
//  101     }
//  102   }
//  103   return ErrStatus;
??USART1_SendByte_1:
        LD        A, S:?b8
        JP        L:?epilogue_w4
//  104 }
//  105 #endif
//  106 
//  107 /* STM8L USART2 send byte */
//  108 #if defined USART2

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  109 ErrorStatus USART2_SendByte( uint8_t byte )
//  110 {
USART2_SendByte:
        CALL      L:?push_w4
        LD        S:?b9, A
//  111   ErrorStatus ErrStatus = SUCCESS;
        MOV       S:?b8, #0x1
//  112   USART_SendData8( USART2, byte );
        LD        A, S:?b9
        LDW       X, #0x53e0
        CALL      L:USART_SendData8
//  113   UART_Timeout = UART_FLAG_TIMEOUT;
        LDW       X, #0x1000
        LDW       L:UART_Timeout, X
//  114   while ( USART_GetFlagStatus(USART2, USART_FLAG_TC) == RESET ){
??USART2_SendByte_0:
        LDW       Y, #0x40
        LDW       X, #0x53e0
        CALL      L:USART_GetFlagStatus
        CP        A, #0x0
        JRNE      L:??USART2_SendByte_1
//  115     if((UART_Timeout--) == 0){
        LDW       X, L:UART_Timeout
        LDW       Y, X
        LDW       X, Y
        DECW      X
        LDW       L:UART_Timeout, X
        TNZW      Y
        JRNE      L:??USART2_SendByte_0
//  116       ErrStatus = ERROR;
        CLR       S:?b8
//  117       break;
//  118     }
//  119   }
//  120   return ErrStatus;
??USART2_SendByte_1:
        LD        A, S:?b8
        JP        L:?epilogue_w4
//  121 }
//  122 #endif
//  123 
//  124 /* STM8L USART3 send byte */
//  125 #if defined USART3

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  126 ErrorStatus USART3_SendByte( uint8_t byte )
//  127 {
USART3_SendByte:
        CALL      L:?push_w4
        LD        S:?b9, A
//  128   ErrorStatus ErrStatus = SUCCESS;
        MOV       S:?b8, #0x1
//  129   USART_SendData8( USART3, byte );
        LD        A, S:?b9
        LDW       X, #0x53f0
        CALL      L:USART_SendData8
//  130   UART_Timeout = UART_FLAG_TIMEOUT;
        LDW       X, #0x1000
        LDW       L:UART_Timeout, X
//  131   while ( USART_GetFlagStatus(USART3, USART_FLAG_TC) == RESET ){
??USART3_SendByte_0:
        LDW       Y, #0x40
        LDW       X, #0x53f0
        CALL      L:USART_GetFlagStatus
        CP        A, #0x0
        JRNE      L:??USART3_SendByte_1
//  132     if((UART_Timeout--) == 0){
        LDW       X, L:UART_Timeout
        LDW       Y, X
        LDW       X, Y
        DECW      X
        LDW       L:UART_Timeout, X
        TNZW      Y
        JRNE      L:??USART3_SendByte_0
//  133       ErrStatus = ERROR;
        CLR       S:?b8
//  134       break;
//  135     }
//  136   }
//  137   return ErrStatus;
??USART3_SendByte_1:
        LD        A, S:?b8
        JP        L:?epilogue_w4
//  138 }
//  139 #endif
//  140 
//  141 /* Public functions ----------------------------------------------------------*/
//  142 
//  143 /**
//  144   * @brief  Uart config
//  145   * values 
//  146   * @param  
//  147   *     Uartx = uart1,uart2,uart3
//  148   *     Baud  
//  149   *     Parity
//  150   *     lenth
//  151   *     stopbit
//  152   *     IT
//  153   * @retval none
//  154   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  155 void uart_cfg( Uart_TypeDef Uartx, uint32_t Baud, IT_TypeDef IT )
//  156 {
uart_cfg:
        CALL      L:?push_l2
        CALL      L:?push_w7
        PUSH      S:?b12
        LD        S:?b12, A
        CALL      L:?mov_l2_l0
        LDW       S:?w7, X
//  157 
//  158   switch ( Uartx ){
        LD        A, S:?b12
        DEC       A
        JREQ      L:??uart_cfg_0
        DEC       A
        JREQ      L:??uart_cfg_1
        DEC       A
        JREQ      L:??uart_cfg_2
        JRA       L:??uart_cfg_3
//  159 /* STM8S UART1 config */
//  160 #ifdef __STM8S_UART1_H
//  161     case uart1:
//  162       CLK_PeripheralClockConfig( CLK_PERIPHERAL_UART1, ENABLE );
//  163       UART1_Init( Baud, 
//  164                   UART1_WORDLENGTH_8D, 
//  165                   UART1_STOPBITS_1, 
//  166                   UART1_PARITY_NO, 
//  167                   UART1_SYNCMODE_CLOCK_DISABLE,
//  168                   UART1_MODE_TXRX_ENABLE );
//  169       if ( IT )   UART1_ITConfig( IT, ENABLE );
//  170       UART1_Cmd( ENABLE ); 
//  171       break;
//  172 #endif	// __STM8S_UART1_H
//  173         
//  174 /* STM8S UART2 config */    
//  175 #ifdef __STM8S_UART2_H
//  176   case uart2:
//  177     CLK_PeripheralClockConfig( CLK_PERIPHERAL_UART2, ENABLE );
//  178     UART2_Init( Baud, 
//  179                 UART2_WORDLENGTH_8D, 
//  180                 UART2_STOPBITS_1, 
//  181                 UART2_PARITY_NO, 
//  182                 UART2_SYNCMODE_CLOCK_DISABLE, 
//  183                 UART2_MODE_TXRX_ENABLE );
//  184     if ( IT ) UART2_ITConfig( IT, ENABLE );
//  185     UART2_Cmd( ENABLE );
//  186     break;
//  187 #endif	// __STM8S_UART2_H
//  188       
//  189 /* STM8S UART3 config */
//  190 #ifdef __STM8S_UART3_H 
//  191   case uart3:
//  192     CLK_PeripheralClockConfig( CLK_PERIPHERAL_UART3, ENABLE );
//  193     UART3_Init( Baud, 
//  194                 UART3_WORDLENGTH_8D, 
//  195                 UART3_STOPBITS_1, 
//  196                 UART3_PARITY_NO, 
//  197                 UART3_MODE_TXRX_ENABLE );
//  198     if ( IT )   UART3_ITConfig( IT, ENABLE );
//  199     UART3_Cmd( ENABLE );
//  200     break;
//  201 #endif	// __STM8S_UART3_H
//  202 
//  203 /* STM8L USART1 config */
//  204 #ifdef USART1
//  205     case uart1:
//  206       CLK_PeripheralClockConfig( CLK_Peripheral_USART1, ENABLE );
??uart_cfg_0:
        MOV       S:?b0, #0x1
        LD        A, #0x5
        CALL      L:CLK_PeripheralClockConfig
//  207       USART_Init( USART1, Baud, USART_WordLength_8b, USART_StopBits_1, 
//  208               USART_Parity_No, USART_Mode_RxTx );
        MOV       S:?b6, #0xc
        CLR       S:?b5
        CLR       S:?b4
        CLR       A
        CALL      L:?mov_l0_l2
        LDW       X, #0x5230
        CALL      L:USART_Init
//  209       USART_Cmd( USART1, ENABLE );
        LD        A, #0x1
        LDW       X, #0x5230
        CALL      L:USART_Cmd
//  210       break;
        JRA       L:??uart_cfg_4
//  211 #endif
//  212 	
//  213 /* STM8L USART2 config */
//  214 #ifdef USART2
//  215     case uart2:
//  216       CLK_PeripheralClockConfig( CLK_Peripheral_USART2, ENABLE );
??uart_cfg_1:
        MOV       S:?b0, #0x1
        LD        A, #0x23
        CALL      L:CLK_PeripheralClockConfig
//  217       USART_Init( USART2, Baud, USART_WordLength_8b, USART_StopBits_1, 
//  218               USART_Parity_No, USART_Mode_RxTx );
        MOV       S:?b6, #0xc
        CLR       S:?b5
        CLR       S:?b4
        CLR       A
        CALL      L:?mov_l0_l2
        LDW       X, #0x53e0
        CALL      L:USART_Init
//  219       USART_Cmd( USART2, ENABLE );
        LD        A, #0x1
        LDW       X, #0x53e0
        CALL      L:USART_Cmd
//  220       break;
        JRA       L:??uart_cfg_4
//  221 #endif
//  222 	  
//  223 /* STM8L USART3 config */
//  224 #ifdef USART3
//  225     case uart3:
//  226       CLK_PeripheralClockConfig( CLK_Peripheral_USART3, ENABLE );
??uart_cfg_2:
        MOV       S:?b0, #0x1
        LD        A, #0x24
        CALL      L:CLK_PeripheralClockConfig
//  227       USART_Init( USART3, Baud, USART_WordLength_8b, USART_StopBits_1, 
//  228               USART_Parity_No, USART_Mode_RxTx );
        MOV       S:?b6, #0xc
        CLR       S:?b5
        CLR       S:?b4
        CLR       A
        CALL      L:?mov_l0_l2
        LDW       X, #0x53f0
        CALL      L:USART_Init
//  229       USART_Cmd( USART3, ENABLE );
        LD        A, #0x1
        LDW       X, #0x53f0
        CALL      L:USART_Cmd
//  230       break;
        JRA       L:??uart_cfg_4
//  231 #endif    
//  232     
//  233     default:
//  234       break;   
//  235   }
//  236 }
??uart_cfg_3:
??uart_cfg_4:
        POP       S:?b12
        CALL      L:?pop_w7
        JP        L:?epilogue_l2
//  237 
//  238 
//  239 /**
//  240   * @brief  uart print string
//  241   * values 
//  242   * @param  
//  243   *     string
//  244   * @retval None
//  245   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  246 void uart_printf( Uart_TypeDef Uartx, char *string )
//  247 {
uart_printf:
        CALL      L:?push_l2
        PUSH      S:?b12
        LD        S:?b12, A
        LDW       S:?w5, X
//  248   char *stringbuff;
//  249   switch ( Uartx ){
        LD        A, S:?b12
        DEC       A
        JREQ      L:??uart_printf_0
        DEC       A
        JREQ      L:??uart_printf_1
        DEC       A
        JREQ      L:??uart_printf_2
        JRA       L:??uart_printf_3
//  250     
//  251 /* STM8S UART1 send string */
//  252 #ifdef __STM8S_UART1_H 
//  253     case uart1:
//  254       for( stringbuff = string; *stringbuff; stringbuff++ ) 
//  255         UART1_SendByte( *stringbuff );  
//  256       break;
//  257 #endif	// __STM8S_UART1_H
//  258 	  
//  259 /* STM8S UART2 send string */
//  260 #ifdef __STM8S_UART2_H 
//  261     case uart2:
//  262       for( stringbuff = string; *stringbuff; stringbuff++ ) 
//  263         UART2_SendByte( *stringbuff );  
//  264       break;
//  265 #endif	// __STM8S_UART2_H
//  266 	  
//  267 /* STM8S UART3 send string */
//  268 #ifdef __STM8S_UART3_H 
//  269     case uart3:
//  270       for( stringbuff = string; *stringbuff; stringbuff++ ) 
//  271         UART3_SendByte( *stringbuff );  
//  272       break;
//  273 #endif	// __STM8S_UART3_H
//  274 	  
//  275 /* STM8L USART1 send string */
//  276 #ifdef USART1 
//  277     case uart1:
//  278       for( stringbuff = string; *stringbuff; stringbuff++ ) 
??uart_printf_0:
        CALL      L:?mov_w4_w5
??uart_printf_4:
        TNZ       [S:?w4.w]
        JREQ      L:??uart_printf_5
//  279         USART1_SendByte( *stringbuff );  
        LD        A, [S:?w4.w]
        CALL      L:USART1_SendByte
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
        JRA       L:??uart_printf_4
//  280       break;
??uart_printf_5:
        JRA       L:??uart_printf_6
//  281 #endif          
//  282 
//  283 /* STM8L USART2 send string */
//  284 #ifdef USART2 
//  285     case uart2:
//  286       for( stringbuff = string; *stringbuff; stringbuff++ ) 
??uart_printf_1:
        CALL      L:?mov_w4_w5
??uart_printf_7:
        TNZ       [S:?w4.w]
        JREQ      L:??uart_printf_8
//  287         USART2_SendByte( *stringbuff );  
        LD        A, [S:?w4.w]
        CALL      L:USART2_SendByte
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
        JRA       L:??uart_printf_7
//  288       break;
??uart_printf_8:
        JRA       L:??uart_printf_6
//  289 #endif       
//  290       
//  291 /* STM8L USART3 send string */
//  292 #ifdef USART3 
//  293     case uart3:
//  294       for( stringbuff = string; *stringbuff; stringbuff++ ) 
??uart_printf_2:
        CALL      L:?mov_w4_w5
??uart_printf_9:
        TNZ       [S:?w4.w]
        JREQ      L:??uart_printf_10
//  295         USART3_SendByte( *stringbuff );  
        LD        A, [S:?w4.w]
        CALL      L:USART3_SendByte
        LDW       X, S:?w4
        INCW      X
        LDW       S:?w4, X
        JRA       L:??uart_printf_9
//  296       break;
??uart_printf_10:
        JRA       L:??uart_printf_6
//  297 #endif  
//  298       
//  299   default:
//  300       break;
//  301   }
//  302 }
??uart_printf_3:
??uart_printf_6:
        POP       S:?b12
        JP        L:?epilogue_l2
//  303 
//  304 /**
//  305   * @brief  uart send buff
//  306   * values 
//  307   * @param  
//  308   *     data-  The buff data
//  309   *     lenth- The numbers of byte
//  310   * @retval None
//  311   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  312 void uart_send_buff( Uart_TypeDef Uartx, uint8_t* data, uint8_t lenth )
//  313 {
uart_send_buff:
        CALL      L:?push_l2
        PUSH      S:?b12
        LD        S:?b11, A
        LDW       S:?w4, X
        MOV       S:?b12, S:?b0
//  314   uint8_t i;
//  315   switch ( Uartx ){
        LD        A, S:?b11
        DEC       A
        JREQ      L:??uart_send_buff_0
        DEC       A
        JREQ      L:??uart_send_buff_1
        DEC       A
        JREQ      L:??uart_send_buff_2
        JRA       L:??uart_send_buff_3
//  316 
//  317 /* STM8S UART1 send buff */    
//  318 #ifdef __STM8S_UART1_H 
//  319   case uart1:
//  320     for( i=0; i<lenth; i++ )
//  321       UART1_SendByte( data[i] );  
//  322     break;
//  323 #endif	// __STM8S_UART1_H
//  324 
//  325 /* STM8S UART2 send buff */     
//  326 #ifdef __STM8S_UART2_H 
//  327   case uart2:
//  328     for( i=0; i<lenth; i++ )
//  329       UART2_SendByte( data[i] );  
//  330     break;
//  331 #endif	// __STM8S_UART2_H
//  332 
//  333 /* STM8S UART3 send buff */     
//  334 #ifdef __STM8S_UART3_H 
//  335   case uart3:
//  336     for( i=0; i<lenth; i++ )
//  337       UART3_SendByte( data[i] );  
//  338     break;
//  339 #endif	// __STM8S_UART3_H	
//  340 	
//  341 /* STM8L USART1 send buff */    
//  342 #ifdef USART1 
//  343   case uart1:
//  344     for( i=0; i<lenth; i++ )
??uart_send_buff_0:
        CLR       S:?b10
??uart_send_buff_4:
        LD        A, S:?b10
        CP        A, S:?b12
        JRNC      L:??uart_send_buff_5
//  345       USART1_SendByte( data[i] );  
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        ADDW      X, S:?w4
        LD        A, (X)
        CALL      L:USART1_SendByte
        INC       S:?b10
        JRA       L:??uart_send_buff_4
//  346     break;
??uart_send_buff_5:
        JRA       L:??uart_send_buff_3
//  347 #endif
//  348 
//  349 /* STM8L USART2 send buff */    
//  350 #ifdef USART2 
//  351   case uart2:
//  352     for( i=0; i<lenth; i++ )
??uart_send_buff_1:
        CLR       S:?b10
??uart_send_buff_6:
        LD        A, S:?b10
        CP        A, S:?b12
        JRNC      L:??uart_send_buff_7
//  353       USART2_SendByte( data[i] );  
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        ADDW      X, S:?w4
        LD        A, (X)
        CALL      L:USART2_SendByte
        INC       S:?b10
        JRA       L:??uart_send_buff_6
//  354     break;
??uart_send_buff_7:
        JRA       L:??uart_send_buff_3
//  355 #endif
//  356 
//  357 /* STM8L USART3 send buff */    
//  358 #ifdef USART3 
//  359   case uart3:
//  360     for( i=0; i<lenth; i++ )
??uart_send_buff_2:
        CLR       S:?b10
??uart_send_buff_8:
        LD        A, S:?b10
        CP        A, S:?b12
        JRNC      L:??uart_send_buff_9
//  361       USART3_SendByte( data[i] );  
        CLRW      X
        LD        A, S:?b10
        LD        XL, A
        ADDW      X, S:?w4
        LD        A, (X)
        CALL      L:USART3_SendByte
        INC       S:?b10
        JRA       L:??uart_send_buff_8
//  362     break;
//  363 #endif
//  364     
//  365   }
//  366 }
??uart_send_buff_9:
??uart_send_buff_3:
        POP       S:?b12
        JP        L:?epilogue_l2

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  367 
//  368   
//  369 /************************** (C) COPYRIGHT 2014 DarrenTang *********************/
//  370 /********************************  END OF FILE  *******************************/
// 
//   2 bytes in section .near.bss
// 529 bytes in section .near_func.text
// 
// 529 bytes of CODE memory
//   2 bytes of DATA memory
//
//Errors: none
//Warnings: none
