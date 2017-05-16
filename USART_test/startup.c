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

#include "types.h"
#include "usart.h"
#include "display.h"

void app_init()
{
	
}

void main(void)
{
	uint8_t c;
	app_init();
	iniuart();
	uint32_t *arrayPointerString;
	
}

