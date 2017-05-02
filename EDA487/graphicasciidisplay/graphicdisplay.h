#ifndef GRAPHICDISPLAY_H
#define GRAPHICDISPLAY_H

static void graphic_ctrl_bit_set(uint8_t data);
static void graphic_ctrl_bit_clear(uint8_t data);
static void graphic_wait_ready();
static void select_controller(uint8_t controller);
static uint8_t graphic_read(uint8_t controller);
static void graphic_write(uint8_t value, uint8_t controller);
static void graphic_write_command(uint8_t command, uint8_t controller);
static void graphic_write_data(uint8_t data, uint8_t controller);
static void graphic_clear_screen();
static void graphic_intialize();

#endif