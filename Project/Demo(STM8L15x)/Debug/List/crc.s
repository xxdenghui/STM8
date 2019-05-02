///////////////////////////////////////////////////////////////////////////////
//
// IAR C/C++ Compiler V3.10.1.201 for STM8                22/Mar/2019  11:20:54
// Copyright 2010-2017 IAR Systems AB.
// Standalone license - IAR Embedded Workbench for STMicroelectronics STM8
//
//    Source file  =  G:\Darren\MCU\STM8\Software\Libraries\CRC\crc.c
//    Command line =  
//        -f C:\Users\new06\AppData\Local\Temp\EWAFD5.tmp
//        (G:\Darren\MCU\STM8\Software\Libraries\CRC\crc.c -e -On --no_cse
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
//        G:\Darren\MCU\STM8\Software\Project\Demo(STM8L15x)\Debug\List\crc.s
//
///////////////////////////////////////////////////////////////////////////////

        EXTERN ?b0
        EXTERN ?b1
        EXTERN ?b14
        EXTERN ?b15
        EXTERN ?b2
        EXTERN ?b3
        EXTERN ?b4
        EXTERN ?b5
        EXTERN ?epilogue_l2_l3
        EXTERN ?mov_w1_w0
        EXTERN ?mov_w5_w0
        EXTERN ?push_l2
        EXTERN ?push_l3
        EXTERN ?sdiv16_x_x_y
        EXTERN ?w1
        EXTERN ?w2
        EXTERN ?w3
        EXTERN ?w4
        EXTERN ?w5
        EXTERN ?w6
        EXTERN toupper

        PUBLIC ArrayCompare
        PUBLIC BCD2String
        PUBLIC ByteToHexStr
        PUBLIC CRC8_Table
        PUBLIC CalCRC_Bytes
        PUBLIC CalCRC_OneByte
        PUBLIC CheckSum
        PUBLIC Dec2String
        PUBLIC Hex2String
        PUBLIC HexStrToByte
        PUBLIC crc8_array
        PUBLIC max

// G:\Darren\MCU\STM8\Software\Libraries\CRC\crc.c
//    1 /**
//    2   ******************************************************************************
//    3   * @file    crc.c
//    4   * @author  Darren Tang
//    5   * @version V1.0.0
//    6   * @date    2015-01-26
//    7   * @brief   This is a CRC Check seous file.
//    8   ******************************************************************************
//    9   * @attention
//   10   *
//   11   * 
//   12   ******************************************************************************
//   13   */
//   14 
//   15 /* Includes ------------------------------------------------------------------*/
//   16 #include "crc.h"
//   17 
//   18 /* Private typedef -----------------------------------------------------------*/
//   19 
//   20 /* Private define ------------------------------------------------------------*/
//   21 
//   22 /* Private macro -------------------------------------------------------------*/
//   23 
//   24 /* Private variables ---------------------------------------------------------*/
//   25 /* CRC8 Check array */

        SECTION `.near.rodata`:CONST:REORDER:NOROOT(0)
//   26 const unsigned char crc8_array[256] = {
crc8_array:
        DC8 0, 94, 188, 226, 97, 63, 221, 131, 194, 156, 126, 32, 163, 253, 31
        DC8 65, 157, 195, 33, 127, 252, 162, 64, 30, 95, 1, 227, 189, 62, 96
        DC8 130, 220, 35, 125, 159, 193, 66, 28, 254, 160, 225, 191, 93, 3, 128
        DC8 222, 60, 98, 190, 224, 2, 92, 223, 129, 99, 61, 124, 34, 192, 158
        DC8 29, 67, 161, 255, 70, 24, 250, 164, 39, 121, 155, 197, 132, 218, 56
        DC8 102, 229, 187, 89, 7, 219, 133, 103, 57, 186, 228, 6, 88, 25, 71
        DC8 165, 251, 120, 38, 196, 154, 101, 59, 217, 135, 4, 90, 184, 230
        DC8 167, 249, 27, 69, 198, 152, 122, 36, 248, 166, 68, 26, 153, 199, 37
        DC8 123, 58, 100, 134, 216, 91, 5, 231, 185, 140, 210, 48, 110, 237
        DC8 179, 81, 15, 78, 16, 242, 172, 47, 113, 147, 205, 17, 79, 173, 243
        DC8 112, 46, 204, 146, 211, 141, 111, 49, 178, 236, 14, 80, 175, 241
        DC8 19, 77, 206, 144, 114, 44, 109, 51, 209, 143, 12, 82, 176, 238, 50
        DC8 108, 142, 208, 83, 13, 239, 177, 240, 174, 76, 18, 145, 207, 45
        DC8 115, 202, 148, 118, 40, 171, 245, 23, 73, 8, 86, 180, 234, 105, 55
        DC8 213, 139, 87, 9, 235, 181, 54, 104, 138, 212, 149, 203, 41, 119
        DC8 244, 170, 72, 22, 233, 183, 85, 11, 136, 214, 52, 106, 43, 117, 151
        DC8 201, 74, 20, 246, 168, 116, 42, 200, 150, 21, 75, 169, 247, 182
        DC8 232, 10, 84, 215, 137, 107, 53
//   27 0x00, 0x5e, 0xbc, 0xe2, 0x61, 0x3f, 0xdd, 0x83,
//   28 0xc2, 0x9c, 0x7e, 0x20, 0xa3, 0xfd, 0x1f, 0x41,
//   29 0x9d, 0xc3, 0x21, 0x7f, 0xfc, 0xa2, 0x40, 0x1e,
//   30 0x5f, 0x01, 0xe3, 0xbd, 0x3e, 0x60, 0x82, 0xdc,
//   31 0x23, 0x7d, 0x9f, 0xc1, 0x42, 0x1c, 0xfe, 0xa0,
//   32 0xe1, 0xbf, 0x5d, 0x03, 0x80, 0xde, 0x3c, 0x62,
//   33 0xbe, 0xe0, 0x02, 0x5c, 0xdf, 0x81, 0x63, 0x3d,
//   34 0x7c, 0x22, 0xc0, 0x9e, 0x1d, 0x43, 0xa1, 0xff,
//   35 0x46, 0x18, 0xfa, 0xa4, 0x27, 0x79, 0x9b, 0xc5,
//   36 0x84, 0xda, 0x38, 0x66, 0xe5, 0xbb, 0x59, 0x07,
//   37 0xdb, 0x85, 0x67, 0x39, 0xba, 0xe4, 0x06, 0x58,
//   38 0x19, 0x47, 0xa5, 0xfb, 0x78, 0x26, 0xc4, 0x9a,
//   39 0x65, 0x3b, 0xd9, 0x87, 0x04, 0x5a, 0xb8, 0xe6,
//   40 0xa7, 0xf9, 0x1b, 0x45, 0xc6, 0x98, 0x7a, 0x24,
//   41 0xf8, 0xa6, 0x44, 0x1a, 0x99, 0xc7, 0x25, 0x7b,
//   42 0x3a, 0x64, 0x86, 0xd8, 0x5b, 0x05, 0xe7, 0xb9,
//   43 0x8c, 0xd2, 0x30, 0x6e, 0xed, 0xb3, 0x51, 0x0f,
//   44 0x4e, 0x10, 0xf2, 0xac, 0x2f, 0x71, 0x93, 0xcd,
//   45 0x11, 0x4f, 0xad, 0xf3, 0x70, 0x2e, 0xcc, 0x92,
//   46 0xd3, 0x8d, 0x6f, 0x31, 0xb2, 0xec, 0x0e, 0x50,
//   47 0xaf, 0xf1, 0x13, 0x4d, 0xce, 0x90, 0x72, 0x2c,
//   48 0x6d, 0x33, 0xd1, 0x8f, 0x0c, 0x52, 0xb0, 0xee,
//   49 0x32, 0x6c, 0x8e, 0xd0, 0x53, 0x0d, 0xef, 0xb1,
//   50 0xf0, 0xae, 0x4c, 0x12, 0x91, 0xcf, 0x2d, 0x73,
//   51 0xca, 0x94, 0x76, 0x28, 0xab, 0xf5, 0x17, 0x49,
//   52 0x08, 0x56, 0xb4, 0xea, 0x69, 0x37, 0xd5, 0x8b,
//   53 0x57, 0x09, 0xeb, 0xb5, 0x36, 0x68, 0x8a, 0xd4,
//   54 0x95, 0xcb, 0x29, 0x77, 0xf4, 0xaa, 0x48, 0x16,
//   55 0xe9, 0xb7, 0x55, 0x0b, 0x88, 0xd6, 0x34, 0x6a,
//   56 0x2b, 0x75, 0x97, 0xc9, 0x4a, 0x14, 0xf6, 0xa8,
//   57 0x74, 0x2a, 0xc8, 0x96, 0x15, 0x4b, 0xa9, 0xf7,
//   58 0xb6, 0xe8, 0x0a, 0x54, 0xd7, 0x89, 0x6b, 0x35,
//   59 };
//   60 
//   61 /* Private function prototypes -----------------------------------------------*/
//   62 
//   63 /* Private functions ---------------------------------------------------------*/
//   64 /**
//   65   * @brief  CRC8 one byte Calan Cheack
//   66   * values.
//   67   * @param  
//   68   *    byte- The check byte
//   69   * @retval 
//   70   *    CRC8-
//   71   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//   72 unsigned char CalCRC_OneByte( unsigned char byte )  // 0x18=> 00011000 X8 + X5 + X4 + 1 
//   73 {
CalCRC_OneByte:
        LD        S:?b1, A
//   74  unsigned char i,CRC_OneByte;
//   75  CRC_OneByte = 0;
        CLR       S:?b2
//   76  for ( i=0; i<8 ;i++ )
        CLR       S:?b0
??CalCRC_OneByte_0:
        LD        A, S:?b0
        CP        A, #0x8
        JRNC      L:??CalCRC_OneByte_1
//   77  {
//   78    if ( ( CRC_OneByte ^ byte ) & 0x01 )
        LD        A, S:?b1
        XOR       A, S:?b2
        AND       A, #0x1
        CP        A, #0x0
        JREQ      L:??CalCRC_OneByte_2
//   79    {
//   80     CRC_OneByte ^= 0x18;
        LD        A, S:?b2
        XOR       A, #0x18
        LD        S:?b2, A
//   81     CRC_OneByte >>= 1;
        LD        A, S:?b2
        SRL       A
        LD        S:?b2, A
//   82     CRC_OneByte |= 0x80;
        LD        A, S:?b2
        OR        A, #0x80
        LD        S:?b2, A
        JRA       L:??CalCRC_OneByte_3
//   83    }      
//   84    else 
//   85      CRC_OneByte >>= 1;
??CalCRC_OneByte_2:
        LD        A, S:?b2
        SRL       A
        LD        S:?b2, A
//   86      byte >>= 1;
??CalCRC_OneByte_3:
        LD        A, S:?b1
        SRL       A
        LD        S:?b1, A
//   87  }
        INC       S:?b0
        JRA       L:??CalCRC_OneByte_0
//   88  return CRC_OneByte;
??CalCRC_OneByte_1:
        LD        A, S:?b2
        RET
//   89 }
//   90 
//   91 /* Public functions ----------------------------------------------------------*/
//   92 
//   93 /**
//   94   * @brief  CRC Table Check
//   95   * values.
//   96   * @param  
//   97   *    p- The data add
//   98   *    Lenth- Bytes to be check
//   99   * @retval 
//  100   *    CRC8-
//  101   */ 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  102 unsigned char CRC8_Table(unsigned char *p, unsigned char Lenth)
//  103 {
CRC8_Table:
        LDW       Y, X
        LD        S:?b1, A
//  104     unsigned char crc8 = 0;
        CLR       S:?b2
//  105     unsigned char counter;
//  106     for( counter = Lenth; counter > 0; counter-- )
        MOV       S:?b0, S:?b1
??CRC8_Table_0:
        TNZ       S:?b0
        JREQ      L:??CRC8_Table_1
//  107     {
//  108         crc8 = crc8_array[crc8^*p]; //Check for CRC
        LD        A, (Y)
        XOR       A, S:?b2
        CLRW      X
        LD        XL, A
        LD        A, (L:crc8_array,X)
        LD        S:?b2, A
//  109         p++;
        INCW      Y
//  110     }
        DEC       S:?b0
        JRA       L:??CRC8_Table_0
//  111     return crc8;
??CRC8_Table_1:
        LD        A, S:?b2
        RET
//  112 }
//  113 
//  114 /**
//  115   * @brief  CRC8 Calan Cheack
//  116   * values.
//  117   * @param  
//  118   *    p- The check bytes add
//  119   *    Lenth- Bytes to be check
//  120   * @retval 
//  121   *    CRC8-
//  122   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  123 unsigned char CalCRC_Bytes( unsigned char *p, unsigned char Lenth )
//  124 {
CalCRC_Bytes:
        LD        S:?b3, A
//  125  unsigned char CRC = 0;
        CLR       S:?b4
//  126  while ( Lenth-- )
??CalCRC_Bytes_0:
        LD        A, S:?b3
        LD        S:?b3, A
        DEC       S:?b3
        TNZ       A
        JREQ      L:??CalCRC_Bytes_1
//  127  { 
//  128     CRC = CalCRC_OneByte( CRC ^ *p++ ); 
        LD        A, (X)
        XOR       A, S:?b4
        CALL      L:CalCRC_OneByte
        LD        S:?b4, A
        INCW      X
        JRA       L:??CalCRC_Bytes_0
//  129  }
//  130  return CRC;
??CalCRC_Bytes_1:
        LD        A, S:?b4
        RET
//  131 }
//  132 
//  133 /**
//  134   * @brief  get max val in counts of numbers
//  135   * values.
//  136   * @param  
//  137   *    num  - numbers
//  138   * @retval 
//  139   *    the maxval
//  140   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  141 unsigned char max( unsigned char* num, unsigned char counts )
//  142 {
max:
        LD        S:?b4, A
//  143   unsigned char maxval = 0;
        CLR       S:?b1
//  144   for ( unsigned char i=0; i<counts; i++ ){
        CLR       S:?b0
??max_0:
        LD        A, S:?b0
        CP        A, S:?b4
        JRNC      L:??max_1
//  145     if (maxval < num[i])
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        LDW       S:?w1, X
        ADDW      Y, S:?w1
        LD        A, S:?b1
        CP        A, (Y)
        JRNC      L:??max_2
//  146       maxval = num[i];
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        LDW       S:?w1, X
        ADDW      Y, S:?w1
        LD        A, (Y)
        LD        S:?b1, A
//  147   }
??max_2:
        INC       S:?b0
        JRA       L:??max_0
//  148   return maxval;
??max_1:
        LD        A, S:?b1
        RET
//  149 }
//  150 
//  151 
//  152 /**
//  153   * @brief  numbers to string
//  154   * values.
//  155   * @param  
//  156   *    num  - numbers
//  157   *    *str - string
//  158   * @retval 
//  159   *    none
//  160   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  161 void Dec2String( unsigned char num, char *str )
//  162 {
Dec2String:
        LD        S:?b0, A
        LDW       Y, X
//  163   *str = num/100 + ASCII_NUM_0;
        LD        A, #0x64
        CLRW      X
        RRWA      X, A
        LD        A, S:?b0
        RLWA      X, A
        DIV       X, A
        LD        A, XL
        ADD       A, #0x30
        LD        (Y), A
//  164   if ( *str != ASCII_NUM_0 )
        LD        A, (Y)
        CP        A, #0x30
        JREQ      L:??Dec2String_0
//  165     str++;
        INCW      Y
//  166   *str = num/10%10 + ASCII_NUM_0;
??Dec2String_0:
        LD        A, #0xa
        CLRW      X
        RRWA      X, A
        LD        A, S:?b0
        RLWA      X, A
        DIV       X, A
        EXG       A, XL
        LD        S:?b1, A
        EXG       A, XL
        LD        A, #0xa
        CLRW      X
        RRWA      X, A
        LD        A, S:?b1
        RLWA      X, A
        DIV       X, A
        ADD       A, #0x30
        LD        (Y), A
//  167   str++;
        INCW      Y
//  168   *str = num%10 + ASCII_NUM_0;
        LD        A, #0xa
        CLRW      X
        RRWA      X, A
        LD        A, S:?b0
        RLWA      X, A
        DIV       X, A
        ADD       A, #0x30
        LD        (Y), A
//  169   str++;
        INCW      Y
//  170   *str = '\0';
        CLR       (Y)
//  171 }
        RET
//  172 
//  173 
//  174 /**
//  175   * @brief  BCD to string
//  176   * values.
//  177   * @param  
//  178   *    num  - BCD numbers
//  179   *    *str - string
//  180   * @retval 
//  181   *    none
//  182   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  183 void BCD2String( unsigned char num, char *str )
//  184 {
BCD2String:
        LD        S:?b0, A
        LDW       Y, X
//  185   *str = num/16 + ASCII_NUM_0;
        LD        A, #0x10
        CLRW      X
        RRWA      X, A
        LD        A, S:?b0
        RLWA      X, A
        DIV       X, A
        LD        A, XL
        ADD       A, #0x30
        LD        (Y), A
//  186   str++;
        INCW      Y
//  187   *str = num%16 + ASCII_NUM_0;
        LD        A, #0x10
        CLRW      X
        RRWA      X, A
        LD        A, S:?b0
        RLWA      X, A
        DIV       X, A
        ADD       A, #0x30
        LD        (Y), A
//  188   str++;
        INCW      Y
//  189   *str = ' ';
        LD        A, #0x20
        LD        (Y), A
//  190   str++;
        INCW      Y
//  191   *str = '\0';
        CLR       (Y)
//  192 }
        RET
//  193 
//  194 /**
//  195   * @brief  Hex to string
//  196   * values.
//  197   * @param  
//  198   *    hex  - HEX numbers
//  199   *    *str - string
//  200   * @retval 
//  201   *    none
//  202   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  203 void Hex2String( unsigned char hex, char *str )
//  204 {
Hex2String:
        LD        S:?b0, A
        LDW       Y, X
//  205   if ( hex/16 <= 9 )
        LD        A, #0x10
        CLRW      X
        RRWA      X, A
        LD        A, S:?b0
        RLWA      X, A
        DIV       X, A
        LD        A, XL
        CP        A, #0xa
        JRNC      L:??Hex2String_0
//  206     *str = hex/16 + ASCII_NUM_0;
        LD        A, #0x10
        CLRW      X
        RRWA      X, A
        LD        A, S:?b0
        RLWA      X, A
        DIV       X, A
        LD        A, XL
        ADD       A, #0x30
        LD        (Y), A
        JRA       L:??Hex2String_1
//  207   else *str = hex/16 + ASCII_NUM_0 + 7;
??Hex2String_0:
        LD        A, #0x10
        CLRW      X
        RRWA      X, A
        LD        A, S:?b0
        RLWA      X, A
        DIV       X, A
        LD        A, XL
        ADD       A, #0x37
        LD        (Y), A
//  208   str++; 
??Hex2String_1:
        INCW      Y
//  209   if ( hex%16 <= 9 )
        LD        A, #0x10
        CLRW      X
        RRWA      X, A
        LD        A, S:?b0
        RLWA      X, A
        DIV       X, A
        CP        A, #0xa
        JRNC      L:??Hex2String_2
//  210     *str = hex%16 + ASCII_NUM_0;
        LD        A, #0x10
        CLRW      X
        RRWA      X, A
        LD        A, S:?b0
        RLWA      X, A
        DIV       X, A
        ADD       A, #0x30
        LD        (Y), A
        JRA       L:??Hex2String_3
//  211   else *str = hex%16 + ASCII_NUM_0 + 7;
??Hex2String_2:
        LD        A, #0x10
        CLRW      X
        RRWA      X, A
        LD        A, S:?b0
        RLWA      X, A
        DIV       X, A
        ADD       A, #0x37
        LD        (Y), A
//  212   str++;
??Hex2String_3:
        INCW      Y
//  213   *str = ' ';
        LD        A, #0x20
        LD        (Y), A
//  214   str++;
        INCW      Y
//  215   *str = '\0';
        CLR       (Y)
//  216 }
        RET
//  217 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  218 void ByteToHexStr(const unsigned char* source, char* dest, int sourceLen)  
//  219 {  
ByteToHexStr:
        LDW       S:?w2, X
        LDW       S:?w3, Y
        CALL      L:?mov_w1_w0
//  220     short i;  
//  221     unsigned char highByte, lowByte;  
//  222   
//  223     for (i = 0; i < sourceLen; i++)  
        CLRW      X
        LDW       Y, X
??ByteToHexStr_0:
        CPW       Y, S:?w1
        JRSGE     L:??ByteToHexStr_1
//  224     {  
//  225         highByte = source[i] >> 4;  
        LDW       X, Y
        ADDW      X, S:?w2
        LD        A, (X)
        SWAP      A
        AND       A, #0xf
        LD        S:?b1, A
//  226         lowByte = source[i] & 0x0f ;  
        LDW       X, Y
        ADDW      X, S:?w2
        LD        A, (X)
        AND       A, #0xf
        LD        S:?b0, A
//  227   
//  228         highByte += 0x30;  
        LD        A, S:?b1
        ADD       A, #0x30
        LD        S:?b1, A
//  229   
//  230         if (highByte > 0x39)  
        LD        A, S:?b1
        CP        A, #0x3a
        JRC       L:??ByteToHexStr_2
//  231                 dest[i * 2] = highByte + 0x07;  
        LDW       X, Y
        SLLW      X
        ADDW      X, S:?w3
        LD        A, S:?b1
        ADD       A, #0x7
        LD        (X), A
        JRA       L:??ByteToHexStr_3
//  232         else  
//  233                 dest[i * 2] = highByte;  
??ByteToHexStr_2:
        LDW       X, Y
        SLLW      X
        ADDW      X, S:?w3
        LD        A, S:?b1
        LD        (X), A
//  234   
//  235         lowByte += 0x30;  
??ByteToHexStr_3:
        LD        A, S:?b0
        ADD       A, #0x30
        LD        S:?b0, A
//  236         if (lowByte > 0x39)  
        LD        A, S:?b0
        CP        A, #0x3a
        JRC       L:??ByteToHexStr_4
//  237             dest[i * 2 + 1] = lowByte + 0x07;  
        LDW       X, Y
        SLLW      X
        ADDW      X, S:?w3
        INCW      X
        LD        A, S:?b0
        ADD       A, #0x7
        LD        (X), A
        JRA       L:??ByteToHexStr_5
//  238         else  
//  239             dest[i * 2 + 1] = lowByte;  
??ByteToHexStr_4:
        LDW       X, Y
        SLLW      X
        ADDW      X, S:?w3
        INCW      X
        LD        A, S:?b0
        LD        (X), A
//  240     }  
??ByteToHexStr_5:
        INCW      Y
        JRA       L:??ByteToHexStr_0
//  241     return ;  
??ByteToHexStr_1:
        RET
//  242 } 
//  243 

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  244 void HexStrToByte(const char* source, unsigned char* dest, int sourceLen)  
//  245 {  
HexStrToByte:
        CALL      L:?push_l2
        CALL      L:?push_l3
        PUSHW     X
        LDW       S:?w6, Y
        CALL      L:?mov_w5_w0
//  246     short i;  
//  247     unsigned char highByte, lowByte;  
//  248       
//  249     for (i = 0; i < sourceLen; i += 2)  
        CLRW      X
        LDW       S:?w4, X
??HexStrToByte_0:
        LDW       X, S:?w4
        CPW       X, S:?w5
        JRSGE     L:??HexStrToByte_1
//  250     {  
//  251         highByte = toupper(source[i]);  
        LDW       X, S:?w4
        ADDW      X, (0x1,SP)
        LD        A, (X)
        CLRW      X
        LD        XL, A
        CALL      L:toupper
        LD        A, XL
        LD        S:?b14, A
//  252         lowByte  = toupper(source[i + 1]);  
        LDW       X, S:?w4
        ADDW      X, (0x1,SP)
        INCW      X
        LD        A, (X)
        CLRW      X
        LD        XL, A
        CALL      L:toupper
        LD        A, XL
        LD        S:?b15, A
//  253   
//  254         if (highByte > 0x39)  
        LD        A, S:?b14
        CP        A, #0x3a
        JRC       L:??HexStrToByte_2
//  255             highByte -= 0x37;  
        LD        A, S:?b14
        ADD       A, #0xc9
        LD        S:?b14, A
        JRA       L:??HexStrToByte_3
//  256         else  
//  257             highByte -= 0x30;  
??HexStrToByte_2:
        LD        A, S:?b14
        ADD       A, #0xd0
        LD        S:?b14, A
//  258   
//  259         if (lowByte > 0x39)  
??HexStrToByte_3:
        LD        A, S:?b15
        CP        A, #0x3a
        JRC       L:??HexStrToByte_4
//  260             lowByte -= 0x37;  
        LD        A, S:?b15
        ADD       A, #0xc9
        LD        S:?b15, A
        JRA       L:??HexStrToByte_5
//  261         else  
//  262             lowByte -= 0x30;  
??HexStrToByte_4:
        LD        A, S:?b15
        ADD       A, #0xd0
        LD        S:?b15, A
//  263   
//  264         dest[i / 2] = (highByte << 4) | lowByte;  
??HexStrToByte_5:
        LD        A, S:?b14
        SWAP      A
        AND       A, #0xf0
        OR        A, S:?b15
        LDW       Y, #0x2
        LDW       X, S:?w4
        CALL      L:?sdiv16_x_x_y
        ADDW      X, S:?w6
        LD        (X), A
//  265     }  
        LDW       X, S:?w4
        INCW      X
        INCW      X
        LDW       S:?w4, X
        JRA       L:??HexStrToByte_0
//  266     return ;  
??HexStrToByte_1:
        ADD       SP, #0x2
        JP        L:?epilogue_l2_l3
//  267 } 
//  268 
//  269 
//  270 /**
//  271   * @brief  check sum
//  272   * values.
//  273   * @param  
//  274   *    *num  - check array
//  275   *    start - the start array number
//  276   *    end   - the end array number
//  277   * @retval 
//  278   *    none
//  279   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  280 unsigned char CheckSum( unsigned char* num, unsigned char start, unsigned char end )
//  281 {
CheckSum:
        LD        S:?b4, A
//  282   unsigned char sum = 0;
        CLR       S:?b5
//  283   for ( unsigned char i=start; i<=end; i++ )
        MOV       S:?b1, S:?b4
??CheckSum_0:
        LD        A, S:?b0
        CP        A, S:?b1
        JRC       L:??CheckSum_1
//  284     sum += num[i];
        CLRW      Y
        LD        A, S:?b1
        LD        YL, A
        LDW       S:?w1, X
        ADDW      Y, S:?w1
        LD        A, (Y)
        ADD       A, S:?b5
        LD        S:?b5, A
        INC       S:?b1
        JRA       L:??CheckSum_0
//  285   return sum;
??CheckSum_1:
        LD        A, S:?b5
        RET
//  286 }
//  287 
//  288 /**
//  289   * @brief  compare array
//  290   * values.
//  291   * @param  
//  292   *    *array1  - first array
//  293   *    *array2  - second array
//  294   *    counter  - How many bytes to be compare
//  295   * @retval 
//  296   *    Compare_TypeDef
//  297   */

        SECTION `.near_func.text`:CODE:REORDER:NOROOT(0)
        CODE
//  298 Compare_TypeDef ArrayCompare( unsigned char* array1, unsigned char* array2, unsigned char counter )
//  299 {
ArrayCompare:
        LDW       S:?w1, X
        LDW       S:?w2, Y
        LD        S:?b1, A
//  300   for ( unsigned char i=0; i<counter; i++ ){
        CLR       S:?b0
??ArrayCompare_0:
        LD        A, S:?b0
        CP        A, S:?b1
        JRNC      L:??ArrayCompare_1
//  301     if ( array1[i]>array2[i] )
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        ADDW      X, S:?w1
        LDW       Y, X
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        ADDW      X, S:?w2
        LD        A, (X)
        CP        A, (Y)
        JRNC      L:??ArrayCompare_2
//  302       return MAX;
        LD        A, #0x1
        JRA       L:??ArrayCompare_3
//  303     else if ( array1[i]<array2[i] )
??ArrayCompare_2:
        CLRW      Y
        LD        A, S:?b0
        LD        YL, A
        ADDW      Y, S:?w2
        CLRW      X
        LD        A, S:?b0
        LD        XL, A
        ADDW      X, S:?w1
        LD        A, (X)
        CP        A, (Y)
        JRNC      L:??ArrayCompare_4
//  304       return MIN;      
        LD        A, #0x2
        JRA       L:??ArrayCompare_3
//  305   }
??ArrayCompare_4:
        INC       S:?b0
        JRA       L:??ArrayCompare_0
//  306   return EQUAL;
??ArrayCompare_1:
        LD        A, #0x3
??ArrayCompare_3:
        RET
//  307 }

        SECTION VREGS:DATA:REORDER:NOROOT(0)

        END
//  308 
//  309 /************************** (C) COPYRIGHT 2014 DarrenTang *********************/
//  310 /********************************  END OF FILE  *******************************/
// 
// 256 bytes in section .near.rodata
// 728 bytes in section .near_func.text
// 
// 728 bytes of CODE  memory
// 256 bytes of CONST memory
//
//Errors: none
//Warnings: none
