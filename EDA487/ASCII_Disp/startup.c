/*
 * 	startup.c
 *
 */
 
#include "gpio.h"

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
typedef volatile int* port32ptr;
typedef volatile long* port16ptr;
typedef volatile char* port8ptr;
#define SYS_TICK 0xE000E010
#define STK_CTRL *((port32ptr) SYS_TICK)
#define STK_LOAD *((port32ptr)(SYS_TICK + 0x04))
#define STK_VAL *((port32ptr)(SYS_TICK + 0x08))
#define GPIO_ADDR 0x40021000
#define GPIO_MODER *((port32ptr)GPIO_ADDR)
#define GPIO_OTYPER *((port32ptr)(GPIO_ADDR + 0x04))
#define GPIO_OSPEEDR *((port32ptr)(GPIO_ADDR + 0x08))
#define GPIO_PUPDR *((port32ptr)(GPIO_ADDR + 0x0C))
#define GPIO_IDR_LOW *((port8ptr)(GPIO_ADDR + 0x10))
#define GPIO_IDR_HIGH *((port8ptr)(GPIO_ADDR + 0x11))
#define GPIO_ODR_LOW *((port8ptr)(GPIO_ADDR + 0x14))
#define GPIO_ODR_HIGH *((port8ptr)(GPIO_ADDR + 0x15))
#define B_E 0x40
#define B_SELECT 0x04
#define B_RW 0x02
#define B_RS 0x01



#define SIMULATOR
unsigned int slowdown_Sim = 1000;

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	);
}

void app_init ( void )
{
	GPIO_MODER = 0x55555555;
	GPIO_OSPEEDR = 0x55555555;
}
void delay_250ns ( void )
{
	STK_CTRL = 0;
	STK_LOAD = 42;
	STK_VAL = 0;
	STK_CTRL = 5;
	while((STK_CTRL & 0x00010000) == 0) ;
	STK_CTRL = 0;
}
void delay_micro(unsigned int us)
{
	for(int i = 0; i <= us*4; i++)
	{
		delay_250ns();
	}
}

void delay_milli(unsigned int ms)
{
	while(ms--){
		#ifdef SIMULATOR
			delay_micro(2);
		#else
			delay_micro(1000); 
		#endif
	}
}

void ascii_ctrl_bit_set(unsigned char data)
{
	GPIO_ODR_LOW |= ( B_SELECT | data); 
}

void ascii_ctrl_bit_clear(unsigned char data)
{
	GPIO_ODR_LOW &= (B_SELECT | ~data);
}

void ascii_write_controller(unsigned char c)
{
	ascii_ctrl_bit_set(B_E);
	GPIO_ODR_HIGH = c;
	delay_250ns();
	ascii_ctrl_bit_clear(B_E);
}

void ascii_write_cmd(unsigned char command)
{
	ascii_ctrl_bit_clear(B_RS);
	ascii_ctrl_bit_clear(B_RW);
	ascii_write_controller(command);
}

void ascii_write_data(unsigned char data)
{
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_clear(B_RW);
	ascii_write_controller(data);
}

unsigned char ascii_read_controller(void)
{
    unsigned char rv; 
    ascii_ctrl_bit_set(B_E);
    delay_250ns();
    delay_250ns();
    rv= GPIO_IDR_HIGH;   /*läser från data bussen*/
    ascii_ctrl_bit_clear(B_E); 
    return rv; 
}

unsigned char ascii_read_status()
{   
    unsigned char rv;
    GPIO_MODER &= 0x0000ffff;
    ascii_ctrl_bit_clear(B_RS);
    ascii_ctrl_bit_set(B_RW); 
    rv = ascii_read_controller(); 
    GPIO_MODER |= 0x55550000;
    return rv; 
}

unsigned char ascii_read_data(void)
{
	unsigned char rv;
	GPIO_MODER &= 0x0000FFFF;
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_set(B_RW);
	rv = ascii_read_controller();
	GPIO_MODER = 0x55555555;
	return rv;
}

void ascii_command(unsigned char command, unsigned int delay)
{
	while((ascii_read_status() & 0x80) == 0x80) ;
	delay_micro(8);
	ascii_write_cmd(command);
	delay_micro(delay);
}

void ascii_init(void)
{
	RCC_AHB1ENR |= RCC_GPIO_D | RCC_GPIO_E;
	ascii_command(0x38, 39);
	ascii_command(0x0E, 39);
	ascii_command(0x01, 1530);
	ascii_command(0x00, 1530);
}

void ascii_write_char(unsigned char data)
{
	while((ascii_read_status() & 0x80) == 0x80) ;
	delay_micro(8);
	ascii_write_data(data);
	delay_micro(39);
}

void ascii_gotoxy(unsigned int row, unsigned int column)
{
	unsigned int adress = row - 1;
	if(column == 2)
	{
		adress += 0x40;
	}
	ascii_write_cmd(0x80 | adress);
}

void main(void)
{
	char* s; 
	char test_1[]= "Hej!";
	char test_2[] = "Lulle Bulle"; 
	
	app_init();
	ascii_init(); 
	ascii_gotoxy(1,1); 
	s= test_1; 
	
	while (*(s))
	{
		ascii_write_char(*(s++)); 
	}
	
	ascii_gotoxy(1,2); 
	s= test_2; 
	
	while (*(s))
	{
		ascii_write_char(*(s++)); 
	}
	while(1) ;
}
