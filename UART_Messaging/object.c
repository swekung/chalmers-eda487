#include "gpio.h"
#include "object.h"

/*
typedef struct tPoint
{
	uint8_t x;
	uint8_t y;
} POINT;

typedef struct tGeometry
{
	uint32_t numpoints;	
	uint32_t sizex;
	uint32_t sizey;
	POINT px[MAX_POINTS];
} GEOMETRY, *PGEOMETRY;

typedef struct tObject
{
	PGEOMETRY geo;
	sint32_t dirx,diry;
	uint32_t posx,posy;
	void (* draw) (struct tObj *);
	void (* clear) (struct tObj *);
	void (* move) (struct tObj *);
	void (* set_speed) (struct tObj *, sint32_t, sint32_t);
} OBJECT, *POBJECT;
*/

void set_object_speed(POBJECT o, sint32_t speedx, sint32_t speedy){
	o->dirx = speedx;
	o->diry = speedy;
}

void draw_object(POBJECT o){
	for(uint32_t i = 0; i < o->geo->numpoints; i++){
		POINT px = o->geo->px[i];
		pixel(o->posx + px.x, o->posy + px.y,1);
	}
}

void clear_object(POBJECT o){
	for(uint32_t i = 0; i < o->geo->numpoints; i++){
		POINT px = o->geo->px[i];
		pixel(o->posx + px.x, o->posy + px.y,0);
	}
}

void move_object(POBJECT o){
	clear_object(o);
	o->posx += o->dirx;
	o->posy += o->diry;
	if((o->posx < 1 ) || (o->posx > 128)){
		o->dirx = -o->dirx;
	}
	if((o->posy < 1 ) || (o->posy > 64)){
		o->diry = -o->diry;
	}
	draw_object(o);
}