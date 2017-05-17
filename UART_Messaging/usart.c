#include "gpio.h"
#include "usart.h"

void iniuart()
{
	USART1.brr = 0x2D9;
	USART1.cr2 = 0;
	USART1.cr1 = (1<<13) | (1<<3) | (1<<2);
}

uint8_t tstchar()
{
	if((USART1.sr & 0x20) == 0)
	{
		return 0;
	}
	return (uint8_t) USART1.dr;
}
void outchar ( uint8_t c )
{
	USART1.dr = (uint16_t) c;
	while((USART1.sr & 0x80) == 0)
	{
		asm volatile(
			"NOP\n"
		) ;
	}
	if( c == '\n')
	{
		outchar('\r');
	}
}
uint8_t inchar ()
{
	uint8_t c;
	while( (c=tstchar() ) == 0);
	return c;
}

uint8_t* recieveString()
{
	static uint8_t tempString[256];
	for(uint16_t i = 0; i < 256; i++)
	{
		uint8_t tempChar = inchar();
		while(tempChar =! '{')
		{
			tempChar = inchar();
		}
		tempString[i] = tempChar;
		if(tempChar == '}')
		{
			break;
		}
	}
	return tempString;
}

