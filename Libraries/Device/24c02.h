/**
  ******************************************************************************
  * @file    24c02.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-07-28
  * @brief   eeprom device 24c02
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __EE24C02_H
#define __EE24C02_H

/* Includes ------------------------------------------------------------------*/
#include "wire.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */
ErrorStatus EEROM_WriteByte( uint8_t addr, uint8_t data );
ErrorStatus EEROM_RadomRead( uint8_t addr, uint8_t* data );

/* Private functions -------------------------------------------------------- */

#endif /* __EE24C02_H */

/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/