#ifndef DELAY_H
#define DELAY_H

#include "gpio.h"

void delay_250ns();
void delay_500ns();
void delay_micro(uint32_t us);
void delay_milli(uint32_t ms);

#endif