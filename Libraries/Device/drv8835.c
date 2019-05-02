/**
  ******************************************************************************
  * @file    drv8835.c
  * @author  Darren
  * @version V1.0.0
  * @date    2018-05-28
  * @brief   drv8835 seouce file for STM8L series
  ******************************************************************************
  * @attention
  *
  * 
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "drv8835.h"

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
volatile uint8_t step_site_X;
volatile uint8_t step_site_Y;
volatile uint16_t steps_X;
volatile uint16_t steps_Y;
/* Private function prototypes -----------------------------------------------*/

/* Private functions ---------------------------------------------------------*/

/* Public functions ----------------------------------------------------------*/

/*******************************************************************************
 * name: Drv8835_init
 * param: none
 * retval: none
 * remark: drv8835 init
 ******************************************************************************/
void Drv8835_Init( void )
{
    // Position IO Init
    GPIO_Init( Position_Port, P_X1|P_X2|P_Y1|P_Y2, GPIO_MODE_IN_PU_NO_IT );
    // Moto IO Init
    GPIO_Init( DRV8835_Port1, GPIO_PIN_ALL, GPIO_MODE_OUT_PP_LOW_FAST );
    GPIO_Init( DRV8835_Port2, BIN2_X|MODE_Y, GPIO_MODE_OUT_PP_LOW_FAST );
}

/*******************************************************************************
 * name: Drv8835_Moto_X
 * param: none
 * retval: none
 * remark: moto X 
 ******************************************************************************/
uint8_t Drv8835_Moto_X( Moto_RunTypeDef way )
{
    if ( way == COAST )
    {
        GPIO_WriteBit( DRV8835_Port1, AIN1_X|AIN2_X|BIN1_X, RESET );
        GPIO_WriteBit( DRV8835_Port2, BIN2_X, RESET );
    }
    else if ( way == BREAK )
    {
        GPIO_WriteBit( DRV8835_Port1, AIN1_X|AIN2_X|BIN1_X, SET );
        GPIO_WriteBit( DRV8835_Port2, BIN2_X, SET );
    }
    else if ( (way == REVERSE) || (way == FORWARD) )
    {
        if ( steps_X )
        {
            if ( way == REVERSE )
            {
                 if ((step_site_X>1)&&(step_site_X<=8))
                {
                    step_site_X--;
                }
                else 
                {
                    step_site_X = 8;
                    steps_X--;
                }
            }
            else
            {
                if ( step_site_X<8 )
                {
                    step_site_X++;
                }
                else
                {
                    step_site_X = 1;
                    steps_X--;
                }
            }
            switch (step_site_X)
            {
                case 1:
                    GPIO_WriteBit( DRV8835_Port1, AIN1_X, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN2_X|BIN1_X, RESET );
                    GPIO_WriteBit( DRV8835_Port2, BIN2_X, RESET );
                    break;
                case 2:
                    GPIO_WriteBit( DRV8835_Port1, AIN1_X|BIN1_X, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN2_X, RESET );
                    GPIO_WriteBit( DRV8835_Port2, BIN2_X, RESET );
                    break;
                case 3:
                    GPIO_WriteBit( DRV8835_Port1, BIN1_X, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN1_X|AIN2_X, RESET );
                    GPIO_WriteBit( DRV8835_Port2, BIN2_X, RESET );
                    break;
                case 4:
                    GPIO_WriteBit( DRV8835_Port1, BIN1_X|AIN2_X, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN1_X, RESET );
                    GPIO_WriteBit( DRV8835_Port2, BIN2_X, RESET );
                    break;
                case 5:
                    GPIO_WriteBit( DRV8835_Port1, AIN2_X, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN1_X|BIN1_X, RESET );
                    GPIO_WriteBit( DRV8835_Port2, BIN2_X, RESET );
                    break; 
                case 6:
                    GPIO_WriteBit( DRV8835_Port1, AIN2_X, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN1_X|BIN1_X, RESET );
                    GPIO_WriteBit( DRV8835_Port2, BIN2_X, SET );
                    break;    
                case 7:
                    GPIO_WriteBit( DRV8835_Port2, BIN2_X, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN1_X|AIN2_X|BIN1_X, RESET );
                    break;
                case 8:
                    GPIO_WriteBit( DRV8835_Port1, AIN1_X, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN2_X|BIN1_X, RESET );
                    GPIO_WriteBit( DRV8835_Port2, BIN2_X, SET );
                  break;
                default:
                    break;
            }
            return 1;
        }
        else return 0;
    }
}

/*******************************************************************************
 * name: Drv8835_Moto_Y
 * param: none
 * retval: none
 * remark: moto Y
 ******************************************************************************/
uint8_t Drv8835_Moto_Y( Moto_RunTypeDef way )
{
    if ( way == COAST )
    {
        GPIO_WriteBit( DRV8835_Port1, AIN1_Y|AIN2_Y|BIN1_Y|BIN2_Y, RESET );
    }
    else if ( way == BREAK )
    {
        GPIO_WriteBit( DRV8835_Port1, AIN1_Y|AIN2_Y|BIN1_Y|BIN2_Y, SET );
    }
    else if ( (way == REVERSE) || (way == FORWARD) )
    {
        if ( steps_Y )
        {
            if ( way == REVERSE )
            {
                 if ((step_site_Y>1)&&(step_site_Y<=8))
                {
                    step_site_Y--;
                }
                else 
                {
                    step_site_Y = 8;
                    steps_Y--;
                }
            }
            else
            {
                if ( step_site_Y<8 )
                {
                    step_site_Y++;
                }
                else
                {
                    step_site_Y = 1;
                    steps_Y--;
                }
            }
            switch (step_site_Y)
            { 
                case 1: 
                    GPIO_WriteBit( DRV8835_Port1, AIN1_Y, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN2_Y|BIN1_Y|BIN2_Y, RESET );
                    break;
                case 2:
                    GPIO_WriteBit( DRV8835_Port1, AIN1_Y|BIN1_Y, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN2_Y|BIN2_Y, RESET );
                    break;
                case 3:
                    GPIO_WriteBit( DRV8835_Port1, BIN1_Y, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN1_Y|AIN2_Y|BIN2_Y, RESET );
                    break;
                case 4:
                    GPIO_WriteBit( DRV8835_Port1, BIN1_Y|AIN2_Y, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN1_Y|BIN2_Y, RESET );
                    break;
                case 5:
                    GPIO_WriteBit( DRV8835_Port1, AIN2_Y, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN1_Y|BIN1_Y|BIN2_Y, RESET );
                    break;
                case 6:
                    GPIO_WriteBit( DRV8835_Port1, AIN2_Y|BIN2_Y, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN1_Y|BIN1_Y, RESET );
                    break;
                case 7:
                    GPIO_WriteBit( DRV8835_Port1, BIN2_Y, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN1_Y|AIN2_Y|BIN1_Y, RESET );
                    break;
                case 8:
                    GPIO_WriteBit( DRV8835_Port1, BIN2_Y|AIN1_Y, SET );
                    GPIO_WriteBit( DRV8835_Port1, AIN2_Y|BIN1_Y, RESET );
                    break;
                default:
                    break;
            }
            return 1;
        }
        else return 0;
    }
}



/************************** (C) COPYRIGHT 2015 DarrenTang *********************/
/********************************  END OF FILE  *******************************/
