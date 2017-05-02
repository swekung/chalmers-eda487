typedef volatile int* port32ptr;
typedef volatile long* port16ptr;
typedef volatile char* port8ptr;
#define SYS_TICK 0xE000E010
#define STK_CTRL *((port32ptr) SYS_TICK)
#define STK_LOAD *((port32ptr)(SYS_TICK + 0x04))
#define STK_VAL *((port32ptr)(SYS_TICK + 0x08))

void delay_250ns ( void )
{
	STK_CTRL = 0;
	STK_LOAD = 42;
	STK_VAL = 0;
	STK_CTRL = 5;
	while((STK_CTRL & 0x00010000)== 0) ;
	STK_CTRL = 0;
}
void delay_500ns ( void )
{
	STK_CTRL = 0;
	STK_LOAD = 84;
	STK_VAL = 0;
	STK_CTRL = 5;
	while((STK_CTRL & 0x00010000)== 0) ;
	STK_CTRL = 0;
}
void delay_micro(unsigned int us)
{
	#ifdef SIMULATOR
		us /= slowdown_Sim;
		us++;
	#endif
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
