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
//#include "usart.h"

typedef struct tag_usart
{
	uint8_t sr;
	uint8_t Unused0;
	uint8_t dr;
	uint8_t Unused1;
	uint8_t brr;
	uint8_t Unused2;
	uint8_t cr1;
	uint8_t Unused3;
	uint8_t cr2;
	uint8_t Unused4;
	uint8_t cr3;
	uint8_t Unused5;
	uint8_t gtpr;
} USART;

typedef volatile USART* usartptr;
#define USART1 (*((usartptr)0x40011000)) 

void iniuart()
{
	USART1.brr = 0x2D9;
	USART1.cr2 = 0;
	USART1.cr1 = (1<<13) | (1<<3) | (1<<2);
}

uint8_t tstchar()
{
	if( (USART1.sr & (1<<5) ) ==0)
	{
		return 0;
	}
	return (uint8_t) USART1.dr;
}
void outchar ( uint8_t c )
{
	while ((USART1.sr & (1<<7)) == 0) ;
	USART1.dr = (uint16_t) c;
}
uint8_t inchar ()
{
	uint8_t c;
	while( (c=tstchar() ) == 0);
	return c;
}

void main(void)
{
	uint8_t c;
	iniuart();
	while(1)
	{
		c = tstchar();
		if ( c )
		{
			outchar(c);
		}
	}
}

