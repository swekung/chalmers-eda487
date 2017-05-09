/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	".L1: B .L1\n"				/* never return */
	) ;
}

#include "types.h"
#include "gpio.h"
#include "irq.h"
#include "exti.h"
#include "syscfg.h"

uint16_t count = 0;

void irq_handler()
{
	count++;
	EXTI.pr |= (1 << 3);
}


void irq_init()
{
	SYSCFG.exticr1 &= 0x0fff;  /* Negates upper 4 bits */
	SYSCFG.exticr1 |= 0x4000;  /* Configures for IRQ3 on ETIX3 */
	EXTI.imr |= (1 << 3); /* Configures EXTI3 to generate interrupts */
	EXTI.ftsr |= (1 << 3); /* Configures EXTI3 to trigger on negative flank */
	IRQ.extiLine3 = irq_handler; /* Sets the function irq_handler to handle interrupts from EXTI3 */
	*((uint32_t *) 0xE000E100) |= (1<<9); /* Sets NVIC priority */
	RCC_APB2ENR |= 0x4000; /* Sets clock to enable interrupts */
	
}

void app_init()
{
	GPIO_D.moder = 0x00005555;
	GPIO_E.moder = 0x00005500;
}
void main(void)
{
	app_init();
	irq_init();
	while(1)
	{
		GPIO_D.odr_low = count;
	}
}

