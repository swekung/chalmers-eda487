/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

#define SIMULATOR

typedef unsigned int uint32_t;
typedef unsigned short uint16_t;
typedef unsigned char uint8_t;
typedef signed int sint32_t;
typedef signed short sint16_t;
typedef signed char sint8_t;

/*struct som innehåller definition av en gpio port
 * structuren som i boken s.67*/
typedef struct gpio
{
    uint32_t moder; 
    uint16_t otyper;
    uint16_t unused0;  /* vi hoppar över 16 bits, som i figuren*/
    uint32_t ospeedr; 
    uint32_t pupdr; 
    uint8_t idr_low;  
    uint8_t idr_high; 
    uint16_t unused1; 
    uint8_t odr_low;
    uint8_t odr_high; 
    uint16_t unused2; 
    uint32_t bsrr; 
    struct { unsigned int lckr : 17;} lckr;   /*bitfield: tilldela ett värde som har 17 bitar inuti en struct som tar 32 bitar*/
    uint32_t afrl;
    uint32_t afrh;
    
} GPIO; 

 /*alias pekare till a volatile struct gpio. Vid variabels deklaration, 
  * det skapas en pekare till en IO port som är volatile*/
typedef volatile GPIO* gpioptr;   

/*Definition för alla 5 portar, 1 kbyte från varandra.
 *Först kastas minnsadress. Minnessadressen är en heltal, så måste den kastas till en pekare:
 * i C kan man inte skriva direkt till en minnessadress.
 * Sen ska den derefereras för att läsa och skriva från och till minnet */
#define GPIO_A (*((gpioptr)0x40020000))  
#define GPIO_B (*((gpioptr)0x40020400))
#define GPIO_C (*((gpioptr)0x40020800)) 
#define GPIO_D (*((gpioptr)0x40020c00))
#define GPIO_E (*((gpioptr)0x40021000))

/* aktivera clockan
Start: 		LDR	R6,=0x00000018
		    LDR	R4,=0x40023830
            LDR	R5,[R4]
            ORR	R5,R5,R6
            STR	R5,[R4] */
#define RCC_AHB1ENR (*((uint32_t* ) 0x40023830))
/*bit 4, satt för aktivera clockan*/
#define RCC_GPIO_D 0x00000008
/*bit 5*/ 
#define RCC_GPIO_E 0x00000010 

typedef volatile int* port32ptr;
typedef volatile long* port16ptr;
typedef volatile char* port8ptr;
#define SYS_TICK 0xE000E010
#define STK_CTRL *((port32ptr) SYS_TICK)
#define STK_LOAD *((port32ptr)(SYS_TICK + 0x04))
#define STK_VAL *((port32ptr)(SYS_TICK + 0x08))

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

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}

void init_app()
{
	GPIO_E.moder = 0x55555555;
	GPIO_E.ospeedr = 0x55555555;
}

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
	for(int i = 0; i <= us*4; i++)
	{
		delay_250ns();
	}
}

void delay_milli(unsigned int ms)
{
	while(ms--){
		delay_micro(2);
	}
}


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
	graphic_write_command(LCD_OFF, B_CS1 | B_CS2);
	graphic_write_command(LCD_ON, B_CS1 | B_CS2);
	graphic_write_command(LCD_DISP_START, B_CS1 | B_CS2);
	graphic_write_command(LCD_SET_ADD, B_CS1 | B_CS2);
	graphic_write_command(LCD_SET_PAGE, B_CS1 | B_CS2);
	select_controller(0);
	
}

void main(void)
{
	init_app();
	graphic_initialize();
	graphic_clear_screen();
	graphic_write_command(LCD_SET_ADD | 10, B_CS1 | B_CS2);
	graphic_write_command(LCD_SET_PAGE | 1, B_CS1 | B_CS2);
	graphic_write_data(0xFF, B_CS1 | B_CS2);
	graphic_wait_ready();
		
}

