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

#include "gpio.h"
#include "display.h"
#include "delay.h"
#include "object.h"
#include "keypad.h"

static GEOMETRY ball_geometry = {
	12,         /* antal punkter */
	4, 4,       /* bredd och höjd */
	{
			   {0,1}, {0,2},
		{1,0}, {1,1}, {1,2}, {1,3},
		{2,0}, {2,1}, {2,2}, {2,3},
			   {3,1}, {3,2}
	}
};

static OBJECT ball = {
	&ball_geometry,
	0, 0,
	1, 1,
	draw_object,
	clear_object,
	move_object,
	set_object_speed
};

void init_app()
{
	GPIO_E.moder = 0x55555555;
	GPIO_E.ospeedr = 0x55555555;
	GPIO_D.moder = 0x55005555;
	GPIO_D.otyper &= 0x00FF;
	GPIO_D.pupdr |= 0x00AA0000;
}

void main(void)
{
	POBJECT p = &ball;
	init_app();
	graphic_initialize();
#ifndef SIMULATOR
	graphic_clear_screen();
#endif

	
	while(1)
	{
		uint8_t temp = keyb();
		switch(temp){
			case 2: p->set_speed(p, 0 ,-1); break;
			case 4: p->set_speed(p, -1, 0); break;
			case 8: p->set_speed(p, 0, 1); break;
			case 6: p->set_speed(p, 1, 0); break;
			default: p->set_speed(p, 0, 0); break;
		}
		p->move(p);
		delay_milli(40);
	}
}

