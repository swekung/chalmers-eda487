#include "gpio.h"
#include "display.h"
#include "delay.h"

#define B_E 0x40
#define B_SELECT 0x04
#define B_RW 0x02
#define B_RS 0x01
#define B_RST 0x20
#define B_CS2 0x10
#define B_CS1 0x08
#define LCD_BUSY 0x80
#define LCD_OFF 0x3E
#define LCD_ON 0x3F
#define LCD_DISP_START 0xC0
#define LCD_SET_ADD 0x40
#define LCD_SET_PAGE 0xB8

void graphic_ctrl_bit_set(uint8_t data)
{
	GPIO_E.odr_low &= ~B_SELECT;
    GPIO_E.odr_low |= data;
}

void graphic_ctrl_bit_clear(uint8_t data)
{
	GPIO_E.odr_low &= ~B_SELECT;
    GPIO_E.odr_low &= ~data;
}

void graphic_wait_ready()
{
	graphic_ctrl_bit_set(B_E);
	GPIO_E.moder = 0x00005555;
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_set(B_RW);
	delay_500ns();
	do
	{
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
	} while ((GPIO_E.idr_high & LCD_BUSY) != 0);
	GPIO_E.moder = 0x55555555;
}

void select_controller(uint8_t controller)
{
	switch(controller)
	{
		case 0: graphic_ctrl_bit_clear(B_CS2);
				graphic_ctrl_bit_clear(B_CS1); break;
		case B_CS1: graphic_ctrl_bit_clear(B_CS2);
					graphic_ctrl_bit_set(B_CS1); break;
		case B_CS2: graphic_ctrl_bit_clear(B_CS1);
					graphic_ctrl_bit_set(B_CS2); break;
		case (B_CS1 | B_CS2): graphic_ctrl_bit_set(B_CS1);
					graphic_ctrl_bit_set(B_CS2); break;
	}
}

uint8_t graphic_read(uint8_t controller)
{
	graphic_ctrl_bit_set(B_E);
	GPIO_E.moder = 0x00005555;
	graphic_ctrl_bit_set(B_RW | B_RS);
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	uint8_t rv = GPIO_E.idr_high;
	graphic_ctrl_bit_clear(B_E);
	GPIO_E.moder = 0x55555555;
	if(controller == B_CS1)
	{
		select_controller(B_CS1);
		graphic_wait_ready();
	} else if(controller == B_CS2)
	{
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	return rv;
}

void graphic_write(uint8_t value, uint8_t controller)
{
	GPIO_E.odr_high = value;
	select_controller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	graphic_ctrl_bit_clear(B_E);
	if(controller & B_CS1)
	{
		select_controller(controller);
		graphic_wait_ready();
	}
	if(controller & B_CS2)
	{
		select_controller(B_CS2);
		graphic_wait_ready();
	}
	GPIO_E.odr_high = 0;
	graphic_ctrl_bit_set(B_E);
	select_controller(0);
}

void graphic_write_command(uint8_t command, uint8_t controller)
{
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_clear(B_RS | B_RW);
	graphic_write(command, controller);
}

void graphic_write_data(uint8_t data, uint8_t controller)
{
	graphic_ctrl_bit_clear(B_E);
	select_controller(controller);
	graphic_ctrl_bit_set(B_RS);
	graphic_ctrl_bit_clear(B_RW);
	graphic_write(data, controller);
}

void graphic_clear_screen()
{
	for(uint8_t page = 0; page <= 7; page++)
	{
		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
		graphic_write_command(LCD_SET_ADD | 0, B_CS1 | B_CS2);
		for(uint16_t add = 0; add <= 63; add++)
		{
			graphic_write_data(0, B_CS1 | B_CS2);
		}
	}
}

void graphic_initialize()
{
	graphic_ctrl_bit_set(B_E);
	delay_micro(10);
	graphic_ctrl_bit_clear(B_RST | B_E | B_CS1 | B_CS2);
	delay_milli(30);
	graphic_ctrl_bit_set(B_RST);
	delay_milli(100);
	graphic_write_command(LCD_OFF, B_CS1 | B_CS2);
	graphic_write_command(LCD_ON, B_CS1 | B_CS2);
	graphic_write_command(LCD_DISP_START, B_CS1 | B_CS2);
	graphic_write_command(LCD_SET_ADD, B_CS1 | B_CS2);
	graphic_write_command(LCD_SET_PAGE, B_CS1 | B_CS2);
	select_controller(0);
	
}

void pixel(uint16_t x, uint16_t y, uint8_t set)
{
	uint16_t index = (y-1) / 8;
	uint8_t mask, controller, c;
	switch((y - 1) % 8) {
    case 0:
        mask = 1; break;
    case 1:
        mask = 2; break;
    case 2:
        mask = 4; break;
    case 3:
        mask = 8; break;
    case 4:
        mask = 0x10; break;
    case 5:
        mask = 0x20; break;
    case 6:
        mask = 0x40; break;
    case 7:
        mask = 0x80; break;
    }
	if(set == 0)
	{
		mask = ~mask;
	}
	if(x > 64) {
        controller = B_CS2;
        x = x - 65;
    } else {
        controller = B_CS1;
        x = x - 1;
    }
    graphic_write_command(LCD_SET_ADD | x, controller);
    graphic_write_command(LCD_SET_PAGE | index, controller);
    c = graphic_read(controller);
    graphic_write_command(LCD_SET_ADD | x, controller);  
	if(set)
        mask = mask | c;
    else
        mask = mask & c;
    graphic_write_data(mask, controller);
}