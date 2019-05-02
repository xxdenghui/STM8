///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR C/C++ Compiler V1.40.1.50106 for STM8            03/Jan/2017  19:39:42 /
// Copyright 2010-2013 IAR Systems AB.                                        /
//                                                                            /
//    Source file  =  C:\Documents and Settings\Administrator\桌面\STM8\Softw /
//                    are\Libraries\STM8S_StdPeriph_Driver\src\stm8s_spi.c    /
//    Command line =  "C:\Documents and Settings\Administrator\桌面\STM8\Soft /
//                    ware\Libraries\STM8S_StdPeriph_Driver\src\stm8s_spi.c"  /
//                    -e -Oh --debug --code_model small --data_model medium   /
//                    -o "C:\Documents and Settings\Administrator\桌面\STM8\S /
//                    oftware\Project\Watering(CT1501-V1)\Debug\Obj\"         /
//                    --dlib_config "D:\Program Files\IAR Systems\Embedded    /
//                    Workbench 6.5\stm8\LIB\dlstm8smn.h" -D STM8S -D         /
//                    STM8S003 -lCN "C:\Documents and                         /
//                    Settings\Administrator\桌面\STM8\Software\Project\Water /
//                    ing(CT1501-V1)\Debug\List\" -lB "C:\Documents and       /
//                    Settings\Administrator\桌面\STM8\Software\Project\Water /
//                    ing(CT1501-V1)\Debug\List\" -I "C:\Documents and        /
//                    Settings\Administrator\桌面\STM8\Software\Project\Water /
//                    ing(CT1501-V1)\..\..\Libraries\STM8S_StdPeriph_Driver\i /
//                    nc\" -I "C:\Documents and Settings\Administrator\桌面\S /
//                    TM8\Software\Project\Watering(CT1501-V1)\..\..\Librarie /
//                    s\Device\" -I "C:\Documents and                         /
//                    Settings\Administrator\桌面\STM8\Software\Project\Water /
//                    ing(CT1501-V1)\..\..\Libraries\HAL\" -I "C:\Documents   /
//                    and Settings\Administrator\桌面\STM8\Software\Project\W /
//                    atering(CT1501-V1)\..\..\Libraries\Bus\" -I             /
//                    "C:\Documents and Settings\Administrator\桌面\STM8\Soft /
//                    ware\Project\Watering(CT1501-V1)\..\..\Libraries\CRC\"  /
//                    -I "C:\Documents and Settings\Administrator\桌面\STM8\S /
//                    oftware\Project\Watering(CT1501-V1)\User\" --vregs 16   /
//    List file    =  C:\Documents and Settings\Administrator\桌面\STM8\Softw /
//                    are\Project\Watering(CT1501-V1)\Debug\List\stm8s_spi.s  /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME stm8s_spi

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b10
        EXTERN ?b11
        EXTERN ?b12
        EXTERN ?b13
        EXTERN ?b14
        EXTERN ?b15
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?b6
        EXTERN ?b8
        EXTERN ?b9
        EXTERN ?epilogue_l2_l3
        EXTERN ?epilogue_w4
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?push_w4
        EXTERN ?sll16_x_x_a
        EXTERN ?w0
        EXTERN ?w1
        EXTERN assert_failed

        PUBLIC SPI_BiDirectionalLineConfig
        PUBLIC SPI_CalculateCRCCmd
        PUBLIC SPI_ClearFlag
        PUBLIC SPI_ClearITPendingBit
        PUBLIC SPI_Cmd
        PUBLIC SPI_DeInit
        PUBLIC SPI_GetCRC
        PUBLIC SPI_GetCRCPolynomial
        PUBLIC SPI_GetFlagStatus
        PUBLIC SPI_GetITStatus
        PUBLIC SPI_ITConfig
        PUBLIC SPI_Init
        PUBLIC SPI_NSSInternalSoftwareCmd
        PUBLIC SPI_ReceiveData
        PUBLIC SPI_ResetCRC
        PUBLIC SPI_SendData
        PUBLIC SPI_TransmitCRC

// C:\Documents and Settings\Administrator\桌面\STM8\Software\Libraries\STM8S_StdPeriph_Driver\src\stm8s_spi.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    stm8s_spi.c
//    4   * @author  MCD Application Team
//    5   * @version V2.2.0
//    6   * @date    30-September-2014
//    7   * @brief   This file contains all the functions for the SPI peripheral.
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
//   29 #include "stm8s_spi.h"
//   30 
//   31 /** @addtogroup STM8S_StdPeriph_Driver
//   32   * @{
//   33   */
//   34   
//   35 /* Private define ------------------------------------------------------------*/
//   36 /* Private macro -------------------------------------------------------------*/
//   37 /* Private variables ---------------------------------------------------------*/
//   38 /* Private function prototypes -----------------------------------------------*/
//   39 /* Private functions ---------------------------------------------------------*/
//   40 
//   41 /** @addtogroup SPI_Public_Functions
//   42   * @{
//   43   */
//   44 
//   45 /**
//   46   * @brief  Deinitializes the SPI peripheral registers to their default reset values.
//   47   * @param  None
//   48   * @retval None
//   49   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   50 void SPI_DeInit(void)
//   51 {
//   52   SPI->CR1    = SPI_CR1_RESET_VALUE;
SPI_DeInit:
        CLR       L:0x5200
//   53   SPI->CR2    = SPI_CR2_RESET_VALUE;
        CLR       L:0x5201
//   54   SPI->ICR    = SPI_ICR_RESET_VALUE;
        CLR       L:0x5202
//   55   SPI->SR     = SPI_SR_RESET_VALUE;
        MOV       L:0x5203, #0x2
//   56   SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
        MOV       L:0x5205, #0x7
//   57 }
        RET
//   58 
//   59 /**
//   60   * @brief  Initializes the SPI according to the specified parameters.
//   61   * @param  FirstBit : This parameter can be any of the 
//   62   *         @ref SPI_FirstBit_TypeDef enumeration.
//   63   * @param  BaudRatePrescaler : This parameter can be any of the 
//   64   *         @ref SPI_BaudRatePrescaler_TypeDef enumeration.
//   65   * @param  Mode : This parameter can be any of the  
//   66   *         @ref SPI_Mode_TypeDef enumeration.
//   67   * @param  ClockPolarity : This parameter can be any of the 
//   68   *         @ref SPI_ClockPolarity_TypeDef enumeration.
//   69   * @param  ClockPhase : This parameter can be any of the 
//   70   *         @ref SPI_ClockPhase_TypeDef enumeration.
//   71   * @param  Data_Direction : This parameter can be any of the 
//   72   *         @ref SPI_DataDirection_TypeDef enumeration.
//   73   * @param  Slave_Management : This parameter can be any of the 
//   74   *         @ref SPI_NSS_TypeDef enumeration.
//   75   * @param  CRCPolynomial : Configures the CRC polynomial.
//   76   * @retval None
//   77   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
?Subroutine0:
        LDW       S:?w1, X
        CLRW      X
        LDW       S:?w0, X
        LDW       X, #`?<Constant "C:\\\\Documents and Sett...">`
        JP        L:assert_failed

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   78 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
//   79 {
SPI_Init:
        CALL      L:?push_l2
        CALL      L:?push_l3
        LD        S:?b15, A
        MOV       S:?b8, S:?b0
        MOV       S:?b9, S:?b1
        MOV       S:?b14, S:?b2
        MOV       S:?b13, S:?b3
        MOV       S:?b10, S:?b4
        MOV       S:?b12, S:?b5
        MOV       S:?b11, S:?b6
//   80   /* Check structure elements */
//   81   assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
        JREQ      L:??CrossCallReturnLabel_7
        CP        A, #0x80
        JREQ      L:??CrossCallReturnLabel_7
        LDW       X, #0x51
        CALL      L:?Subroutine0
//   82   assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
??CrossCallReturnLabel_7:
        TNZ       S:?b8
        JREQ      L:??CrossCallReturnLabel_6
        LD        A, S:?b8
        CP        A, #0x8
        JREQ      L:??CrossCallReturnLabel_6
        CP        A, #0x10
        JREQ      L:??CrossCallReturnLabel_6
        CP        A, #0x18
        JREQ      L:??CrossCallReturnLabel_6
        CP        A, #0x20
        JREQ      L:??CrossCallReturnLabel_6
        CP        A, #0x28
        JREQ      L:??CrossCallReturnLabel_6
        CP        A, #0x30
        JREQ      L:??CrossCallReturnLabel_6
        CP        A, #0x38
        JREQ      L:??CrossCallReturnLabel_6
        LDW       X, #0x52
        CALL      L:?Subroutine0
//   83   assert_param(IS_SPI_MODE_OK(Mode));
??CrossCallReturnLabel_6:
        LD        A, S:?b9
        CP        A, #0x4
        JREQ      L:??CrossCallReturnLabel_5
        TNZ       S:?b9
        JREQ      L:??CrossCallReturnLabel_5
        LDW       X, #0x53
        CALL      L:?Subroutine0
//   84   assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
??CrossCallReturnLabel_5:
        TNZ       S:?b14
        JREQ      L:??CrossCallReturnLabel_4
        LD        A, S:?b14
        CP        A, #0x2
        JREQ      L:??CrossCallReturnLabel_4
        LDW       X, #0x54
        CALL      L:?Subroutine0
//   85   assert_param(IS_SPI_PHASE_OK(ClockPhase));
??CrossCallReturnLabel_4:
        TNZ       S:?b13
        JREQ      L:??CrossCallReturnLabel_3
        LD        A, S:?b13
        CP        A, #0x1
        JREQ      L:??CrossCallReturnLabel_3
        LDW       X, #0x55
        CALL      L:?Subroutine0
//   86   assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
??CrossCallReturnLabel_3:
        TNZ       S:?b10
        JREQ      L:??CrossCallReturnLabel_2
        LD        A, S:?b10
        CP        A, #0x4
        JREQ      L:??CrossCallReturnLabel_2
        CP        A, #0x80
        JREQ      L:??CrossCallReturnLabel_2
        CP        A, #0xc0
        JREQ      L:??CrossCallReturnLabel_2
        LDW       X, #0x56
        CALL      L:?Subroutine0
//   87   assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
??CrossCallReturnLabel_2:
        LD        A, S:?b12
        CP        A, #0x2
        JREQ      L:??CrossCallReturnLabel_1
        TNZ       S:?b12
        JREQ      L:??CrossCallReturnLabel_1
        LDW       X, #0x57
        CALL      L:?Subroutine0
//   88   assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
??CrossCallReturnLabel_1:
        TNZ       S:?b11
        JRNE      L:??CrossCallReturnLabel_0
        LDW       X, #0x58
        CALL      L:?Subroutine0
//   89   
//   90   /* Frame Format, BaudRate, Clock Polarity and Phase configuration */
//   91   SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
//   92                        (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
??CrossCallReturnLabel_0:
        LD        A, S:?b8
        OR        A, S:?b15
        OR        A, S:?b14
        OR        A, S:?b13
        LD        L:0x5200, A
//   93   
//   94   /* Data direction configuration: BDM, BDOE and RXONLY bits */
//   95   SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
        LD        A, S:?b12
        OR        A, S:?b10
        LD        L:0x5201, A
//   96   
//   97   if (Mode == SPI_MODE_MASTER)
        LD        A, S:?b9
        CP        A, #0x4
        JRNE      L:??SPI_Init_0
//   98   {
//   99     SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
        BSET      L:0x5201, #0x0
        JRA       L:??SPI_Init_1
//  100   }
//  101   else
//  102   {
//  103     SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
??SPI_Init_0:
        BRES      L:0x5201, #0x0
//  104   }
//  105   
//  106   /* Master/Slave mode configuration */
//  107   SPI->CR1 |= (uint8_t)(Mode);
??SPI_Init_1:
        OR        A, L:0x5200
        LD        L:0x5200, A
//  108   
//  109   /* CRC configuration */
//  110   SPI->CRCPR = (uint8_t)CRCPolynomial;
        LD        A, S:?b11
        LD        L:0x5205, A
//  111 }
        JP        L:?epilogue_l2_l3
//  112 
//  113 /**
//  114   * @brief  Enables or disables the SPI peripheral.
//  115   * @param  NewState New state of the SPI peripheral.
//  116   *         This parameter can be: ENABLE or DISABLE
//  117   * @retval None
//  118   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  119 void SPI_Cmd(FunctionalState NewState)
//  120 {
//  121   /* Check function parameters */
//  122   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
SPI_Cmd:
        TNZ       A
        JREQ      L:??SPI_Cmd_0
        CP        A, #0x1
        JREQ      L:??CrossCallReturnLabel_8
        LDW       X, #0x7a
        CALL      L:?Subroutine0
//  123   
//  124   if (NewState != DISABLE)
//  125   {
//  126     SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
??CrossCallReturnLabel_8:
        BSET      L:0x5200, #0x6
        RET
//  127   }
//  128   else
//  129   {
//  130     SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
??SPI_Cmd_0:
        BRES      L:0x5200, #0x6
//  131   }
//  132 }
        RET
//  133 
//  134 /**
//  135   * @brief  Enables or disables the specified interrupts.
//  136   * @param  SPI_IT Specifies the SPI interrupts sources to be enabled or disabled.
//  137   * @param  NewState: The new state of the specified SPI interrupts.
//  138   *         This parameter can be: ENABLE or DISABLE.
//  139   * @retval None
//  140   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  141 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
//  142 {
SPI_ITConfig:
        CALL      L:?push_w4
        LD        S:?b8, A
        MOV       S:?b9, S:?b0
//  143   uint8_t itpos = 0;
//  144   /* Check function parameters */
//  145   assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
        CP        A, #0x17
        JREQ      L:??CrossCallReturnLabel_10
        CP        A, #0x6
        JREQ      L:??CrossCallReturnLabel_10
        CP        A, #0x5
        JREQ      L:??CrossCallReturnLabel_10
        CP        A, #0x34
        JREQ      L:??CrossCallReturnLabel_10
        LDW       X, #0x91
        CALL      L:?Subroutine0
//  146   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
??CrossCallReturnLabel_10:
        TNZ       S:?b9
        JREQ      L:??CrossCallReturnLabel_9
        LD        A, S:?b9
        CP        A, #0x1
        JREQ      L:??CrossCallReturnLabel_9
        LDW       X, #0x92
        CALL      L:?Subroutine0
//  147   
//  148   /* Get the SPI IT index */
//  149   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
??CrossCallReturnLabel_9:
        LD        A, S:?b8
        CALL      L:??Subroutine2_0
//  150   
//  151   if (NewState != DISABLE)
??CrossCallReturnLabel_20:
        TNZ       S:?b9
        JREQ      L:??SPI_ITConfig_0
//  152   {
//  153     SPI->ICR |= itpos; /* Enable interrupt*/
        OR        A, L:0x5202
        JRA       L:??SPI_ITConfig_1
//  154   }
//  155   else
//  156   {
//  157     SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
??SPI_ITConfig_0:
        CPL       A
        AND       A, L:0x5202
??SPI_ITConfig_1:
        LD        L:0x5202, A
//  158   }
//  159 }
        JP        L:?epilogue_w4

        SECTION `.near_func.text`:CODE:NOROOT(0)
?Subroutine1:
        SWAP      A
        REQUIRE ??Subroutine2_0
        ;               // Fall through to label ??Subroutine2_0

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
??Subroutine2_0:
        AND       A, #0xf
        CLRW      X
        INCW      X
        CALL      L:?sll16_x_x_a
        LD        A, XL
        RET
//  160 
//  161 /**
//  162   * @brief  Transmits a Data through the SPI peripheral.
//  163   * @param  Data : Byte to be transmitted.
//  164   * @retval None
//  165   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  166 void SPI_SendData(uint8_t Data)
//  167 {
//  168   SPI->DR = Data; /* Write in the DR register the data to be sent*/
SPI_SendData:
        LD        L:0x5204, A
//  169 }
        RET
//  170 
//  171 /**
//  172   * @brief  Returns the most recent received data by the SPI peripheral.
//  173   * @param  None
//  174   * @retval The value of the received data.
//  175   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  176 uint8_t SPI_ReceiveData(void)
//  177 {
//  178   return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
SPI_ReceiveData:
        LD        A, L:0x5204
        RET
//  179 }
//  180 
//  181 /**
//  182   * @brief  Configures internally by software the NSS pin.
//  183   * @param  NewState Indicates the new state of the SPI Software slave management.
//  184   *         This parameter can be: ENABLE or DISABLE.
//  185   * @retval None
//  186   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  187 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
//  188 {
//  189   /* Check function parameters */
//  190   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
SPI_NSSInternalSoftwareCmd:
        TNZ       A
        JREQ      L:??SPI_NSSInternalSoftwareCmd_0
        CP        A, #0x1
        JREQ      L:??CrossCallReturnLabel_11
        LDW       X, #0xbe
        CALL      L:?Subroutine0
//  191   
//  192   if (NewState != DISABLE)
//  193   {
//  194     SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
??CrossCallReturnLabel_11:
        BSET      L:0x5201, #0x0
        RET
//  195   }
//  196   else
//  197   {
//  198     SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
??SPI_NSSInternalSoftwareCmd_0:
        BRES      L:0x5201, #0x0
//  199   }
//  200 }
        RET
//  201 
//  202 /**
//  203   * @brief  Enables the transmit of the CRC value.
//  204   * @param  None
//  205   * @retval None
//  206   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  207 void SPI_TransmitCRC(void)
//  208 {
//  209   SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
SPI_TransmitCRC:
        BSET      L:0x5201, #0x4
//  210 }
        RET
//  211 
//  212 /**
//  213   * @brief  Enables or disables the CRC value calculation of the transferred bytes.
//  214   * @param  NewState Indicates the new state of the SPI CRC value calculation.
//  215   *         This parameter can be: ENABLE or DISABLE.
//  216   * @retval None
//  217   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  218 void SPI_CalculateCRCCmd(FunctionalState NewState)
//  219 {
//  220   /* Check function parameters */
//  221   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
SPI_CalculateCRCCmd:
        TNZ       A
        JREQ      L:??SPI_CalculateCRCCmd_0
        CP        A, #0x1
        JREQ      L:??CrossCallReturnLabel_12
        LDW       X, #0xdd
        CALL      L:?Subroutine0
//  222   
//  223   if (NewState != DISABLE)
//  224   {
//  225     SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
??CrossCallReturnLabel_12:
        BSET      L:0x5201, #0x5
        RET
//  226   }
//  227   else
//  228   {
//  229     SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
??SPI_CalculateCRCCmd_0:
        BRES      L:0x5201, #0x5
//  230   }
//  231 }
        RET
//  232 
//  233 /**
//  234   * @brief  Returns the transmit or the receive CRC register value.
//  235   * @param  SPI_CRC Specifies the CRC register to be read.
//  236   * @retval The selected CRC register value.
//  237   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  238 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
//  239 {
//  240   uint8_t crcreg = 0;
//  241   
//  242   /* Check function parameters */
//  243   assert_param(IS_SPI_CRC_OK(SPI_CRC));
SPI_GetCRC:
        CP        A, #0x1
        JREQ      L:??CrossCallReturnLabel_13
        TNZ       A
        JREQ      L:??SPI_GetCRC_0
        LDW       X, #0xf3
        CALL      L:?Subroutine0
//  244   
//  245   if (SPI_CRC != SPI_CRC_RX)
//  246   {
//  247     crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
??CrossCallReturnLabel_13:
        LD        A, L:0x5207
        RET
//  248   }
//  249   else
//  250   {
//  251     crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
??SPI_GetCRC_0:
        LD        A, L:0x5206
//  252   }
//  253   
//  254   /* Return the selected CRC register status*/
//  255   return crcreg;
        RET
//  256 }
//  257 
//  258 /**
//  259   * @brief  Reset the Rx CRCR and Tx CRCR registers.
//  260   * @param  None
//  261   * @retval None
//  262   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  263 void SPI_ResetCRC(void)
//  264 {
//  265   /* Rx CRCR & Tx CRCR registers are reset when CRCEN (hardware calculation)
//  266   bit in SPI_CR2 is written to 1 (enable) */
//  267   SPI_CalculateCRCCmd(ENABLE);
SPI_ResetCRC:
        BSET      L:0x5201, #0x5
//  268   
//  269   /* Previous function disable the SPI */
//  270   SPI_Cmd(ENABLE);
        BSET      L:0x5200, #0x6
//  271 }
        RET
//  272 
//  273 /**
//  274   * @brief  Returns the CRC Polynomial register value.
//  275   * @param  None
//  276   * @retval The CRC Polynomial register value.
//  277   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  278 uint8_t SPI_GetCRCPolynomial(void)
//  279 {
//  280   return SPI->CRCPR; /* Return the CRC polynomial register */
SPI_GetCRCPolynomial:
        LD        A, L:0x5205
        RET
//  281 }
//  282 
//  283 /**
//  284   * @brief  Selects the data transfer direction in bi-directional mode.
//  285   * @param  SPI_Direction Specifies the data transfer direction in bi-directional mode.
//  286   * @retval None
//  287   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  288 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
//  289 {
//  290   /* Check function parameters */
//  291   assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
SPI_BiDirectionalLineConfig:
        TNZ       A
        JREQ      L:??SPI_BiDirectionalLineConfig_0
        CP        A, #0x1
        JREQ      L:??CrossCallReturnLabel_14
        LDW       X, #0x123
        CALL      L:?Subroutine0
//  292   
//  293   if (SPI_Direction != SPI_DIRECTION_RX)
//  294   {
//  295     SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
??CrossCallReturnLabel_14:
        BSET      L:0x5201, #0x6
        RET
//  296   }
//  297   else
//  298   {
//  299     SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
??SPI_BiDirectionalLineConfig_0:
        BRES      L:0x5201, #0x6
//  300   }
//  301 }
        RET
//  302 
//  303 /**
//  304   * @brief  Checks whether the specified SPI flag is set or not.
//  305   * @param  SPI_FLAG : Specifies the flag to check.
//  306   *         This parameter can be any of the @ref SPI_FLAG_TypeDef enumeration.
//  307   * @retval FlagStatus : Indicates the state of SPI_FLAG.
//  308   *         This parameter can be any of the @ref FlagStatus enumeration.
//  309   */
//  310 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  311 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
//  312 {
SPI_GetFlagStatus:
        CALL      L:?push_w4
        LD        S:?b9, A
//  313   FlagStatus status = RESET;
        CLR       S:?b8
//  314   /* Check parameters */
//  315   assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
        CP        A, #0x40
        JREQ      L:??CrossCallReturnLabel_15
        CP        A, #0x20
        JREQ      L:??CrossCallReturnLabel_15
        CP        A, #0x10
        JREQ      L:??CrossCallReturnLabel_15
        CP        A, #0x8
        JREQ      L:??CrossCallReturnLabel_15
        CP        A, #0x2
        JREQ      L:??CrossCallReturnLabel_15
        CP        A, #0x1
        JREQ      L:??CrossCallReturnLabel_15
        CP        A, #0x80
        JREQ      L:??CrossCallReturnLabel_15
        LDW       X, #0x13b
        CALL      L:?Subroutine0
//  316   
//  317   /* Check the status of the specified SPI flag */
//  318   if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
??CrossCallReturnLabel_15:
        LD        A, S:?b9
        BCP       A, L:0x5203
        JREQ      L:??SPI_GetFlagStatus_0
//  319   {
//  320     status = SET; /* SPI_FLAG is set */
        MOV       S:?b8, #0x1
//  321   }
//  322   else
//  323   {
//  324     status = RESET; /* SPI_FLAG is reset*/
//  325   }
//  326   
//  327   /* Return the SPI_FLAG status */
//  328   return status;
??SPI_GetFlagStatus_0:
        LD        A, S:?b8
        JP        L:?epilogue_w4
//  329 }
//  330 
//  331 /**
//  332   * @brief  Clears the SPI flags.
//  333   * @param  SPI_FLAG : Specifies the flag to clear.
//  334   *         This parameter can be one of the following values:
//  335   *         - SPI_FLAG_CRCERR
//  336   *         - SPI_FLAG_WKUP
//  337   * @note   - OVR (OverRun Error) interrupt pending bit is cleared by software
//  338   *         sequence:
//  339   *         a read operation to SPI_DR register (SPI_ReceiveData()) followed by
//  340   *         a read operation to SPI_SR register (SPI_GetFlagStatus()).
//  341   *         - MODF (Mode Fault) interrupt pending bit is cleared by software sequence:
//  342   *         a read/write operation to SPI_SR register (SPI_GetFlagStatus()) followed by
//  343   *         a write operation to SPI_CR1 register (SPI_Cmd() to enable the SPI).
//  344   * @retval None
//  345   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  346 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
//  347 {
SPI_ClearFlag:
        PUSH      S:?b8
        LD        S:?b8, A
//  348   assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
        CP        A, #0x10
        JREQ      L:??CrossCallReturnLabel_16
        CP        A, #0x8
        JREQ      L:??CrossCallReturnLabel_16
        LDW       X, #0x15c
        CALL      L:?Subroutine0
//  349   /* Clear the flag bit */
//  350   SPI->SR = (uint8_t)(~SPI_FLAG);
??CrossCallReturnLabel_16:
        CPL       S:?b8
        LD        A, S:?b8
        LD        L:0x5203, A
//  351 }
        POP       S:?b8
        RET
//  352 
//  353 /**
//  354   * @brief  Checks whether the specified interrupt has occurred or not.
//  355   * @param  SPI_IT: Specifies the SPI interrupt pending bit to check.
//  356   *         This parameter can be one of the following values:
//  357   *         - SPI_IT_CRCERR
//  358   *         - SPI_IT_WKUP
//  359   *         - SPI_IT_OVR
//  360   *         - SPI_IT_MODF
//  361   *         - SPI_IT_RXNE
//  362   *         - SPI_IT_TXE
//  363   * @retval ITStatus : Indicates the state of the SPI_IT.
//  364   *         This parameter can be any of the @ref ITStatus enumeration.
//  365   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  366 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
//  367 {
SPI_GetITStatus:
        CALL      L:?push_w4
        LD        S:?b9, A
//  368   ITStatus pendingbitstatus = RESET;
        CLR       S:?b8
//  369   uint8_t itpos = 0;
//  370   uint8_t itmask1 = 0;
//  371   uint8_t itmask2 = 0;
//  372   uint8_t enablestatus = 0;
//  373   assert_param(IS_SPI_GET_IT_OK(SPI_IT));
        CP        A, #0x65
        JREQ      L:??CrossCallReturnLabel_17
        CP        A, #0x55
        JREQ      L:??CrossCallReturnLabel_17
        CP        A, #0x45
        JREQ      L:??CrossCallReturnLabel_17
        CP        A, #0x34
        JREQ      L:??CrossCallReturnLabel_17
        CP        A, #0x17
        JREQ      L:??CrossCallReturnLabel_17
        CP        A, #0x6
        JREQ      L:??CrossCallReturnLabel_17
        LDW       X, #0x175
        CALL      L:?Subroutine0
//  374   /* Get the SPI IT index */
//  375   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
//  376   
//  377   /* Get the SPI IT mask */
//  378   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
//  379   /* Set the IT mask */
//  380   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
//  381   /* Get the SPI_ITPENDINGBIT enable bit status */
//  382   enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
??CrossCallReturnLabel_17:
        LD        A, S:?b9
        CALL      L:?Subroutine1
??CrossCallReturnLabel_22:
        AND       A, L:0x5203
        LD        S:?b0, A
//  383   /* Check the status of the specified SPI interrupt */
//  384   if (((SPI->ICR & itpos) != RESET) && enablestatus)
        LD        A, S:?b9
        CALL      L:??Subroutine2_0
??CrossCallReturnLabel_19:
        BCP       A, L:0x5202
        JREQ      L:??SPI_GetITStatus_0
        TNZ       S:?b0
        JREQ      L:??SPI_GetITStatus_0
//  385   {
//  386     /* SPI_ITPENDINGBIT is set */
//  387     pendingbitstatus = SET;
        MOV       S:?b8, #0x1
//  388   }
//  389   else
//  390   {
//  391     /* SPI_ITPENDINGBIT is reset */
//  392     pendingbitstatus = RESET;
//  393   }
//  394   /* Return the SPI_ITPENDINGBIT status */
//  395   return  pendingbitstatus;
??SPI_GetITStatus_0:
        LD        A, S:?b8
        JP        L:?epilogue_w4
//  396 }
//  397 
//  398 /**
//  399   * @brief  Clears the interrupt pending bits.
//  400   * @param  SPI_IT: Specifies the interrupt pending bit to clear.
//  401   *         This parameter can be one of the following values:
//  402   *         - SPI_IT_CRCERR
//  403   *         - SPI_IT_WKUP
//  404   * @note   - OVR (OverRun Error) interrupt pending bit is cleared by software sequence:
//  405   *         a read operation to SPI_DR register (SPI_ReceiveData()) followed by
//  406   *         a read operation to SPI_SR register (SPI_GetITStatus()).
//  407   *         - MODF (Mode Fault) interrupt pending bit is cleared by software sequence:
//  408   *         a read/write operation to SPI_SR register (SPI_GetITStatus()) followed by
//  409   *         a write operation to SPI_CR1 register (SPI_Cmd() to enable the SPI).
//  410   * @retval None
//  411   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  412 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
//  413 {
SPI_ClearITPendingBit:
        PUSH      S:?b8
        LD        S:?b8, A
//  414   uint8_t itpos = 0;
//  415   assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
        CP        A, #0x45
        JREQ      L:??CrossCallReturnLabel_18
        CP        A, #0x34
        JREQ      L:??CrossCallReturnLabel_18
        LDW       X, #0x19f
        CALL      L:?Subroutine0
//  416   
//  417   /* Clear  SPI_IT_CRCERR or SPI_IT_WKUP interrupt pending bits */
//  418   
//  419   /* Get the SPI pending bit index */
//  420   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
//  421   /* Clear the pending bit */
//  422   SPI->SR = (uint8_t)(~itpos);
??CrossCallReturnLabel_18:
        LD        A, S:?b8
        CALL      L:?Subroutine1
??CrossCallReturnLabel_21:
        CPL       A
        LD        L:0x5203, A
//  423   
//  424 }
        POP       S:?b8
        RET

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
`?<Constant "C:\\\\Documents and Sett...">`:
        DC8 43H, 3AH, 5CH, 44H, 6FH, 63H, 75H, 6DH
        DC8 65H, 6EH, 74H, 73H, 20H, 61H, 6EH, 64H
        DC8 20H, 53H, 65H, 74H, 74H, 69H, 6EH, 67H
        DC8 73H, 5CH, 41H, 64H, 6DH, 69H, 6EH, 69H
        DC8 73H, 74H, 72H, 61H, 74H, 6FH, 72H, 5CH
        DC8 0D7H, 0C0H, 0C3H, 0E6H, 5CH, 53H, 54H, 4DH
        DC8 38H, 5CH, 53H, 6FH, 66H, 74H, 77H, 61H
        DC8 72H, 65H, 5CH, 4CH, 69H, 62H, 72H, 61H
        DC8 72H, 69H, 65H, 73H, 5CH, 53H, 54H, 4DH
        DC8 38H, 53H, 5FH, 53H, 74H, 64H, 50H, 65H
        DC8 72H, 69H, 70H, 68H, 5FH, 44H, 72H, 69H
        DC8 76H, 65H, 72H, 5CH, 73H, 72H, 63H, 5CH
        DC8 73H, 74H, 6DH, 38H, 73H, 5FH, 73H, 70H
        DC8 69H, 2EH, 63H, 0

        END
//  425 
//  426 /**
//  427   * @}
//  428   */
//  429   
//  430 /**
//  431   * @}
//  432   */
//  433   
//  434 
//  435 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
// 
// 108 bytes in section .near.rodata
// 667 bytes in section .near_func.text
// 
// 667 bytes of CODE  memory
// 108 bytes of CONST memory
//
//Errors: none
//Warnings: none
