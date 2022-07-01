/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2022 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "usart.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "stdbool.h"
#include "string.h"
#include "stdio.h"
#include <pthread.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
bool previousState;
bool currentState;
char buff[64];
struct Led{
	bool state;
	uint32_t timeIn;
	uint32_t timeOut;
	uint32_t timer;
	int stt;
	GPIO_TypeDef * port;
	uint16_t pin;
};
struct Led led1={
		.state=false,
		.timeIn =460,
		.timeOut =230,
		.timer =0,
		.stt=0,
		.port=LD1_GPIO_Port,
		.pin=LD1_Pin
};
struct Led led2={
		.state=false,
		.timeIn =400,
		.timeOut =600,
		.timer =0,
		.stt=0,
		.port=LD2_GPIO_Port,
		.pin=LD2_Pin
};
struct Led led3={
		.state=false,
		.timeIn =100,
		.timeOut =300,
		.timer =0,
		.stt=0,
		.port=LD3_GPIO_Port,
		.pin=LD3_Pin
};

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_LPUART1_UART_Init();
  int state=0;
  uint8_t Rx_data[10];
  /* USER CODE BEGIN 2 */

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
	  previousState= currentState;
	  currentState = HAL_GPIO_ReadPin(B1_GPIO_Port,B1_Pin);
	  long crnt_tick=0;
	  switch(state){
		  case 0:
			  if(currentState==1 && previousState==0){
				  state=1;
				  HAL_GPIO_TogglePin(LD1_GPIO_Port,LD1_Pin);
				  HAL_UART_Transmit(&hlpuart1,"Zmena stavu LED1.\r\n", 20, 100);
				  led1.state=false;
			  }
			  break;
		  case 1:
			  if(currentState==0 && previousState==1){
				  crnt_tick=HAL_GetTickPrio();
				  HAL_Delay(4);
				  state=0;
			  }
			  break;
		  case 2:
			  if(crnt_tick+4<=HAL_GetTickPrio())
				  state=0;
			  break;
	  }
	  char word[1];
	  HAL_StatusTypeDef res = HAL_UART_Receive(&hlpuart1, word, 1, 0);

	  if (res == HAL_OK)
	  {
		  if(word[0]=='\n' || word[0]=='\r'){
			  ChangeLedState(buff);
			  memset(&buff, 0, sizeof(buff));
		  }else{
			HAL_UART_Transmit(&hlpuart1, word, 1, 100);
			strncat(buff, word, 1);
		  }
	  }

	  blink(&led1);
	  blink(&led2);
	  blink(&led3);
  }
  /* USER CODE END 3 */
}


void ChangeLedState(char * str){
	HAL_UART_Transmit(&hlpuart1,"\n", 1, 100);
	if(str[0]!='L' && str[1]!='D')return;
	switch(str[2]){
		case '1':
			SetPinState(&led1,str);
			break;
		case '2':
			SetPinState(&led2,str);
			break;
		case '3':
			SetPinState(&led3,str);
			break;
		default:
			HAL_UART_Transmit(&hlpuart1, "Chyba",5, 100);
			HAL_UART_Transmit(&hlpuart1,"\r\n", 2, 100);
			break;
	}
}

/*
 * Příkazy na ovládání
 * LDx=1 - zapnutí LED
 * LDx=0 - vypnutí LED
 * LDx=! - negace stavu LED
 * LDx B - zapnutí/vypnutí s nastavenými časovači od posledně
 * LDx B xxx - nastavení časovače in a out na čas xxx a změna stavu blikání
 * LDx B xxx yyy - nastavení časovače in na xxx a out na yyy a změna stavu blikání
 * */
void SetPinState(struct Led* ledka, char* str){
	switch(str[4]){
		case '0':
			HAL_GPIO_WritePin(ledka->port, ledka->pin, GPIO_PIN_RESET);
			ledka->state=false;
			break;
		case '1':
			HAL_GPIO_WritePin(ledka->port, ledka->pin, GPIO_PIN_SET);
			ledka->state=false;
			break;
		case '!':
			HAL_GPIO_TogglePin(ledka->port,ledka->pin);
			ledka->state=false;
			break;
		case 'B':
			ledka->state=!ledka->state;
			ledka->stt=0;
			ledka->timer=HAL_GetTick();

			char in[8];
			char out[8];
			char out1[8];

			int cnt=0;
			char * pch;
			pch = strtok (str," ");
			while (pch != NULL)
			{
				pch = strtok (NULL, " ");
				if(cnt==1)
					strcat(in, pch);
				if(cnt==2)
					strcat(out1,pch);
				cnt++;
			}
			memcpy(out, &out1[1], strlen(out1));//Protoze to tam pridava dva random znaky na zacatek. treba RN150. Tímto je odstranim

			if(cnt==3){
				ledka->timeIn=atoi(in);
				ledka->timeOut=atoi(in);
			}
			if(cnt==4){
				ledka->timeIn=atoi(in);
				ledka->timeOut=atoi(out);
			}
		    HAL_UART_Transmit(&hlpuart1,"IN ", 3, 100);
		    char snum[5];
		    itoa(ledka->timeIn,snum,10);
			HAL_UART_Transmit(&hlpuart1,snum, strlen(snum), 100);
			HAL_UART_Transmit(&hlpuart1,"\n", 1, 100);
			HAL_UART_Transmit(&hlpuart1,"OUT ", 4, 100);
			char anum[5];
			itoa(ledka->timeOut,anum,10);
			HAL_UART_Transmit(&hlpuart1,anum, strlen(anum), 100);
			HAL_UART_Transmit(&hlpuart1,"\n", 1, 100);
			break;
		}
}


void blink(struct Led* ledka){
	if(!ledka->state)return;
	switch(ledka->stt){
	case 0:
		if(ledka->timer+ledka->timeIn<=HAL_GetTick()){
			HAL_GPIO_WritePin(ledka->port,ledka->pin, GPIO_PIN_RESET);
			ledka->timer=HAL_GetTick();
			ledka->stt=1;
		}
		break;
	case 1:
		if(ledka->timer+ ledka->timeOut<=HAL_GetTick()){
			HAL_GPIO_WritePin(ledka->port,ledka->pin, GPIO_PIN_SET);
			ledka->timer=HAL_GetTick();
			ledka->stt=0;
		}
		break;
	}
}
/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  if (HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1_BOOST) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = 2;
  RCC_OscInitStruct.PLL.PLLN = 30;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = RCC_PLLQ_DIV2;
  RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */

