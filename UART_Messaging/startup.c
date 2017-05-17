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
#include "object.h"
#include "mailicon.xbm"

#define SIMULATOR

typedef struct
{
	unsigned char width;
	unsigned char height;
	unsigned char* data;
} sprite;

static void load_sprite(sprite* s, unsigned char* data, int width, int height) {
	s->width = width;
	s->height = height;
	s->data = data;
}

void draw_sprite(sprite* s, int x, int y, int set) { 
	int i,j,k, width_in_bytes;
	if (s->width % 8 == 0)
		 width_in_bytes = s->width / 8;
	else
		width_in_bytes = s->width / 8 + 1;
	for (i = 0; i < s->height; i++)
		 for (j = 0; j < width_in_bytes; j++) {
			 unsigned char byte = s->data[i * width_in_bytes + j];
			 for (k =0; k < 8; k++) {
				 if (byte & (1 << k))
					pixel(8 * j + k + x + 1, i + y + 1, set);
			}

		} 
}

sprite mail;


void writeMessage()
{
	uint16_t index = 1;
	ascii_gotoxy(0,0);
	uint8_t tempChar = inchar();
	while(tempChar == 0)
	{
		tempChar = inchar();
	}
	pixel(1,1,1);
	display_on();
	draw_sprite(&mail, 0, 0, 1);
	ascii_command(0x01, 2000);
	while(1)
	{
		if(index < 21)
		{
			ascii_gotoxy(index, 1);
			ascii_write_char(tempChar);
		} else if( index >= 21){
			ascii_gotoxy(index - 20, 2);
			ascii_write_char(tempChar);
		}
		tempChar = inchar();
		if(tempChar == 47)
			break;
		index++;
	}
}

void app_init()
{
	GPIO_E.moder = 0x55555555;   /*port E utport*/
	GPIO_E.otyper = 0x00000000;  /*push pull*/
	GPIO_E.ospeedr = 0x55555555; /*medium speed, om problem sätt till låg*/
	GPIO_E.pupdr = 0x55550000;   /* pullup inputs*/
}

void main(void)
{
	uint8_t c;
	iniuart();
	load_sprite(&mail, mailicon_bits, mailicon_width, mailicon_height);
	app_init();
	ascii_init();
	//graphic_initialize();
	graphic_clear_screen();
	display_off();
	//draw_sprite(&mail, 0, 0, 1);
	while(1)
	{
		writeMessage();
		delay_ms(2000);
		pixel(1,1,0);
		draw_sprite(&mail, 0, 0, 0);
	}
}

