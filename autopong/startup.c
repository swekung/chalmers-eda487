/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
//#define SIMULATOR




void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}

#include "gpio.h"
#include "display.h"
#include "delay.h"
#include "display.h"
#include "object.h"
void init_app( void ){
	GPIO_E.moder = 0x55555555;
}

static GEOMETRY ball_geometry ={
	12,
	4,
	4,
	{{0,1}, {0,2}, {1,0}, {1,1}, {1,2}, {1,3}, {2,0}, {2,1}
	,{2,2}, {2,3}, {3,1}, {3,2}}
} ;

static OBJECT ball ={
	&ball_geometry,
	0,0,			
	1,1,			
	draw_object,
	clear_object,
	move_object,
	set_object_speed
};


   

int main(int argc, char **argv){
	POBJECT p = &ball;
	init_app();
	graphic_initialize();
#ifndef SIMULATOR
	graphic_clear_screen;
#endif
	p->set_speed(p, 10, 5);
	while(1){
		p->move(p);
		delay_milli(40);
	}
}