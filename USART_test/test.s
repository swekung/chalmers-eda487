   1              		.syntax unified
   2              		.arch armv6-m
   3              		.fpu softvfp
   4              		.eabi_attribute 20, 1
   5              		.eabi_attribute 21, 1
   6              		.eabi_attribute 23, 3
   7              		.eabi_attribute 24, 1
   8              		.eabi_attribute 25, 1
   9              		.eabi_attribute 26, 1
  10              		.eabi_attribute 30, 6
  11              		.eabi_attribute 34, 0
  12              		.eabi_attribute 18, 4
  13              		.thumb
  14              		.syntax unified
  15              		.file	"startup.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.section	.start_section,"ax",%progbits
  20              		.align	2
  21              		.global	startup
  22              		.code	16
  23              		.thumb_func
  25              	startup:
  26              	.LFB0:
  27              		.file 1 "/Users/Simon/chalmers-eda487/USART_test/startup.c"
   1:/Users/Simon/chalmers-eda487/USART_test/startup.c **** /*
   2:/Users/Simon/chalmers-eda487/USART_test/startup.c ****  * 	startup.c
   3:/Users/Simon/chalmers-eda487/USART_test/startup.c ****  *
   4:/Users/Simon/chalmers-eda487/USART_test/startup.c ****  */
   5:/Users/Simon/chalmers-eda487/USART_test/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 
   7:/Users/Simon/chalmers-eda487/USART_test/startup.c **** void startup ( void )
   8:/Users/Simon/chalmers-eda487/USART_test/startup.c **** {
  28              		.loc 1 8 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
   9:/Users/Simon/chalmers-eda487/USART_test/startup.c **** asm volatile(
  33              		.loc 1 9 0
  34              		.syntax divided
  35              	@ 9 "/Users/Simon/chalmers-eda487/USART_test/startup.c" 1
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  10:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	" MOV SP,R0\n"
  12:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	" BL main\n"				/* call main */
  13:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	".L1: B .L1\n"				/* never return */
  14:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	) ;
  15:/Users/Simon/chalmers-eda487/USART_test/startup.c **** }
  42              		.loc 1 15 0
  43              		.thumb
  44              		.syntax unified
  45 000a C046     		nop
  46              		.cfi_endproc
  47              	.LFE0:
  49              		.text
  50              		.align	2
  51              		.global	app_init
  52              		.code	16
  53              		.thumb_func
  55              	app_init:
  56              	.LFB1:
  16:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 
  17:/Users/Simon/chalmers-eda487/USART_test/startup.c **** #include "types.h"
  18:/Users/Simon/chalmers-eda487/USART_test/startup.c **** #include "usart.h"
  19:/Users/Simon/chalmers-eda487/USART_test/startup.c **** #include "display.h"
  20:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 
  21:/Users/Simon/chalmers-eda487/USART_test/startup.c **** void app_init()
  22:/Users/Simon/chalmers-eda487/USART_test/startup.c **** {
  57              		.loc 1 22 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  23:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	
  24:/Users/Simon/chalmers-eda487/USART_test/startup.c **** }
  67              		.loc 1 24 0
  68 0004 C046     		nop
  69 0006 BD46     		mov	sp, r7
  70              		@ sp needed
  71 0008 80BD     		pop	{r7, pc}
  72              		.cfi_endproc
  73              	.LFE1:
  75 000a C046     		.align	2
  76              		.global	main
  77              		.code	16
  78              		.thumb_func
  80              	main:
  81              	.LFB2:
  25:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 
  26:/Users/Simon/chalmers-eda487/USART_test/startup.c **** void main(void)
  27:/Users/Simon/chalmers-eda487/USART_test/startup.c **** {
  82              		.loc 1 27 0
  83              		.cfi_startproc
  84              		@ args = 0, pretend = 0, frame = 8
  85              		@ frame_needed = 1, uses_anonymous_args = 0
  86 000c 90B5     		push	{r4, r7, lr}
  87              		.cfi_def_cfa_offset 12
  88              		.cfi_offset 4, -12
  89              		.cfi_offset 7, -8
  90              		.cfi_offset 14, -4
  91 000e 83B0     		sub	sp, sp, #12
  92              		.cfi_def_cfa_offset 24
  93 0010 00AF     		add	r7, sp, #0
  94              		.cfi_def_cfa_register 7
  28:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t c;
  29:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	app_init();
  95              		.loc 1 29 0
  96 0012 FFF7FEFF 		bl	app_init
  30:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	iniuart();
  97              		.loc 1 30 0
  98 0016 FFF7FEFF 		bl	iniuart
  99              	.L4:
 100              	.LBB2:
  31:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	while(1)
  32:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	{
  33:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 		uint8_t c = tstchar();
 101              		.loc 1 33 0 discriminator 1
 102 001a FC1D     		adds	r4, r7, #7
 103 001c FFF7FEFF 		bl	tstchar
 104 0020 0300     		movs	r3, r0
 105 0022 2370     		strb	r3, [r4]
  34:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 		outchar(c);
 106              		.loc 1 34 0 discriminator 1
 107 0024 FB1D     		adds	r3, r7, #7
 108 0026 1B78     		ldrb	r3, [r3]
 109 0028 1800     		movs	r0, r3
 110 002a FFF7FEFF 		bl	outchar
 111              	.LBE2:
  35:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	}
 112              		.loc 1 35 0 discriminator 1
 113 002e F4E7     		b	.L4
 114              		.cfi_endproc
 115              	.LFE2:
 117              	.Letext0:
 118              		.file 2 "/Users/Simon/chalmers-eda487/libraries/types.h"
