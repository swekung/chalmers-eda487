#ifndef OBJECT_H
#define OBJECT_H

#include "gpio.h"

#define MAX_POINTS 20

typedef struct tPoint{
	uint8_t x;
	uint8_t y; 
}POINT;

typedef struct tGeometry{
	uint32_t numpoints;
	uint32_t sizex;
	uint32_t sizey;
	POINT px[MAX_POINTS];
} GEOMETRY, *PGEOMETRY;

typedef struct tObj{
	PGEOMETRY geo;
	uint32_t dirx, diry;
	uint32_t posx, posy;
	void (*draw) (struct tObj*);
	void (*clear) (struct tObj*);
	void (*move) (struct tObj*);
	void (*set_speed) (struct tObj*, uint32_t, uint32_t);
}OBJECT, *POBJECT;

void set_object_speed(POBJECT o, sint32_t speedx, sint32_t speedy);
void draw_object(POBJECT o);
void clear_object(POBJECT o);
void move_object(POBJECT o);

#endif