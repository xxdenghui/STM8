/**
  ******************************************************************************
  * @file    hal_spi.h
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
#ifndef __HAL_SPI_H
#define __HAL_SPI_H

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"

/* Exported types ------------------------------------------------------------*/
typedef enum {
  master = SPI_MODE_MASTER, /*!< SPI Master configuration */
  slave  = SPI_MODE_SLAVE /*!< SPI Slave configuration */
} HAL_SPI_Mode_TypeDef;

typedef enum {
  msb = SPI_FIRSTBIT_MSB, /*!< MSB bit will be transmitted first */
  lsb = SPI_FIRSTBIT_LSB  /*!< LSB bit will be transmitted first */
} HAL_SPI_FirstBit_TypeDef;
/* Exported constants --------------------------------------------------------*/

/* Exported macros -----------------------------------------------------------*/

/* Private macros ------------------------------------------------------------*/

/* Exported functions ------------------------------------------------------- */
void hal_spi_cfg( HAL_SPI_Mode_TypeDef mode, HAL_SPI_FirstBit_TypeDef firstbit );
void hal_spi_send( uint8_t* data, uint16_t lenth );
void hal_spi_read( uint8_t* data, uint16_t lenth );


/* Private functions -------------------------------------------------------- */

#endif /* __HAL_SPI_H */

/************************** (C) COPYRIGHT 2016 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
