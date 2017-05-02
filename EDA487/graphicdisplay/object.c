#include "object.h"
#include "display.h"

#define MAX_POINTS 20



void set_object_speed(POBJECT o, sint32_t speedx, sint32_t speedy)
{
	o->dirx = speedx;
	o->diry = speedy;
}

void draw_object(POBJECT o)
{
	for (int i = 0; i < o->geo->numpoints; i++)
    {
        POINT px = o->geo->px[i];
        pixel(o->posx + px.x, o->posy + px.y, 1); 
    }
}

void clear_object(POBJECT o)
{
	for (int i = 0; i < o->geo->numpoints; i++)
    {
        POINT px = o->geo->px[i];
        pixel(o->posx + px.x, o->posy + px.y, 0); 
    }
}

void move_object(POBJECT o)
{
	clear_object(o);
	o->posx += o->dirx;
	o->posy += o->diry;
	if(o->posx < 1)
	{
		set_object_speed(o, -o->dirx, o->diry);
	}
	if(o->posx + o->geo->sizex > 128)
	{
		set_object_speed(o, -o->dirx, o->diry);
	}
	if(o->posy < 1)
	{
		set_object_speed(o, o->dirx, -o->diry);
	}
	if(o->posy + o->geo->sizey > 128)
	{
		set_object_speed(o, o->dirx, -o->diry);
	}
	draw_object(o);
}