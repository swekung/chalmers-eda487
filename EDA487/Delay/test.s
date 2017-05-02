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
  27              		.file 1 "/Users/Simon/Dropbox/EDA487/Delay/startup.c"
   1:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** /*
   2:/Users/Simon/Dropbox/EDA487/Delay/startup.c ****  * 	startup.c
   3:/Users/Simon/Dropbox/EDA487/Delay/startup.c ****  *
   4:/Users/Simon/Dropbox/EDA487/Delay/startup.c ****  */
   5:/Users/Simon/Dropbox/EDA487/Delay/startup.c ****  
   6:/Users/Simon/Dropbox/EDA487/Delay/startup.c ****  #include "gpio.h"
   7:/Users/Simon/Dropbox/EDA487/Delay/startup.c ****  
   8:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   9:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** typedef volatile int* port32ptr;
  10:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** typedef volatile long* port16ptr;
  11:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** typedef volatile char* port8ptr;
  12:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** #define SYS_TICK 0xE000E010
  13:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** #define STK_CTRL *((port32ptr) SYS_TICK)
  14:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** #define STK_LOAD *((port32ptr)(SYS_TICK + 0x04))
  15:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** #define STK_VAL *((port32ptr)(SYS_TICK + 0x08))
  16:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** #define GPIO_D_ADDR 0x40020C00
  17:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** #define GPIO_MODER *((port32ptr)GPIO_D_ADDR)
  18:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** #define GPIO_OTYPER *((port32ptr)(GPIO_D_ADDR + 0x04))
  19:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** #define GPIO_OSPEEDR *((port32ptr)(GPIO_D_ADDR + 0x08))
  20:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** #define GPIO_PUPDR *((port32ptr)(GPIO_D_ADDR + 0x0C))
  21:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** #define GPIO_IDR_LOW *((port8ptr)(GPIO_D_ADDR + 0x10))
  22:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** #define GPIO_IDR_HIGH *((port8ptr)(GPIO_D_ADDR + 0x11))
  23:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** #define GPIO_ODR_LOW *((port8ptr)(GPIO_D_ADDR + 0x14))
  24:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** #define GPIO_ODR_HIGH *((port8ptr)(GPIO_D_ADDR + 0x15))
  25:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 
  26:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 
  27:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** //#define SIMULATOR
  28:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** unsigned int slowdown_Sim = 1000;
  29:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 
  30:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** void startup ( void )
  31:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** {
  28              		.loc 1 31 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
  32:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** asm volatile(
  33              		.loc 1 32 0
  34              		.syntax divided
  35              	@ 32 "/Users/Simon/Dropbox/EDA487/Delay/startup.c" 1
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  33:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  34:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	" MOV SP,R0\n"
  35:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	" BL main\n"				/* call main */
  36:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	".L1: B .L1\n"				/* never return */
  37:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	);
  38:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** }
  42              		.loc 1 38 0
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
  39:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 
  40:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** void app_init ( void )
  41:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** {
  64              		.loc 1 41 0
  65              		.cfi_startproc
  66              		@ args = 0, pretend = 0, frame = 0
  67              		@ frame_needed = 1, uses_anonymous_args = 0
  68 0000 80B5     		push	{r7, lr}
  69              		.cfi_def_cfa_offset 8
  70              		.cfi_offset 7, -8
  71              		.cfi_offset 14, -4
  72 0002 00AF     		add	r7, sp, #0
  73              		.cfi_def_cfa_register 7
  42:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	GPIO_MODER = 0x5555;
  74              		.loc 1 42 0
  75 0004 054B     		ldr	r3, .L3
  76 0006 064A     		ldr	r2, .L3+4
  77 0008 1A60     		str	r2, [r3]
  43:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	RCC_AHB1ENR |= RCC_GPIO_D | RCC_GPIO_E;
  78              		.loc 1 43 0
  79 000a 064B     		ldr	r3, .L3+8
  80 000c 054A     		ldr	r2, .L3+8
  81 000e 1268     		ldr	r2, [r2]
  82 0010 1821     		movs	r1, #24
  83 0012 0A43     		orrs	r2, r1
  84 0014 1A60     		str	r2, [r3]
  44:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** }
  85              		.loc 1 44 0
  86 0016 C046     		nop
  87 0018 BD46     		mov	sp, r7
  88              		@ sp needed
  89 001a 80BD     		pop	{r7, pc}
  90              	.L4:
  91              		.align	2
  92              	.L3:
  93 001c 000C0240 		.word	1073875968
  94 0020 55550000 		.word	21845
  95 0024 30380240 		.word	1073887280
  96              		.cfi_endproc
  97              	.LFE1:
  99              		.align	2
 100              		.global	delay_250ns
 101              		.code	16
 102              		.thumb_func
 104              	delay_250ns:
 105              	.LFB2:
  45:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** void delay_250ns ( void )
  46:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** {
 106              		.loc 1 46 0
 107              		.cfi_startproc
 108              		@ args = 0, pretend = 0, frame = 0
 109              		@ frame_needed = 1, uses_anonymous_args = 0
 110 0028 80B5     		push	{r7, lr}
 111              		.cfi_def_cfa_offset 8
 112              		.cfi_offset 7, -8
 113              		.cfi_offset 14, -4
 114 002a 00AF     		add	r7, sp, #0
 115              		.cfi_def_cfa_register 7
  47:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	STK_CTRL = 0;
 116              		.loc 1 47 0
 117 002c 0C4B     		ldr	r3, .L7
 118 002e 0022     		movs	r2, #0
 119 0030 1A60     		str	r2, [r3]
  48:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	STK_LOAD = 42;
 120              		.loc 1 48 0
 121 0032 0C4B     		ldr	r3, .L7+4
 122 0034 2A22     		movs	r2, #42
 123 0036 1A60     		str	r2, [r3]
  49:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	STK_VAL = 0;
 124              		.loc 1 49 0
 125 0038 0B4B     		ldr	r3, .L7+8
 126 003a 0022     		movs	r2, #0
 127 003c 1A60     		str	r2, [r3]
  50:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	STK_CTRL = 5;
 128              		.loc 1 50 0
 129 003e 084B     		ldr	r3, .L7
 130 0040 0522     		movs	r2, #5
 131 0042 1A60     		str	r2, [r3]
  51:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	while((STK_CTRL & 0x00010000)== 0) ;
 132              		.loc 1 51 0
 133 0044 C046     		nop
 134              	.L6:
 135              		.loc 1 51 0 is_stmt 0 discriminator 1
 136 0046 064B     		ldr	r3, .L7
 137 0048 1A68     		ldr	r2, [r3]
 138 004a 8023     		movs	r3, #128
 139 004c 5B02     		lsls	r3, r3, #9
 140 004e 1340     		ands	r3, r2
 141 0050 F9D0     		beq	.L6
  52:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	STK_CTRL = 0;
 142              		.loc 1 52 0 is_stmt 1
 143 0052 034B     		ldr	r3, .L7
 144 0054 0022     		movs	r2, #0
 145 0056 1A60     		str	r2, [r3]
  53:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** }
 146              		.loc 1 53 0
 147 0058 C046     		nop
 148 005a BD46     		mov	sp, r7
 149              		@ sp needed
 150 005c 80BD     		pop	{r7, pc}
 151              	.L8:
 152 005e C046     		.align	2
 153              	.L7:
 154 0060 10E000E0 		.word	-536813552
 155 0064 14E000E0 		.word	-536813548
 156 0068 18E000E0 		.word	-536813544
 157              		.cfi_endproc
 158              	.LFE2:
 160              		.align	2
 161              		.global	delay_micro
 162              		.code	16
 163              		.thumb_func
 165              	delay_micro:
 166              	.LFB3:
  54:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** void delay_micro(unsigned int us)
  55:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** {
 167              		.loc 1 55 0
 168              		.cfi_startproc
 169              		@ args = 0, pretend = 0, frame = 16
 170              		@ frame_needed = 1, uses_anonymous_args = 0
 171 006c 80B5     		push	{r7, lr}
 172              		.cfi_def_cfa_offset 8
 173              		.cfi_offset 7, -8
 174              		.cfi_offset 14, -4
 175 006e 84B0     		sub	sp, sp, #16
 176              		.cfi_def_cfa_offset 24
 177 0070 00AF     		add	r7, sp, #0
 178              		.cfi_def_cfa_register 7
 179 0072 7860     		str	r0, [r7, #4]
 180              	.LBB2:
  56:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	#ifdef SIMULATOR
  57:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 		us /= slowdown_Sim;
  58:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 		us++;
  59:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	#endif
  60:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	for(int i = 0; i <= us*4; i++)
 181              		.loc 1 60 0
 182 0074 0023     		movs	r3, #0
 183 0076 FB60     		str	r3, [r7, #12]
 184 0078 04E0     		b	.L10
 185              	.L11:
  61:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	{
  62:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 		delay_250ns();
 186              		.loc 1 62 0 discriminator 3
 187 007a FFF7FEFF 		bl	delay_250ns
  60:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	{
 188              		.loc 1 60 0 discriminator 3
 189 007e FB68     		ldr	r3, [r7, #12]
 190 0080 0133     		adds	r3, r3, #1
 191 0082 FB60     		str	r3, [r7, #12]
 192              	.L10:
  60:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	{
 193              		.loc 1 60 0 is_stmt 0 discriminator 1
 194 0084 7B68     		ldr	r3, [r7, #4]
 195 0086 9A00     		lsls	r2, r3, #2
 196 0088 FB68     		ldr	r3, [r7, #12]
 197 008a 9A42     		cmp	r2, r3
 198 008c F5D2     		bcs	.L11
 199              	.LBE2:
  63:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	}
  64:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** }
 200              		.loc 1 64 0 is_stmt 1
 201 008e C046     		nop
 202 0090 BD46     		mov	sp, r7
 203 0092 04B0     		add	sp, sp, #16
 204              		@ sp needed
 205 0094 80BD     		pop	{r7, pc}
 206              		.cfi_endproc
 207              	.LFE3:
 209 0096 C046     		.align	2
 210              		.global	delay_milli
 211              		.code	16
 212              		.thumb_func
 214              	delay_milli:
 215              	.LFB4:
  65:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 
  66:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** void delay_milli(unsigned int ms)
  67:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** {
 216              		.loc 1 67 0
 217              		.cfi_startproc
 218              		@ args = 0, pretend = 0, frame = 8
 219              		@ frame_needed = 1, uses_anonymous_args = 0
 220 0098 80B5     		push	{r7, lr}
 221              		.cfi_def_cfa_offset 8
 222              		.cfi_offset 7, -8
 223              		.cfi_offset 14, -4
 224 009a 82B0     		sub	sp, sp, #8
 225              		.cfi_def_cfa_offset 16
 226 009c 00AF     		add	r7, sp, #0
 227              		.cfi_def_cfa_register 7
 228 009e 7860     		str	r0, [r7, #4]
  68:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	while(ms--){
 229              		.loc 1 68 0
 230 00a0 04E0     		b	.L13
 231              	.L14:
  69:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 		#ifdef SIMULATOR
  70:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 			delay_micro(2);
  71:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 		#else
  72:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 			delay_micro(1000); 
 232              		.loc 1 72 0
 233 00a2 FA23     		movs	r3, #250
 234 00a4 9B00     		lsls	r3, r3, #2
 235 00a6 1800     		movs	r0, r3
 236 00a8 FFF7FEFF 		bl	delay_micro
 237              	.L13:
  68:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	while(ms--){
 238              		.loc 1 68 0
 239 00ac 7B68     		ldr	r3, [r7, #4]
 240 00ae 5A1E     		subs	r2, r3, #1
 241 00b0 7A60     		str	r2, [r7, #4]
 242 00b2 002B     		cmp	r3, #0
 243 00b4 F5D1     		bne	.L14
  73:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 		#endif
  74:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	}
  75:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** }
 244              		.loc 1 75 0
 245 00b6 C046     		nop
 246 00b8 BD46     		mov	sp, r7
 247 00ba 02B0     		add	sp, sp, #8
 248              		@ sp needed
 249 00bc 80BD     		pop	{r7, pc}
 250              		.cfi_endproc
 251              	.LFE4:
 253 00be C046     		.align	2
 254              		.global	main
 255              		.code	16
 256              		.thumb_func
 258              	main:
 259              	.LFB5:
  76:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 
  77:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** void main(void)
  78:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** {
 260              		.loc 1 78 0
 261              		.cfi_startproc
 262              		@ args = 0, pretend = 0, frame = 0
 263              		@ frame_needed = 1, uses_anonymous_args = 0
 264 00c0 80B5     		push	{r7, lr}
 265              		.cfi_def_cfa_offset 8
 266              		.cfi_offset 7, -8
 267              		.cfi_offset 14, -4
 268 00c2 00AF     		add	r7, sp, #0
 269              		.cfi_def_cfa_register 7
  79:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	app_init();
 270              		.loc 1 79 0
 271 00c4 FFF7FEFF 		bl	app_init
 272              	.L16:
  80:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	while(1)
  81:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	{
  82:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 		GPIO_ODR_LOW = 0xFF;
 273              		.loc 1 82 0 discriminator 1
 274 00c8 064B     		ldr	r3, .L17
 275 00ca FF22     		movs	r2, #255
 276 00cc 1A70     		strb	r2, [r3]
  83:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 		delay_milli(5);
 277              		.loc 1 83 0 discriminator 1
 278 00ce 0520     		movs	r0, #5
 279 00d0 FFF7FEFF 		bl	delay_milli
  84:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 		GPIO_ODR_LOW = 0x00;
 280              		.loc 1 84 0 discriminator 1
 281 00d4 034B     		ldr	r3, .L17
 282 00d6 0022     		movs	r2, #0
 283 00d8 1A70     		strb	r2, [r3]
  85:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 		delay_milli(5);
 284              		.loc 1 85 0 discriminator 1
 285 00da 0520     		movs	r0, #5
 286 00dc FFF7FEFF 		bl	delay_milli
  86:/Users/Simon/Dropbox/EDA487/Delay/startup.c **** 	}
 287              		.loc 1 86 0 discriminator 1
 288 00e0 F2E7     		b	.L16
 289              	.L18:
 290 00e2 C046     		.align	2
 291              	.L17:
 292 00e4 140C0240 		.word	1073875988
 293              		.cfi_endproc
 294              	.LFE5:
 296              	.Letext0:
 297              		.file 2 "/Users/Simon/Dropbox/EDA487/Delay/gpio.h"
