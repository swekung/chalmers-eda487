#ifndef USART_H
#define USART_H

#include "types.h"

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

void iniuart();
uint8_t tstchar();
uint8_t inchar ();
void outchar ( uint8_t c );

#endif
