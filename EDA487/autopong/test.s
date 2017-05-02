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
  27              		.file 1 "/Users/Simon/Dropbox/EDA487/autopong/startup.c"
   1:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** /*
   2:/Users/Simon/Dropbox/EDA487/autopong/startup.c ****  * 	startup.c
   3:/Users/Simon/Dropbox/EDA487/autopong/startup.c ****  *
   4:/Users/Simon/Dropbox/EDA487/autopong/startup.c ****  */
   5:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 
   7:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** void startup ( void )
   8:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** {
  28              		.loc 1 8 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
   9:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** asm volatile(
  33              		.loc 1 9 0
  34              		.syntax divided
  35              	@ 9 "/Users/Simon/Dropbox/EDA487/autopong/startup.c" 1
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  10:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	" MOV SP,R0\n"
  12:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	" BL main\n"				/* call main */
  13:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	".L1: B .L1\n"				/* never return */
  14:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	) ;
  15:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** }
  42              		.loc 1 15 0
  43              		.thumb
  44              		.syntax unified
  45 000a C046     		nop
  46              		.cfi_endproc
  47              	.LFE0:
  49              		.data
  50              		.align	2
  53              	ball_geometry:
  54 0000 0C000000 		.word	12
  55 0004 04000000 		.word	4
  56 0008 04000000 		.word	4
  57 000c 00       		.byte	0
  58 000d 01       		.byte	1
  59 000e 00       		.byte	0
  60 000f 02       		.byte	2
  61 0010 01       		.byte	1
  62 0011 00       		.byte	0
  63 0012 01       		.byte	1
  64 0013 01       		.byte	1
  65 0014 01       		.byte	1
  66 0015 02       		.byte	2
  67 0016 01       		.byte	1
  68 0017 03       		.byte	3
  69 0018 02       		.byte	2
  70 0019 00       		.byte	0
  71 001a 02       		.byte	2
  72 001b 01       		.byte	1
  73 001c 02       		.byte	2
  74 001d 02       		.byte	2
  75 001e 02       		.byte	2
  76 001f 03       		.byte	3
  77 0020 03       		.byte	3
  78 0021 01       		.byte	1
  79 0022 03       		.byte	3
  80 0023 02       		.byte	2
  81 0024 00000000 		.space	16
  81      00000000 
  81      00000000 
  81      00000000 
  82              		.align	2
  85              	ball:
  86 0034 00000000 		.word	ball_geometry
  87 0038 00000000 		.word	0
  88 003c 00000000 		.word	0
  89 0040 01000000 		.word	1
  90 0044 01000000 		.word	1
  91 0048 00000000 		.word	draw_object
  92 004c 00000000 		.word	clear_object
  93 0050 00000000 		.word	move_object
  94 0054 00000000 		.word	set_object_speed
  95              		.text
  96              		.align	2
  97              		.global	init_app
  98              		.code	16
  99              		.thumb_func
 101              	init_app:
 102              	.LFB1:
  16:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 
  17:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** #define SIMULATOR
  18:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 
  19:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** #include "gpio.h"
  20:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** #include "display.h"
  21:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** #include "delay.h"
  22:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** #include "object.h"
  23:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** #include "keypad.h"
  24:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 
  25:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** static GEOMETRY ball_geometry = {
  26:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	12,         /* antal punkter */
  27:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	4, 4,       /* bredd och höjd */
  28:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	{
  29:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 			   {0,1}, {0,2},
  30:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 		{1,0}, {1,1}, {1,2}, {1,3},
  31:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 		{2,0}, {2,1}, {2,2}, {2,3},
  32:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 			   {3,1}, {3,2}
  33:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	}
  34:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** };
  35:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 
  36:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** static OBJECT ball = {
  37:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	&ball_geometry,
  38:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	0, 0,
  39:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	1, 1,
  40:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	draw_object,
  41:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	clear_object,
  42:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	move_object,
  43:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	set_object_speed
  44:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** };
  45:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 
  46:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** void init_app()
  47:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** {
 103              		.loc 1 47 0
 104              		.cfi_startproc
 105              		@ args = 0, pretend = 0, frame = 0
 106              		@ frame_needed = 1, uses_anonymous_args = 0
 107 0000 80B5     		push	{r7, lr}
 108              		.cfi_def_cfa_offset 8
 109              		.cfi_offset 7, -8
 110              		.cfi_offset 14, -4
 111 0002 00AF     		add	r7, sp, #0
 112              		.cfi_def_cfa_register 7
  48:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	GPIO_E.moder = 0x55555555;
 113              		.loc 1 48 0
 114 0004 0D4B     		ldr	r3, .L3
 115 0006 0E4A     		ldr	r2, .L3+4
 116 0008 1A60     		str	r2, [r3]
  49:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	GPIO_E.ospeedr = 0x55555555;
 117              		.loc 1 49 0
 118 000a 0C4B     		ldr	r3, .L3
 119 000c 0C4A     		ldr	r2, .L3+4
 120 000e 9A60     		str	r2, [r3, #8]
  50:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	GPIO_D.moder = 0x55005555;
 121              		.loc 1 50 0
 122 0010 0C4B     		ldr	r3, .L3+8
 123 0012 0D4A     		ldr	r2, .L3+12
 124 0014 1A60     		str	r2, [r3]
  51:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	GPIO_D.otyper &= 0x00FF;
 125              		.loc 1 51 0
 126 0016 0B4A     		ldr	r2, .L3+8
 127 0018 0A4B     		ldr	r3, .L3+8
 128 001a 9B88     		ldrh	r3, [r3, #4]
 129 001c 9BB2     		uxth	r3, r3
 130 001e FF21     		movs	r1, #255
 131 0020 0B40     		ands	r3, r1
 132 0022 9BB2     		uxth	r3, r3
 133 0024 9380     		strh	r3, [r2, #4]
  52:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	GPIO_D.pupdr |= 0x00AA0000;
 134              		.loc 1 52 0
 135 0026 074B     		ldr	r3, .L3+8
 136 0028 064A     		ldr	r2, .L3+8
 137 002a D268     		ldr	r2, [r2, #12]
 138 002c AA21     		movs	r1, #170
 139 002e 0904     		lsls	r1, r1, #16
 140 0030 0A43     		orrs	r2, r1
 141 0032 DA60     		str	r2, [r3, #12]
  53:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** }
 142              		.loc 1 53 0
 143 0034 C046     		nop
 144 0036 BD46     		mov	sp, r7
 145              		@ sp needed
 146 0038 80BD     		pop	{r7, pc}
 147              	.L4:
 148 003a C046     		.align	2
 149              	.L3:
 150 003c 00100240 		.word	1073876992
 151 0040 55555555 		.word	1431655765
 152 0044 000C0240 		.word	1073875968
 153 0048 55550055 		.word	1426085205
 154              		.cfi_endproc
 155              	.LFE1:
 157              		.align	2
 158              		.global	main
 159              		.code	16
 160              		.thumb_func
 162              	main:
 163              	.LFB2:
  54:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 
  55:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** void main(void)
  56:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** {
 164              		.loc 1 56 0
 165              		.cfi_startproc
 166              		@ args = 0, pretend = 0, frame = 8
 167              		@ frame_needed = 1, uses_anonymous_args = 0
 168 004c 90B5     		push	{r4, r7, lr}
 169              		.cfi_def_cfa_offset 12
 170              		.cfi_offset 4, -12
 171              		.cfi_offset 7, -8
 172              		.cfi_offset 14, -4
 173 004e 83B0     		sub	sp, sp, #12
 174              		.cfi_def_cfa_offset 24
 175 0050 00AF     		add	r7, sp, #0
 176              		.cfi_def_cfa_register 7
  57:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	POBJECT p = &ball;
 177              		.loc 1 57 0
 178 0052 234B     		ldr	r3, .L14
 179 0054 7B60     		str	r3, [r7, #4]
  58:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	init_app();
 180              		.loc 1 58 0
 181 0056 FFF7FEFF 		bl	init_app
  59:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	graphic_initialize();
 182              		.loc 1 59 0
 183 005a FFF7FEFF 		bl	graphic_initialize
 184              	.L13:
 185              	.LBB2:
  60:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** #ifndef SIMULATOR
  61:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	graphic_clear_screen();
  62:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** #endif
  63:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 
  64:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	
  65:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	while(1)
  66:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	{
  67:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 		uint8_t temp = keyb();
 186              		.loc 1 67 0
 187 005e FC1C     		adds	r4, r7, #3
 188 0060 FFF7FEFF 		bl	keyb
 189 0064 0300     		movs	r3, r0
 190 0066 2370     		strb	r3, [r4]
  68:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 		switch(temp){
 191              		.loc 1 68 0
 192 0068 FB1C     		adds	r3, r7, #3
 193 006a 1B78     		ldrb	r3, [r3]
 194 006c 042B     		cmp	r3, #4
 195 006e 10D0     		beq	.L7
 196 0070 02DC     		bgt	.L8
 197 0072 022B     		cmp	r3, #2
 198 0074 05D0     		beq	.L9
 199 0076 22E0     		b	.L6
 200              	.L8:
 201 0078 062B     		cmp	r3, #6
 202 007a 19D0     		beq	.L10
 203 007c 082B     		cmp	r3, #8
 204 007e 10D0     		beq	.L11
 205 0080 1DE0     		b	.L6
 206              	.L9:
  69:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 			case 2: p->set_speed(p, 0 ,-1); break;
 207              		.loc 1 69 0
 208 0082 7B68     		ldr	r3, [r7, #4]
 209 0084 1B6A     		ldr	r3, [r3, #32]
 210 0086 0122     		movs	r2, #1
 211 0088 5242     		rsbs	r2, r2, #0
 212 008a 7868     		ldr	r0, [r7, #4]
 213 008c 0021     		movs	r1, #0
 214 008e 9847     		blx	r3
 215 0090 1CE0     		b	.L12
 216              	.L7:
  70:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 			case 4: p->set_speed(p, -1, 0); break;
 217              		.loc 1 70 0
 218 0092 7B68     		ldr	r3, [r7, #4]
 219 0094 1B6A     		ldr	r3, [r3, #32]
 220 0096 0122     		movs	r2, #1
 221 0098 5142     		rsbs	r1, r2, #0
 222 009a 7868     		ldr	r0, [r7, #4]
 223 009c 0022     		movs	r2, #0
 224 009e 9847     		blx	r3
 225 00a0 14E0     		b	.L12
 226              	.L11:
  71:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 			case 8: p->set_speed(p, 0, 1); break;
 227              		.loc 1 71 0
 228 00a2 7B68     		ldr	r3, [r7, #4]
 229 00a4 1B6A     		ldr	r3, [r3, #32]
 230 00a6 7868     		ldr	r0, [r7, #4]
 231 00a8 0122     		movs	r2, #1
 232 00aa 0021     		movs	r1, #0
 233 00ac 9847     		blx	r3
 234 00ae 0DE0     		b	.L12
 235              	.L10:
  72:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 			case 6: p->set_speed(p, 1, 0); break;
 236              		.loc 1 72 0
 237 00b0 7B68     		ldr	r3, [r7, #4]
 238 00b2 1B6A     		ldr	r3, [r3, #32]
 239 00b4 7868     		ldr	r0, [r7, #4]
 240 00b6 0022     		movs	r2, #0
 241 00b8 0121     		movs	r1, #1
 242 00ba 9847     		blx	r3
 243 00bc 06E0     		b	.L12
 244              	.L6:
  73:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 			default: p->set_speed(p, 0, 0); break;
 245              		.loc 1 73 0
 246 00be 7B68     		ldr	r3, [r7, #4]
 247 00c0 1B6A     		ldr	r3, [r3, #32]
 248 00c2 7868     		ldr	r0, [r7, #4]
 249 00c4 0022     		movs	r2, #0
 250 00c6 0021     		movs	r1, #0
 251 00c8 9847     		blx	r3
 252 00ca C046     		nop
 253              	.L12:
  74:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 		}
  75:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 		p->move(p);
 254              		.loc 1 75 0
 255 00cc 7B68     		ldr	r3, [r7, #4]
 256 00ce DB69     		ldr	r3, [r3, #28]
 257 00d0 7A68     		ldr	r2, [r7, #4]
 258 00d2 1000     		movs	r0, r2
 259 00d4 9847     		blx	r3
  76:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 		delay_milli(40);
 260              		.loc 1 76 0
 261 00d6 2820     		movs	r0, #40
 262 00d8 FFF7FEFF 		bl	delay_milli
 263              	.LBE2:
  77:/Users/Simon/Dropbox/EDA487/autopong/startup.c **** 	}
 264              		.loc 1 77 0
 265 00dc BFE7     		b	.L13
 266              	.L15:
 267 00de C046     		.align	2
 268              	.L14:
 269 00e0 34000000 		.word	ball
 270              		.cfi_endproc
 271              	.LFE2:
 273              	.Letext0:
 274              		.file 2 "/Users/Simon/Dropbox/EDA487/autopong/gpio.h"
 275              		.file 3 "/Users/Simon/Dropbox/EDA487/autopong/object.h"
