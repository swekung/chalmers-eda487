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
  27              		.file 1 "/Users/Simon/chalmers-eda487/Final/startup.c"
   1:/Users/Simon/chalmers-eda487/Final/startup.c **** /*
   2:/Users/Simon/chalmers-eda487/Final/startup.c ****  * 	startup.c
   3:/Users/Simon/chalmers-eda487/Final/startup.c ****  *
   4:/Users/Simon/chalmers-eda487/Final/startup.c ****  */
   5:/Users/Simon/chalmers-eda487/Final/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:/Users/Simon/chalmers-eda487/Final/startup.c **** 
   7:/Users/Simon/chalmers-eda487/Final/startup.c **** void startup ( void )
   8:/Users/Simon/chalmers-eda487/Final/startup.c **** {
  28              		.loc 1 8 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
   9:/Users/Simon/chalmers-eda487/Final/startup.c **** asm volatile(
  33              		.loc 1 9 0
  34              		.syntax divided
  35              	@ 9 "/Users/Simon/chalmers-eda487/Final/startup.c" 1
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  10:/Users/Simon/chalmers-eda487/Final/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:/Users/Simon/chalmers-eda487/Final/startup.c **** 	" MOV SP,R0\n"
  12:/Users/Simon/chalmers-eda487/Final/startup.c **** 	" BL main\n"				/* call main */
  13:/Users/Simon/chalmers-eda487/Final/startup.c **** 	".L1: B .L1\n"				/* never return */
  14:/Users/Simon/chalmers-eda487/Final/startup.c **** 	) ;
  15:/Users/Simon/chalmers-eda487/Final/startup.c **** }
  42              		.loc 1 15 0
  43              		.thumb
  44              		.syntax unified
  45 000a C046     		nop
  46              		.cfi_endproc
  47              	.LFE0:
  49              		.text
  50              		.align	2
  51              		.global	main
  52              		.code	16
  53              		.thumb_func
  55              	main:
  56              	.LFB1:
  16:/Users/Simon/chalmers-eda487/Final/startup.c **** 
  17:/Users/Simon/chalmers-eda487/Final/startup.c **** #include "types.h"
  18:/Users/Simon/chalmers-eda487/Final/startup.c **** #include "usart.h"
  19:/Users/Simon/chalmers-eda487/Final/startup.c **** 
  20:/Users/Simon/chalmers-eda487/Final/startup.c **** void main(void)
  21:/Users/Simon/chalmers-eda487/Final/startup.c **** {
  57              		.loc 1 21 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 8
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 90B5     		push	{r4, r7, lr}
  62              		.cfi_def_cfa_offset 12
  63              		.cfi_offset 4, -12
  64              		.cfi_offset 7, -8
  65              		.cfi_offset 14, -4
  66 0002 83B0     		sub	sp, sp, #12
  67              		.cfi_def_cfa_offset 24
  68 0004 00AF     		add	r7, sp, #0
  69              		.cfi_def_cfa_register 7
  22:/Users/Simon/chalmers-eda487/Final/startup.c **** 	uint8_t c;
  23:/Users/Simon/chalmers-eda487/Final/startup.c **** 	iniuart();
  70              		.loc 1 23 0
  71 0006 FFF7FEFF 		bl	iniuart
  72              	.L4:
  73              	.LBB2:
  24:/Users/Simon/chalmers-eda487/Final/startup.c **** 	while(1)
  25:/Users/Simon/chalmers-eda487/Final/startup.c **** 	{
  26:/Users/Simon/chalmers-eda487/Final/startup.c **** 		uint8_t c = tstchar();
  74              		.loc 1 26 0
  75 000a FC1D     		adds	r4, r7, #7
  76 000c FFF7FEFF 		bl	tstchar
  77 0010 0300     		movs	r3, r0
  78 0012 2370     		strb	r3, [r4]
  27:/Users/Simon/chalmers-eda487/Final/startup.c **** 		if(c != 0)
  79              		.loc 1 27 0
  80 0014 FB1D     		adds	r3, r7, #7
  81 0016 1B78     		ldrb	r3, [r3]
  82 0018 002B     		cmp	r3, #0
  83 001a F6D0     		beq	.L4
  28:/Users/Simon/chalmers-eda487/Final/startup.c **** 		{
  29:/Users/Simon/chalmers-eda487/Final/startup.c **** 			outchar(c);
  84              		.loc 1 29 0
  85 001c FB1D     		adds	r3, r7, #7
  86 001e 1B78     		ldrb	r3, [r3]
  87 0020 1800     		movs	r0, r3
  88 0022 FFF7FEFF 		bl	outchar
  89              	.LBE2:
  30:/Users/Simon/chalmers-eda487/Final/startup.c **** 		}
  31:/Users/Simon/chalmers-eda487/Final/startup.c **** 	}
  90              		.loc 1 31 0
  91 0026 F0E7     		b	.L4
  92              		.cfi_endproc
  93              	.LFE1:
  95              	.Letext0:
  96              		.file 2 "/Users/Simon/chalmers-eda487/libraries/types.h"
