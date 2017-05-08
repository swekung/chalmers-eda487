/*
 * 	startup.c
 *
 */
 




void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}

#include "gpio.h"
#include "delay.h"
#include "irq.h"

#ifdef SIMULATOR
#define DELAY_COUNT 100
#else
#define DELAY_COUNT 1000000
#endif

// Definiering av systick vektor

typedef struct sys_tick
{
    uint32_t ctrl; 
    uint32_t load; 
    uint32_t val; 
    uint32_t calib;
    
}Sys_tick; 


typedef volatile Sys_tick* systickptr; 

#define SYS_TICK (*((systickptr)0xe000e010))

//systick vektor definierad

uint8_t systick_flag = 0;


void delay_count(uint32_t count)
{
	while(count--)
	{
		delay_250ns();
		systick_flag = 0;
		if(systick_flag != 0)
			{
				break;
			}
	}
}

void systick_irq_handler()
{
	systick_flag = 1;
}

void init_app()
{
	GPIO_D.moder = 0x5555;
	IRQ.sysTick = systick_irq_handler;
}

void main(void)
{
	GPIO_D.odr_low = 0;
	delay_count(DELAY_COUNT);
	GPIO_D.odr_low = 0xFF;
	delay_count(DELAY_COUNT);
}

