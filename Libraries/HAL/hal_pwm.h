/**
  ******************************************************************************
  * @file    hal_pwm.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-03-15
  * @brief   
  ******************************************************************************
  * @attention
  * 
  ******************************************************************************
**/
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __HAL_PWM_H
#define __HAL_PWM_H

/* Includes ------------------------------------------------------------------*/
#ifdef STM8S
#include "stm8s.h"
#endif

#ifdef STM8L15
#include "stm8l15x.h"
#endif

/* Exported types ------------------------------------------------------------*/
typedef enum {
  t1ch1 = (uint8_t)0x11 , /* Timer1 ch2 */
  t1ch2 = (uint8_t)0x12 , /* Timer1 ch2 */
  t1ch3 = (uint8_t)0x13 , /* Timer1 ch3 */
  t1ch4 = (uint8_t)0x14 , /* Timer1 ch4 */
  t2ch1 = (uint8_t)0x21 , /* Timer2 ch2 */
  t2ch2 = (uint8_t)0x22 , /* Timer2 ch2 */
  t2ch3 = (uint8_t)0x23 , /* Timer2 ch3 */
  t3ch1 = (uint8_t)0x31 , /* Timer3 ch2 */
  t3ch2 = (uint8_t)0x32   /* Timer3 ch2 */
} HAL_PWMCH_TypeDef;

/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */
void hal_pwm_set( HAL_PWMCH_TypeDef channel, uint16_t PWM_value, uint16_t maxvalue );

/* Private functions -------------------------------------------------------- */

#endif /* __HAL_PWM_H */

/************************** (C) COPYRIGHT 2016 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
