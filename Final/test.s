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
  27              		.file 1 "C:/Users/Ludvig/Documents/chalmers-eda487/Final/startup.c"
   1:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** /*
   2:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c ****  * 	startup.c
   3:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c ****  *
   4:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c ****  */
   5:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 
   7:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** void startup ( void )
   8:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** {
  28              		.loc 1 8 0
  29              		.cfi_startproc
   9:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** asm volatile(
  30              		.loc 1 9 0
  31              		.syntax divided
  32              	@ 9 "C:/Users/Ludvig/Documents/chalmers-eda487/Final/startup.c" 1
  33 0000 0248     		 LDR R0,=0x2001C000
  34 0002 8546     	 MOV SP,R0
  35 0004 FFF7FEFF 	 BL main
  36 0008 FEE7     	.L1: B .L1
  37              	
  38              	@ 0 "" 2
  10:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 	".L1: B .L1\n"				/* never return */
  14:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 	) ;
  15:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** }
  39              		.loc 1 15 0
  40              		.thumb
  41              		.syntax unified
  42 000a C046     		nop
  43              		.cfi_endproc
  44              	.LFE0:
  46              		.text
  47              		.align	2
  48              		.global	main
  49              		.code	16
  50              		.thumb_func
  52              	main:
  53              	.LFB1:
  16:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 
  17:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** #include "types.h"
  18:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** #include "usart.h"
  19:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 
  20:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** void main(void)
  21:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** {
  54              		.loc 1 21 0
  55              		.cfi_startproc
  56 0000 90B5     		push	{r4, r7, lr}
  57              		.cfi_def_cfa_offset 12
  58              		.cfi_offset 4, -12
  59              		.cfi_offset 7, -8
  60              		.cfi_offset 14, -4
  61 0002 83B0     		sub	sp, sp, #12
  62              		.cfi_def_cfa_offset 24
  63 0004 00AF     		add	r7, sp, #0
  64              		.cfi_def_cfa_register 7
  22:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 	uint8_t c;
  23:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 	iniuart();
  65              		.loc 1 23 0
  66 0006 FFF7FEFF 		bl	iniuart
  67              	.L4:
  68              	.LBB2:
  24:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 	while(1)
  25:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 	{
  26:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 		uint8_t c = tstchar();
  69              		.loc 1 26 0
  70 000a FC1D     		adds	r4, r7, #7
  71 000c FFF7FEFF 		bl	tstchar
  72 0010 0300     		movs	r3, r0
  73 0012 2370     		strb	r3, [r4]
  27:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 		if(c != 0)
  74              		.loc 1 27 0
  75 0014 FB1D     		adds	r3, r7, #7
  76 0016 1B78     		ldrb	r3, [r3]
  77 0018 002B     		cmp	r3, #0
  78 001a F6D0     		beq	.L4
  28:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 		{
  29:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 			outchar(c);
  79              		.loc 1 29 0
  80 001c FB1D     		adds	r3, r7, #7
  81 001e 1B78     		ldrb	r3, [r3]
  82 0020 1800     		movs	r0, r3
  83 0022 FFF7FEFF 		bl	outchar
  84              	.LBE2:
  30:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 		}
  31:C:/Users/Ludvig/Documents/chalmers-eda487/Final\startup.c **** 	}
  85              		.loc 1 31 0
  86 0026 F0E7     		b	.L4
  87              		.cfi_endproc
  88              	.LFE1:
  90              	.Letext0:
  91              		.file 2 "C:\\Users\\Ludvig\\Documents\\chalmers-eda487\\libraries/types.h"
