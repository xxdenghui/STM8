/**
  ******************************************************************************
  * @file    main.c
  * @author  MCD Application Team
  * @version V1.2.1
  * @date    30-September-2014
  * @brief   Main program body
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8l10x.h"
#include "stm8l101_eval.h"

/**
  * @addtogroup RST_IllegalOpcode
  * @{
  */

/* Private typedef -----------------------------------------------------------*/

/* Private define ------------------------------------------------------------*/

/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
void Delay (uint16_t nCount);
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

/**
  * @brief  Main program.
  * @param  None
  * @retval None
  */
void main(void)
{
    uint8_t i =0;
    
    FlagStatus IllOpFlag = RESET;

    enableInterrupts();
    
    /* Initialize Leds mounted on evaluation board */
    STM_EVAL_LEDInit(LED2);
    STM_EVAL_LEDInit(LED3);
    STM_EVAL_LEDInit(LED4);

    /* Initialize key button on evaluation board */
    STM_EVAL_PBInit(BUTTON_KEY, BUTTON_MODE_EXTI);
    
    /* Initialize the Interrupt sensitivity */
    EXTI_SetPinSensitivity(EXTI_Pin_5, EXTI_Trigger_Falling);
    
    FLASH_Unlock(FLASH_MemType_Program);
    
    IllOpFlag = RST_GetFlagStatus(RST_FLAG_ILLOPF);

    /* Test if a ILLOP Reset has occured */
    if (IllOpFlag)
    {
        for (i=0;i<50;i++)
        {
            /* An ILLOP Reset has occured, Toggles LD2, LD3 and LD4 */
            STM_EVAL_LEDToggle(LED2);
            STM_EVAL_LEDToggle(LED3);
            STM_EVAL_LEDToggle(LED4);
            /* delay */
            Delay(0x1FFF);
        }
        /* Clear IWDGF Flag */
        RST_ClearFlag(RST_FLAG_ILLOPF);
    }

    /* Write an illigal opcode */
    FLASH_ProgramByte(0x9F00, 0x75);

    while (1)
    {
        /* Toggle LED */
        STM_EVAL_LEDToggle(LED2);
        STM_EVAL_LEDToggle(LED3);
        STM_EVAL_LEDToggle(LED4);
        /* delay */
        Delay(0xFFFF);
    }

}
/**
  * @brief  Delay.
  * @param  nCount
  * @retval None
  */
void Delay(uint16_t nCount)
{
    /* Decrement nCount value */
    while (nCount != 0)
    {
        nCount--;
    }
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{ 
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

/**
  * @}
  */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
