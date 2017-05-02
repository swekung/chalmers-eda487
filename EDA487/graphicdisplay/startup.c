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
#define SIMULATOR

#include "display.h"
#include "gpio.h"
#include "delay.h"
#include "object.h"



void init_app()
{
	GPIO_E.moder = 0x55555555;
	GPIO_E.ospeedr = 0x55555555;
}

void draw_lines()
{
	uint32_t i;
	for(i = 1; i <= 128; i++)
        pixel(i, 10, 1);
    for(i = 1; i <= 64; i++)
        pixel(10, i, 1);

    delay_milli(500);

    for(i = 1; i <= 128; i++)
        pixel(i, 10, 0);
    for(i = 1; i <= 64; i++)
        pixel(10, i, 0);
}
void main(void)
{
    init_app();
    graphic_initialize();
    graphic_clear_screen();
	draw_lines();
}

