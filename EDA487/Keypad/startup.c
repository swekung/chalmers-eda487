/*
 * 	startup.c
 *
 */
#include "gpio.h"

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
typedef volatile int* port32ptr;
typedef volatile long* port16ptr;
typedef volatile char* port8ptr;
#define GPIO_D_ADDR 0x40020C00
#define GPIO_MODER ((port32ptr)GPIO_D_ADDR)
#define GPIO_OTYPER ((port32ptr)(GPIO_D_ADDR + 0x04))
#define GPIO_OSPEEDR ((port32ptr)(GPIO_D_ADDR + 0x08))
#define GPIO_PUPDR ((port32ptr)(GPIO_D_ADDR + 0x0C))
#define GPIO_IDR_LOW ((port8ptr)(GPIO_D_ADDR + 0x10))
#define GPIO_IDR_HIGH ((port8ptr)(GPIO_D_ADDR + 0x11))
#define GPIO_ODR_LOW ((port8ptr)(GPIO_D_ADDR + 0x14))
#define GPIO_ODR_HIGH ((port8ptr)(GPIO_D_ADDR + 0x15))
unsigned char keypad[16] = {1,2,3,10,4,5,6,11,7,8,9,12,14,0,15,13};


void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}


void initApp()
{
	*GPIO_MODER = 0x55005555;
	*GPIO_OTYPER &= 0x00FF;
	*GPIO_PUPDR |= 0x00AA0000;
	RCC_AHB1ENR |= RCC_GPIO_D | RCC_GPIO_E;
}


void kbdActivate( unsigned int row )
{
	switch( row )
	{
		case 1: *GPIO_ODR_HIGH = 0x10; break; 
		case 2: *GPIO_ODR_HIGH = 0x20; break; 
		case 3: *GPIO_ODR_HIGH = 0x40; break; 
		case 4: *GPIO_ODR_HIGH = 0x80; break; 
		case 0: *GPIO_ODR_HIGH = 0x00; break;
	}
}

int kbdGetCol ( void )
{
	unsigned char c;
	c = *GPIO_IDR_HIGH;
	if ( c & 0x8 ) return 4; 
	if ( c & 0x4 ) return 3; 
	if ( c & 0x2 ) return 2; 
	if ( c & 0x1 ) return 1;
}

unsigned char keyb(void)
{ 
	int row = 0;
	int col = 0;
	for (row=1; row <=4 ; row++ ) 
		{
		kbdActivate( row );
		if( (col = kbdGetCol () ) )
			{ 
				return keypad [4*(row-1)+(col-1) ];
			}
		} 
	return 0xFF;
	kbdActivate( 0 );
}

void out7seg ( unsigned char c)
{
	switch(c)
	{
		case 0: *GPIO_ODR_LOW = 0x3F; break;
		case 1: *GPIO_ODR_LOW = 0x06; break; 
		case 2: *GPIO_ODR_LOW  = 0x5B; break; 
		case 3: *GPIO_ODR_LOW  = 0x4F; break; 
		case 4: *GPIO_ODR_LOW  = 0x66; break; 
		case 5: *GPIO_ODR_LOW  = 0x6D; break; 
		case 6: *GPIO_ODR_LOW  = 0x7D; break; 
		case 7: *GPIO_ODR_LOW  = 0x07; break; 
		case 8: *GPIO_ODR_LOW  = 0x7F; break; 
		case 9: *GPIO_ODR_LOW  = 0x67; break; 
		case 10: *GPIO_ODR_LOW  = 0x77; break; 
		case 11: *GPIO_ODR_LOW  = 0x7C; break; 
		case 12: *GPIO_ODR_LOW  = 0x39; break; 
		case 13: *GPIO_ODR_LOW  = 0x5E; break; 
		case 14: *GPIO_ODR_LOW  = 0x79; break; 
		case 15: *GPIO_ODR_LOW  = 0x71; break; 
		case 0xFF: *GPIO_ODR_LOW = 0x00; break;
	}
}
void main(void)
{
	initApp();
	while(1)
	{
		out7seg(keyb());
	}
}


