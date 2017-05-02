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
  27              		.file 1 "/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c"
   1:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** /*
   2:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****  * 	startup.c
   3:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****  *
   4:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****  */
   5:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 
   7:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** void startup ( void )
   8:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** {
  28              		.loc 1 8 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
   9:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** asm volatile(
  33              		.loc 1 9 0
  34              		.syntax divided
  35              	@ 9 "/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c" 1
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  10:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 	" MOV SP,R0\n"
  12:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 	" BL main\n"				/* call main */
  13:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 	".L1: B .L1\n"				/* never return */
  14:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 	) ;
  15:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** }
  42              		.loc 1 15 0
  43              		.thumb
  44              		.syntax unified
  45 000a C046     		nop
  46              		.cfi_endproc
  47              	.LFE0:
  49              		.text
  50              		.align	2
  51              		.global	init_app
  52              		.code	16
  53              		.thumb_func
  55              	init_app:
  56              	.LFB1:
  16:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** #define SIMULATOR
  17:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 
  18:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** #include "display.h"
  19:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** #include "gpio.h"
  20:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** #include "delay.h"
  21:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 
  22:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 
  23:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 
  24:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** void init_app()
  25:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** {
  57              		.loc 1 25 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  26:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 	GPIO_E.moder = 0x55555555;
  67              		.loc 1 26 0
  68 0004 044B     		ldr	r3, .L3
  69 0006 054A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  27:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 	GPIO_E.ospeedr = 0x55555555;
  71              		.loc 1 27 0
  72 000a 034B     		ldr	r3, .L3
  73 000c 034A     		ldr	r2, .L3+4
  74 000e 9A60     		str	r2, [r3, #8]
  28:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** }
  75              		.loc 1 28 0
  76 0010 C046     		nop
  77 0012 BD46     		mov	sp, r7
  78              		@ sp needed
  79 0014 80BD     		pop	{r7, pc}
  80              	.L4:
  81 0016 C046     		.align	2
  82              	.L3:
  83 0018 00100240 		.word	1073876992
  84 001c 55555555 		.word	1431655765
  85              		.cfi_endproc
  86              	.LFE1:
  88              		.align	2
  89              		.global	draw_lines
  90              		.code	16
  91              		.thumb_func
  93              	draw_lines:
  94              	.LFB2:
  29:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 
  30:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** void draw_lines()
  31:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** {
  95              		.loc 1 31 0
  96              		.cfi_startproc
  97              		@ args = 0, pretend = 0, frame = 8
  98              		@ frame_needed = 1, uses_anonymous_args = 0
  99 0020 80B5     		push	{r7, lr}
 100              		.cfi_def_cfa_offset 8
 101              		.cfi_offset 7, -8
 102              		.cfi_offset 14, -4
 103 0022 82B0     		sub	sp, sp, #8
 104              		.cfi_def_cfa_offset 16
 105 0024 00AF     		add	r7, sp, #0
 106              		.cfi_def_cfa_register 7
  32:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 	uint32_t i;
  33:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 	for(i = 1; i <= 128; i++)
 107              		.loc 1 33 0
 108 0026 0123     		movs	r3, #1
 109 0028 7B60     		str	r3, [r7, #4]
 110 002a 09E0     		b	.L6
 111              	.L7:
  34:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****         pixel(i, 10, 1);
 112              		.loc 1 34 0 discriminator 3
 113 002c 7B68     		ldr	r3, [r7, #4]
 114 002e 9BB2     		uxth	r3, r3
 115 0030 0122     		movs	r2, #1
 116 0032 0A21     		movs	r1, #10
 117 0034 1800     		movs	r0, r3
 118 0036 FFF7FEFF 		bl	pixel
  33:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****         pixel(i, 10, 1);
 119              		.loc 1 33 0 discriminator 3
 120 003a 7B68     		ldr	r3, [r7, #4]
 121 003c 0133     		adds	r3, r3, #1
 122 003e 7B60     		str	r3, [r7, #4]
 123              	.L6:
  33:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****         pixel(i, 10, 1);
 124              		.loc 1 33 0 is_stmt 0 discriminator 1
 125 0040 7B68     		ldr	r3, [r7, #4]
 126 0042 802B     		cmp	r3, #128
 127 0044 F2D9     		bls	.L7
  35:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****     for(i = 1; i <= 64; i++)
 128              		.loc 1 35 0 is_stmt 1
 129 0046 0123     		movs	r3, #1
 130 0048 7B60     		str	r3, [r7, #4]
 131 004a 09E0     		b	.L8
 132              	.L9:
  36:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****         pixel(10, i, 1);
 133              		.loc 1 36 0 discriminator 3
 134 004c 7B68     		ldr	r3, [r7, #4]
 135 004e 9BB2     		uxth	r3, r3
 136 0050 0122     		movs	r2, #1
 137 0052 1900     		movs	r1, r3
 138 0054 0A20     		movs	r0, #10
 139 0056 FFF7FEFF 		bl	pixel
  35:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****     for(i = 1; i <= 64; i++)
 140              		.loc 1 35 0 discriminator 3
 141 005a 7B68     		ldr	r3, [r7, #4]
 142 005c 0133     		adds	r3, r3, #1
 143 005e 7B60     		str	r3, [r7, #4]
 144              	.L8:
  35:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****     for(i = 1; i <= 64; i++)
 145              		.loc 1 35 0 is_stmt 0 discriminator 1
 146 0060 7B68     		ldr	r3, [r7, #4]
 147 0062 402B     		cmp	r3, #64
 148 0064 F2D9     		bls	.L9
  37:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 
  38:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****     delay_milli(500);
 149              		.loc 1 38 0 is_stmt 1
 150 0066 FA23     		movs	r3, #250
 151 0068 5B00     		lsls	r3, r3, #1
 152 006a 1800     		movs	r0, r3
 153 006c FFF7FEFF 		bl	delay_milli
  39:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 
  40:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****     for(i = 1; i <= 128; i++)
 154              		.loc 1 40 0
 155 0070 0123     		movs	r3, #1
 156 0072 7B60     		str	r3, [r7, #4]
 157 0074 09E0     		b	.L10
 158              	.L11:
  41:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****         pixel(i, 10, 0);
 159              		.loc 1 41 0 discriminator 3
 160 0076 7B68     		ldr	r3, [r7, #4]
 161 0078 9BB2     		uxth	r3, r3
 162 007a 0022     		movs	r2, #0
 163 007c 0A21     		movs	r1, #10
 164 007e 1800     		movs	r0, r3
 165 0080 FFF7FEFF 		bl	pixel
  40:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****         pixel(i, 10, 0);
 166              		.loc 1 40 0 discriminator 3
 167 0084 7B68     		ldr	r3, [r7, #4]
 168 0086 0133     		adds	r3, r3, #1
 169 0088 7B60     		str	r3, [r7, #4]
 170              	.L10:
  40:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****         pixel(i, 10, 0);
 171              		.loc 1 40 0 is_stmt 0 discriminator 1
 172 008a 7B68     		ldr	r3, [r7, #4]
 173 008c 802B     		cmp	r3, #128
 174 008e F2D9     		bls	.L11
  42:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****     for(i = 1; i <= 64; i++)
 175              		.loc 1 42 0 is_stmt 1
 176 0090 0123     		movs	r3, #1
 177 0092 7B60     		str	r3, [r7, #4]
 178 0094 09E0     		b	.L12
 179              	.L13:
  43:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****         pixel(10, i, 0);
 180              		.loc 1 43 0 discriminator 3
 181 0096 7B68     		ldr	r3, [r7, #4]
 182 0098 9BB2     		uxth	r3, r3
 183 009a 0022     		movs	r2, #0
 184 009c 1900     		movs	r1, r3
 185 009e 0A20     		movs	r0, #10
 186 00a0 FFF7FEFF 		bl	pixel
  42:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****     for(i = 1; i <= 64; i++)
 187              		.loc 1 42 0 discriminator 3
 188 00a4 7B68     		ldr	r3, [r7, #4]
 189 00a6 0133     		adds	r3, r3, #1
 190 00a8 7B60     		str	r3, [r7, #4]
 191              	.L12:
  42:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****     for(i = 1; i <= 64; i++)
 192              		.loc 1 42 0 is_stmt 0 discriminator 1
 193 00aa 7B68     		ldr	r3, [r7, #4]
 194 00ac 402B     		cmp	r3, #64
 195 00ae F2D9     		bls	.L13
  44:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** }
 196              		.loc 1 44 0 is_stmt 1
 197 00b0 C046     		nop
 198 00b2 BD46     		mov	sp, r7
 199 00b4 02B0     		add	sp, sp, #8
 200              		@ sp needed
 201 00b6 80BD     		pop	{r7, pc}
 202              		.cfi_endproc
 203              	.LFE2:
 205              		.align	2
 206              		.global	main
 207              		.code	16
 208              		.thumb_func
 210              	main:
 211              	.LFB3:
  45:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** void main(void)
  46:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** {
 212              		.loc 1 46 0
 213              		.cfi_startproc
 214              		@ args = 0, pretend = 0, frame = 0
 215              		@ frame_needed = 1, uses_anonymous_args = 0
 216 00b8 80B5     		push	{r7, lr}
 217              		.cfi_def_cfa_offset 8
 218              		.cfi_offset 7, -8
 219              		.cfi_offset 14, -4
 220 00ba 00AF     		add	r7, sp, #0
 221              		.cfi_def_cfa_register 7
  47:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****     init_app();
 222              		.loc 1 47 0
 223 00bc FFF7FEFF 		bl	init_app
  48:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****     graphic_initialize();
 224              		.loc 1 48 0
 225 00c0 FFF7FEFF 		bl	graphic_initialize
  49:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c ****     graphic_clear_screen();
 226              		.loc 1 49 0
 227 00c4 FFF7FEFF 		bl	graphic_clear_screen
  50:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** 	draw_lines();
 228              		.loc 1 50 0
 229 00c8 FFF7FEFF 		bl	draw_lines
  51:/Users/Simon/Dropbox/EDA487/graphicdisplay/startup.c **** }
 230              		.loc 1 51 0
 231 00cc C046     		nop
 232 00ce BD46     		mov	sp, r7
 233              		@ sp needed
 234 00d0 80BD     		pop	{r7, pc}
 235              		.cfi_endproc
 236              	.LFE3:
 238              	.Letext0:
 239              		.file 2 "/Users/Simon/Dropbox/EDA487/graphicdisplay/gpio.h"
