/*
 * 	startup.c
 *
 */
 
 #include "gpio.h"
 
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
typedef volatile int* port32ptr;
typedef volatile long* port16ptr;
typedef volatile char* port8ptr;
#define SYS_TICK 0xE000E010
#define STK_CTRL *((port32ptr) SYS_TICK)
#define STK_LOAD *((port32ptr)(SYS_TICK + 0x04))
#define STK_VAL *((port32ptr)(SYS_TICK + 0x08))
#define GPIO_D_ADDR 0x40020C00
#define GPIO_MODER *((port32ptr)GPIO_D_ADDR)
#define GPIO_OTYPER *((port32ptr)(GPIO_D_ADDR + 0x04))
#define GPIO_OSPEEDR *((port32ptr)(GPIO_D_ADDR + 0x08))
#define GPIO_PUPDR *((port32ptr)(GPIO_D_ADDR + 0x0C))
#define GPIO_IDR_LOW *((port8ptr)(GPIO_D_ADDR + 0x10))
#define GPIO_IDR_HIGH *((port8ptr)(GPIO_D_ADDR + 0x11))
#define GPIO_ODR_LOW *((port8ptr)(GPIO_D_ADDR + 0x14))
#define GPIO_ODR_HIGH *((port8ptr)(GPIO_D_ADDR + 0x15))


//#define SIMULATOR
unsigned int slowdown_Sim = 1000;

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	);
}

void app_init ( void )
{
	GPIO_MODER = 0x5555;
	RCC_AHB1ENR |= RCC_GPIO_D | RCC_GPIO_E;
}
void delay_250ns ( void )
{
	STK_CTRL = 0;
	STK_LOAD = 42;
	STK_VAL = 0;
	STK_CTRL = 5;
	while((STK_CTRL & 0x00010000)== 0) ;
	STK_CTRL = 0;
}
void delay_micro(unsigned int us)
{
	#ifdef SIMULATOR
		us /= slowdown_Sim;
		us++;
	#endif
	for(int i = 0; i <= us*4; i++)
	{
		delay_250ns();
	}
}

void delay_milli(unsigned int ms)
{
	while(ms--){
		#ifdef SIMULATOR
			delay_micro(2);
		#else
			delay_micro(1000); 
		#endif
	}
}

void main(void)
{
	app_init();
	while(1)
	{
		GPIO_ODR_LOW = 0xFF;
		delay_milli(5);
		GPIO_ODR_LOW = 0x00;
		delay_milli(5);
	}
}

