#ifndef DISPLAY_H
#define DISPLAY_H

#include "gpio.h"

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

void graphic_ctrl_bit_set(uint8_t data);
void graphic_ctrl_bit_clear(uint8_t data);
void graphic_wait_ready();
void select_controller(uint8_t controller);
uint8_t graphic_read(uint8_t controller);
void graphic_write(uint8_t value, uint8_t controller);
void graphic_write_command(uint8_t command, uint8_t controller);
void graphic_write_data(uint8_t data, uint8_t controller);
void graphic_clear_screen();
void graphic_initialize();
void pixel(uint16_t x, uint16_t y, uint8_t set);

#endif