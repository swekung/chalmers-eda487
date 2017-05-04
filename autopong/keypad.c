#include "gpio.h"

uint8_t keypad[16] = {1,2,3,10,4,5,6,11,7,8,9,12,14,0,15,13};

void kbdActivate( uint32_t row )
{
	switch( row )
	{
		case 1: GPIO_D.odr_high = 0x10; break; 
		case 2: GPIO_D.odr_high = 0x20; break; 
		case 3: GPIO_D.odr_high = 0x40; break; 
		case 4: GPIO_D.odr_high = 0x80; break; 
		case 0: GPIO_D.odr_high = 0x00; break;
	}
}

int kbdGetCol ( void )
{
	unsigned char c;
	c = GPIO_D.idr_high;
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