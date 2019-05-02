///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                22/Mar/2019  11:20:54
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  
//        G:\Darren\MCU\STM8\Software\Libraries\STM8L15x_StdPeriph_Driver\src\stm8l15x_usart.c
//    Command line =  
//        -f C:\Users\new06\AppData\Local\Temp\EWB2F8.tmp
//        (G:\Darren\MCU\STM8\Software\Libraries\STM8L15x_StdPeriph_Driver\src\stm8l15x_usart.c
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
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\Debug\List\stm8l15x_usart.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b14
        EXTERN ?b15
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b7
        EXTERN ?epilogue_l2_l3
        EXTERN ?load32_l1_dbsp
        EXTERN ?mov_l3_l0
        EXTERN ?push_l0
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?sll16_x_x_a
        EXTERN ?srl16_x_x_4
        EXTERN ?udiv32_l0_l0_l1
        EXTERN ?w0
        EXTERN ?w4
        EXTERN ?w6
        EXTERN ?w7
        EXTERN CLK_GetClockFreq

        PUBLIC USART_ClearFlag
        PUBLIC USART_ClearITPendingBit
        PUBLIC USART_ClockInit
        PUBLIC USART_Cmd
        PUBLIC USART_DMACmd
        PUBLIC USART_DeInit
        PUBLIC USART_GetFlagStatus
        PUBLIC USART_GetITStatus
        PUBLIC USART_HalfDuplexCmd
        PUBLIC USART_ITConfig
        PUBLIC USART_Init
        PUBLIC USART_IrDACmd
        PUBLIC USART_IrDAConfig
        PUBLIC USART_ReceiveData8
        PUBLIC USART_ReceiveData9
        PUBLIC USART_ReceiverWakeUpCmd
        PUBLIC USART_SendBreak
        PUBLIC USART_SendData8
        PUBLIC USART_SendData9
        PUBLIC USART_SetAddress
        PUBLIC USART_SetGuardTime
        PUBLIC USART_SetPrescaler
        PUBLIC USART_SmartCardCmd
        PUBLIC USART_SmartCardNACKCmd
        PUBLIC USART_WakeUpConfig

// G:\Darren\MCU\STM8\Software\Libraries\STM8L15x_StdPeriph_Driver\src\stm8l15x_usart.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8l15x_usart.c
//    4   * @author  MCD Application Team
//    5   * @version V1.6.1
//    6   * @date    30-September-2014
//    7   * @brief   This file provides firmware functions to manage the following 
//    8   *          functionalities of the Universal synchronous asynchronous receiver
//    9   *          transmitter (USART):           
//   10   *           - Initialization and Configuration
//   11   *           - Data transfers
//   12   *           - Multi-Processor Communication
//   13   *           - Half-duplex mode
//   14   *           - Smartcard mode
//   15   *           - IrDA mode
//   16   *           - DMA transfers management
//   17   *           - Interrupts and flags management 
//   18   *           
//   19   *  @verbatim
//   20   *      
//   21   *          ===================================================================
//   22   *                                 How to use this driver
//   23   *          ===================================================================
//   24   *          1. Enable peripheral clock using CLK_PeripheralClockConfig(CLK_Peripheral_USARTx,
//   25   *             ENABLE) function (Refer to the product datasheet for the available USART
//   26   *           	peripherals)
//   27   *
//   28   *          2.  Enable the external Pull-up on the used USART Pins using the
//   29   *              GPIO_ExternalPullUpConfig() function or an external pull-up equivalent resistor
//   30 	*              (RPU = 45 KOhm typical value). 
//   31 	*
//   32   *          3. Program the Baud Rate, Word Length , Stop Bit, Parity and Mode (Receiver/Transmitter)
//   33   *           	using the USART_Init() function.
//   34   *
//   35   *          4. For synchronous mode, enable the clock and program the polarity,
//   36   *             phase and last bit using the USART_ClockInit() function.
//   37   *
//   38   *          5. Enable the corresponding interrupt using the function USART_ITConfig() if you need 
//   39 	*             to use interrupt mode. 
//   40   *
//   41   *          6. When using the DMA mode 
//   42   *                   - Configure the DMA using DMA_Init() function
//   43   *                   - Activate the needed channel Request using USART_DMACmd() function
//   44   * 
//   45   *          7. Enable the USART using the USART_Cmd() function.
//   46   * 
//   47   *          8. Enable the DMA using the DMA_Cmd() function, when using DMA mode. 
//   48   *
//   49   *          Refer to Multi-Processor, half-duplex, Smartcard, IrDA sub-sections for more details.
//   50   *          
//   51   *  @endverbatim
//   52   *        
//   53   ******************************************************************************
//   54   * @attention
//   55   *
//   56   * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
//   57   *
//   58   * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
//   59   * You may not use this file except in compliance with the License.
//   60   * You may obtain a copy of the License at:
//   61   *
//   62   *        http://www.st.com/software_license_agreement_liberty_v2
//   63   *
//   64   * Unless required by applicable law or agreed to in writing, software 
//   65   * distributed under the License is distributed on an "AS IS" BASIS, 
//   66   * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   67   * See the License for the specific language governing permissions and
//   68   * limitations under the License.
//   69   *
//   70   ******************************************************************************
//   71   */ 
//   72 
//   73 /* Includes ------------------------------------------------------------------*/
//   74 #include "stm8l15x_usart.h"
//   75 
//   76 /** @addtogroup STM8L15x_StdPeriph_Driver
//   77   * @{
//   78   */
//   79 
//   80 /** @defgroup USART 
//   81   * @brief USART driver modules
//   82   * @{
//   83   */
//   84 	
//   85 /* Private typedef -----------------------------------------------------------*/
//   86 /* Private define ------------------------------------------------------------*/
//   87 /* Private macro -------------------------------------------------------------*/
//   88 /* Private variables ---------------------------------------------------------*/
//   89 /* Private function prototypes -----------------------------------------------*/
//   90 /* Private functions ---------------------------------------------------------*/
//   91 
//   92 /** @defgroup USART_Private_Functions
//   93   * @{
//   94   */
//   95 
//   96 /** @defgroup USART_Group1 Initialization and Configuration functions
//   97  *  @brief   Initialization and Configuration functions 
//   98  *
//   99 @verbatim   
//  100  ===============================================================================
//  101                   Initialization and Configuration functions
//  102  ===============================================================================  
//  103 
//  104   This subsection provides a set of functions allowing to initialize the USART 
//  105   in asynchronous and in synchronous modes.
//  106    - For the asynchronous mode only these parameters can be configured: 
//  107         - Baud Rate
//  108         - Word Length 
//  109         - Stop Bit
//  110         - Parity: If the parity is enabled, then the MSB bit of the data written
//  111           in the data register is transmitted but is changed by the parity bit.
//  112           Depending on the frame length defined by the M bit (8-bits or 9-bits),
//  113           the possible USART frame formats are as listed in the following table:
//  114    +-------------------------------------------------------------+     
//  115    |   M bit |  PCE bit  |            USART frame                |
//  116    |---------------------|---------------------------------------|             
//  117    |    0    |    0      |    | SB | 8 bit data | STB |          |
//  118    |---------|-----------|---------------------------------------|  
//  119    |    0    |    1      |    | SB | 7 bit data | PB | STB |     |
//  120    |---------|-----------|---------------------------------------|  
//  121    |    1    |    0      |    | SB | 9 bit data | STB |          |
//  122    |---------|-----------|---------------------------------------|  
//  123    |    1    |    1      |    | SB | 8 bit data | PB | STB |     |
//  124    +-------------------------------------------------------------+            
//  125         - Receiver/transmitter modes
//  126 
//  127   The USART_Init() function follows the USART  asynchronous configuration procedure
//  128   (details for the procedure are available in reference manual (RM0031)).
//  129 
//  130   - For the synchronous mode in addition to the asynchronous mode parameters these 
//  131     parameters should be also configured:
//  132         - USART Clock Enabled
//  133         - USART polarity
//  134         - USART phase
//  135         - USART LastBit
//  136   
//  137   These parameters can be configured using the USART_ClockInit() function.
//  138 
//  139 @endverbatim
//  140   * @{
//  141   */
//  142 
//  143 /**
//  144   * @brief   Deinitializes the USART peripheral.
//  145   * @param  USARTx: where x can be 1, 2 or 3 to select the specified USART peripheral.
//  146   * @retval None
//  147   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  148 void USART_DeInit(USART_TypeDef* USARTx)
//  149 {
USART_DeInit:
        LDW       Y, X
//  150 
//  151   /* Clear the Idle Line Detected bit in the status register by a read
//  152       to the USART_SR register followed by a Read to the USART_DR register */
//  153   (void) USARTx->SR;
        LD        A, (Y)
        LD        S:?b0, A
//  154   (void) USARTx->DR;
        LDW       X, Y
        INCW      X
        LD        A, (X)
//  155 
//  156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
        LDW       X, Y
        ADDW      X, #0x3
        CLR       (X)
//  157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
        LDW       X, Y
        INCW      X
        INCW      X
        CLR       (X)
//  158 
//  159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
        LDW       X, Y
        ADDW      X, #0x4
        CLR       (X)
//  160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
        LDW       X, Y
        ADDW      X, #0x5
        CLR       (X)
//  161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
        LDW       X, Y
        ADDW      X, #0x6
        CLR       (X)
//  162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
        LDW       X, Y
        ADDW      X, #0x7
        CLR       (X)
//  163 }
        RET
//  164 
//  165 /**
//  166   * @brief  Initializes the USART according to the specified parameters.
//  167   * @note   Configure in Push Pull or Open Drain mode the Tx pin by setting the
//  168   *         correct I/O Port register according the product package and line
//  169   *         configuration
//  170   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
//  171   * @param  BaudRate: The baudrate.
//  172   * @param  USART_WordLength: the word length
//  173   *           This parameter can be one of the following values:
//  174   *            @arg USART_WordLength_8b: 8 bits Data
//  175   *            @arg USART_WordLength_9b: 9 bits Data  
//  176   * @param  USART_StopBits: Stop Bit
//  177   *           This parameter can be one of the following values:
//  178   *            @arg USART_StopBits_1: One stop bit is transmitted at the end of frame
//  179   *            @arg USART_StopBits_2: Two stop bits are transmitted at the end of frame
//  180   *            @arg USART_StopBits_1_5: One and half stop bits
//  181   * @param  USART_Parity: Parity
//  182   *           This parameter can be one of the following values:
//  183   *            @arg USART_Parity_No: No Parity
//  184   *            @arg USART_Parity_Even: Even Parity
//  185   *            @arg USART_Parity_Odd: Odd Parity    
//  186   * @param  USART_Mode: Mode
//  187   *           This parameter can be one of the following values:
//  188   *            @arg USART_Mode_Rx: Receive Enable
//  189   *            @arg USART_Mode_Tx: Transmit Enable  
//  190   * @retval None
//  191   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  192 void USART_Init(USART_TypeDef* USARTx, 
//  193                 uint32_t BaudRate, 
//  194                 /*USART_WordLength_TypeDef*/ uint8_t USART_WordLength, 
//  195                 /*USART_StopBits_TypeDef*/ uint8_t USART_StopBits,
//  196                 /*USART_Parity_TypeDef*/ uint8_t USART_Parity, 
//  197                 USART_Mode_TypeDef USART_Mode)
//  198 {
USART_Init:
        CALL      L:?push_l2
        CALL      L:?push_l3
        CALL      L:?push_l0
        PUSH      A
        PUSH      S:?b4
        PUSH      S:?b6
        LDW       S:?w4, X
        MOV       S:?b11, S:?b5
//  199   uint32_t BaudRate_Mantissa = 0;
        CLRW      X
        LDW       S:?w7, X
        LDW       S:?w6, X
//  200 
//  201   /* Check the parameters */
//  202   assert_param(IS_USART_BAUDRATE(BaudRate));
//  203 
//  204   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
//  205 
//  206   assert_param(IS_USART_STOPBITS(USART_StopBits));
//  207 
//  208   assert_param(IS_USART_PARITY(USART_Parity));
//  209 
//  210   assert_param(IS_USART_MODE(USART_Mode));
//  211 
//  212   /* Clear the word length and Parity Control bits */
//  213   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        A, (X)
        AND       A, #0xe9
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        (X), A
//  214   /* Set the word length bit according to USART_WordLength value */
//  215   /* Set the Parity Control bit to USART_Parity value */
//  216   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
        LD        A, (0x3,SP)
        OR        A, S:?b11
        LDW       X, S:?w4
        ADDW      X, #0x4
        OR        A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x4
        LD        (X), A
//  217 
//  218   /* Clear the STOP bits */
//  219   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
        LDW       X, S:?w4
        ADDW      X, #0x6
        LD        A, (X)
        AND       A, #0xcf
        LDW       X, S:?w4
        ADDW      X, #0x6
        LD        (X), A
//  220   /* Set the STOP bits number according to USART_StopBits value */
//  221   USARTx->CR3 |= (uint8_t)USART_StopBits;
        LDW       X, S:?w4
        ADDW      X, #0x6
        LD        A, (0x2,SP)
        OR        A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x6
        LD        (X), A
//  222 
//  223   /* Clear the LSB mantissa of USARTDIV */
//  224   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
        LDW       X, S:?w4
        INCW      X
        INCW      X
        LD        A, (X)
        LD        S:?b10, A
        LDW       X, S:?w4
        INCW      X
        INCW      X
        CLR       (X)
//  225   /* Clear the MSB mantissa of USARTDIV */
//  226   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        A, (X)
        AND       A, #0xf
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        (X), A
//  227   /* Clear the Fraction bits of USARTDIV */
//  228   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        A, (X)
        AND       A, #0xf0
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        (X), A
//  229 
//  230   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
        CALL      L:CLK_GetClockFreq
        CALL      L:?load32_l1_dbsp
        DATA
        DC8       0x4
        CODE
        CALL      L:?udiv32_l0_l0_l1
        CALL      L:?mov_l3_l0
//  231   /* Set the fraction of USARTDIV */
//  232   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
        LD        A, S:?b14
        AND       A, #0xf0
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        (X), A
//  233   /* Set the MSB mantissa of USARTDIV */
//  234   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
        LD        A, S:?b15
        AND       A, #0xf
        LDW       X, S:?w4
        ADDW      X, #0x3
        OR        A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x3
        LD        (X), A
//  235   /* Set the LSB mantissa of USARTDIV */
//  236   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
        LDW       X, S:?w7
        CALL      L:?srl16_x_x_4
        LD        A, XL
        LDW       X, S:?w4
        INCW      X
        INCW      X
        LD        (X), A
//  237 
//  238   /* Disable the Transmitter and Receiver */
//  239   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
        LDW       X, S:?w4
        ADDW      X, #0x5
        LD        A, (X)
        AND       A, #0xf3
        LDW       X, S:?w4
        ADDW      X, #0x5
        LD        (X), A
//  240   /* Set TEN and REN bits according to USART_Mode value */
//  241   USARTx->CR2 |= (uint8_t)USART_Mode;
        LDW       X, S:?w4
        ADDW      X, #0x5
        LD        A, (0x1,SP)
        OR        A, (X)
        LDW       X, S:?w4
        ADDW      X, #0x5
        LD        (X), A
//  242 }
        ADD       SP, #0x7
        JP        L:?epilogue_l2_l3
//  243 
//  244 /**
//  245   * @brief  Initializes the USART Clock according to the specified parameters.
//  246   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
//  247   * @param  USART_Clock: Clock
//  248   *           This parameter can be one of the following values:
//  249   *            @arg USART_Clock_Disable: CK pin disabled
//  250   *            @arg USART_Clock_Enable: CK pin enabled  
//  251   * @param  USART_CPOL: Clock Polarity
//  252   *           This parameter can be one of the following values:
//  253   *            @arg USART_CPOL_Low: CK to 0 when idle
//  254   *            @arg USART_CPOL_High: CK to 1 when idle
//  255   * @param  USART_CPHA: Clock Phase
//  256   *           This parameter can be one of the following values:
//  257   *            @arg USART_CPHA_1Edge: The first clock transition is the first data capture edge
//  258   *            @arg USART_CPHA_2Edge: The second clock transition is the first data capture edge
//  259   * @param  USART_LastBit: Last Bit
//  260   *           This parameter can be one of the following values:
//  261   *            @arg USART_LastBit_Disable: The clock pulse of the last data bit is 
//  262   *               not output to the SCLK pin
//  263   *            @arg USART_LastBit_Enable: The clock pulse of the last data bit is 
//  264   *               output to the SCLK pin
//  265   * @retval None
//  266   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  267 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
//  268                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
//  269                      USART_LastBit_TypeDef USART_LastBit)
//  270 {
USART_ClockInit:
        LD        S:?b3, A
//  271   /* Check the parameters */
//  272   assert_param(IS_USART_CLOCK(USART_Clock));
//  273   assert_param(IS_USART_CPOL(USART_CPOL));
//  274   assert_param(IS_USART_CPHA(USART_CPHA));
//  275   assert_param(IS_USART_LASTBIT(USART_LastBit));
//  276 
//  277   /* Clear the Clock Polarity, lock Phase, Last Bit Clock pulse */
//  278   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
        LDW       Y, X
        ADDW      Y, #0x6
        LD        A, (Y)
        AND       A, #0xf8
        ADDW      X, #0x6
        LD        (X), A
        SUBW      X, #0x6
//  279   /* Set the Clock Polarity, lock Phase, Last Bit Clock pulse */
//  280   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
        LD        A, S:?b1
        OR        A, S:?b0
        OR        A, S:?b2
        LDW       Y, X
        ADDW      Y, #0x6
        OR        A, (Y)
        ADDW      X, #0x6
        LD        (X), A
        SUBW      X, #0x6
//  281 
//  282   if (USART_Clock != USART_Clock_Disable)
        TNZ       S:?b3
        JREQ      L:??USART_ClockInit_0
//  283   {
//  284     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
        LDW       Y, X
        ADDW      Y, #0x6
        LD        A, (Y)
        OR        A, #0x8
        ADDW      X, #0x6
        LD        (X), A
        SUBW      X, #0x6
        JRA       L:??USART_ClockInit_1
//  285   }
//  286   else
//  287   {
//  288     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
??USART_ClockInit_0:
        LDW       Y, X
        ADDW      Y, #0x6
        LD        A, (Y)
        AND       A, #0xf7
        ADDW      X, #0x6
        LD        (X), A
        SUBW      X, #0x6
//  289   }
//  290 }
??USART_ClockInit_1:
        RET
//  291 
//  292 /**
//  293   * @brief  Enable the USART peripheral.
//  294   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
//  295   * @param  NewState: The new state of the USART Communication.
//  296     *         This parameter can be: ENABLE or DISABLE.
//  297   * @retval None
//  298   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  299 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  300 {
USART_Cmd:
        LD        S:?b0, A
//  301   if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??USART_Cmd_0
//  302   {
//  303     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
        LDW       Y, X
        ADDW      Y, #0x4
        LD        A, (Y)
        AND       A, #0xdf
        ADDW      X, #0x4
        LD        (X), A
        SUBW      X, #0x4
        JRA       L:??USART_Cmd_1
//  304   }
//  305   else
//  306   {
//  307     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
??USART_Cmd_0:
        LDW       Y, X
        ADDW      Y, #0x4
        LD        A, (Y)
        OR        A, #0x20
        ADDW      X, #0x4
        LD        (X), A
        SUBW      X, #0x4
//  308   }
//  309 }
??USART_Cmd_1:
        RET
//  310 
//  311 /**
//  312   * @brief  Sets the system clock prescaler.
//  313   * @note   IrDA Low Power mode or smartcard mode should be enabled
//  314   * @note   This function is related to SmartCard and IrDa mode.
//  315   * @param  USARTx: Select the USARTx peripheral.
//  316   * @param  USART_Prescaler: specifies the prescaler clock.
//  317   * @note   In IrDA Low Power Mode the clock source is divided by the value given 
//  318   *         in the register (8 bits)
//  319   *         - 0000 0000 Reserved
//  320   *         - 0000 0001 divides the clock source by 1
//  321   *         - 0000 0010 divides the clock source by 2
//  322   *         - ...
//  323   * @note   In Smart Card Mode the clock source is divided by the value given in the register
//  324   *         (5 significant bits) multiplied by 2
//  325   *         - 0 0000 Reserved
//  326   *         - 0 0001 divides the clock source by 2
//  327   *         - 0 0010 divides the clock source by 4
//  328   *         - 0 0011 divides the clock source by 6
//  329   *         - ...
//  330   * @retval None
//  331   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  332 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
//  333 {
//  334   /* Load the USART prescaler value*/
//  335   USARTx->PSCR = USART_Prescaler;
USART_SetPrescaler:
        ADDW      X, #0xa
        LD        (X), A
        SUBW      X, #0xa
//  336 }
        RET
//  337 
//  338 /**
//  339   * @brief  Transmits break characters.
//  340   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
//  341   * @retval None
//  342   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  343 void USART_SendBreak(USART_TypeDef* USARTx)
//  344 {
//  345   USARTx->CR2 |= USART_CR2_SBK;
USART_SendBreak:
        LDW       Y, X
        ADDW      Y, #0x5
        LD        A, (Y)
        OR        A, #0x1
        ADDW      X, #0x5
        LD        (X), A
        SUBW      X, #0x5
//  346 }
        RET
//  347 
//  348 /**
//  349   * @}
//  350   */
//  351 
//  352 /** @defgroup USART_Group2 Data transfers functions
//  353  *  @brief   Data transfers functions 
//  354  *
//  355 @verbatim   
//  356  ===============================================================================
//  357                             Data transfers functions
//  358  ===============================================================================  
//  359 
//  360   This subsection provides a set of functions allowing to manage the USART data 
//  361   transfers.
//  362   
//  363   During an USART reception, data shifts in least significant bit first through 
//  364   the RX pin. In this mode, the USART_DR register is similar to a buffer (RDR) 
//  365   between the internal bus and the received shift register.
//  366 
//  367   When a transmission is taking place, a write instruction to the USART_DR register 
//  368   stores the data in the TDR register which is copied in the shift register 
//  369   at the end of the current transmission.
//  370 
//  371   The read access of the USART_DR register can be done using the USART_ReceiveData8()
//  372   or USART_ReceiveData9() functions and returns the RDR buffered value. Whereas a write
//  373 	access to the USART_DR can be done using USART_SendData8() or USART_SendData9() 
//  374 	functions and stores the written data into TDR buffer.
//  375 
//  376 @endverbatim
//  377   * @{
//  378   */
//  379 
//  380 /**
//  381   * @brief  Returns the most recent received data by the USART peripheral.
//  382   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
//  383   * @retval The received data.
//  384   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  385 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
//  386 {
//  387   return USARTx->DR;
USART_ReceiveData8:
        INCW      X
        LD        A, (X)
        RET
//  388 }
//  389 
//  390 /**
//  391   * @brief  Returns the most recent received data by the USART peripheral.
//  392   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
//  393   * @retval The received data.
//  394   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  395 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
//  396 {
USART_ReceiveData9:
        LDW       Y, X
//  397   uint16_t temp = 0;
        CLR       S:?b1
        CLR       S:?b0
//  398 
//  399   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
        LDW       X, Y
        ADDW      X, #0x4
        LD        A, (X)
        CLRW      X
        LD        XL, A
        SLLW      X
        RLWA      X, A
        AND       A, #0x1
        RLWA      X, A
        AND       A, #0x0
        RLWA      X, A
        LDW       S:?w0, X
//  400   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
        INCW      Y
        LD        A, (Y)
        CLRW      X
        LD        XL, A
        RRWA      X, A
        OR        A, S:?b1
        RRWA      X, A
        OR        A, S:?b0
        RRWA      X, A
        RLWA      X, A
        AND       A, #0x1
        RLWA      X, A
        AND       A, #0xff
        RLWA      X, A
        RET
//  401 }
//  402 
//  403 /**
//  404   * @brief  Transmits 8 bit data through the USART peripheral.
//  405   * @param  Data: The data to transmit.
//  406   * @retval None
//  407   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  408 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
//  409 {
USART_SendData8:
        LDW       Y, X
//  410   /* Transmit Data */
//  411   USARTx->DR = Data;
        LDW       X, Y
        INCW      X
        LD        (X), A
//  412 }
        RET
//  413 
//  414 /**
//  415   * @brief  Transmits 9 bit data through the USART peripheral.
//  416   * @param  USARTx: Select the USARTx peripheral.
//  417   * @param  Data: The data to transmit.
//  418   *         This parameter should be lower than 0x1FF.
//  419   * @retval None
//  420   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  421 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
//  422 {
USART_SendData9:
        LDW       S:?w0, X
//  423   assert_param(IS_USART_DATA_9BITS(Data));
//  424 
//  425   /* Clear the transmit data bit 8     */
//  426   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
        LDW       X, S:?w0
        ADDW      X, #0x4
        LD        A, (X)
        AND       A, #0xbf
        LDW       X, S:?w0
        ADDW      X, #0x4
        LD        (X), A
//  427 
//  428   /* Write the transmit data bit [8]   */
//  429   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
        LDW       X, Y
        SRLW      X
        SRLW      X
        LD        A, XL
        AND       A, #0x40
        LDW       X, S:?w0
        ADDW      X, #0x4
        OR        A, (X)
        LDW       X, S:?w0
        ADDW      X, #0x4
        LD        (X), A
//  430 
//  431   /* Write the transmit data bit [0:7] */
//  432   USARTx->DR   = (uint8_t)(Data);
        LDW       X, S:?w0
        INCW      X
        LD        A, YL
        LD        (X), A
//  433 }
        RET
//  434 /**
//  435   * @}
//  436   */
//  437 
//  438 /** @defgroup USART_Group3 MultiProcessor Communication functions
//  439  *  @brief   Multi-Processor Communication functions 
//  440  *
//  441 @verbatim   
//  442  ===============================================================================
//  443                     Multi-Processor Communication functions
//  444  ===============================================================================  
//  445 
//  446   This subsection provides a set of functions allowing to manage the USART 
//  447   multiprocessor communication.
//  448   
//  449   For instance one of the USARTs can be the master, its TX output is connected to 
//  450   the RX input of the other USART. The others are slaves, their respective TX outputs 
//  451   are logically ANDed together and connected to the RX input of the master.
//  452 
//  453   USART multiprocessor communication is possible through the following procedure:
//  454      1. Program the Baud rate, Word length = 9 bits, Stop bits, Parity, Mode transmitter 
//  455         or Mode receiver and hardware flow control values using the USART_Init()
//  456         function.
//  457      2. Configures the USART address using the USART_SetAddress() function.
//  458      3. Configures the wake up method (USART_WakeUp_IdleLine or USART_WakeUp_AddressMark)
//  459         using USART_WakeUpConfig() function only for the slaves.
//  460      4. Enable the USART using the USART_Cmd() function.
//  461      5. Enter the USART slaves in mute mode using USART_ReceiverWakeUpCmd() function.
//  462 
//  463   The USART Slave exit from mute mode when receiving the wake up condition.
//  464 
//  465 @endverbatim
//  466   * @{
//  467   */
//  468 	
//  469 /**
//  470   * @brief  Determines if the USART is in mute mode or not.
//  471   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
//  472   * @param  NewState: The new state of the USART mode.
//  473     *         This parameter can be: ENABLE or DISABLE.
//  474   * @retval None
//  475   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  476 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  477 {
USART_ReceiverWakeUpCmd:
        LD        S:?b0, A
//  478   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  479 
//  480   if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??USART_ReceiverWakeUpCmd_0
//  481   {
//  482     /* Enable the mute mode USART by setting the RWU bit in the CR2 register */
//  483     USARTx->CR2 |= USART_CR2_RWU;
        LDW       Y, X
        ADDW      Y, #0x5
        LD        A, (Y)
        OR        A, #0x2
        ADDW      X, #0x5
        LD        (X), A
        SUBW      X, #0x5
        JRA       L:??USART_ReceiverWakeUpCmd_1
//  484   }
//  485   else
//  486   {
//  487     /* Disable the mute mode USART by clearing the RWU bit in the CR1 register */
//  488     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
??USART_ReceiverWakeUpCmd_0:
        LDW       Y, X
        ADDW      Y, #0x5
        LD        A, (Y)
        AND       A, #0xfd
        ADDW      X, #0x5
        LD        (X), A
        SUBW      X, #0x5
//  489   }
//  490 }
??USART_ReceiverWakeUpCmd_1:
        RET
//  491 
//  492 /**
//  493   * @brief  Sets the address of the USART node.
//  494   * @param  USARTx: Select the USARTx peripheral.
//  495   * @param  Address: Indicates the address of the USART node.
//  496   *         This parameter should be lower than 16
//  497   * @retval None
//  498   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  499 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
//  500 {
USART_SetAddress:
        LD        S:?b0, A
//  501   /* assert_param for USART_Address */
//  502   assert_param(IS_USART_ADDRESS(USART_Address));
//  503 
//  504   /* Clear the USART address */
//  505   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
        LDW       Y, X
        ADDW      Y, #0x7
        LD        A, (Y)
        AND       A, #0xf0
        ADDW      X, #0x7
        LD        (X), A
        SUBW      X, #0x7
//  506   /* Set the USART address node */
//  507   USARTx->CR4 |= USART_Address;
        LDW       Y, X
        ADDW      Y, #0x7
        LD        A, (Y)
        OR        A, S:?b0
        ADDW      X, #0x7
        LD        (X), A
        SUBW      X, #0x7
//  508 }
        RET
//  509 
//  510 /**
//  511   * @brief  Selects the USART WakeUp method.
//  512   * @param  USART_WakeUp: Specifies the USART wakeup method.
//  513   *           This parameter can be one of the following values:
//  514   *            @arg USART_WakeUp_IdleLine: 0x01 Idle Line wake up
//  515   *            @arg USART_WakeUp_AddressMark: 0x02 Address Mark wake up    
//  516   * @retval None
//  517   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  518 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
//  519 {
USART_WakeUpConfig:
        LD        S:?b0, A
//  520   assert_param(IS_USART_WAKEUP(USART_WakeUp));
//  521 
//  522   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
        LDW       Y, X
        ADDW      Y, #0x4
        LD        A, (Y)
        AND       A, #0xf7
        ADDW      X, #0x4
        LD        (X), A
        SUBW      X, #0x4
//  523   USARTx->CR1 |= (uint8_t)USART_WakeUp;
        LDW       Y, X
        ADDW      Y, #0x4
        LD        A, (Y)
        OR        A, S:?b0
        ADDW      X, #0x4
        LD        (X), A
        SUBW      X, #0x4
//  524 }
        RET
//  525 /**
//  526   * @}
//  527   */
//  528 
//  529 /** @defgroup USART_Group4 Halfduplex mode function
//  530  *  @brief   Half-duplex mode function 
//  531  *
//  532 @verbatim   
//  533  ===============================================================================
//  534                          Half-duplex mode function
//  535  ===============================================================================  
//  536 
//  537   This subsection provides a function allowing to manage the USART 
//  538   Half-duplex communication.
//  539   
//  540   The USART can be configured to follow a single-wire half-duplex protocol where 
//  541   the TX and RX lines are internally connected.
//  542 
//  543   USART Half duplex communication is possible through the following procedure:
//  544      1. Program the Baud rate, Word length, Stop bits, Parity, Mode transmitter 
//  545         or Mode receiver and hardware flow control values using the USART_Init()
//  546         function.
//  547      2. Configures the USART address using the USART_SetAddress() function.
//  548      3. Enable the USART using the USART_Cmd() function.
//  549      4. Enable the half duplex mode using USART_HalfDuplexCmd() function.
//  550 
//  551 Note:
//  552 ----
//  553   1. The RX pin is no longer used
//  554   2. In Half-duplex mode the following bits must be kept cleared:
//  555        - CLKEN bits in the USART_CR3 register.
//  556        - SCEN and IREN bits in the USART_CR5 register.
//  557 
//  558 @endverbatim
//  559   * @{
//  560   */
//  561 
//  562 /**
//  563   * @brief  Enables or disables the USART’s Half Duplex communication.
//  564   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
//  565   * @param  NewState new state of the USART Communication.
//  566     *         This parameter can be: ENABLE or DISABLE.
//  567   * @retval None
//  568   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  569 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  570 {
USART_HalfDuplexCmd:
        LD        S:?b0, A
//  571   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  572 
//  573   if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??USART_HalfDuplexCmd_0
//  574   {
//  575     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
        LDW       Y, X
        ADDW      Y, #0x8
        LD        A, (Y)
        OR        A, #0x8
        ADDW      X, #0x8
        LD        (X), A
        SUBW      X, #0x8
        JRA       L:??USART_HalfDuplexCmd_1
//  576   }
//  577   else
//  578   {
//  579     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
??USART_HalfDuplexCmd_0:
        LDW       Y, X
        ADDW      Y, #0x8
        LD        A, (Y)
        AND       A, #0xf7
        ADDW      X, #0x8
        LD        (X), A
        SUBW      X, #0x8
//  580   }
//  581 }
??USART_HalfDuplexCmd_1:
        RET
//  582 
//  583 /**
//  584   * @}
//  585   */
//  586 
//  587 /** @defgroup USART_Group5 Smartcard mode functions
//  588  *  @brief   Smartcard mode functions 
//  589  *
//  590 @verbatim   
//  591  ===============================================================================
//  592                                Smartcard mode functions
//  593  ===============================================================================  
//  594 
//  595   This subsection provides a set of functions allowing to manage the USART 
//  596   Smartcard communication.
//  597   
//  598   The Smartcard interface is designed to support asynchronous protocol Smartcards as
//  599   defined in the ISO 7816-3 standard.
//  600 
//  601   The USART can provide a clock to the smartcard through the SCLK output.
//  602   In smartcard mode, SCLK is not associated to the communication but is simply derived 
//  603   from the internal peripheral input clock through a 5-bit prescaler.
//  604 
//  605   Smartcard communication is possible through the following procedure:
//  606      1. Configures the Smartcard Prsecaler using the USART_SetPrescaler() function.
//  607      2. Configures the Smartcard Guard Time using the USART_SetGuardTime() function.
//  608      3. Program the USART clock using the USART_ClockInit() function as following:
//  609         - USART Clock enabled
//  610         - USART CPOL Low
//  611         - USART CPHA on first edge
//  612         - USART Last Bit Clock Enabled
//  613      4. Program the Smartcard interface using the USART_Init() function as following:
//  614         - Word Length = 9 Bits
//  615         - 1.5 Stop Bit
//  616         - Even parity
//  617         - BaudRate = 12096 baud
//  618         - Hardware flow control disabled (RTS and CTS signals)
//  619         - Tx and Rx enabled
//  620      5. Optionally you can enable the parity error interrupt using the USART_ITConfig()
//  621         function
//  622      6. Enable the USART using the USART_Cmd() function.
//  623      7. Enable the Smartcard NACK using the USART_SmartCardNACKCmd() function.
//  624      8. Enable the Smartcard interface using the USART_SmartCardCmd() function.
//  625 
//  626   Please refer to the ISO 7816-3 specification for more details.
//  627 
//  628 Note: 
//  629 -----
//  630   1.  It is also possible to choose 0.5 stop bit for receiving but it is recommended 
//  631       to use 1.5 stop bits for both transmitting and receiving to avoid switching 
//  632       between the two configurations.
//  633   2. In smartcard mode, the following bits must be kept cleared:
//  634      - HDSEL and IREN bits in the USART_CR5 register.
//  635 
//  636 @endverbatim
//  637   * @{
//  638   */
//  639 	
//  640 /**
//  641   * @brief  Enables or disables the USART Smart Card mode.
//  642   * @param  USARTx: Select the USARTx peripheral.
//  643   * @param  NewState: new state of the Smart Card mode.
//  644     *         This parameter can be: ENABLE or DISABLE.
//  645   * @retval None
//  646   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  647 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  648 {
USART_SmartCardCmd:
        LD        S:?b0, A
//  649   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  650 
//  651   if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??USART_SmartCardCmd_0
//  652   {
//  653     /* Enable the SC mode by setting the SCEN bit in the CR5 register */
//  654     USARTx->CR5 |= USART_CR5_SCEN;
        LDW       Y, X
        ADDW      Y, #0x8
        LD        A, (Y)
        OR        A, #0x20
        ADDW      X, #0x8
        LD        (X), A
        SUBW      X, #0x8
        JRA       L:??USART_SmartCardCmd_1
//  655   }
//  656   else
//  657   {
//  658     /* Disable the SC mode by clearing the SCEN bit in the CR5 register */
//  659     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
??USART_SmartCardCmd_0:
        LDW       Y, X
        ADDW      Y, #0x8
        LD        A, (Y)
        AND       A, #0xdf
        ADDW      X, #0x8
        LD        (X), A
        SUBW      X, #0x8
//  660   }
//  661 }
??USART_SmartCardCmd_1:
        RET
//  662 
//  663 /**
//  664   * @brief  Enables or disables NACK transmission.
//  665   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
//  666   * @param  NewState: new state of the Smart Card mode.
//  667     *         This parameter can be: ENABLE or DISABLE.
//  668   * @retval None
//  669   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  670 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  671 {
USART_SmartCardNACKCmd:
        LD        S:?b0, A
//  672   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  673 
//  674   if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??USART_SmartCardNACKCmd_0
//  675   {
//  676     /* Enable the NACK transmission by setting the NACK bit in the CR5 register */
//  677     USARTx->CR5 |= USART_CR5_NACK;
        LDW       Y, X
        ADDW      Y, #0x8
        LD        A, (Y)
        OR        A, #0x10
        ADDW      X, #0x8
        LD        (X), A
        SUBW      X, #0x8
        JRA       L:??USART_SmartCardNACKCmd_1
//  678   }
//  679   else
//  680   {
//  681     /* Disable the NACK transmission by clearing the NACK bit in the CR5 register */
//  682     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
??USART_SmartCardNACKCmd_0:
        LDW       Y, X
        ADDW      Y, #0x8
        LD        A, (Y)
        AND       A, #0xef
        ADDW      X, #0x8
        LD        (X), A
        SUBW      X, #0x8
//  683   }
//  684 }
??USART_SmartCardNACKCmd_1:
        RET
//  685 
//  686 /**
//  687   * @brief  Sets the specified USART guard time.
//  688   * @note   SmartCard Mode should be Enabled
//  689   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
//  690   * @param  USART_GuardTime: specifies the guard time.
//  691   * @retval None
//  692   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  693 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
//  694 {
//  695   /* Set the USART guard time */
//  696   USARTx->GTR = USART_GuardTime;
USART_SetGuardTime:
        ADDW      X, #0x9
        LD        (X), A
        SUBW      X, #0x9
//  697 }
        RET
//  698 
//  699 /**
//  700   * @}
//  701   */
//  702 
//  703 /** @defgroup USART_Group6 IrDA mode functions
//  704  *  @brief   IrDA mode functions 
//  705  *
//  706 @verbatim   
//  707  ===============================================================================
//  708                                 IrDA mode functions
//  709  ===============================================================================  
//  710 
//  711   This subsection provides a set of functions allowing to manage the USART 
//  712   IrDA communication.
//  713   
//  714   IrDA is a half duplex communication protocol. If the Transmitter is busy, any data
//  715   on the IrDA receive line will be ignored by the IrDA decoder and if the Receiver 
//  716   is busy, data on the TX from the USART to IrDA will not be encoded by IrDA.
//  717   While receiving data, transmission should be avoided as the data to be transmitted
//  718   could be corrupted.
//  719 
//  720   IrDA communication is possible through the following procedure:
//  721      1. Program the Baud rate, Word length = 8 bits, Stop bits, Parity, Transmitter/Receiver 
//  722         modes and hardware flow control values using the USART_Init() function.
//  723      2. Enable the USART using the USART_Cmd() function.
//  724      3. Configures the IrDA pulse width by configuring the prescaler using  
//  725         the USART_SetPrescaler() function.
//  726      4. Configures the IrDA  USART_IrDAMode_LowPower or USART_IrDAMode_Normal mode
//  727         using the USART_IrDAConfig() function.
//  728      5. Enable the IrDA using the USART_IrDACmd() function.
//  729 
//  730 Note: 
//  731 -----
//  732   1. A pulse of width less than two and greater than one PSC period(s) may or may
//  733      not be rejected.
//  734   2. The receiver set up time should be managed by software. The IrDA physical layer
//  735      specification specifies a minimum of 10 ms delay between transmission and 
//  736      reception (IrDA is a half duplex protocol).
//  737   3. In IrDA mode, the following bits must be kept cleared:
//  738     - STOP and CLKEN bits in the USART_CR3 register.
//  739     - SCEN and HDSEL bits in the USART_CR5 register.
//  740 
//  741 @endverbatim
//  742   * @{
//  743   */
//  744 	
//  745 /**
//  746   * @brief  Configures the USART’s IrDA interface.
//  747   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
//  748   * @param  USART_IrDAMode specifies the IrDA mode.
//  749   *           This parameter can be one of the following values:
//  750   *            @arg USART_IrDAMode_Normal: IrDA Normal Mode
//  751   *            @arg USART_IrDAMode_LowPower: IrDA Low Power Mode 
//  752   * @retval None
//  753   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  754 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
//  755 {
USART_IrDAConfig:
        LD        S:?b0, A
//  756   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
//  757 
//  758   if (USART_IrDAMode != USART_IrDAMode_Normal)
        TNZ       S:?b0
        JREQ      L:??USART_IrDAConfig_0
//  759   {
//  760     USARTx->CR5 |= USART_CR5_IRLP;
        LDW       Y, X
        ADDW      Y, #0x8
        LD        A, (Y)
        OR        A, #0x4
        ADDW      X, #0x8
        LD        (X), A
        SUBW      X, #0x8
        JRA       L:??USART_IrDAConfig_1
//  761   }
//  762   else
//  763   {
//  764     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
??USART_IrDAConfig_0:
        LDW       Y, X
        ADDW      Y, #0x8
        LD        A, (Y)
        AND       A, #0xfb
        ADDW      X, #0x8
        LD        (X), A
        SUBW      X, #0x8
//  765   }
//  766 }
??USART_IrDAConfig_1:
        RET
//  767 
//  768 /**
//  769   * @brief  Enables or disables the USART’s IrDA interface.
//  770   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
//  771   * @param  NewState new state of the IrDA mode.
//  772     *         This parameter can be: ENABLE or DISABLE.
//  773   * @retval None
//  774   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  775 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
//  776 {
USART_IrDACmd:
        LD        S:?b0, A
//  777 
//  778   /* Check parameters */
//  779   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  780 
//  781   if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??USART_IrDACmd_0
//  782   {
//  783     /* Enable the IrDA mode by setting the IREN bit in the CR3 register */
//  784     USARTx->CR5 |= USART_CR5_IREN;
        LDW       Y, X
        ADDW      Y, #0x8
        LD        A, (Y)
        OR        A, #0x2
        ADDW      X, #0x8
        LD        (X), A
        SUBW      X, #0x8
        JRA       L:??USART_IrDACmd_1
//  785   }
//  786   else
//  787   {
//  788     /* Disable the IrDA mode by clearing the IREN bit in the CR3 register */
//  789     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
??USART_IrDACmd_0:
        LDW       Y, X
        ADDW      Y, #0x8
        LD        A, (Y)
        AND       A, #0xfd
        ADDW      X, #0x8
        LD        (X), A
        SUBW      X, #0x8
//  790   }
//  791 }
??USART_IrDACmd_1:
        RET
//  792 
//  793 /**
//  794   * @}
//  795   */
//  796 
//  797 /** @defgroup USART_Group7 DMA transfers management functions
//  798  *  @brief   DMA transfers management functions
//  799  *
//  800 @verbatim   
//  801  ===============================================================================
//  802                       DMA transfers management functions
//  803  ===============================================================================  
//  804 
//  805 @endverbatim
//  806   * @{
//  807   */
//  808 
//  809 
//  810 /**
//  811   * @brief  Enables or disables the USART DMA interface.
//  812   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
//  813   * @param  USART_DMAReq Specifies the USART DMA transfer request to be enabled or disabled.
//  814   *           This parameter can be one of the following values:
//  815   *            @arg USART_DMAReq_TX: Receive DMA request Enable
//  816   *            @arg USART_DMAReq_RX: Transmit DMA request Enable 
//  817   * @param  NewState Indicates the new state of the USART DMA request.
//  818     *         This parameter can be: ENABLE or DISABLE.
//  819   * @retval None
//  820   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  821 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
//  822                   FunctionalState NewState)
//  823 {
USART_DMACmd:
        LD        S:?b1, A
//  824   /* Check the parameters */
//  825   assert_param(IS_USART_DMAREQ(USART_DMAReq));
//  826   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  827 
//  828   if (NewState != DISABLE)
        TNZ       S:?b0
        JREQ      L:??USART_DMACmd_0
//  829   {
//  830     /* Enable the DMA transfer for selected requests by setting the DMAT and/or
//  831        DMAR bits in the USART CR5 register */
//  832     USARTx->CR5 |= (uint8_t) USART_DMAReq;
        LDW       Y, X
        ADDW      Y, #0x8
        LD        A, (Y)
        OR        A, S:?b1
        ADDW      X, #0x8
        LD        (X), A
        SUBW      X, #0x8
        JRA       L:??USART_DMACmd_1
//  833   }
//  834   else
//  835   {
//  836     /* Disable the DMA transfer for selected requests by clearing the DMAT and/or
//  837        DMAR bits in the USART CR5 register */
//  838     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
??USART_DMACmd_0:
        LDW       Y, X
        ADDW      Y, #0x8
        LD        A, S:?b1
        CPL       A
        AND       A, (Y)
        ADDW      X, #0x8
        LD        (X), A
        SUBW      X, #0x8
//  839   }
//  840 }
??USART_DMACmd_1:
        RET
//  841 
//  842 /**
//  843   * @}
//  844   */
//  845   
//  846 /** @defgroup USART_Group8 Interrupts and flags management functions
//  847  *  @brief   Interrupts and flags management functions 
//  848  *
//  849 @verbatim   
//  850  ===============================================================================
//  851                    Interrupts and flags management functions
//  852  ===============================================================================  
//  853 
//  854   This subsection provides a set of functions allowing to configure the USART 
//  855   Interrupts sources, DMA channels requests and check or clear the flags or 
//  856   pending bits status.
//  857   The user should identify which mode will be used in his application to manage 
//  858   the communication: Polling mode, Interrupt mode or DMA mode. 
//  859     
//  860   Polling Mode
//  861   =============
//  862   In Polling Mode, the USART communication can be managed by 9 flags:
//  863      1. USART_FLAG_TXE: to indicate the status of the transmit buffer register
//  864      2. USART_FLAG_RXNE: to indicate the status of the receive buffer register
//  865      3. USART_FLAG_TC: to indicate the status of the transmit operation
//  866      4. USART_FLAG_IDLE: to indicate the status of the Idle Line             
//  867      5. USART_FLAG_SBK: to indicate the status of the Send Break characters
//  868      6. USART_FLAG_NE: to indicate if a noise error occur
//  869      7. USART_FLAG_FE: to indicate if a frame error occur
//  870      8. USART_FLAG_PE: to indicate if a parity error occur
//  871      9. USART_FLAG_ORE: to indicate if an Overrun error occur
//  872 
//  873   In this Mode it is advised to use the following functions:
//  874       - FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG);
//  875       - void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG);
//  876 
//  877   Interrupt Mode
//  878   ===============
//  879   In Interrupt Mode, the USART communication can be managed by 7 interrupt sources
//  880   and 6 pending bits: 
//  881 
//  882   Pending Bits:
//  883   ------------- 
//  884      1. USART_IT_TXE: to indicate the status of the transmit buffer register
//  885      2. USART_IT_RXNE: to indicate the status of the receive buffer register
//  886      3. USART_IT_TC: to indicate the status of the transmit operation
//  887      4. USART_IT_IDLE: to indicate the status of the Idle Line             
//  888      5. USART_IT_PE: to indicate if a parity error occur
//  889      6. USART_IT_OR: to indicate if an Noise flag, overrun error and framing error in
//  890 											multibuffer communication error occur
//  891 
//  892   Interrupt Source:
//  893   -----------------
//  894      1. USART_IT_TXE: specifies the interrupt source for the Tx buffer empty 
//  895                        interrupt. 
//  896      2. USART_IT_RXNE: specifies the interrupt source for the Rx buffer not 
//  897                         empty interrupt.
//  898      3. USART_IT_TC: specifies the interrupt source for the Transmit complete 
//  899 											interrupt. 
//  900      4. USART_IT_IDLE: specifies the interrupt source for the Idle Line interrupt.
//  901      5. USART_IT_PE: specifies the interrupt source for the parity error interrupt. 
//  902      6. USART_IT_ERR:  specifies the interrupt source for the errors interrupt.
//  903 		 7. USART_IT_OR: specifies the interrupt source for the overrun error interrupt.
//  904 
//  905     Note: Some parameters are coded in order to use them as interrupt source or 
//  906     ----  as pending bits.
//  907 
//  908   In this Mode it is advised to use the following functions:
//  909      - void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState
//  910                       		 NewState);
//  911      - ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT);
//  912      - void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT);
//  913 
//  914   DMA Mode
//  915   ========
//  916   In DMA Mode, the USART communication can be managed by 2 DMA Channel requests:
//  917      1. USART_DMAReq_Tx: specifies the Tx buffer DMA transfer request
//  918      2. USART_DMAReq_Rx: specifies the Rx buffer DMA transfer request
//  919 
//  920   In this Mode it is advised to use the following function:
//  921      - void USART_DMACmd(USART_TypeDef* USARTx, uint16_t USART_DMAReq, FunctionalState NewState);
//  922 
//  923 @endverbatim
//  924   * @{
//  925   */
//  926 
//  927 /**
//  928   * @brief  Enables or disables the specified USART interrupts.
//  929   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
//  930   * @param  USART_IT specifies the USART interrupt sources to be enabled or disabled.
//  931   *         This parameter can be one of the following values:
//  932   *            @arg USART_IT_TXE: Transmit Data Register empty interrupt
//  933   *            @arg USART_IT_TC: Transmission complete interrupt
//  934   *            @arg USART_IT_RXNE: Receive Data register not empty interrupt
//  935   *            @arg USART_IT_OR: Overrun error interrupt
//  936   *            @arg USART_IT_IDLE: Idle line detection interrupt
//  937   *            @arg USART_IT_ERR: Error interrupt
//  938   * @param  NewState new state of the specified USART interrupts.
//  939     *         This parameter can be: ENABLE or DISABLE.
//  940   * @retval None
//  941   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  942 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
//  943 {
USART_ITConfig:
        LDW       S:?w0, X
        LD        S:?b2, A
//  944   uint8_t usartreg, itpos = 0x00;
        CLR       S:?b4
//  945   assert_param(IS_USART_CONFIG_IT(USART_IT));
//  946   assert_param(IS_FUNCTIONAL_STATE(NewState));
//  947 
//  948   /* Get the USART register index */
//  949   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
        LD        A, YH
        LD        S:?b3, A
//  950   /* Get the USART IT index */
//  951   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
        LD        A, YL
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        LD        S:?b4, A
//  952 
//  953   if (NewState != DISABLE)
        TNZ       S:?b2
        JREQ      L:??USART_ITConfig_0
//  954   {
//  955     /**< Enable the Interrupt bits according to USART_IT mask */
//  956     if (usartreg == 0x01)
        LD        A, S:?b3
        CP        A, #0x1
        JRNE      L:??USART_ITConfig_1
//  957     {
//  958       USARTx->CR1 |= itpos;
        LDW       X, S:?w0
        ADDW      X, #0x4
        LD        A, (X)
        OR        A, S:?b4
        LDW       X, S:?w0
        ADDW      X, #0x4
        LD        (X), A
        JRA       L:??USART_ITConfig_2
//  959     }
//  960     else if (usartreg == 0x05)
??USART_ITConfig_1:
        LD        A, S:?b3
        CP        A, #0x5
        JRNE      L:??USART_ITConfig_3
//  961     {
//  962       USARTx->CR5 |= itpos;
        LDW       X, S:?w0
        ADDW      X, #0x8
        LD        A, (X)
        OR        A, S:?b4
        LDW       X, S:?w0
        ADDW      X, #0x8
        LD        (X), A
        JRA       L:??USART_ITConfig_2
//  963     }
//  964     /*uartreg =0x02*/
//  965     else
//  966     {
//  967       USARTx->CR2 |= itpos;
??USART_ITConfig_3:
        LDW       X, S:?w0
        ADDW      X, #0x5
        LD        A, (X)
        OR        A, S:?b4
        LDW       X, S:?w0
        ADDW      X, #0x5
        LD        (X), A
        JRA       L:??USART_ITConfig_2
//  968     }
//  969   }
//  970   else
//  971   {
//  972     /**< Disable the interrupt bits according to USART_IT mask */
//  973     if (usartreg == 0x01)
??USART_ITConfig_0:
        LD        A, S:?b3
        CP        A, #0x1
        JRNE      L:??USART_ITConfig_4
//  974     {
//  975       USARTx->CR1 &= (uint8_t)(~itpos);
        LDW       X, S:?w0
        ADDW      X, #0x4
        LD        A, S:?b4
        CPL       A
        AND       A, (X)
        LDW       X, S:?w0
        ADDW      X, #0x4
        LD        (X), A
        JRA       L:??USART_ITConfig_2
//  976     }
//  977     else if (usartreg == 0x05)
??USART_ITConfig_4:
        LD        A, S:?b3
        CP        A, #0x5
        JRNE      L:??USART_ITConfig_5
//  978     {
//  979       USARTx->CR5 &= (uint8_t)(~itpos);
        LDW       X, S:?w0
        ADDW      X, #0x8
        LD        A, S:?b4
        CPL       A
        AND       A, (X)
        LDW       X, S:?w0
        ADDW      X, #0x8
        LD        (X), A
        JRA       L:??USART_ITConfig_2
//  980     }
//  981     /*uartreg =0x02*/
//  982     else
//  983     {
//  984       USARTx->CR2 &= (uint8_t)(~itpos);
??USART_ITConfig_5:
        LDW       X, S:?w0
        ADDW      X, #0x5
        LD        A, S:?b4
        CPL       A
        AND       A, (X)
        LDW       X, S:?w0
        ADDW      X, #0x5
        LD        (X), A
//  985     }
//  986   }
//  987 }
??USART_ITConfig_2:
        RET
//  988 
//  989 /**
//  990   * @brief  Checks whether the specified USART flag is set or not.
//  991   * @param  USARTx: Select the USARTx peripheral.
//  992   * @param  USART_FLAG specifies the flag to check.
//  993   *         This parameter can be one of the following values:
//  994   *            @arg USART_FLAG_TXE: Transmit Data Register empty
//  995   *            @arg USART_FLAG_TC: Transmission Complete 
//  996   *            @arg USART_FLAG_RXNE: Read Data Register Not Empty
//  997   *            @arg USART_FLAG_IDLE: Idle line detected
//  998   *            @arg USART_FLAG_OR: OverRun error
//  999   *            @arg USART_FLAG_NF: Noise error
// 1000   *            @arg USART_FLAG_FE: Framing Error
// 1001   *            @arg USART_FLAG_PE: Parity Error
// 1002   *            @arg USART_FLAG_SBK: Send Break characters               
// 1003   * @retval FlagStatus (SET or RESET)
// 1004   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1005 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
// 1006 {
USART_GetFlagStatus:
        LDW       S:?w0, X
        LDW       X, Y
// 1007   FlagStatus status = RESET;
        CLR       S:?b2
// 1008 
// 1009   /* Check parameters */
// 1010   assert_param(IS_USART_FLAG(USART_FLAG));
// 1011 
// 1012   if (USART_FLAG == USART_FLAG_SBK)
        CPW       X, #0x101
        JRNE      L:??USART_GetFlagStatus_0
// 1013   {
// 1014     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
        LDW       Y, S:?w0
        ADDW      Y, #0x5
        LD        A, XL
        AND       A, (Y)
        CP        A, #0x0
        JREQ      L:??USART_GetFlagStatus_1
// 1015     {
// 1016       /* USART_FLAG is set*/
// 1017       status = SET;
        LD        A, #0x1
        LD        S:?b2, A
        JRA       L:??USART_GetFlagStatus_2
// 1018     }
// 1019     else
// 1020     {
// 1021       /* USART_FLAG is reset*/
// 1022       status = RESET;
??USART_GetFlagStatus_1:
        CLR       S:?b2
        JRA       L:??USART_GetFlagStatus_2
// 1023     }
// 1024   }
// 1025   else
// 1026   {
// 1027     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
??USART_GetFlagStatus_0:
        LD        A, XL
        AND       A, [S:?w0.w]
        CP        A, #0x0
        JREQ      L:??USART_GetFlagStatus_3
// 1028     {
// 1029       /* USART_FLAG is set*/
// 1030       status = SET;
        LD        A, #0x1
        LD        S:?b2, A
        JRA       L:??USART_GetFlagStatus_2
// 1031     }
// 1032     else
// 1033     {
// 1034       /* USART_FLAG is reset*/
// 1035       status = RESET;
??USART_GetFlagStatus_3:
        CLR       S:?b2
// 1036     }
// 1037   }
// 1038   /* Return the USART_FLAG status*/
// 1039   return status;
??USART_GetFlagStatus_2:
        LD        A, S:?b2
        RET
// 1040 }
// 1041 
// 1042 /**
// 1043   * @brief  Clears the USARTx's pending flags.
// 1044   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
// 1045   * @param  USART_FLAG: specifies the flag to clear.
// 1046   *         This parameter can be any combination of the following values:
// 1047   *            @arg USART_FLAG_TC:   Transmission Complete flag.
// 1048   *            @arg USART_FLAG_RXNE: Receive data register not empty flag.
// 1049   * @note   PE (Parity error), FE (Framing error), NE (Noise error), OR (OverRun error)
// 1050   *         and IDLE (Idle line detected) flags are cleared by software sequence: a read
// 1051   *         operation to USART_SR register (USART_GetFlagStatus())followed by a read
// 1052   *         operation to USART_DR register(USART_ReceiveData8() or USART_ReceiveData9()).
// 1053   * @note   RXNE flag can be also cleared by a read to the USART_DR register
// 1054   *         (USART_ReceiveData8()or USART_ReceiveData9()).
// 1055   * @note   TC flag can be also cleared by software sequence: a read operation to USART_SR
// 1056   *         register (USART_GetFlagStatus()) followed by a write operation to USART_DR
// 1057   *         register (USART_SendData8() or USART_SendData9()).
// 1058   * @note    TXE flag is cleared only by a write to the USART_DR register
// 1059   *         (USART_SendData8() or USART_SendData9()).
// 1060   * @note   SBK flag is cleared during the stop bit of break.
// 1061   * @retval None
// 1062   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1063 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
// 1064 {
// 1065   /* Check the parameters */
// 1066   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
// 1067   /*< Clear RXNE or TC flags */
// 1068   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
USART_ClearFlag:
        LD        A, YL
        CPL       A
        LD        (X), A
// 1069 }
        RET
// 1070 
// 1071 /**
// 1072   * @brief  Checks whether the specified USART interrupt has occurred or not.
// 1073   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
// 1074   * @param  USART_IT: Specifies the USART interrupt pending bit to check.
// 1075   *         This parameter can be one of the following values:
// 1076   *            @arg USART_IT_TXE: Transmit Data Register empty interrupt
// 1077   *            @arg USART_IT_TC: Transmission complete interrupt
// 1078   *            @arg USART_IT_RXNE: Receive Data register not empty interrupt
// 1079   *            @arg USART_IT_IDLE: Idle line detection interrupt
// 1080   *            @arg USART_IT_OR: OverRun Error interrupt
// 1081   *            @arg USART_IT_PE: Parity Error interrupt
// 1082   *            @arg USART_IT_FE: Frame Error interrupt
// 1083   *            @arg USART_IT_NF: Noise Flag Error interrupt
// 1084   * @retval ITStatus The new state of USART_IT (SET or RESET).
// 1085   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1086 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
// 1087 {
USART_GetITStatus:
        LDW       S:?w0, X
// 1088   ITStatus pendingbitstatus = RESET;
        CLR       S:?b2
// 1089   uint8_t temp = 0;
        CLR       S:?b4
// 1090   uint8_t itpos = 0;
        CLR       S:?b7
// 1091   uint8_t itmask1 = 0;
        CLR       S:?b5
// 1092   uint8_t itmask2 = 0;
        CLR       S:?b6
// 1093   uint8_t enablestatus = 0;
        CLR       S:?b3
// 1094 
// 1095   /* Check parameters */
// 1096   assert_param(IS_USART_GET_IT(USART_IT));
// 1097 
// 1098   /* Get the USART IT index */
// 1099   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
        LD        A, YL
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        LD        S:?b7, A
// 1100   /* Get the USART IT index */
// 1101   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
        LD        A, YL
        SWAP      A
        AND       A, #0xf
        LD        S:?b5, A
// 1102   /* Set the IT mask*/
// 1103   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
        CLRW      X
        INCW      X
        LD        A, S:?b5
        CALL      L:?sll16_x_x_a
        LD        A, XL
        LD        S:?b6, A
// 1104 
// 1105   /* Check the status of the specified USART pending bit*/
// 1106   if (USART_IT == USART_IT_PE)
        CPW       Y, #0x100
        JRNE      L:??USART_GetITStatus_0
// 1107   {
// 1108     /* Get the USART_IT enable bit status*/
// 1109     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
        LDW       X, S:?w0
        ADDW      X, #0x4
        LD        A, (X)
        AND       A, S:?b6
        LD        S:?b3, A
// 1110     /* Check the status of the specified USART interrupt*/
// 1111 
// 1112     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
        LD        A, [S:?w0.w]
        AND       A, S:?b7
        CP        A, #0x0
        JREQ      L:??USART_GetITStatus_1
        TNZ       S:?b3
        JREQ      L:??USART_GetITStatus_1
// 1113     {
// 1114       /* Interrupt occurred*/
// 1115       pendingbitstatus = SET;
        LD        A, #0x1
        LD        S:?b2, A
        JRA       L:??USART_GetITStatus_2
// 1116     }
// 1117     else
// 1118     {
// 1119       /* Interrupt not occurred*/
// 1120       pendingbitstatus = RESET;
??USART_GetITStatus_1:
        CLR       S:?b2
        JRA       L:??USART_GetITStatus_2
// 1121     }
// 1122   }
// 1123 
// 1124   else if (USART_IT == USART_IT_OR)
??USART_GetITStatus_0:
        CPW       Y, #0x235
        JRNE      L:??USART_GetITStatus_3
// 1125   {
// 1126     /* Get the USART_IT enable bit status*/
// 1127     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
        LDW       X, S:?w0
        ADDW      X, #0x5
        LD        A, (X)
        AND       A, S:?b6
        LD        S:?b3, A
// 1128     /* Check the status of the specified USART interrupt*/
// 1129 
// 1130     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
        LDW       X, S:?w0
        ADDW      X, #0x8
        LD        A, (X)
        AND       A, #0x1
        LD        S:?b4, A
// 1131 
// 1132     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
        LD        A, [S:?w0.w]
        AND       A, S:?b7
        CP        A, #0x0
        JREQ      L:??USART_GetITStatus_4
        TNZ       S:?b3
        JRNE      L:??USART_GetITStatus_5
        TNZ       S:?b4
        JREQ      L:??USART_GetITStatus_4
// 1133     {
// 1134       /* Interrupt occurred*/
// 1135       pendingbitstatus = SET;
??USART_GetITStatus_5:
        LD        A, #0x1
        LD        S:?b2, A
        JRA       L:??USART_GetITStatus_2
// 1136     }
// 1137     else
// 1138     {
// 1139       /* Interrupt not occurred*/
// 1140       pendingbitstatus = RESET;
??USART_GetITStatus_4:
        CLR       S:?b2
        JRA       L:??USART_GetITStatus_2
// 1141     }
// 1142   }
// 1143 
// 1144   else
// 1145   {
// 1146     /* Get the USART_IT enable bit status*/
// 1147     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
??USART_GetITStatus_3:
        LDW       X, S:?w0
        ADDW      X, #0x5
        LD        A, (X)
        AND       A, S:?b6
        LD        S:?b3, A
// 1148     /* Check the status of the specified USART interrupt*/
// 1149     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
        LD        A, [S:?w0.w]
        AND       A, S:?b7
        CP        A, #0x0
        JREQ      L:??USART_GetITStatus_6
        TNZ       S:?b3
        JREQ      L:??USART_GetITStatus_6
// 1150     {
// 1151       /* Interrupt occurred*/
// 1152       pendingbitstatus = SET;
        LD        A, #0x1
        LD        S:?b2, A
        JRA       L:??USART_GetITStatus_2
// 1153     }
// 1154     else
// 1155     {
// 1156       /* Interrupt not occurred*/
// 1157       pendingbitstatus = RESET;
??USART_GetITStatus_6:
        CLR       S:?b2
// 1158     }
// 1159   }
// 1160 
// 1161   /* Return the USART_IT status*/
// 1162   return  pendingbitstatus;
??USART_GetITStatus_2:
        LD        A, S:?b2
        RET
// 1163 }
// 1164 
// 1165 /**
// 1166   * @brief  Clears the USARTx’s interrupt pending bits.
// 1167   * @param  USARTx: where x can be 1 to select the specified USART peripheral.
// 1168   * @param  USART_IT: specifies the interrupt pending bit to clear.
// 1169   *         This parameter can be one of the following values:
// 1170   *            @arg USART_IT_TC: Transmission complete interrupt.
// 1171   * @note   PE (Parity error), FE (Framing error), NE (Noise error),
// 1172   *         OR (OverRun error) and IDLE (Idle line detected) pending bits are
// 1173   *         cleared by software sequence: a read operation to USART_SR register
// 1174   *         (USART_GetITStatus()) followed by a read operation to USART_DR
// 1175   *         register (USART_ReceiveData8() or USART_ReceiveData9()).
// 1176   * @note   RXNE pending bit can be also cleared by a read to the USART_DR register
// 1177   *         (USART_ReceiveData8() or USART_ReceiveData9()).
// 1178   * @note   TC (Transmit complete) pending bit can be also cleared by software
// 1179   *         sequence: a read operation to USART_SR register (USART_GetITStatus())
// 1180   *         followed by a write operation to USART_DR register (USART_SendData8()
// 1181   *         or USART_SendData9()).
// 1182   * @note   TXE pending bit is cleared only by a write to the USART_DR register
// 1183   *         (USART_SendData8() or USART_SendData9()).
// 1184   * @retval None
// 1185   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
// 1186 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
// 1187 {
// 1188   assert_param(IS_USART_CLEAR_IT(USART_IT));
// 1189 
// 1190   /*< Clear RXNE or TC pending bit */
// 1191   USARTx->SR &= (uint8_t)(~USART_SR_TC);
USART_ClearITPendingBit:
        LD        A, (X)
        AND       A, #0xbf
        LD        (X), A
// 1192 }
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
// 1193 
// 1194 
// 1195 /**
// 1196   * @}
// 1197   */
// 1198 
// 1199 /**
// 1200   * @}
// 1201   */
// 1202 
// 1203 /**
// 1204   * @}
// 1205   */
// 1206 
// 1207 /**
// 1208   * @}
// 1209   */
// 1210 
// 1211 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
// 1 254 bytes in section .near_func.text
// 
// 1 254 bytes of CODE memory
//
//Errors: none
//Warnings: none
