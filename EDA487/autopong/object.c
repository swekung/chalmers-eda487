#include "object.h"
#include "display.h"

#define MAX_POINTS 20

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

void set_object_speed(POBJECT o, sint32_t speedx, sint32_t speedy)
{
	o.dirx = speedx;
	o.diry = speedy;
}

void draw_object(POBJECT o)
{
	for(uint32_t i = 0; i < o.px.numpoints; i++)
	{
		pixel(o.geo.px[i][0]+o.posx, o.geo.px[i][1]+o.posy, 1);
	}
}

void clear_object(POBJECT o)
{
	for(uint32_t i = 0; i < o.px.numpoints; i++)
	{
		pixel(o.geo.px[i][0]+o.posx, o.geo.px[i][1]+o.posy, 0);
	}
}

void move_object(POBJECT o)
{
	clear_object(o);
	o.posx += o.dirx;
	o.posy += o.diry;
	if(o.posx < 1)
	{
		set_object_speed(o, -o.dirx, dirx);
	}
	if(o.posx + o.geo.sizex > 128)
	{
		set_object_speed(o, -o.dirx, dirx);
	}
	if(o.posy < 1)
	{
		set_object_speed(o, -o.diry, diry);
	}
	if(o.posy + o.geo.sizey > 128)
	{
		set_object_speed(o, -o.diry, diry);
	}
	draw_object(o);
}