/**
  ******************************************************************************
  * @file    delay.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2015-11-10
  * @brief   This is a delay  head file.
  ******************************************************************************
  * @attention
  * The Sysclock must be 24MHz
  * 
  ******************************************************************************
  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __DELAY_H
#define __DELAY_H

/* Includes ------------------------------------------------------------------*/

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros ------------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */
void delayms( unsigned int ms );
void delayus( unsigned int us );

/* Private functions -------------------------------------------------------- */

#endif /* __DELAY_H */

/************************** (C) COPYRIGHT 2014 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
