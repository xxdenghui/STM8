/** @page TIM4_TimeBase Toggling an output with TIM4 update interrupt 

  @verbatim
  ******************** (C)COPYRIGHT 2014 STMicroelectronics *******************
  * @file    TIM4/TIM4_TimeBase/readme.txt 
  * @author  MCD Application Team
  * @version V1.2.1
  * @date    30-September-2014
  * @brief   Description of the TIM4 Time Base Example.
  ******************************************************************************
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
  @endverbatim

  @par Example description

  This example provides a short description of how to use the TIM4 peripheral
  In this example, the PB.0 pin toggles each time the Update interrupt occurs
  
  The TIM4CLK frequency is 2MHz, the Prescaler is 1 so the TIM4 counter clock is 2MHz. 

  The TIM4 is running at 7.8125 KHz: TIM4 Frequency = TIM4 counter clock/(ARR value + 1) 
  So the TIM4 generates an Update Interrupt each 128 us.
  
  @note The square signal frequency on PB.0 is the half of Update Interrupt frequency
   (signal Period = 2 x Update interrupt period).
  


  @par Directory content

  - TIM4\TIM4_TimeBase\main.c                      Main file containing the "main" function
  - TIM4\TIM4_TimeBase\stm8l10x_conf.h             Library Configuration file
  - TIM4\TIM4_TimeBase\stm8l10x_it.c               Interrupt routines source
  - TIM4\TIM4_TimeBase\stm8l10x_it.h               Interrupt routines declaration


  @par Hardware and Software environment

  - This example runs on STM8L10x devices.
  
  - This example has been tested with STMicroelectronics STM8L101-EVAL evaluation
    board and can be easily tailored to any other development board.
    
  - STM8L1x-EVAL Set-up
   - Connect PB.0 pin to an oscilloscope.


  @par How to use it ?

  In order to make the program work, you must do the following :

  - Copy all source files from this example folder to the template folder under
    Project\STM8L10x_StdPeriph_Templates
  - Open your preferred toolchain 
  - Rebuild all files and load your image into target memory
  - Run the example
  - Connect the PB.0 pin to an oscilloscope 
  
@note
 - STM8L10x devices are STM8L microcontrollers with a Flash memory density up to 8 Kbytes.
  
 * <h3><center>&copy; COPYRIGHT STMicroelectronics</center></h3>
 */
