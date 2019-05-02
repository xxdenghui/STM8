/**
  ******************************************************************************
  * @file    tft_uart.c
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-09-17
  * @brief   
  ******************************************************************************
  * @attention
  * 
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "tft_uart.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/
#define ASIC_NUM0 0x30

#define PAGE_MAK  4
#define ID_MAK		6
#define CMD_MAK   7 
#define TXT1_MAK  8
#define TXT2_MAK  9

#define PAGES     0
#define IDS       1
/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
// pending value
extern uint8_t Pending;
extern uint8_t Pending_CMD[2];
extern uint8_t Mode_CMD[3][5];
extern uint8_t Power_STA;
uint8_t Mode_STA[4];
uint8_t Stage[4];
uint8_t Groups;


// command
uint8_t CMDbuff_START[2] = { 0xEE, 0xB1 };
uint8_t CMDbuff_END[4] = { 0xFF, 0xFC, 0xFF, 0xFF };
uint8_t CMDbuff_PAGE[2] = { 0x00, 0x00 };
uint8_t CMDbuff_ID[2] = { 0x00, 0x00 };
uint8_t CMDbuff_TXT[2] = { 0x00, 0x00 };

// mode status
uint8_t Mode[4][4] = { 1 };
    
// Uart data values
uint8_t StartCode = 0;
uint8_t EndCode = 0;
uint8_t GetBuff[20] = { 0 };
uint8_t GetBuff_CNT;

// 时间设定数值
uint8_t TimeSet[3][4][5] = { 0 };
uint8_t TimeCount[3][4][5] = { 0 };
/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/ 

/**
  * @brief  命令类型分为： 10-按键类型 11-数值类型。
  *           10-产生待处理状态字和处理类型状态字
  *           11-保存数据到缓存
  * @param  none
  * @retval none
  */
void Processing_DAT( void )
{
  switch ( GetBuff[CMD_MAK] ){ 
    case 0x10:
      Get_Command( );         // 解析数据包中命令ID号
			break;        
    case 0x11:				
      Get_Value( );  
      break;
    default: break;
  }
}

/**
  * @brief  根据命令待处理字 Pending_CMD 处理收到的命令
  * @param  none
  * @retval none
  */
void Processing_CMD( void )
{
  switch ( Pending_CMD[PAGES] ){
    case 1: 
      switch ( Pending_CMD[IDS] ){
        case 0: Mode_CMD[0][0] ^= 0x01; break;  //  Start Button
        case 1: Mode_CMD[0][1] ^= 0x01; Groups=0; break;  //  ID1 Mode
        case 2: Mode_CMD[0][2] ^= 0x01; Groups=1; break;  //  ID2 Mode
        case 3: Mode_CMD[0][3] ^= 0x01; Groups=2; break;  //  ID3 Mode
        case 4: Mode_CMD[0][4] ^= 0x01; Groups=3; break;  //  ID4 Mode
      }
      break;
    case 2:
      switch ( Pending_CMD[IDS] ){
        case 0: Mode_CMD[1][0] ^= 0x01; break;  //  Start Button
        case 1: Mode_CMD[1][1] ^= 0x01; Groups=0; break;  //  ID1 Mode
        case 2: Mode_CMD[1][2] ^= 0x01; Groups=1; break;  //  ID2 Mode
        case 3: Mode_CMD[1][3] ^= 0x01; Groups=2; break;  //  ID3 Mode
        case 4: Mode_CMD[1][4] ^= 0x01; Groups=3; break;  //  ID4 Mode
      }
      break;
    case 3:
      switch ( Pending_CMD[IDS] ){
        case 0: Mode_CMD[2][0] ^= 0x01; break;  //  Start Button
        case 1: Mode_CMD[2][1] ^= 0x01; Groups=0; break;  //  ID1 Mode
        case 2: Mode_CMD[2][2] ^= 0x01; Groups=1; break;  //  ID2 Mode
        case 3: Mode_CMD[2][3] ^= 0x01; Groups=2; break;  //  ID3 Mode
        case 4: Mode_CMD[2][4] ^= 0x01; Groups=3; break;  //  ID4 Mode
      }
      break;  
  }
}

/**
  * @brief  解析数据包中的命令
  * @param  none
  * @retval none
  */
void Get_Command( void )
{
  switch ( GetBuff[PAGE_MAK] ){
    case 1:       // Page1
      Pending_CMD[PAGES] = 1;
      switch ( GetBuff[ID_MAK] ){ 	// 获得ID号的数值
        case  2: Pending_CMD[IDS] = 1; Pending |= COMMAND_PEN; break; // 265V channel
        case  4: Pending_CMD[IDS] = 2; Pending |= COMMAND_PEN; break; // 220V channel
        case  6: Pending_CMD[IDS] = 3; Pending |= COMMAND_PEN; break; // 165V channel
        case  8: Pending_CMD[IDS] = 4; Pending |= COMMAND_PEN; break; // 100V channel
        case 10: Pending_CMD[IDS] = 0; Pending |= COMMAND_PEN; break; // Start Button
      }
      break;
    case 2:       // Page2
      Pending_CMD[PAGES] = 2;
      switch ( GetBuff[ID_MAK] ){ 	// 获得ID号的数值
        case  2: Pending_CMD[IDS] = 1; Pending |= COMMAND_PEN; break; // 265V channel
        case  4: Pending_CMD[IDS] = 2; Pending |= COMMAND_PEN; break; // 220V channel
        case  6: Pending_CMD[IDS] = 3; Pending |= COMMAND_PEN; break; // 165V channel
        case  8: Pending_CMD[IDS] = 4; Pending |= COMMAND_PEN; break; // 100V channel
        case 10: Pending_CMD[IDS] = 0; Pending |= COMMAND_PEN; break; // Start Button
      }
      break;
    case 3:       // Page1
      Pending_CMD[PAGES] = 3;
      switch ( GetBuff[ID_MAK] ){ 	// 获得ID号的数值
        case  2: Pending_CMD[IDS] = 1; Pending |= COMMAND_PEN; break; // 265V channel
        case  4: Pending_CMD[IDS] = 2; Pending |= COMMAND_PEN; break; // 220V channel
        case  6: Pending_CMD[IDS] = 3; Pending |= COMMAND_PEN; break; // 165V channel
        case  8: Pending_CMD[IDS] = 4; Pending |= COMMAND_PEN; break; // 100V channel
        case 10: Pending_CMD[IDS] = 0; Pending |= COMMAND_PEN; break; // Start Button
      }
      break;
  }
}

/**
  * @brief  获得Page和ID对应的数值
  * @param  none
  * @retval none
  */
void Get_Value( void )
{
  switch ( GetBuff[PAGE_MAK] ){
    case 1:				// Page1
      switch ( GetBuff[ID_MAK] ){ 	// 获得ID号的数值
        // page1 - ID 14~18
        case 14: TimeSet[0][0][0] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;	
        case 15: TimeSet[0][0][1] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 16: TimeSet[0][0][2] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 17: TimeSet[0][0][3] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 18: TimeSet[0][0][4] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        // page1 - ID 19~23
        case 19: TimeSet[0][1][0] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;	
        case 20: TimeSet[0][1][1] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 21: TimeSet[0][1][2] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 22: TimeSet[0][1][3] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 23: TimeSet[0][1][4] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        // page1 - ID 24~28
        case 24: TimeSet[0][2][0] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;	
        case 25: TimeSet[0][2][1] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 26: TimeSet[0][2][2] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 27: TimeSet[0][2][3] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 28: TimeSet[0][2][4] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        // page1 - ID 29~33
        case 29: TimeSet[0][3][0] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;	
        case 30: TimeSet[0][3][1] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 31: TimeSet[0][3][2] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 32: TimeSet[0][3][3] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 33: TimeSet[0][3][4] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
      }
      break;
    case 2:				// Page2
      switch ( GetBuff[ID_MAK] ){ 	// 获得ID号的数值
        // page2 - ID 14~18
        case 14: TimeSet[1][0][0] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;	
        case 15: TimeSet[1][0][1] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 16: TimeSet[1][0][2] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 17: TimeSet[1][0][3] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 18: TimeSet[1][0][4] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        // page2 - ID 19~23
        case 19: TimeSet[1][1][0] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;	
        case 20: TimeSet[1][1][1] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 21: TimeSet[1][1][2] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 22: TimeSet[1][1][3] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 23: TimeSet[1][1][4] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        // page1 - ID 24~28
        case 24: TimeSet[1][2][0] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;	
        case 25: TimeSet[1][2][1] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 26: TimeSet[1][2][2] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 27: TimeSet[1][2][3] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 28: TimeSet[1][2][4] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        // page2 - ID 29~33
        case 29: TimeSet[1][3][0] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;	
        case 30: TimeSet[1][3][1] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 31: TimeSet[1][3][2] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 32: TimeSet[1][3][3] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 33: TimeSet[1][3][4] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
      }
      break;
    case 3:				// Page3
      switch ( GetBuff[ID_MAK] ){ 	// 获得ID号的数值
        // page3 - ID 14~18
        case 14: TimeSet[2][0][0] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;	
        case 15: TimeSet[2][0][1] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 16: TimeSet[2][0][2] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 17: TimeSet[2][0][3] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 18: TimeSet[2][0][4] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        // page3 - ID 19~23
        case 19: TimeSet[2][1][0] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;	
        case 20: TimeSet[2][1][1] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 21: TimeSet[2][1][2] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 22: TimeSet[2][1][3] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 23: TimeSet[2][1][4] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        // page3 - ID 24~28
        case 24: TimeSet[2][2][0] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;	
        case 25: TimeSet[2][2][1] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 26: TimeSet[2][2][2] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 27: TimeSet[2][2][3] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 28: TimeSet[2][2][4] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        // page3 - ID 29~33
        case 29: TimeSet[2][3][0] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;	
        case 30: TimeSet[2][3][1] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 31: TimeSet[2][3][2] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 32: TimeSet[2][3][3] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
        case 33: TimeSet[2][3][4] = (GetBuff[TXT1_MAK]-ASIC_NUM0)*10+(GetBuff[TXT2_MAK]-ASIC_NUM0); break;
      }
      break;     
	}
}

/**
  * @brief  接收到命令中断处理函数
  * @param  none
  * @retval none
  */
void UART2_RX_Handler( void )
{
  uint8_t GetByte;
	GetByte = UART2_ReceiveData8(  );;
	switch ( GetByte ){
		case 0xEE:
			GetBuff_CNT = 1; break;
		case 0xFF:
			switch ( EndCode ){
				case 0: EndCode++; GetBuff_CNT++; break;
				case 2:	EndCode++; GetBuff_CNT++; break;
				case 3: EndCode = 0; GetBuff_CNT++; Pending |= GETDATA_PEN;; break;
				default: GetBuff_CNT++; break;
			}	
			break;
		case 0xFC:
			if ( EndCode == 1 ){
				EndCode = 2;
				GetBuff_CNT++;
			} else GetBuff_CNT++;
			break;
		default: GetBuff_CNT++;	break;
	}
	GetBuff[GetBuff_CNT-1] = GetByte;
}

/**
  * @brief  数值减一秒处理函数
  * @param  none
  * @retval none
  */
void Second_DEC( void )
{
  for ( uint8_t i=0; i<3; i++ ){
      if ( (Stage[Groups]==0) && TimeCount[i][Groups][0] && (Mode_STA[Groups]==2) && (Power_STA&0x01) ){  // 265V 脉冲关倒计时数据更新
        TimeCount[i][Groups][0]--;
        if ( TimeCount[i][Groups][0] == 0 ){
          switch ( Groups ){
            case 0:
              GPIO_WriteLow(GPIOB,GPIO_PIN_5);
              TimeCount[i][Groups][1] = TimeSet[i][Groups][1];
              Stage[Groups] = 1;
              break;
            case 1:
              GPIO_WriteLow(GPIOB,GPIO_PIN_4);
              TimeCount[i][Groups][1] = TimeSet[i][Groups][1];
              Stage[Groups] = 1;
              break;
            case 2:
              GPIO_WriteLow(GPIOB,GPIO_PIN_3);
              TimeCount[i][Groups][1] = TimeSet[i][Groups][1];
              Stage[Groups] = 1;
              break;
            case 3:
              GPIO_WriteLow(GPIOB,GPIO_PIN_2);
              TimeCount[i][Groups][1] = TimeSet[i][Groups][1];
              Stage[Groups] = 1;
              break;  
          }
        }
      }
      if ( (Stage[Groups]==1) && TimeCount[i][Groups][1] && (Mode_STA[Groups]==2) && (Power_STA&0x01) ){
        TimeCount[i][Groups][1]--;
        if ( TimeCount[i][Groups][1] == 0 ){
          switch ( Groups ){
            case 0:
              GPIO_WriteHigh(GPIOB,GPIO_PIN_5);
              TimeCount[i][Groups][0] = TimeSet[i][Groups][0];
              Stage[Groups] = 0;
              break;
            case 1:
              GPIO_WriteHigh(GPIOB,GPIO_PIN_4);
              TimeCount[i][Groups][0] = TimeSet[i][Groups][0];
              Stage[Groups] = 0;
              break;
            case 2:
              GPIO_WriteHigh(GPIOB,GPIO_PIN_3);
              TimeCount[i][Groups][0] = TimeSet[i][Groups][0];
              Stage[Groups] = 0;
              break;
            case 3:
              GPIO_WriteHigh(GPIOB,GPIO_PIN_2);
              TimeCount[i][Groups][0] = TimeSet[i][Groups][0];
              Stage[Groups] = 0;
              break;
          }
        }
      }
      if ( TimeCount[i][Groups][2] && Mode_STA[Groups] && (Power_STA&0x01) ){
        TimeCount[i][Groups][2]--;
        if ( TimeCount[i][Groups][2]==0 ){
          if ( TimeCount[i][Groups][3]==0 ){
            if ( TimeCount[i][Groups][4]==0 ) {  // 计时到0
              switch ( Groups ){
                case 0:
                  GPIO_WriteHigh(GPIOB,GPIO_PIN_5); 
                  switch ( Mode_STA[Groups] ){
                    case 1:   // 发送两次按钮按下数据包
                      for ( uint8_t k=0; k<2; k++ ){
                        CMDbuff_PAGE[1] = i+1;
                        CMDbuff_ID[1] = Groups*2+1;
                        UART2_SendBuff( CMDbuff_START, sizeof(CMDbuff_START) );
                        UART2_SendByte( 0x25 );
                        UART2_SendBuff( CMDbuff_PAGE,  sizeof(CMDbuff_PAGE) );
                        UART2_SendBuff( CMDbuff_ID,    sizeof(CMDbuff_ID) );
                        UART2_SendBuff( CMDbuff_END,   sizeof(CMDbuff_END) );
                        delayms(10);
                      }
                      break;
                    case 2:   // 发送按钮按下数据包
                      CMDbuff_PAGE[1] = i+1;
                      CMDbuff_ID[1] = Groups*2+1;
                      UART2_SendBuff( CMDbuff_START, sizeof(CMDbuff_START) );
                      UART2_SendByte( 0x25 );
                      UART2_SendBuff( CMDbuff_PAGE,  sizeof(CMDbuff_PAGE) );
                      UART2_SendBuff( CMDbuff_ID,    sizeof(CMDbuff_ID) );
                      UART2_SendBuff( CMDbuff_END,   sizeof(CMDbuff_END) );
                      break;
                    default:
                      break;
                  }
                  Mode_STA[Groups] = 0;
                  if ( Mode_STA[Groups+1] ) Groups++;
                  //Mode_STA[Groups] = 1;
                  delayms(5000);
                  GPIO_WriteLow(GPIOB,GPIO_PIN_4);
                  break;
                case 1:
                  GPIO_WriteHigh(GPIOB,GPIO_PIN_4); 
                  switch ( Mode_STA[Groups] ){
                    case 1:   // 发送两次按钮按下数据包
                      for ( uint8_t k=0; k<2; k++ ){
                        CMDbuff_PAGE[1] = i+1;
                        CMDbuff_ID[1] = Groups*2+1;
                        UART2_SendBuff( CMDbuff_START, sizeof(CMDbuff_START) );
                        UART2_SendByte( 0x25 );
                        UART2_SendBuff( CMDbuff_PAGE,  sizeof(CMDbuff_PAGE) );
                        UART2_SendBuff( CMDbuff_ID,    sizeof(CMDbuff_ID) );
                        UART2_SendBuff( CMDbuff_END,   sizeof(CMDbuff_END) );
                        delayms(10);
                      }
                      break;
                    case 2:   // 发送按钮按下数据包
                      CMDbuff_PAGE[1] = i+1;
                      CMDbuff_ID[1] = Groups*2+1;
                      UART2_SendBuff( CMDbuff_START, sizeof(CMDbuff_START) );
                      UART2_SendByte( 0x25 );
                      UART2_SendBuff( CMDbuff_PAGE,  sizeof(CMDbuff_PAGE) );
                      UART2_SendBuff( CMDbuff_ID,    sizeof(CMDbuff_ID) );
                      UART2_SendBuff( CMDbuff_END,   sizeof(CMDbuff_END) );
                      break;
                    default:
                      break;
                  }
                  Mode_STA[Groups] = 0;
                  Groups++;
                  //Mode_STA[Groups] = 1;
                  delayms(5000);
                  GPIO_WriteLow(GPIOB,GPIO_PIN_3);
                  break;
                case 2:
                  GPIO_WriteHigh(GPIOB,GPIO_PIN_3); 
                  switch ( Mode_STA[Groups] ){
                    case 1:   // 发送两次按钮按下数据包
                      for ( uint8_t k=0; k<2; k++ ){
                        CMDbuff_PAGE[1] = i+1;
                        CMDbuff_ID[1] = Groups*2+1;
                        UART2_SendBuff( CMDbuff_START, sizeof(CMDbuff_START) );
                        UART2_SendByte( 0x25 );
                        UART2_SendBuff( CMDbuff_PAGE,  sizeof(CMDbuff_PAGE) );
                        UART2_SendBuff( CMDbuff_ID,    sizeof(CMDbuff_ID) );
                        UART2_SendBuff( CMDbuff_END,   sizeof(CMDbuff_END) );
                        delayms(10);
                      }
                      break;
                    case 2:   // 发送按钮按下数据包
                      CMDbuff_PAGE[1] = i+1;
                      CMDbuff_ID[1] = Groups*2+1;
                      UART2_SendBuff( CMDbuff_START, sizeof(CMDbuff_START) );
                      UART2_SendByte( 0x25 );
                      UART2_SendBuff( CMDbuff_PAGE,  sizeof(CMDbuff_PAGE) );
                      UART2_SendBuff( CMDbuff_ID,    sizeof(CMDbuff_ID) );
                      UART2_SendBuff( CMDbuff_END,   sizeof(CMDbuff_END) );
                      break;
                    default:
                      break;
                  }
                  Mode_STA[Groups] = 0;
                  Groups++;
                  //Mode_STA[Groups] = 1;
                  delayms(5000);
                  GPIO_WriteLow(GPIOB,GPIO_PIN_2);
                  break;
                case 3:
                  GPIO_WriteHigh(GPIOB,GPIO_PIN_2); 
                  switch ( Mode_STA[Groups] ){
                    case 1:   // 发送两次按钮按下数据包
                      for ( uint8_t k=0; k<2; k++ ){
                        CMDbuff_PAGE[1] = i+1;
                        CMDbuff_ID[1] = Groups*2+1;
                        UART2_SendBuff( CMDbuff_START, sizeof(CMDbuff_START) );
                        UART2_SendByte( 0x25 );
                        UART2_SendBuff( CMDbuff_PAGE,  sizeof(CMDbuff_PAGE) );
                        UART2_SendBuff( CMDbuff_ID,    sizeof(CMDbuff_ID) );
                        UART2_SendBuff( CMDbuff_END,   sizeof(CMDbuff_END) );
                        delayms(10);
                      }
                      break;
                    case 2:   // 发送按钮按下数据包
                      CMDbuff_PAGE[1] = i+1;
                      CMDbuff_ID[1] = Groups*2+1;
                      UART2_SendBuff( CMDbuff_START, sizeof(CMDbuff_START) );
                      UART2_SendByte( 0x25 );
                      UART2_SendBuff( CMDbuff_PAGE,  sizeof(CMDbuff_PAGE) );
                      UART2_SendBuff( CMDbuff_ID,    sizeof(CMDbuff_ID) );
                      UART2_SendBuff( CMDbuff_END,   sizeof(CMDbuff_END) );
                      break;
                    default:
                      break;
                  }
                  Mode_STA[Groups] = 0;
                  Groups=0;
                  GPIO_WriteHigh(GPIOC,GPIO_PIN_2);
                  GPIO_WriteHigh(GPIOC,GPIO_PIN_3);
                  GPIO_WriteHigh(GPIOC,GPIO_PIN_4);
                  GPIO_WriteHigh(GPIOC,GPIO_PIN_5);
                  GPIO_WriteHigh(GPIOC,GPIO_PIN_6);
                  GPIO_WriteHigh(GPIOC,GPIO_PIN_7);
                  Power_STA&=~0x01; //OFF
                  CMDbuff_PAGE[1] = i+1;
                  CMDbuff_ID[1] = 11;
                  UART2_SendBuff( CMDbuff_START, sizeof(CMDbuff_START) );
                  UART2_SendByte( 0x25 );
                  UART2_SendBuff( CMDbuff_PAGE,  sizeof(CMDbuff_PAGE) );
                  UART2_SendBuff( CMDbuff_ID,    sizeof(CMDbuff_ID) );
                  UART2_SendBuff( CMDbuff_END,   sizeof(CMDbuff_END) );
                  break;  
              }
              /*GPIO_WriteHigh(GPIOB,GPIO_PIN_5); 
              switch ( Mode_STA[j] ){
                case 1:   // 发送两次按钮按下数据包
                  for ( uint8_t k=0; k<2; k++ ){
                    CMDbuff_PAGE[1] = i+1;
                    CMDbuff_ID[1] = j*2+1;
                    UART2_SendBuff( CMDbuff_START, sizeof(CMDbuff_START) );
                    UART2_SendByte( 0x25 );
                    UART2_SendBuff( CMDbuff_PAGE,  sizeof(CMDbuff_PAGE) );
                    UART2_SendBuff( CMDbuff_ID,    sizeof(CMDbuff_ID) );
                    UART2_SendBuff( CMDbuff_END,   sizeof(CMDbuff_END) );
                  }
                  break;
                case 2:   // 发送按钮按下数据包
                  CMDbuff_PAGE[1] = i+1;
                  CMDbuff_ID[1] = j*2+1;
                  UART2_SendBuff( CMDbuff_START, sizeof(CMDbuff_START) );
                  UART2_SendByte( 0x25 );
                  UART2_SendBuff( CMDbuff_PAGE,  sizeof(CMDbuff_PAGE) );
                  UART2_SendBuff( CMDbuff_ID,    sizeof(CMDbuff_ID) );
                  UART2_SendBuff( CMDbuff_END,   sizeof(CMDbuff_END) );
                  break;
                default:
                  break;
              }
              Mode_STA[j] = 0; */
              
              ////
            } 
            else { TimeCount[i][Groups][4]--; TimeCount[i][Groups][3] = 59; TimeCount[i][Groups][2] = 59; }
          } else {
            TimeCount[i][Groups][3]--;
            TimeCount[i][Groups][2] = 59;
          }
        } 
      }
  }
  /*if ( (Stage[0]==0) && TimeCount[0][0][0] && (Mode_STA[0]==2) && (Power_STA&0x01) ){  // 265V 脉冲关倒计时数据更新
    TimeCount[0][0][0]--;
    if ( TimeCount[0][0][0] == 0 ){
      GPIO_WriteLow(GPIOB,GPIO_PIN_5);
      TimeCount[0][0][1] = TimeSet[0][0][1];
      Stage[0] = 1;
    }
  }
  if ( (Stage[0]==1) && TimeCount[0][0][1] && (Mode_STA[0]==2) && (Power_STA&0x01) ){
    TimeCount[0][0][1]--;
    if ( TimeCount[0][0][1] == 0 ){
      GPIO_WriteHigh(GPIOB,GPIO_PIN_5);
      TimeCount[0][0][0] = TimeSet[0][0][0];
      Stage[0] = 0;
    }
  }
  if ( TimeCount[0][0][2] && Mode_STA[0] && (Power_STA&0x01) ){
    TimeCount[0][0][2]--;
    if ( TimeCount[0][0][2]==0 ){
      if ( TimeCount[0][0][3]==0 ){
        if ( TimeCount[0][0][4]==0 ) {GPIO_WriteHigh(GPIOB,GPIO_PIN_5); (Power_STA&=~0x01);} // 计时到0
        else { TimeCount[0][0][4]--; TimeCount[0][0][3] = 59; TimeCount[0][0][2] = 59; }
      } else {
        TimeCount[0][0][3]--;
        TimeCount[0][0][2] = 59;
      }
    } 
  }*/
}

/**
  * @brief  模式更新处理
  * @param  none
  * @retval none
  */
void Mode_CHG( void )
{
  uint8_t i,j;
  for ( i=0; i<3; i++ ){
    for ( j=0; j<5; j++ ){
      if ( j == 0 ){  //  start button
        switch ( i ){
          case 0: 
            if (Mode_CMD[i][j]){
              GPIO_WriteReverse(GPIOC,GPIO_PIN_2);
              GPIO_WriteReverse(GPIOC,GPIO_PIN_3);
              GPIO_WriteReverse(GPIOC,GPIO_PIN_4);
              GPIO_WriteReverse(GPIOC,GPIO_PIN_5);
              GPIO_WriteReverse(GPIOC,GPIO_PIN_6);
              GPIO_WriteReverse(GPIOC,GPIO_PIN_7);
              Power_STA ^= 0x01;
              Mode_CMD[i][j]=0;
              Groups=0; 
              for ( uint8_t k=0; k<5; k++ )
                for ( uint8_t l=0; l<4; l++ )
                  TimeCount[0][l][k]=TimeSet[0][l][k];
            } break;
          case 1: 
            if (Mode_CMD[i][j]){
              GPIO_WriteReverse(GPIOC,GPIO_PIN_2);
              GPIO_WriteReverse(GPIOC,GPIO_PIN_3);
              GPIO_WriteReverse(GPIOC,GPIO_PIN_4);
              GPIO_WriteReverse(GPIOC,GPIO_PIN_5);
              GPIO_WriteReverse(GPIOC,GPIO_PIN_6);
              GPIO_WriteReverse(GPIOC,GPIO_PIN_7);
              Power_STA ^= 0x02;
              Mode_CMD[i][j]=0;
              for ( uint8_t k=0; k<5; k++ )
                for ( uint8_t l=0; l<4; l++ )
                  TimeCount[0][l][k]=TimeSet[0][l][k];
            } break;
          case 2: 
            if (Mode_CMD[i][j]){
              GPIO_WriteReverse(GPIOC,GPIO_PIN_2);
              GPIO_WriteReverse(GPIOC,GPIO_PIN_3);
              GPIO_WriteReverse(GPIOC,GPIO_PIN_4);
              GPIO_WriteReverse(GPIOC,GPIO_PIN_5);
              GPIO_WriteReverse(GPIOC,GPIO_PIN_6);
              GPIO_WriteReverse(GPIOC,GPIO_PIN_7);
              Power_STA ^= 0x04;
              Mode_CMD[i][j]=0;
              for ( uint8_t k=0; k<5; k++ )
                for ( uint8_t l=0; l<4; l++ )
                  TimeCount[0][l][k]=TimeSet[0][l][k];
            } break;
        }
      } else {
        switch ( Groups+1 ){
          case 1: 
            if (Mode_CMD[i][Groups+1]){
              //Mode_STA[1]=Mode_STA[2]=Mode_STA[3]=0;
              Mode_STA[0]++;
              if ( Mode_STA[0]>2 ) Mode_STA[0] = 0;
              if ( Mode_STA[0] == 0 ) GPIO_WriteHigh(GPIOB,GPIO_PIN_5); // OFF Group1
              else GPIO_WriteLow(GPIOB,GPIO_PIN_5); // ON Group1
              Mode_CMD[i][Groups+1]=0;
            } 
            break;
          case 2: 
            if (Mode_CMD[i][Groups+1]){
              //Mode_STA[0]=Mode_STA[2]=Mode_STA[3]=0;
              Mode_STA[1]++;
              if ( Mode_STA[1]>2 ) Mode_STA[1] = 0;
              //if ( Mode_STA[1] == 0 ) GPIO_WriteHigh(GPIOB,GPIO_PIN_4); // OFF Group1
              //else GPIO_WriteLow(GPIOB,GPIO_PIN_4); // ON Group1
              Mode_CMD[i][Groups+1]=0;
            } 
            break;
          case 3:
          if (Mode_CMD[i][Groups+1]){
            //Mode_STA[0]=Mode_STA[1]=Mode_STA[3]=0;
              Mode_STA[2]++;
              if ( Mode_STA[2]>2 ) Mode_STA[2] = 0;
              //if ( Mode_STA[2] == 0 ) GPIO_WriteHigh(GPIOB,GPIO_PIN_3); // OFF Group1
              //else GPIO_WriteLow(GPIOB,GPIO_PIN_3); // ON Group1
              Mode_CMD[i][Groups+1]=0;
            } 
            break;
          case 4:
            if (Mode_CMD[i][Groups+1]){
              //Mode_STA[0]=Mode_STA[1]=Mode_STA[2]=0;
              Mode_STA[3]++;
              if ( Mode_STA[3]>2 ) Mode_STA[3] = 0;
              //if ( Mode_STA[3] == 0 ) GPIO_WriteHigh(GPIOB,GPIO_PIN_2); // OFF Group1
              //else GPIO_WriteLow(GPIOB,GPIO_PIN_2); // ON Group1
              Mode_CMD[i][Groups+1]=0;
            } 
            break;
        }
      }
    }
  }
}

/**
  * @brief  发送数据包
  * @param  none
  * @retval none
  */
void Send_DAT( void )
{
  
}

/**
  * @brief  更新显示文本
  * @param  none
  * @retval none
  */
void Refresh_TXT( void )
{
  for ( uint8_t i=1; i<4; i++ ){
    for ( uint8_t j=14; j<34; j++ ){
      if ( (Power_STA&0x01) && (i==1) ){
        CMDbuff_TXT[0] = TimeCount[0][(j-14)/5][(j-14)%5]/10+ASIC_NUM0;
        CMDbuff_TXT[1] = TimeCount[0][(j-14)/5][(j-14)%5]%10+ASIC_NUM0;
        CMDbuff_PAGE[1] = i;
        CMDbuff_ID[1] = j;
        UART2_SendBuff( CMDbuff_START, sizeof(CMDbuff_START) );
        UART2_SendByte( 0x10 );
        UART2_SendBuff( CMDbuff_PAGE,  sizeof(CMDbuff_PAGE) );
        UART2_SendBuff( CMDbuff_ID,    sizeof(CMDbuff_ID) );
        UART2_SendBuff( CMDbuff_TXT,   sizeof(CMDbuff_TXT) );
        UART2_SendBuff( CMDbuff_END,   sizeof(CMDbuff_END) );
      } 
      if ( (Power_STA&0x02) && (i==2) ){
        CMDbuff_TXT[0] = TimeCount[1][(j-14)/5][(j-14)%5]/10+ASIC_NUM0;
        CMDbuff_TXT[1] = TimeCount[1][(j-14)/5][(j-14)%5]%10+ASIC_NUM0;
        CMDbuff_PAGE[1] = i;
        CMDbuff_ID[1] = j;
        UART2_SendBuff( CMDbuff_START, sizeof(CMDbuff_START) );
        UART2_SendByte( 0x10 );
        UART2_SendBuff( CMDbuff_PAGE,  sizeof(CMDbuff_PAGE) );
        UART2_SendBuff( CMDbuff_ID,    sizeof(CMDbuff_ID) );
        UART2_SendBuff( CMDbuff_TXT,   sizeof(CMDbuff_TXT) );
        UART2_SendBuff( CMDbuff_END,   sizeof(CMDbuff_END) );
      }  
      if ( (Power_STA&0x04) && (i==3) ){
        CMDbuff_TXT[0] = TimeCount[2][(j-14)/5][(j-14)%5]/10+ASIC_NUM0;
        CMDbuff_TXT[1] = TimeCount[2][(j-14)/5][(j-14)%5]%10+ASIC_NUM0;
        CMDbuff_PAGE[1] = i;
        CMDbuff_ID[1] = j;
        UART2_SendBuff( CMDbuff_START, sizeof(CMDbuff_START) );
        UART2_SendByte( 0x10 );
        UART2_SendBuff( CMDbuff_PAGE,  sizeof(CMDbuff_PAGE) );
        UART2_SendBuff( CMDbuff_ID,    sizeof(CMDbuff_ID) );
        UART2_SendBuff( CMDbuff_TXT,   sizeof(CMDbuff_TXT) );
        UART2_SendBuff( CMDbuff_END,   sizeof(CMDbuff_END) );
      }  
    }
  }
}

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/