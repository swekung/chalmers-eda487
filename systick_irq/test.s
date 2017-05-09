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
  27              		.file 1 "/Users/Simon/chalmers-eda487/systick_irq/startup.c"
   1:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** /*
   2:/Users/Simon/chalmers-eda487/systick_irq/startup.c ****  * 	startup.c
   3:/Users/Simon/chalmers-eda487/systick_irq/startup.c ****  *
   4:/Users/Simon/chalmers-eda487/systick_irq/startup.c ****  */
   5:/Users/Simon/chalmers-eda487/systick_irq/startup.c ****  
   6:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
   7:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
   8:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
   9:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  10:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  11:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  12:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** void startup ( void )
  13:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** {
  28              		.loc 1 13 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
  14:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** asm volatile(
  33              		.loc 1 14 0
  34              		.syntax divided
  35              	@ 14 "/Users/Simon/chalmers-eda487/systick_irq/startup.c" 1
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  15:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  16:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	" MOV SP,R0\n"
  17:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	" BL main\n"				/* call main */
  18:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	".L1: B .L1\n"				/* never return */
  19:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	) ;
  20:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** }
  42              		.loc 1 20 0
  43              		.thumb
  44              		.syntax unified
  45 000a C046     		nop
  46              		.cfi_endproc
  47              	.LFE0:
  49              		.global	systick_flag
  50              		.bss
  53              	systick_flag:
  54 0000 00       		.space	1
  55              		.text
  56              		.align	2
  57              		.global	delay_250ns
  58              		.code	16
  59              		.thumb_func
  61              	delay_250ns:
  62              	.LFB1:
  21:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  22:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** #include "gpio.h"
  23:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** //#include "delay.h"
  24:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** #include "irq.h"
  25:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  26:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** #define SIMULATOR
  27:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  28:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** #ifdef SIMULATOR
  29:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** #define DELAY_COUNT 100
  30:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** #else
  31:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** #define DELAY_COUNT 1000000
  32:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** #endif
  33:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  34:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** // Definiering av systick vektor
  35:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  36:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** typedef struct sys_tick
  37:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** {
  38:/Users/Simon/chalmers-eda487/systick_irq/startup.c ****     uint32_t ctrl; 
  39:/Users/Simon/chalmers-eda487/systick_irq/startup.c ****     uint32_t load; 
  40:/Users/Simon/chalmers-eda487/systick_irq/startup.c ****     uint32_t val; 
  41:/Users/Simon/chalmers-eda487/systick_irq/startup.c ****     uint32_t calib;
  42:/Users/Simon/chalmers-eda487/systick_irq/startup.c ****     
  43:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** }Sys_tick; 
  44:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  45:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  46:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** typedef volatile Sys_tick* systickptr; 
  47:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  48:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** #define SYS_TICK (*((systickptr)0xe000e010))
  49:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  50:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** typedef volatile int* port32ptr;
  51:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** typedef volatile long* port16ptr;
  52:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** typedef volatile char* port8ptr;
  53:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** #define SYS_TICK 0xE000E010
  54:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** #define STK_CTRL *((port32ptr) SYS_TICK)
  55:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** #define STK_LOAD *((port32ptr)(SYS_TICK + 0x04))
  56:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** #define STK_VAL *((port32ptr)(SYS_TICK + 0x08))
  57:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  58:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** //systick vektor definierad
  59:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  60:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** uint8_t systick_flag = 0;
  61:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  62:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  63:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** void delay_250ns ( void )
  64:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** {
  63              		.loc 1 64 0
  64              		.cfi_startproc
  65              		@ args = 0, pretend = 0, frame = 0
  66              		@ frame_needed = 1, uses_anonymous_args = 0
  67 0000 80B5     		push	{r7, lr}
  68              		.cfi_def_cfa_offset 8
  69              		.cfi_offset 7, -8
  70              		.cfi_offset 14, -4
  71 0002 00AF     		add	r7, sp, #0
  72              		.cfi_def_cfa_register 7
  65:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	STK_CTRL = 0;
  73              		.loc 1 65 0
  74 0004 084B     		ldr	r3, .L3
  75 0006 0022     		movs	r2, #0
  76 0008 1A60     		str	r2, [r3]
  66:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	STK_LOAD = 42;
  77              		.loc 1 66 0
  78 000a 084B     		ldr	r3, .L3+4
  79 000c 2A22     		movs	r2, #42
  80 000e 1A60     		str	r2, [r3]
  67:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	STK_VAL = 0;
  81              		.loc 1 67 0
  82 0010 074B     		ldr	r3, .L3+8
  83 0012 0022     		movs	r2, #0
  84 0014 1A60     		str	r2, [r3]
  68:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	STK_CTRL = 5;
  85              		.loc 1 68 0
  86 0016 044B     		ldr	r3, .L3
  87 0018 0522     		movs	r2, #5
  88 001a 1A60     		str	r2, [r3]
  69:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	STK_CTRL = 7;
  89              		.loc 1 69 0
  90 001c 024B     		ldr	r3, .L3
  91 001e 0722     		movs	r2, #7
  92 0020 1A60     		str	r2, [r3]
  70:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** }
  93              		.loc 1 70 0
  94 0022 C046     		nop
  95 0024 BD46     		mov	sp, r7
  96              		@ sp needed
  97 0026 80BD     		pop	{r7, pc}
  98              	.L4:
  99              		.align	2
 100              	.L3:
 101 0028 10E000E0 		.word	-536813552
 102 002c 14E000E0 		.word	-536813548
 103 0030 18E000E0 		.word	-536813544
 104              		.cfi_endproc
 105              	.LFE1:
 107              		.align	2
 108              		.global	delay_count
 109              		.code	16
 110              		.thumb_func
 112              	delay_count:
 113              	.LFB2:
  71:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  72:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** void delay_count(uint32_t count)
  73:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** {
 114              		.loc 1 73 0
 115              		.cfi_startproc
 116              		@ args = 0, pretend = 0, frame = 8
 117              		@ frame_needed = 1, uses_anonymous_args = 0
 118 0034 80B5     		push	{r7, lr}
 119              		.cfi_def_cfa_offset 8
 120              		.cfi_offset 7, -8
 121              		.cfi_offset 14, -4
 122 0036 82B0     		sub	sp, sp, #8
 123              		.cfi_def_cfa_offset 16
 124 0038 00AF     		add	r7, sp, #0
 125              		.cfi_def_cfa_register 7
 126 003a 7860     		str	r0, [r7, #4]
  74:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	while(count--)
 127              		.loc 1 74 0
 128 003c 08E0     		b	.L6
 129              	.L9:
  75:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	{
  76:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 		delay_250ns();
 130              		.loc 1 76 0
 131 003e FFF7FEFF 		bl	delay_250ns
 132              	.L8:
  77:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 		while(1)
  78:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 		{
  79:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 			if(systick_flag == 1)
 133              		.loc 1 79 0
 134 0042 084B     		ldr	r3, .L10
 135 0044 1B78     		ldrb	r3, [r3]
 136 0046 012B     		cmp	r3, #1
 137 0048 FBD1     		bne	.L8
  80:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 			{
  81:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 				systick_flag = 0;
 138              		.loc 1 81 0
 139 004a 064B     		ldr	r3, .L10
 140 004c 0022     		movs	r2, #0
 141 004e 1A70     		strb	r2, [r3]
 142              	.L6:
  74:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	{
 143              		.loc 1 74 0
 144 0050 7B68     		ldr	r3, [r7, #4]
 145 0052 5A1E     		subs	r2, r3, #1
 146 0054 7A60     		str	r2, [r7, #4]
 147 0056 002B     		cmp	r3, #0
 148 0058 F1D1     		bne	.L9
  82:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 				break;
  83:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 			}
  84:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 		}
  85:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	}
  86:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** }
 149              		.loc 1 86 0
 150 005a C046     		nop
 151 005c BD46     		mov	sp, r7
 152 005e 02B0     		add	sp, sp, #8
 153              		@ sp needed
 154 0060 80BD     		pop	{r7, pc}
 155              	.L11:
 156 0062 C046     		.align	2
 157              	.L10:
 158 0064 00000000 		.word	systick_flag
 159              		.cfi_endproc
 160              	.LFE2:
 162              		.align	2
 163              		.global	systick_irq_handler
 164              		.code	16
 165              		.thumb_func
 167              	systick_irq_handler:
 168              	.LFB3:
  87:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  88:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** void systick_irq_handler()
  89:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** {
 169              		.loc 1 89 0
 170              		.cfi_startproc
 171              		@ args = 0, pretend = 0, frame = 0
 172              		@ frame_needed = 1, uses_anonymous_args = 0
 173 0068 80B5     		push	{r7, lr}
 174              		.cfi_def_cfa_offset 8
 175              		.cfi_offset 7, -8
 176              		.cfi_offset 14, -4
 177 006a 00AF     		add	r7, sp, #0
 178              		.cfi_def_cfa_register 7
  90:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	STK_CTRL = 0;
 179              		.loc 1 90 0
 180 006c 044B     		ldr	r3, .L13
 181 006e 0022     		movs	r2, #0
 182 0070 1A60     		str	r2, [r3]
  91:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	systick_flag = 1;
 183              		.loc 1 91 0
 184 0072 044B     		ldr	r3, .L13+4
 185 0074 0122     		movs	r2, #1
 186 0076 1A70     		strb	r2, [r3]
  92:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** }
 187              		.loc 1 92 0
 188 0078 C046     		nop
 189 007a BD46     		mov	sp, r7
 190              		@ sp needed
 191 007c 80BD     		pop	{r7, pc}
 192              	.L14:
 193 007e C046     		.align	2
 194              	.L13:
 195 0080 10E000E0 		.word	-536813552
 196 0084 00000000 		.word	systick_flag
 197              		.cfi_endproc
 198              	.LFE3:
 200              		.align	2
 201              		.global	init_app
 202              		.code	16
 203              		.thumb_func
 205              	init_app:
 206              	.LFB4:
  93:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
  94:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** void init_app()
  95:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** {
 207              		.loc 1 95 0
 208              		.cfi_startproc
 209              		@ args = 0, pretend = 0, frame = 0
 210              		@ frame_needed = 1, uses_anonymous_args = 0
 211 0088 80B5     		push	{r7, lr}
 212              		.cfi_def_cfa_offset 8
 213              		.cfi_offset 7, -8
 214              		.cfi_offset 14, -4
 215 008a 00AF     		add	r7, sp, #0
 216              		.cfi_def_cfa_register 7
  96:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	GPIO_D.moder = 0x5555;
 217              		.loc 1 96 0
 218 008c 044B     		ldr	r3, .L16
 219 008e 054A     		ldr	r2, .L16+4
 220 0090 1A60     		str	r2, [r3]
  97:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	IRQ.sysTick = systick_irq_handler;
 221              		.loc 1 97 0
 222 0092 054B     		ldr	r3, .L16+8
 223 0094 054A     		ldr	r2, .L16+12
 224 0096 DA63     		str	r2, [r3, #60]
  98:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** }
 225              		.loc 1 98 0
 226 0098 C046     		nop
 227 009a BD46     		mov	sp, r7
 228              		@ sp needed
 229 009c 80BD     		pop	{r7, pc}
 230              	.L17:
 231 009e C046     		.align	2
 232              	.L16:
 233 00a0 000C0240 		.word	1073875968
 234 00a4 55550000 		.word	21845
 235 00a8 00C00120 		.word	536985600
 236 00ac 00000000 		.word	systick_irq_handler
 237              		.cfi_endproc
 238              	.LFE4:
 240              		.align	2
 241              		.global	main
 242              		.code	16
 243              		.thumb_func
 245              	main:
 246              	.LFB5:
  99:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 
 100:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** void main(void)
 101:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** {
 247              		.loc 1 101 0
 248              		.cfi_startproc
 249              		@ args = 0, pretend = 0, frame = 0
 250              		@ frame_needed = 1, uses_anonymous_args = 0
 251 00b0 80B5     		push	{r7, lr}
 252              		.cfi_def_cfa_offset 8
 253              		.cfi_offset 7, -8
 254              		.cfi_offset 14, -4
 255 00b2 00AF     		add	r7, sp, #0
 256              		.cfi_def_cfa_register 7
 102:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	init_app();
 257              		.loc 1 102 0
 258 00b4 FFF7FEFF 		bl	init_app
 259              	.L19:
 103:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	while(1)
 104:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	{
 105:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 		GPIO_D.odr_low = 0;
 260              		.loc 1 105 0 discriminator 1
 261 00b8 064B     		ldr	r3, .L20
 262 00ba 0022     		movs	r2, #0
 263 00bc 1A75     		strb	r2, [r3, #20]
 106:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 		delay_count(DELAY_COUNT);
 264              		.loc 1 106 0 discriminator 1
 265 00be 6420     		movs	r0, #100
 266 00c0 FFF7FEFF 		bl	delay_count
 107:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 		GPIO_D.odr_low = 0xFF;
 267              		.loc 1 107 0 discriminator 1
 268 00c4 034B     		ldr	r3, .L20
 269 00c6 FF22     		movs	r2, #255
 270 00c8 1A75     		strb	r2, [r3, #20]
 108:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 		delay_count(DELAY_COUNT);
 271              		.loc 1 108 0 discriminator 1
 272 00ca 6420     		movs	r0, #100
 273 00cc FFF7FEFF 		bl	delay_count
 109:/Users/Simon/chalmers-eda487/systick_irq/startup.c **** 	}
 274              		.loc 1 109 0 discriminator 1
 275 00d0 F2E7     		b	.L19
 276              	.L21:
 277 00d2 C046     		.align	2
 278              	.L20:
 279 00d4 000C0240 		.word	1073875968
 280              		.cfi_endproc
 281              	.LFE5:
 283              	.Letext0:
 284              		.file 2 "/Users/Simon/chalmers-eda487/libraries/gpio.h"
 285              		.file 3 "/Users/Simon/chalmers-eda487/libraries/irq.h"
