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
  27              		.file 1 "/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c"
   1:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** /*
   2:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****  * 	startup.c
   3:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****  *
   4:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****  */
   5:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****  
   6:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #include "gpio.h"
   7:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
   8:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   9:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** typedef volatile int* port32ptr;
  10:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** typedef volatile long* port16ptr;
  11:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** typedef volatile char* port8ptr;
  12:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define SYS_TICK 0xE000E010
  13:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define STK_CTRL *((port32ptr) SYS_TICK)
  14:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define STK_LOAD *((port32ptr)(SYS_TICK + 0x04))
  15:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define STK_VAL *((port32ptr)(SYS_TICK + 0x08))
  16:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define GPIO_ADDR 0x40021000
  17:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define GPIO_MODER *((port32ptr)GPIO_ADDR)
  18:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define GPIO_OTYPER *((port32ptr)(GPIO_ADDR + 0x04))
  19:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define GPIO_OSPEEDR *((port32ptr)(GPIO_ADDR + 0x08))
  20:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define GPIO_PUPDR *((port32ptr)(GPIO_ADDR + 0x0C))
  21:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define GPIO_IDR_LOW *((port8ptr)(GPIO_ADDR + 0x10))
  22:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define GPIO_IDR_HIGH *((port8ptr)(GPIO_ADDR + 0x11))
  23:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define GPIO_ODR_LOW *((port8ptr)(GPIO_ADDR + 0x14))
  24:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define GPIO_ODR_HIGH *((port8ptr)(GPIO_ADDR + 0x15))
  25:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define B_E 0x40
  26:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define B_SELECT 0x04
  27:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define B_RW 0x02
  28:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define B_RS 0x01
  29:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
  30:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
  31:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
  32:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** #define SIMULATOR
  33:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** unsigned int slowdown_Sim = 1000;
  34:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
  35:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void startup ( void )
  36:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
  28              		.loc 1 36 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
  37:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** asm volatile(
  33              		.loc 1 37 0
  34              		.syntax divided
  35              	@ 37 "/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c" 1
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  38:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  39:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	" MOV SP,R0\n"
  40:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	" BL main\n"				/* call main */
  41:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	".L1: B .L1\n"				/* never return */
  42:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	);
  43:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
  42              		.loc 1 43 0
  43              		.thumb
  44              		.syntax unified
  45 000a C046     		nop
  46              		.cfi_endproc
  47              	.LFE0:
  49              		.global	slowdown_Sim
  50              		.data
  51              		.align	2
  54              	slowdown_Sim:
  55 0000 E8030000 		.word	1000
  56              		.text
  57              		.align	2
  58              		.global	app_init
  59              		.code	16
  60              		.thumb_func
  62              	app_init:
  63              	.LFB1:
  44:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
  45:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void app_init ( void )
  46:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
  64              		.loc 1 46 0
  65              		.cfi_startproc
  66              		@ args = 0, pretend = 0, frame = 0
  67              		@ frame_needed = 1, uses_anonymous_args = 0
  68 0000 80B5     		push	{r7, lr}
  69              		.cfi_def_cfa_offset 8
  70              		.cfi_offset 7, -8
  71              		.cfi_offset 14, -4
  72 0002 00AF     		add	r7, sp, #0
  73              		.cfi_def_cfa_register 7
  47:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	GPIO_MODER = 0x55555555;
  74              		.loc 1 47 0
  75 0004 044B     		ldr	r3, .L3
  76 0006 054A     		ldr	r2, .L3+4
  77 0008 1A60     		str	r2, [r3]
  48:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	GPIO_OSPEEDR = 0x55555555;
  78              		.loc 1 48 0
  79 000a 054B     		ldr	r3, .L3+8
  80 000c 034A     		ldr	r2, .L3+4
  81 000e 1A60     		str	r2, [r3]
  49:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
  82              		.loc 1 49 0
  83 0010 C046     		nop
  84 0012 BD46     		mov	sp, r7
  85              		@ sp needed
  86 0014 80BD     		pop	{r7, pc}
  87              	.L4:
  88 0016 C046     		.align	2
  89              	.L3:
  90 0018 00100240 		.word	1073876992
  91 001c 55555555 		.word	1431655765
  92 0020 08100240 		.word	1073877000
  93              		.cfi_endproc
  94              	.LFE1:
  96              		.align	2
  97              		.global	delay_250ns
  98              		.code	16
  99              		.thumb_func
 101              	delay_250ns:
 102              	.LFB2:
  50:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void delay_250ns ( void )
  51:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
 103              		.loc 1 51 0
 104              		.cfi_startproc
 105              		@ args = 0, pretend = 0, frame = 0
 106              		@ frame_needed = 1, uses_anonymous_args = 0
 107 0024 80B5     		push	{r7, lr}
 108              		.cfi_def_cfa_offset 8
 109              		.cfi_offset 7, -8
 110              		.cfi_offset 14, -4
 111 0026 00AF     		add	r7, sp, #0
 112              		.cfi_def_cfa_register 7
  52:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	STK_CTRL = 0;
 113              		.loc 1 52 0
 114 0028 0C4B     		ldr	r3, .L7
 115 002a 0022     		movs	r2, #0
 116 002c 1A60     		str	r2, [r3]
  53:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	STK_LOAD = 42;
 117              		.loc 1 53 0
 118 002e 0C4B     		ldr	r3, .L7+4
 119 0030 2A22     		movs	r2, #42
 120 0032 1A60     		str	r2, [r3]
  54:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	STK_VAL = 0;
 121              		.loc 1 54 0
 122 0034 0B4B     		ldr	r3, .L7+8
 123 0036 0022     		movs	r2, #0
 124 0038 1A60     		str	r2, [r3]
  55:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	STK_CTRL = 5;
 125              		.loc 1 55 0
 126 003a 084B     		ldr	r3, .L7
 127 003c 0522     		movs	r2, #5
 128 003e 1A60     		str	r2, [r3]
  56:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	while((STK_CTRL & 0x00010000) == 0) ;
 129              		.loc 1 56 0
 130 0040 C046     		nop
 131              	.L6:
 132              		.loc 1 56 0 is_stmt 0 discriminator 1
 133 0042 064B     		ldr	r3, .L7
 134 0044 1A68     		ldr	r2, [r3]
 135 0046 8023     		movs	r3, #128
 136 0048 5B02     		lsls	r3, r3, #9
 137 004a 1340     		ands	r3, r2
 138 004c F9D0     		beq	.L6
  57:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	STK_CTRL = 0;
 139              		.loc 1 57 0 is_stmt 1
 140 004e 034B     		ldr	r3, .L7
 141 0050 0022     		movs	r2, #0
 142 0052 1A60     		str	r2, [r3]
  58:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
 143              		.loc 1 58 0
 144 0054 C046     		nop
 145 0056 BD46     		mov	sp, r7
 146              		@ sp needed
 147 0058 80BD     		pop	{r7, pc}
 148              	.L8:
 149 005a C046     		.align	2
 150              	.L7:
 151 005c 10E000E0 		.word	-536813552
 152 0060 14E000E0 		.word	-536813548
 153 0064 18E000E0 		.word	-536813544
 154              		.cfi_endproc
 155              	.LFE2:
 157              		.align	2
 158              		.global	delay_micro
 159              		.code	16
 160              		.thumb_func
 162              	delay_micro:
 163              	.LFB3:
  59:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void delay_micro(unsigned int us)
  60:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
 164              		.loc 1 60 0
 165              		.cfi_startproc
 166              		@ args = 0, pretend = 0, frame = 16
 167              		@ frame_needed = 1, uses_anonymous_args = 0
 168 0068 80B5     		push	{r7, lr}
 169              		.cfi_def_cfa_offset 8
 170              		.cfi_offset 7, -8
 171              		.cfi_offset 14, -4
 172 006a 84B0     		sub	sp, sp, #16
 173              		.cfi_def_cfa_offset 24
 174 006c 00AF     		add	r7, sp, #0
 175              		.cfi_def_cfa_register 7
 176 006e 7860     		str	r0, [r7, #4]
 177              	.LBB2:
  61:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	for(int i = 0; i <= us*4; i++)
 178              		.loc 1 61 0
 179 0070 0023     		movs	r3, #0
 180 0072 FB60     		str	r3, [r7, #12]
 181 0074 04E0     		b	.L10
 182              	.L11:
  62:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	{
  63:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 		delay_250ns();
 183              		.loc 1 63 0 discriminator 3
 184 0076 FFF7FEFF 		bl	delay_250ns
  61:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	for(int i = 0; i <= us*4; i++)
 185              		.loc 1 61 0 discriminator 3
 186 007a FB68     		ldr	r3, [r7, #12]
 187 007c 0133     		adds	r3, r3, #1
 188 007e FB60     		str	r3, [r7, #12]
 189              	.L10:
  61:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	for(int i = 0; i <= us*4; i++)
 190              		.loc 1 61 0 is_stmt 0 discriminator 1
 191 0080 7B68     		ldr	r3, [r7, #4]
 192 0082 9A00     		lsls	r2, r3, #2
 193 0084 FB68     		ldr	r3, [r7, #12]
 194 0086 9A42     		cmp	r2, r3
 195 0088 F5D2     		bcs	.L11
 196              	.LBE2:
  64:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	}
  65:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
 197              		.loc 1 65 0 is_stmt 1
 198 008a C046     		nop
 199 008c BD46     		mov	sp, r7
 200 008e 04B0     		add	sp, sp, #16
 201              		@ sp needed
 202 0090 80BD     		pop	{r7, pc}
 203              		.cfi_endproc
 204              	.LFE3:
 206 0092 C046     		.align	2
 207              		.global	delay_milli
 208              		.code	16
 209              		.thumb_func
 211              	delay_milli:
 212              	.LFB4:
  66:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
  67:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void delay_milli(unsigned int ms)
  68:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
 213              		.loc 1 68 0
 214              		.cfi_startproc
 215              		@ args = 0, pretend = 0, frame = 8
 216              		@ frame_needed = 1, uses_anonymous_args = 0
 217 0094 80B5     		push	{r7, lr}
 218              		.cfi_def_cfa_offset 8
 219              		.cfi_offset 7, -8
 220              		.cfi_offset 14, -4
 221 0096 82B0     		sub	sp, sp, #8
 222              		.cfi_def_cfa_offset 16
 223 0098 00AF     		add	r7, sp, #0
 224              		.cfi_def_cfa_register 7
 225 009a 7860     		str	r0, [r7, #4]
  69:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	while(ms--){
 226              		.loc 1 69 0
 227 009c 02E0     		b	.L13
 228              	.L14:
  70:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 		#ifdef SIMULATOR
  71:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 			delay_micro(2);
 229              		.loc 1 71 0
 230 009e 0220     		movs	r0, #2
 231 00a0 FFF7FEFF 		bl	delay_micro
 232              	.L13:
  69:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	while(ms--){
 233              		.loc 1 69 0
 234 00a4 7B68     		ldr	r3, [r7, #4]
 235 00a6 5A1E     		subs	r2, r3, #1
 236 00a8 7A60     		str	r2, [r7, #4]
 237 00aa 002B     		cmp	r3, #0
 238 00ac F7D1     		bne	.L14
  72:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 		#else
  73:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 			delay_micro(1000); 
  74:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 		#endif
  75:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	}
  76:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
 239              		.loc 1 76 0
 240 00ae C046     		nop
 241 00b0 BD46     		mov	sp, r7
 242 00b2 02B0     		add	sp, sp, #8
 243              		@ sp needed
 244 00b4 80BD     		pop	{r7, pc}
 245              		.cfi_endproc
 246              	.LFE4:
 248 00b6 C046     		.align	2
 249              		.global	ascii_ctrl_bit_set
 250              		.code	16
 251              		.thumb_func
 253              	ascii_ctrl_bit_set:
 254              	.LFB5:
  77:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
  78:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void ascii_ctrl_bit_set(unsigned char data)
  79:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
 255              		.loc 1 79 0
 256              		.cfi_startproc
 257              		@ args = 0, pretend = 0, frame = 8
 258              		@ frame_needed = 1, uses_anonymous_args = 0
 259 00b8 80B5     		push	{r7, lr}
 260              		.cfi_def_cfa_offset 8
 261              		.cfi_offset 7, -8
 262              		.cfi_offset 14, -4
 263 00ba 82B0     		sub	sp, sp, #8
 264              		.cfi_def_cfa_offset 16
 265 00bc 00AF     		add	r7, sp, #0
 266              		.cfi_def_cfa_register 7
 267 00be 0200     		movs	r2, r0
 268 00c0 FB1D     		adds	r3, r7, #7
 269 00c2 1A70     		strb	r2, [r3]
  80:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	GPIO_ODR_LOW |= ( B_SELECT | data); 
 270              		.loc 1 80 0
 271 00c4 0749     		ldr	r1, .L16
 272 00c6 074B     		ldr	r3, .L16
 273 00c8 1B78     		ldrb	r3, [r3]
 274 00ca DAB2     		uxtb	r2, r3
 275 00cc FB1D     		adds	r3, r7, #7
 276 00ce 1B78     		ldrb	r3, [r3]
 277 00d0 1343     		orrs	r3, r2
 278 00d2 DBB2     		uxtb	r3, r3
 279 00d4 0422     		movs	r2, #4
 280 00d6 1343     		orrs	r3, r2
 281 00d8 DBB2     		uxtb	r3, r3
 282 00da 0B70     		strb	r3, [r1]
  81:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
 283              		.loc 1 81 0
 284 00dc C046     		nop
 285 00de BD46     		mov	sp, r7
 286 00e0 02B0     		add	sp, sp, #8
 287              		@ sp needed
 288 00e2 80BD     		pop	{r7, pc}
 289              	.L17:
 290              		.align	2
 291              	.L16:
 292 00e4 14100240 		.word	1073877012
 293              		.cfi_endproc
 294              	.LFE5:
 296              		.align	2
 297              		.global	ascii_ctrl_bit_clear
 298              		.code	16
 299              		.thumb_func
 301              	ascii_ctrl_bit_clear:
 302              	.LFB6:
  82:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
  83:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void ascii_ctrl_bit_clear(unsigned char data)
  84:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
 303              		.loc 1 84 0
 304              		.cfi_startproc
 305              		@ args = 0, pretend = 0, frame = 8
 306              		@ frame_needed = 1, uses_anonymous_args = 0
 307 00e8 80B5     		push	{r7, lr}
 308              		.cfi_def_cfa_offset 8
 309              		.cfi_offset 7, -8
 310              		.cfi_offset 14, -4
 311 00ea 82B0     		sub	sp, sp, #8
 312              		.cfi_def_cfa_offset 16
 313 00ec 00AF     		add	r7, sp, #0
 314              		.cfi_def_cfa_register 7
 315 00ee 0200     		movs	r2, r0
 316 00f0 FB1D     		adds	r3, r7, #7
 317 00f2 1A70     		strb	r2, [r3]
  85:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	GPIO_ODR_LOW &= (B_SELECT | ~data);
 318              		.loc 1 85 0
 319 00f4 0A49     		ldr	r1, .L19
 320 00f6 0A4B     		ldr	r3, .L19
 321 00f8 1B78     		ldrb	r3, [r3]
 322 00fa DBB2     		uxtb	r3, r3
 323 00fc 5BB2     		sxtb	r3, r3
 324 00fe FA1D     		adds	r2, r7, #7
 325 0100 1278     		ldrb	r2, [r2]
 326 0102 52B2     		sxtb	r2, r2
 327 0104 D243     		mvns	r2, r2
 328 0106 52B2     		sxtb	r2, r2
 329 0108 0420     		movs	r0, #4
 330 010a 0243     		orrs	r2, r0
 331 010c 52B2     		sxtb	r2, r2
 332 010e 1340     		ands	r3, r2
 333 0110 5BB2     		sxtb	r3, r3
 334 0112 DBB2     		uxtb	r3, r3
 335 0114 0B70     		strb	r3, [r1]
  86:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
 336              		.loc 1 86 0
 337 0116 C046     		nop
 338 0118 BD46     		mov	sp, r7
 339 011a 02B0     		add	sp, sp, #8
 340              		@ sp needed
 341 011c 80BD     		pop	{r7, pc}
 342              	.L20:
 343 011e C046     		.align	2
 344              	.L19:
 345 0120 14100240 		.word	1073877012
 346              		.cfi_endproc
 347              	.LFE6:
 349              		.align	2
 350              		.global	ascii_write_controller
 351              		.code	16
 352              		.thumb_func
 354              	ascii_write_controller:
 355              	.LFB7:
  87:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
  88:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void ascii_write_controller(unsigned char c)
  89:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
 356              		.loc 1 89 0
 357              		.cfi_startproc
 358              		@ args = 0, pretend = 0, frame = 8
 359              		@ frame_needed = 1, uses_anonymous_args = 0
 360 0124 80B5     		push	{r7, lr}
 361              		.cfi_def_cfa_offset 8
 362              		.cfi_offset 7, -8
 363              		.cfi_offset 14, -4
 364 0126 82B0     		sub	sp, sp, #8
 365              		.cfi_def_cfa_offset 16
 366 0128 00AF     		add	r7, sp, #0
 367              		.cfi_def_cfa_register 7
 368 012a 0200     		movs	r2, r0
 369 012c FB1D     		adds	r3, r7, #7
 370 012e 1A70     		strb	r2, [r3]
  90:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_ctrl_bit_set(B_E);
 371              		.loc 1 90 0
 372 0130 4020     		movs	r0, #64
 373 0132 FFF7FEFF 		bl	ascii_ctrl_bit_set
  91:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	GPIO_ODR_HIGH = c;
 374              		.loc 1 91 0
 375 0136 064A     		ldr	r2, .L22
 376 0138 FB1D     		adds	r3, r7, #7
 377 013a 1B78     		ldrb	r3, [r3]
 378 013c 1370     		strb	r3, [r2]
  92:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	delay_250ns();
 379              		.loc 1 92 0
 380 013e FFF7FEFF 		bl	delay_250ns
  93:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_ctrl_bit_clear(B_E);
 381              		.loc 1 93 0
 382 0142 4020     		movs	r0, #64
 383 0144 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  94:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
 384              		.loc 1 94 0
 385 0148 C046     		nop
 386 014a BD46     		mov	sp, r7
 387 014c 02B0     		add	sp, sp, #8
 388              		@ sp needed
 389 014e 80BD     		pop	{r7, pc}
 390              	.L23:
 391              		.align	2
 392              	.L22:
 393 0150 15100240 		.word	1073877013
 394              		.cfi_endproc
 395              	.LFE7:
 397              		.align	2
 398              		.global	ascii_write_cmd
 399              		.code	16
 400              		.thumb_func
 402              	ascii_write_cmd:
 403              	.LFB8:
  95:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
  96:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void ascii_write_cmd(unsigned char command)
  97:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
 404              		.loc 1 97 0
 405              		.cfi_startproc
 406              		@ args = 0, pretend = 0, frame = 8
 407              		@ frame_needed = 1, uses_anonymous_args = 0
 408 0154 80B5     		push	{r7, lr}
 409              		.cfi_def_cfa_offset 8
 410              		.cfi_offset 7, -8
 411              		.cfi_offset 14, -4
 412 0156 82B0     		sub	sp, sp, #8
 413              		.cfi_def_cfa_offset 16
 414 0158 00AF     		add	r7, sp, #0
 415              		.cfi_def_cfa_register 7
 416 015a 0200     		movs	r2, r0
 417 015c FB1D     		adds	r3, r7, #7
 418 015e 1A70     		strb	r2, [r3]
  98:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 419              		.loc 1 98 0
 420 0160 0120     		movs	r0, #1
 421 0162 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  99:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 422              		.loc 1 99 0
 423 0166 0220     		movs	r0, #2
 424 0168 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 100:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_write_controller(command);
 425              		.loc 1 100 0
 426 016c FB1D     		adds	r3, r7, #7
 427 016e 1B78     		ldrb	r3, [r3]
 428 0170 1800     		movs	r0, r3
 429 0172 FFF7FEFF 		bl	ascii_write_controller
 101:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
 430              		.loc 1 101 0
 431 0176 C046     		nop
 432 0178 BD46     		mov	sp, r7
 433 017a 02B0     		add	sp, sp, #8
 434              		@ sp needed
 435 017c 80BD     		pop	{r7, pc}
 436              		.cfi_endproc
 437              	.LFE8:
 439 017e C046     		.align	2
 440              		.global	ascii_write_data
 441              		.code	16
 442              		.thumb_func
 444              	ascii_write_data:
 445              	.LFB9:
 102:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
 103:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void ascii_write_data(unsigned char data)
 104:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
 446              		.loc 1 104 0
 447              		.cfi_startproc
 448              		@ args = 0, pretend = 0, frame = 8
 449              		@ frame_needed = 1, uses_anonymous_args = 0
 450 0180 80B5     		push	{r7, lr}
 451              		.cfi_def_cfa_offset 8
 452              		.cfi_offset 7, -8
 453              		.cfi_offset 14, -4
 454 0182 82B0     		sub	sp, sp, #8
 455              		.cfi_def_cfa_offset 16
 456 0184 00AF     		add	r7, sp, #0
 457              		.cfi_def_cfa_register 7
 458 0186 0200     		movs	r2, r0
 459 0188 FB1D     		adds	r3, r7, #7
 460 018a 1A70     		strb	r2, [r3]
 105:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_ctrl_bit_set(B_RS);
 461              		.loc 1 105 0
 462 018c 0120     		movs	r0, #1
 463 018e FFF7FEFF 		bl	ascii_ctrl_bit_set
 106:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 464              		.loc 1 106 0
 465 0192 0220     		movs	r0, #2
 466 0194 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 107:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_write_controller(data);
 467              		.loc 1 107 0
 468 0198 FB1D     		adds	r3, r7, #7
 469 019a 1B78     		ldrb	r3, [r3]
 470 019c 1800     		movs	r0, r3
 471 019e FFF7FEFF 		bl	ascii_write_controller
 108:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
 472              		.loc 1 108 0
 473 01a2 C046     		nop
 474 01a4 BD46     		mov	sp, r7
 475 01a6 02B0     		add	sp, sp, #8
 476              		@ sp needed
 477 01a8 80BD     		pop	{r7, pc}
 478              		.cfi_endproc
 479              	.LFE9:
 481 01aa C046     		.align	2
 482              		.global	ascii_read_controller
 483              		.code	16
 484              		.thumb_func
 486              	ascii_read_controller:
 487              	.LFB10:
 109:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
 110:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** unsigned char ascii_read_controller(void)
 111:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
 488              		.loc 1 111 0
 489              		.cfi_startproc
 490              		@ args = 0, pretend = 0, frame = 8
 491              		@ frame_needed = 1, uses_anonymous_args = 0
 492 01ac 80B5     		push	{r7, lr}
 493              		.cfi_def_cfa_offset 8
 494              		.cfi_offset 7, -8
 495              		.cfi_offset 14, -4
 496 01ae 82B0     		sub	sp, sp, #8
 497              		.cfi_def_cfa_offset 16
 498 01b0 00AF     		add	r7, sp, #0
 499              		.cfi_def_cfa_register 7
 112:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****     unsigned char rv; 
 113:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****     ascii_ctrl_bit_set(B_E);
 500              		.loc 1 113 0
 501 01b2 4020     		movs	r0, #64
 502 01b4 FFF7FEFF 		bl	ascii_ctrl_bit_set
 114:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****     delay_250ns();
 503              		.loc 1 114 0
 504 01b8 FFF7FEFF 		bl	delay_250ns
 115:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****     delay_250ns();
 505              		.loc 1 115 0
 506 01bc FFF7FEFF 		bl	delay_250ns
 116:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****     rv= GPIO_IDR_HIGH;   /*läser från data bussen*/
 507              		.loc 1 116 0
 508 01c0 064A     		ldr	r2, .L28
 509 01c2 FB1D     		adds	r3, r7, #7
 510 01c4 1278     		ldrb	r2, [r2]
 511 01c6 1A70     		strb	r2, [r3]
 117:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****     ascii_ctrl_bit_clear(B_E); 
 512              		.loc 1 117 0
 513 01c8 4020     		movs	r0, #64
 514 01ca FFF7FEFF 		bl	ascii_ctrl_bit_clear
 118:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****     return rv; 
 515              		.loc 1 118 0
 516 01ce FB1D     		adds	r3, r7, #7
 517 01d0 1B78     		ldrb	r3, [r3]
 119:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
 518              		.loc 1 119 0
 519 01d2 1800     		movs	r0, r3
 520 01d4 BD46     		mov	sp, r7
 521 01d6 02B0     		add	sp, sp, #8
 522              		@ sp needed
 523 01d8 80BD     		pop	{r7, pc}
 524              	.L29:
 525 01da C046     		.align	2
 526              	.L28:
 527 01dc 11100240 		.word	1073877009
 528              		.cfi_endproc
 529              	.LFE10:
 531              		.align	2
 532              		.global	ascii_read_status
 533              		.code	16
 534              		.thumb_func
 536              	ascii_read_status:
 537              	.LFB11:
 120:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
 121:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** unsigned char ascii_read_status()
 122:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {   
 538              		.loc 1 122 0
 539              		.cfi_startproc
 540              		@ args = 0, pretend = 0, frame = 8
 541              		@ frame_needed = 1, uses_anonymous_args = 0
 542 01e0 90B5     		push	{r4, r7, lr}
 543              		.cfi_def_cfa_offset 12
 544              		.cfi_offset 4, -12
 545              		.cfi_offset 7, -8
 546              		.cfi_offset 14, -4
 547 01e2 83B0     		sub	sp, sp, #12
 548              		.cfi_def_cfa_offset 24
 549 01e4 00AF     		add	r7, sp, #0
 550              		.cfi_def_cfa_register 7
 123:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****     unsigned char rv;
 124:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****     GPIO_MODER &= 0x0000ffff;
 551              		.loc 1 124 0
 552 01e6 0E4B     		ldr	r3, .L32
 553 01e8 0D4A     		ldr	r2, .L32
 554 01ea 1268     		ldr	r2, [r2]
 555 01ec 1204     		lsls	r2, r2, #16
 556 01ee 120C     		lsrs	r2, r2, #16
 557 01f0 1A60     		str	r2, [r3]
 125:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****     ascii_ctrl_bit_clear(B_RS);
 558              		.loc 1 125 0
 559 01f2 0120     		movs	r0, #1
 560 01f4 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 126:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****     ascii_ctrl_bit_set(B_RW); 
 561              		.loc 1 126 0
 562 01f8 0220     		movs	r0, #2
 563 01fa FFF7FEFF 		bl	ascii_ctrl_bit_set
 127:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****     rv = ascii_read_controller(); 
 564              		.loc 1 127 0
 565 01fe FC1D     		adds	r4, r7, #7
 566 0200 FFF7FEFF 		bl	ascii_read_controller
 567 0204 0300     		movs	r3, r0
 568 0206 2370     		strb	r3, [r4]
 128:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****     GPIO_MODER |= 0x55550000;
 569              		.loc 1 128 0
 570 0208 054B     		ldr	r3, .L32
 571 020a 054A     		ldr	r2, .L32
 572 020c 1268     		ldr	r2, [r2]
 573 020e 0549     		ldr	r1, .L32+4
 574 0210 0A43     		orrs	r2, r1
 575 0212 1A60     		str	r2, [r3]
 129:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c ****     return rv; 
 576              		.loc 1 129 0
 577 0214 FB1D     		adds	r3, r7, #7
 578 0216 1B78     		ldrb	r3, [r3]
 130:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
 579              		.loc 1 130 0
 580 0218 1800     		movs	r0, r3
 581 021a BD46     		mov	sp, r7
 582 021c 03B0     		add	sp, sp, #12
 583              		@ sp needed
 584 021e 90BD     		pop	{r4, r7, pc}
 585              	.L33:
 586              		.align	2
 587              	.L32:
 588 0220 00100240 		.word	1073876992
 589 0224 00005555 		.word	1431633920
 590              		.cfi_endproc
 591              	.LFE11:
 593              		.align	2
 594              		.global	ascii_read_data
 595              		.code	16
 596              		.thumb_func
 598              	ascii_read_data:
 599              	.LFB12:
 131:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
 132:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** unsigned char ascii_read_data(void)
 133:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
 600              		.loc 1 133 0
 601              		.cfi_startproc
 602              		@ args = 0, pretend = 0, frame = 8
 603              		@ frame_needed = 1, uses_anonymous_args = 0
 604 0228 90B5     		push	{r4, r7, lr}
 605              		.cfi_def_cfa_offset 12
 606              		.cfi_offset 4, -12
 607              		.cfi_offset 7, -8
 608              		.cfi_offset 14, -4
 609 022a 83B0     		sub	sp, sp, #12
 610              		.cfi_def_cfa_offset 24
 611 022c 00AF     		add	r7, sp, #0
 612              		.cfi_def_cfa_register 7
 134:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	unsigned char rv;
 135:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	GPIO_MODER &= 0x0000FFFF;
 613              		.loc 1 135 0
 614 022e 0D4B     		ldr	r3, .L36
 615 0230 0C4A     		ldr	r2, .L36
 616 0232 1268     		ldr	r2, [r2]
 617 0234 1204     		lsls	r2, r2, #16
 618 0236 120C     		lsrs	r2, r2, #16
 619 0238 1A60     		str	r2, [r3]
 136:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_ctrl_bit_set(B_RS);
 620              		.loc 1 136 0
 621 023a 0120     		movs	r0, #1
 622 023c FFF7FEFF 		bl	ascii_ctrl_bit_set
 137:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_ctrl_bit_set(B_RW);
 623              		.loc 1 137 0
 624 0240 0220     		movs	r0, #2
 625 0242 FFF7FEFF 		bl	ascii_ctrl_bit_set
 138:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	rv = ascii_read_controller();
 626              		.loc 1 138 0
 627 0246 FC1D     		adds	r4, r7, #7
 628 0248 FFF7FEFF 		bl	ascii_read_controller
 629 024c 0300     		movs	r3, r0
 630 024e 2370     		strb	r3, [r4]
 139:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	GPIO_MODER = 0x55555555;
 631              		.loc 1 139 0
 632 0250 044B     		ldr	r3, .L36
 633 0252 054A     		ldr	r2, .L36+4
 634 0254 1A60     		str	r2, [r3]
 140:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	return rv;
 635              		.loc 1 140 0
 636 0256 FB1D     		adds	r3, r7, #7
 637 0258 1B78     		ldrb	r3, [r3]
 141:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
 638              		.loc 1 141 0
 639 025a 1800     		movs	r0, r3
 640 025c BD46     		mov	sp, r7
 641 025e 03B0     		add	sp, sp, #12
 642              		@ sp needed
 643 0260 90BD     		pop	{r4, r7, pc}
 644              	.L37:
 645 0262 C046     		.align	2
 646              	.L36:
 647 0264 00100240 		.word	1073876992
 648 0268 55555555 		.word	1431655765
 649              		.cfi_endproc
 650              	.LFE12:
 652              		.align	2
 653              		.global	ascii_command
 654              		.code	16
 655              		.thumb_func
 657              	ascii_command:
 658              	.LFB13:
 142:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
 143:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void ascii_command(unsigned char command, unsigned int delay)
 144:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
 659              		.loc 1 144 0
 660              		.cfi_startproc
 661              		@ args = 0, pretend = 0, frame = 8
 662              		@ frame_needed = 1, uses_anonymous_args = 0
 663 026c 80B5     		push	{r7, lr}
 664              		.cfi_def_cfa_offset 8
 665              		.cfi_offset 7, -8
 666              		.cfi_offset 14, -4
 667 026e 82B0     		sub	sp, sp, #8
 668              		.cfi_def_cfa_offset 16
 669 0270 00AF     		add	r7, sp, #0
 670              		.cfi_def_cfa_register 7
 671 0272 0200     		movs	r2, r0
 672 0274 3960     		str	r1, [r7]
 673 0276 FB1D     		adds	r3, r7, #7
 674 0278 1A70     		strb	r2, [r3]
 145:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	while((ascii_read_status() & 0x80) == 0x80) ;
 675              		.loc 1 145 0
 676 027a C046     		nop
 677              	.L39:
 678              		.loc 1 145 0 is_stmt 0 discriminator 1
 679 027c FFF7FEFF 		bl	ascii_read_status
 680 0280 0300     		movs	r3, r0
 681 0282 5BB2     		sxtb	r3, r3
 682 0284 002B     		cmp	r3, #0
 683 0286 F9DB     		blt	.L39
 146:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	delay_micro(8);
 684              		.loc 1 146 0 is_stmt 1
 685 0288 0820     		movs	r0, #8
 686 028a FFF7FEFF 		bl	delay_micro
 147:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_write_cmd(command);
 687              		.loc 1 147 0
 688 028e FB1D     		adds	r3, r7, #7
 689 0290 1B78     		ldrb	r3, [r3]
 690 0292 1800     		movs	r0, r3
 691 0294 FFF7FEFF 		bl	ascii_write_cmd
 148:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	delay_micro(delay);
 692              		.loc 1 148 0
 693 0298 3B68     		ldr	r3, [r7]
 694 029a 1800     		movs	r0, r3
 695 029c FFF7FEFF 		bl	delay_micro
 149:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
 696              		.loc 1 149 0
 697 02a0 C046     		nop
 698 02a2 BD46     		mov	sp, r7
 699 02a4 02B0     		add	sp, sp, #8
 700              		@ sp needed
 701 02a6 80BD     		pop	{r7, pc}
 702              		.cfi_endproc
 703              	.LFE13:
 705              		.align	2
 706              		.global	ascii_init
 707              		.code	16
 708              		.thumb_func
 710              	ascii_init:
 711              	.LFB14:
 150:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
 151:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void ascii_init(void)
 152:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
 712              		.loc 1 152 0
 713              		.cfi_startproc
 714              		@ args = 0, pretend = 0, frame = 0
 715              		@ frame_needed = 1, uses_anonymous_args = 0
 716 02a8 80B5     		push	{r7, lr}
 717              		.cfi_def_cfa_offset 8
 718              		.cfi_offset 7, -8
 719              		.cfi_offset 14, -4
 720 02aa 00AF     		add	r7, sp, #0
 721              		.cfi_def_cfa_register 7
 153:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	RCC_AHB1ENR |= RCC_GPIO_D | RCC_GPIO_E;
 722              		.loc 1 153 0
 723 02ac 0D4B     		ldr	r3, .L41
 724 02ae 0D4A     		ldr	r2, .L41
 725 02b0 1268     		ldr	r2, [r2]
 726 02b2 1821     		movs	r1, #24
 727 02b4 0A43     		orrs	r2, r1
 728 02b6 1A60     		str	r2, [r3]
 154:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_command(0x38, 39);
 729              		.loc 1 154 0
 730 02b8 2721     		movs	r1, #39
 731 02ba 3820     		movs	r0, #56
 732 02bc FFF7FEFF 		bl	ascii_command
 155:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_command(0x0E, 39);
 733              		.loc 1 155 0
 734 02c0 2721     		movs	r1, #39
 735 02c2 0E20     		movs	r0, #14
 736 02c4 FFF7FEFF 		bl	ascii_command
 156:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_command(0x01, 1530);
 737              		.loc 1 156 0
 738 02c8 074B     		ldr	r3, .L41+4
 739 02ca 1900     		movs	r1, r3
 740 02cc 0120     		movs	r0, #1
 741 02ce FFF7FEFF 		bl	ascii_command
 157:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_command(0x00, 1530);
 742              		.loc 1 157 0
 743 02d2 054B     		ldr	r3, .L41+4
 744 02d4 1900     		movs	r1, r3
 745 02d6 0020     		movs	r0, #0
 746 02d8 FFF7FEFF 		bl	ascii_command
 158:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
 747              		.loc 1 158 0
 748 02dc C046     		nop
 749 02de BD46     		mov	sp, r7
 750              		@ sp needed
 751 02e0 80BD     		pop	{r7, pc}
 752              	.L42:
 753 02e2 C046     		.align	2
 754              	.L41:
 755 02e4 30380240 		.word	1073887280
 756 02e8 FA050000 		.word	1530
 757              		.cfi_endproc
 758              	.LFE14:
 760              		.align	2
 761              		.global	ascii_write_char
 762              		.code	16
 763              		.thumb_func
 765              	ascii_write_char:
 766              	.LFB15:
 159:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
 160:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void ascii_write_char(unsigned char data)
 161:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
 767              		.loc 1 161 0
 768              		.cfi_startproc
 769              		@ args = 0, pretend = 0, frame = 8
 770              		@ frame_needed = 1, uses_anonymous_args = 0
 771 02ec 80B5     		push	{r7, lr}
 772              		.cfi_def_cfa_offset 8
 773              		.cfi_offset 7, -8
 774              		.cfi_offset 14, -4
 775 02ee 82B0     		sub	sp, sp, #8
 776              		.cfi_def_cfa_offset 16
 777 02f0 00AF     		add	r7, sp, #0
 778              		.cfi_def_cfa_register 7
 779 02f2 0200     		movs	r2, r0
 780 02f4 FB1D     		adds	r3, r7, #7
 781 02f6 1A70     		strb	r2, [r3]
 162:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	while((ascii_read_status() & 0x80) == 0x80) ;
 782              		.loc 1 162 0
 783 02f8 C046     		nop
 784              	.L44:
 785              		.loc 1 162 0 is_stmt 0 discriminator 1
 786 02fa FFF7FEFF 		bl	ascii_read_status
 787 02fe 0300     		movs	r3, r0
 788 0300 5BB2     		sxtb	r3, r3
 789 0302 002B     		cmp	r3, #0
 790 0304 F9DB     		blt	.L44
 163:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	delay_micro(8);
 791              		.loc 1 163 0 is_stmt 1
 792 0306 0820     		movs	r0, #8
 793 0308 FFF7FEFF 		bl	delay_micro
 164:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_write_data(data);
 794              		.loc 1 164 0
 795 030c FB1D     		adds	r3, r7, #7
 796 030e 1B78     		ldrb	r3, [r3]
 797 0310 1800     		movs	r0, r3
 798 0312 FFF7FEFF 		bl	ascii_write_data
 165:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	delay_micro(39);
 799              		.loc 1 165 0
 800 0316 2720     		movs	r0, #39
 801 0318 FFF7FEFF 		bl	delay_micro
 166:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
 802              		.loc 1 166 0
 803 031c C046     		nop
 804 031e BD46     		mov	sp, r7
 805 0320 02B0     		add	sp, sp, #8
 806              		@ sp needed
 807 0322 80BD     		pop	{r7, pc}
 808              		.cfi_endproc
 809              	.LFE15:
 811              		.align	2
 812              		.global	ascii_gotoxy
 813              		.code	16
 814              		.thumb_func
 816              	ascii_gotoxy:
 817              	.LFB16:
 167:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
 168:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void ascii_gotoxy(unsigned int row, unsigned int column)
 169:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
 818              		.loc 1 169 0
 819              		.cfi_startproc
 820              		@ args = 0, pretend = 0, frame = 16
 821              		@ frame_needed = 1, uses_anonymous_args = 0
 822 0324 80B5     		push	{r7, lr}
 823              		.cfi_def_cfa_offset 8
 824              		.cfi_offset 7, -8
 825              		.cfi_offset 14, -4
 826 0326 84B0     		sub	sp, sp, #16
 827              		.cfi_def_cfa_offset 24
 828 0328 00AF     		add	r7, sp, #0
 829              		.cfi_def_cfa_register 7
 830 032a 7860     		str	r0, [r7, #4]
 831 032c 3960     		str	r1, [r7]
 170:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	unsigned int adress = row - 1;
 832              		.loc 1 170 0
 833 032e 7B68     		ldr	r3, [r7, #4]
 834 0330 013B     		subs	r3, r3, #1
 835 0332 FB60     		str	r3, [r7, #12]
 171:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	if(column == 2)
 836              		.loc 1 171 0
 837 0334 3B68     		ldr	r3, [r7]
 838 0336 022B     		cmp	r3, #2
 839 0338 02D1     		bne	.L46
 172:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	{
 173:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 		adress += 0x40;
 840              		.loc 1 173 0
 841 033a FB68     		ldr	r3, [r7, #12]
 842 033c 4033     		adds	r3, r3, #64
 843 033e FB60     		str	r3, [r7, #12]
 844              	.L46:
 174:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	}
 175:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_write_cmd(0x80 | adress);
 845              		.loc 1 175 0
 846 0340 FB68     		ldr	r3, [r7, #12]
 847 0342 DBB2     		uxtb	r3, r3
 848 0344 8022     		movs	r2, #128
 849 0346 5242     		rsbs	r2, r2, #0
 850 0348 1343     		orrs	r3, r2
 851 034a DBB2     		uxtb	r3, r3
 852 034c 1800     		movs	r0, r3
 853 034e FFF7FEFF 		bl	ascii_write_cmd
 176:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** }
 854              		.loc 1 176 0
 855 0352 C046     		nop
 856 0354 BD46     		mov	sp, r7
 857 0356 04B0     		add	sp, sp, #16
 858              		@ sp needed
 859 0358 80BD     		pop	{r7, pc}
 860              		.cfi_endproc
 861              	.LFE16:
 863              		.section	.rodata
 864              		.align	2
 865              	.LC0:
 866 0000 48656A21 		.ascii	"Hej!\000"
 866      00
 867 0005 000000   		.align	2
 868              	.LC2:
 869 0008 4C756C6C 		.ascii	"Lulle Bulle\000"
 869      65204275 
 869      6C6C6500 
 870              		.text
 871 035a C046     		.align	2
 872              		.global	main
 873              		.code	16
 874              		.thumb_func
 876              	main:
 877              	.LFB17:
 177:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 
 178:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** void main(void)
 179:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** {
 878              		.loc 1 179 0
 879              		.cfi_startproc
 880              		@ args = 0, pretend = 0, frame = 24
 881              		@ frame_needed = 1, uses_anonymous_args = 0
 882 035c 90B5     		push	{r4, r7, lr}
 883              		.cfi_def_cfa_offset 12
 884              		.cfi_offset 4, -12
 885              		.cfi_offset 7, -8
 886              		.cfi_offset 14, -4
 887 035e 87B0     		sub	sp, sp, #28
 888              		.cfi_def_cfa_offset 40
 889 0360 00AF     		add	r7, sp, #0
 890              		.cfi_def_cfa_register 7
 180:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	char* s; 
 181:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	char test_1[]= "Hej!";
 891              		.loc 1 181 0
 892 0362 0C23     		movs	r3, #12
 893 0364 FB18     		adds	r3, r7, r3
 894 0366 194A     		ldr	r2, .L53
 895 0368 1168     		ldr	r1, [r2]
 896 036a 1960     		str	r1, [r3]
 897 036c 1279     		ldrb	r2, [r2, #4]
 898 036e 1A71     		strb	r2, [r3, #4]
 182:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	char test_2[] = "Lulle Bulle"; 
 899              		.loc 1 182 0
 900 0370 3B00     		movs	r3, r7
 901 0372 174A     		ldr	r2, .L53+4
 902 0374 13CA     		ldmia	r2!, {r0, r1, r4}
 903 0376 13C3     		stmia	r3!, {r0, r1, r4}
 183:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	
 184:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	app_init();
 904              		.loc 1 184 0
 905 0378 FFF7FEFF 		bl	app_init
 185:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_init(); 
 906              		.loc 1 185 0
 907 037c FFF7FEFF 		bl	ascii_init
 186:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_gotoxy(1,1); 
 908              		.loc 1 186 0
 909 0380 0121     		movs	r1, #1
 910 0382 0120     		movs	r0, #1
 911 0384 FFF7FEFF 		bl	ascii_gotoxy
 187:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	s= test_1; 
 912              		.loc 1 187 0
 913 0388 0C23     		movs	r3, #12
 914 038a FB18     		adds	r3, r7, r3
 915 038c 7B61     		str	r3, [r7, #20]
 188:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	
 189:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	while (*(s))
 916              		.loc 1 189 0
 917 038e 06E0     		b	.L48
 918              	.L49:
 190:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	{
 191:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 		ascii_write_char(*(s++)); 
 919              		.loc 1 191 0
 920 0390 7B69     		ldr	r3, [r7, #20]
 921 0392 5A1C     		adds	r2, r3, #1
 922 0394 7A61     		str	r2, [r7, #20]
 923 0396 1B78     		ldrb	r3, [r3]
 924 0398 1800     		movs	r0, r3
 925 039a FFF7FEFF 		bl	ascii_write_char
 926              	.L48:
 189:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	{
 927              		.loc 1 189 0
 928 039e 7B69     		ldr	r3, [r7, #20]
 929 03a0 1B78     		ldrb	r3, [r3]
 930 03a2 002B     		cmp	r3, #0
 931 03a4 F4D1     		bne	.L49
 192:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	}
 193:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	
 194:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	ascii_gotoxy(1,2); 
 932              		.loc 1 194 0
 933 03a6 0221     		movs	r1, #2
 934 03a8 0120     		movs	r0, #1
 935 03aa FFF7FEFF 		bl	ascii_gotoxy
 195:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	s= test_2; 
 936              		.loc 1 195 0
 937 03ae 3B00     		movs	r3, r7
 938 03b0 7B61     		str	r3, [r7, #20]
 196:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	
 197:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	while (*(s))
 939              		.loc 1 197 0
 940 03b2 06E0     		b	.L50
 941              	.L51:
 198:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	{
 199:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 		ascii_write_char(*(s++)); 
 942              		.loc 1 199 0
 943 03b4 7B69     		ldr	r3, [r7, #20]
 944 03b6 5A1C     		adds	r2, r3, #1
 945 03b8 7A61     		str	r2, [r7, #20]
 946 03ba 1B78     		ldrb	r3, [r3]
 947 03bc 1800     		movs	r0, r3
 948 03be FFF7FEFF 		bl	ascii_write_char
 949              	.L50:
 197:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	{
 950              		.loc 1 197 0
 951 03c2 7B69     		ldr	r3, [r7, #20]
 952 03c4 1B78     		ldrb	r3, [r3]
 953 03c6 002B     		cmp	r3, #0
 954 03c8 F4D1     		bne	.L51
 955              	.L52:
 200:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	}
 201:/Users/Simon/Dropbox/EDA487/ASCII_Disp/startup.c **** 	while(1) ;
 956              		.loc 1 201 0 discriminator 1
 957 03ca FEE7     		b	.L52
 958              	.L54:
 959              		.align	2
 960              	.L53:
 961 03cc 00000000 		.word	.LC0
 962 03d0 08000000 		.word	.LC2
 963              		.cfi_endproc
 964              	.LFE17:
 966              	.Letext0:
 967              		.file 2 "/Users/Simon/Dropbox/EDA487/ASCII_Disp/gpio.h"
