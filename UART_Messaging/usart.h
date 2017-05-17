#ifndef USART_H
#define USART_H

#include "types.h"

typedef struct tag_usart
{
	uint16_t sr;
	uint16_t Unused0;
	uint16_t dr;
	uint16_t Unused1;
	uint16_t brr;
	uint16_t Unused2;
	uint16_t cr1;
	uint16_t Unused3;
	uint16_t cr2;
	uint16_t Unused4;
	uint16_t cr3;
	uint16_t Unused5;
	uint16_t gtpr;
} USART;

typedef volatile USART* usartptr;
#define USART1 (*((usartptr)0x40011000))  

void iniuart();
uint8_t tstchar();
uint8_t inchar ();
void outchar ( uint8_t c );

#endif
