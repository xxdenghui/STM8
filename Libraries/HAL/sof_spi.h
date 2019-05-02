/**
  ******************************************************************************
  * @file    sof_spi.h
  * @author  Darren Tang
  * @version V1.0.0
  * @date    2016-10-31
  * @brief   
  ******************************************************************************
  * @attention
  * 
  ******************************************************************************
**/
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __SOF_SPI_H
#define __SOF_SPI_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"

/* Exported types ------------------------------------------------------------*/

/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/
/* SS-V1 */
#define MOSI_PORT       GPIOC
#define MOSI_PIN        GPIO_PIN_6
#define MISO_PORT       GPIOC
#define MISO_PIN        GPIO_PIN_7
#define SCK_PORT        GPIOC
#define SCK_PIN         GPIO_PIN_5

/* Private functions -------------------------------------------------------- */
void SPI_GPIO_CFG(  );

/* Exported functions ------------------------------------------------------- */
void sof_spi_cfg( void );
void sof_spi_rw( uint8_t* send_data,  uint8_t* read_data, uint8_t bytes );

#endif /* __SOF_SPI_H */

/************************** (C) COPYRIGHT 2016 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
