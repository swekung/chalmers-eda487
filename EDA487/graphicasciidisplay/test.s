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
  27              		.file 1 "/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c"
   1:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** /*
   2:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****  * 	startup.c
   3:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****  *
   4:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****  */
   5:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
   7:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define SIMULATOR
   8:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
   9:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** typedef unsigned int uint32_t;
  10:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** typedef unsigned short uint16_t;
  11:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** typedef unsigned char uint8_t;
  12:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** typedef signed int sint32_t;
  13:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** typedef signed short sint16_t;
  14:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** typedef signed char sint8_t;
  15:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
  16:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** /*struct som innehåller definition av en gpio port
  17:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****  * structuren som i boken s.67*/
  18:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** typedef struct gpio
  19:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
  20:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     uint32_t moder; 
  21:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     uint16_t otyper;
  22:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     uint16_t unused0;  /* vi hoppar över 16 bits, som i figuren*/
  23:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     uint32_t ospeedr; 
  24:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     uint32_t pupdr; 
  25:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     uint8_t idr_low;  
  26:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     uint8_t idr_high; 
  27:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     uint16_t unused1; 
  28:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     uint8_t odr_low;
  29:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     uint8_t odr_high; 
  30:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     uint16_t unused2; 
  31:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     uint32_t bsrr; 
  32:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     struct { unsigned int lckr : 17;} lckr;   /*bitfield: tilldela ett värde som har 17 bitar inut
  33:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     uint32_t afrl;
  34:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     uint32_t afrh;
  35:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     
  36:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** } GPIO; 
  37:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
  38:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****  /*alias pekare till a volatile struct gpio. Vid variabels deklaration, 
  39:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****   * det skapas en pekare till en IO port som är volatile*/
  40:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** typedef volatile GPIO* gpioptr;   
  41:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
  42:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** /*Definition för alla 5 portar, 1 kbyte från varandra.
  43:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****  *Först kastas minnsadress. Minnessadressen är en heltal, så måste den kastas till en pekare:
  44:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****  * i C kan man inte skriva direkt till en minnessadress.
  45:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****  * Sen ska den derefereras för att läsa och skriva från och till minnet */
  46:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define GPIO_A (*((gpioptr)0x40020000))  
  47:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define GPIO_B (*((gpioptr)0x40020400))
  48:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define GPIO_C (*((gpioptr)0x40020800)) 
  49:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define GPIO_D (*((gpioptr)0x40020c00))
  50:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define GPIO_E (*((gpioptr)0x40021000))
  51:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
  52:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** /* aktivera clockan
  53:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** Start: 		LDR	R6,=0x00000018
  54:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		    LDR	R4,=0x40023830
  55:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****             LDR	R5,[R4]
  56:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****             ORR	R5,R5,R6
  57:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****             STR	R5,[R4] */
  58:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define RCC_AHB1ENR (*((uint32_t* ) 0x40023830))
  59:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** /*bit 4, satt för aktivera clockan*/
  60:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define RCC_GPIO_D 0x00000008
  61:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** /*bit 5*/ 
  62:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define RCC_GPIO_E 0x00000010 
  63:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
  64:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** typedef volatile int* port32ptr;
  65:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** typedef volatile long* port16ptr;
  66:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** typedef volatile char* port8ptr;
  67:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define SYS_TICK 0xE000E010
  68:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define STK_CTRL *((port32ptr) SYS_TICK)
  69:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define STK_LOAD *((port32ptr)(SYS_TICK + 0x04))
  70:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define STK_VAL *((port32ptr)(SYS_TICK + 0x08))
  71:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
  72:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define B_E 0x40
  73:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define B_SELECT 0x04
  74:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define B_RW 0x02
  75:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define B_RS 0x01
  76:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define B_RST 0x20
  77:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define B_CS2 0x10
  78:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define B_CS1 0x08
  79:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define LCD_BUSY 0x80
  80:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define LCD_OFF 0x3E
  81:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define LCD_ON 0x3F
  82:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define LCD_DISP_START 0xC0
  83:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define LCD_SET_ADD 0x40
  84:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** #define LCD_SET_PAGE 0xB8
  85:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
  86:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void startup ( void )
  87:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
  28              		.loc 1 87 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
  88:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** asm volatile(
  33              		.loc 1 88 0
  34              		.syntax divided
  35              	@ 88 "/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c" 1
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  89:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  90:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	" MOV SP,R0\n"
  91:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	" BL main\n"				/* call main */
  92:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	".L1: B .L1\n"				/* never return */
  93:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	) ;
  94:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
  42              		.loc 1 94 0
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
  95:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
  96:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void init_app()
  97:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
  57              		.loc 1 97 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  98:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	GPIO_E.moder = 0x55555555;
  67              		.loc 1 98 0
  68 0004 044B     		ldr	r3, .L3
  69 0006 054A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  99:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	GPIO_E.ospeedr = 0x55555555;
  71              		.loc 1 99 0
  72 000a 034B     		ldr	r3, .L3
  73 000c 034A     		ldr	r2, .L3+4
  74 000e 9A60     		str	r2, [r3, #8]
 100:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
  75              		.loc 1 100 0
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
  89              		.global	delay_250ns
  90              		.code	16
  91              		.thumb_func
  93              	delay_250ns:
  94              	.LFB2:
 101:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
 102:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void delay_250ns ( void )
 103:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
  95              		.loc 1 103 0
  96              		.cfi_startproc
  97              		@ args = 0, pretend = 0, frame = 0
  98              		@ frame_needed = 1, uses_anonymous_args = 0
  99 0020 80B5     		push	{r7, lr}
 100              		.cfi_def_cfa_offset 8
 101              		.cfi_offset 7, -8
 102              		.cfi_offset 14, -4
 103 0022 00AF     		add	r7, sp, #0
 104              		.cfi_def_cfa_register 7
 104:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	STK_CTRL = 0;
 105              		.loc 1 104 0
 106 0024 0C4B     		ldr	r3, .L7
 107 0026 0022     		movs	r2, #0
 108 0028 1A60     		str	r2, [r3]
 105:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	STK_LOAD = 42;
 109              		.loc 1 105 0
 110 002a 0C4B     		ldr	r3, .L7+4
 111 002c 2A22     		movs	r2, #42
 112 002e 1A60     		str	r2, [r3]
 106:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	STK_VAL = 0;
 113              		.loc 1 106 0
 114 0030 0B4B     		ldr	r3, .L7+8
 115 0032 0022     		movs	r2, #0
 116 0034 1A60     		str	r2, [r3]
 107:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	STK_CTRL = 5;
 117              		.loc 1 107 0
 118 0036 084B     		ldr	r3, .L7
 119 0038 0522     		movs	r2, #5
 120 003a 1A60     		str	r2, [r3]
 108:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	while((STK_CTRL & 0x00010000)== 0) ;
 121              		.loc 1 108 0
 122 003c C046     		nop
 123              	.L6:
 124              		.loc 1 108 0 is_stmt 0 discriminator 1
 125 003e 064B     		ldr	r3, .L7
 126 0040 1A68     		ldr	r2, [r3]
 127 0042 8023     		movs	r3, #128
 128 0044 5B02     		lsls	r3, r3, #9
 129 0046 1340     		ands	r3, r2
 130 0048 F9D0     		beq	.L6
 109:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	STK_CTRL = 0;
 131              		.loc 1 109 0 is_stmt 1
 132 004a 034B     		ldr	r3, .L7
 133 004c 0022     		movs	r2, #0
 134 004e 1A60     		str	r2, [r3]
 110:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
 135              		.loc 1 110 0
 136 0050 C046     		nop
 137 0052 BD46     		mov	sp, r7
 138              		@ sp needed
 139 0054 80BD     		pop	{r7, pc}
 140              	.L8:
 141 0056 C046     		.align	2
 142              	.L7:
 143 0058 10E000E0 		.word	-536813552
 144 005c 14E000E0 		.word	-536813548
 145 0060 18E000E0 		.word	-536813544
 146              		.cfi_endproc
 147              	.LFE2:
 149              		.align	2
 150              		.global	delay_500ns
 151              		.code	16
 152              		.thumb_func
 154              	delay_500ns:
 155              	.LFB3:
 111:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void delay_500ns ( void )
 112:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
 156              		.loc 1 112 0
 157              		.cfi_startproc
 158              		@ args = 0, pretend = 0, frame = 0
 159              		@ frame_needed = 1, uses_anonymous_args = 0
 160 0064 80B5     		push	{r7, lr}
 161              		.cfi_def_cfa_offset 8
 162              		.cfi_offset 7, -8
 163              		.cfi_offset 14, -4
 164 0066 00AF     		add	r7, sp, #0
 165              		.cfi_def_cfa_register 7
 113:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	STK_CTRL = 0;
 166              		.loc 1 113 0
 167 0068 0C4B     		ldr	r3, .L11
 168 006a 0022     		movs	r2, #0
 169 006c 1A60     		str	r2, [r3]
 114:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	STK_LOAD = 84;
 170              		.loc 1 114 0
 171 006e 0C4B     		ldr	r3, .L11+4
 172 0070 5422     		movs	r2, #84
 173 0072 1A60     		str	r2, [r3]
 115:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	STK_VAL = 0;
 174              		.loc 1 115 0
 175 0074 0B4B     		ldr	r3, .L11+8
 176 0076 0022     		movs	r2, #0
 177 0078 1A60     		str	r2, [r3]
 116:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	STK_CTRL = 5;
 178              		.loc 1 116 0
 179 007a 084B     		ldr	r3, .L11
 180 007c 0522     		movs	r2, #5
 181 007e 1A60     		str	r2, [r3]
 117:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	while((STK_CTRL & 0x00010000)== 0) ;
 182              		.loc 1 117 0
 183 0080 C046     		nop
 184              	.L10:
 185              		.loc 1 117 0 is_stmt 0 discriminator 1
 186 0082 064B     		ldr	r3, .L11
 187 0084 1A68     		ldr	r2, [r3]
 188 0086 8023     		movs	r3, #128
 189 0088 5B02     		lsls	r3, r3, #9
 190 008a 1340     		ands	r3, r2
 191 008c F9D0     		beq	.L10
 118:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	STK_CTRL = 0;
 192              		.loc 1 118 0 is_stmt 1
 193 008e 034B     		ldr	r3, .L11
 194 0090 0022     		movs	r2, #0
 195 0092 1A60     		str	r2, [r3]
 119:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
 196              		.loc 1 119 0
 197 0094 C046     		nop
 198 0096 BD46     		mov	sp, r7
 199              		@ sp needed
 200 0098 80BD     		pop	{r7, pc}
 201              	.L12:
 202 009a C046     		.align	2
 203              	.L11:
 204 009c 10E000E0 		.word	-536813552
 205 00a0 14E000E0 		.word	-536813548
 206 00a4 18E000E0 		.word	-536813544
 207              		.cfi_endproc
 208              	.LFE3:
 210              		.align	2
 211              		.global	delay_micro
 212              		.code	16
 213              		.thumb_func
 215              	delay_micro:
 216              	.LFB4:
 120:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void delay_micro(unsigned int us)
 121:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
 217              		.loc 1 121 0
 218              		.cfi_startproc
 219              		@ args = 0, pretend = 0, frame = 16
 220              		@ frame_needed = 1, uses_anonymous_args = 0
 221 00a8 80B5     		push	{r7, lr}
 222              		.cfi_def_cfa_offset 8
 223              		.cfi_offset 7, -8
 224              		.cfi_offset 14, -4
 225 00aa 84B0     		sub	sp, sp, #16
 226              		.cfi_def_cfa_offset 24
 227 00ac 00AF     		add	r7, sp, #0
 228              		.cfi_def_cfa_register 7
 229 00ae 7860     		str	r0, [r7, #4]
 230              	.LBB2:
 122:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	for(int i = 0; i <= us*4; i++)
 231              		.loc 1 122 0
 232 00b0 0023     		movs	r3, #0
 233 00b2 FB60     		str	r3, [r7, #12]
 234 00b4 04E0     		b	.L14
 235              	.L15:
 123:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	{
 124:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		delay_250ns();
 236              		.loc 1 124 0 discriminator 3
 237 00b6 FFF7FEFF 		bl	delay_250ns
 122:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	for(int i = 0; i <= us*4; i++)
 238              		.loc 1 122 0 discriminator 3
 239 00ba FB68     		ldr	r3, [r7, #12]
 240 00bc 0133     		adds	r3, r3, #1
 241 00be FB60     		str	r3, [r7, #12]
 242              	.L14:
 122:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	for(int i = 0; i <= us*4; i++)
 243              		.loc 1 122 0 is_stmt 0 discriminator 1
 244 00c0 7B68     		ldr	r3, [r7, #4]
 245 00c2 9A00     		lsls	r2, r3, #2
 246 00c4 FB68     		ldr	r3, [r7, #12]
 247 00c6 9A42     		cmp	r2, r3
 248 00c8 F5D2     		bcs	.L15
 249              	.LBE2:
 125:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	}
 126:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
 250              		.loc 1 126 0 is_stmt 1
 251 00ca C046     		nop
 252 00cc BD46     		mov	sp, r7
 253 00ce 04B0     		add	sp, sp, #16
 254              		@ sp needed
 255 00d0 80BD     		pop	{r7, pc}
 256              		.cfi_endproc
 257              	.LFE4:
 259 00d2 C046     		.align	2
 260              		.global	delay_milli
 261              		.code	16
 262              		.thumb_func
 264              	delay_milli:
 265              	.LFB5:
 127:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
 128:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void delay_milli(unsigned int ms)
 129:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
 266              		.loc 1 129 0
 267              		.cfi_startproc
 268              		@ args = 0, pretend = 0, frame = 8
 269              		@ frame_needed = 1, uses_anonymous_args = 0
 270 00d4 80B5     		push	{r7, lr}
 271              		.cfi_def_cfa_offset 8
 272              		.cfi_offset 7, -8
 273              		.cfi_offset 14, -4
 274 00d6 82B0     		sub	sp, sp, #8
 275              		.cfi_def_cfa_offset 16
 276 00d8 00AF     		add	r7, sp, #0
 277              		.cfi_def_cfa_register 7
 278 00da 7860     		str	r0, [r7, #4]
 130:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	while(ms--){
 279              		.loc 1 130 0
 280 00dc 02E0     		b	.L17
 281              	.L18:
 131:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		delay_micro(2);
 282              		.loc 1 131 0
 283 00de 0220     		movs	r0, #2
 284 00e0 FFF7FEFF 		bl	delay_micro
 285              	.L17:
 130:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	while(ms--){
 286              		.loc 1 130 0
 287 00e4 7B68     		ldr	r3, [r7, #4]
 288 00e6 5A1E     		subs	r2, r3, #1
 289 00e8 7A60     		str	r2, [r7, #4]
 290 00ea 002B     		cmp	r3, #0
 291 00ec F7D1     		bne	.L18
 132:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	}
 133:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
 292              		.loc 1 133 0
 293 00ee C046     		nop
 294 00f0 BD46     		mov	sp, r7
 295 00f2 02B0     		add	sp, sp, #8
 296              		@ sp needed
 297 00f4 80BD     		pop	{r7, pc}
 298              		.cfi_endproc
 299              	.LFE5:
 301 00f6 C046     		.align	2
 302              		.global	graphic_ctrl_bit_set
 303              		.code	16
 304              		.thumb_func
 306              	graphic_ctrl_bit_set:
 307              	.LFB6:
 134:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
 135:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
 136:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void graphic_ctrl_bit_set(uint8_t data)
 137:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
 308              		.loc 1 137 0
 309              		.cfi_startproc
 310              		@ args = 0, pretend = 0, frame = 8
 311              		@ frame_needed = 1, uses_anonymous_args = 0
 312 00f8 80B5     		push	{r7, lr}
 313              		.cfi_def_cfa_offset 8
 314              		.cfi_offset 7, -8
 315              		.cfi_offset 14, -4
 316 00fa 82B0     		sub	sp, sp, #8
 317              		.cfi_def_cfa_offset 16
 318 00fc 00AF     		add	r7, sp, #0
 319              		.cfi_def_cfa_register 7
 320 00fe 0200     		movs	r2, r0
 321 0100 FB1D     		adds	r3, r7, #7
 322 0102 1A70     		strb	r2, [r3]
 138:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	GPIO_E.odr_low &= ~B_SELECT;
 323              		.loc 1 138 0
 324 0104 0A4A     		ldr	r2, .L20
 325 0106 0A4B     		ldr	r3, .L20
 326 0108 1B7D     		ldrb	r3, [r3, #20]
 327 010a DBB2     		uxtb	r3, r3
 328 010c 0421     		movs	r1, #4
 329 010e 8B43     		bics	r3, r1
 330 0110 DBB2     		uxtb	r3, r3
 331 0112 1375     		strb	r3, [r2, #20]
 139:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     GPIO_E.odr_low |= data;
 332              		.loc 1 139 0
 333 0114 0649     		ldr	r1, .L20
 334 0116 064B     		ldr	r3, .L20
 335 0118 1B7D     		ldrb	r3, [r3, #20]
 336 011a DAB2     		uxtb	r2, r3
 337 011c FB1D     		adds	r3, r7, #7
 338 011e 1B78     		ldrb	r3, [r3]
 339 0120 1343     		orrs	r3, r2
 340 0122 DBB2     		uxtb	r3, r3
 341 0124 0B75     		strb	r3, [r1, #20]
 140:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
 342              		.loc 1 140 0
 343 0126 C046     		nop
 344 0128 BD46     		mov	sp, r7
 345 012a 02B0     		add	sp, sp, #8
 346              		@ sp needed
 347 012c 80BD     		pop	{r7, pc}
 348              	.L21:
 349 012e C046     		.align	2
 350              	.L20:
 351 0130 00100240 		.word	1073876992
 352              		.cfi_endproc
 353              	.LFE6:
 355              		.align	2
 356              		.global	graphic_ctrl_bit_clear
 357              		.code	16
 358              		.thumb_func
 360              	graphic_ctrl_bit_clear:
 361              	.LFB7:
 141:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
 142:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void graphic_ctrl_bit_clear(uint8_t data)
 143:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
 362              		.loc 1 143 0
 363              		.cfi_startproc
 364              		@ args = 0, pretend = 0, frame = 8
 365              		@ frame_needed = 1, uses_anonymous_args = 0
 366 0134 80B5     		push	{r7, lr}
 367              		.cfi_def_cfa_offset 8
 368              		.cfi_offset 7, -8
 369              		.cfi_offset 14, -4
 370 0136 82B0     		sub	sp, sp, #8
 371              		.cfi_def_cfa_offset 16
 372 0138 00AF     		add	r7, sp, #0
 373              		.cfi_def_cfa_register 7
 374 013a 0200     		movs	r2, r0
 375 013c FB1D     		adds	r3, r7, #7
 376 013e 1A70     		strb	r2, [r3]
 144:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	GPIO_E.odr_low &= ~B_SELECT;
 377              		.loc 1 144 0
 378 0140 0C4A     		ldr	r2, .L23
 379 0142 0C4B     		ldr	r3, .L23
 380 0144 1B7D     		ldrb	r3, [r3, #20]
 381 0146 DBB2     		uxtb	r3, r3
 382 0148 0421     		movs	r1, #4
 383 014a 8B43     		bics	r3, r1
 384 014c DBB2     		uxtb	r3, r3
 385 014e 1375     		strb	r3, [r2, #20]
 145:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c ****     GPIO_E.odr_low &= ~data;
 386              		.loc 1 145 0
 387 0150 0849     		ldr	r1, .L23
 388 0152 084B     		ldr	r3, .L23
 389 0154 1B7D     		ldrb	r3, [r3, #20]
 390 0156 DBB2     		uxtb	r3, r3
 391 0158 5BB2     		sxtb	r3, r3
 392 015a FA1D     		adds	r2, r7, #7
 393 015c 1278     		ldrb	r2, [r2]
 394 015e 52B2     		sxtb	r2, r2
 395 0160 D243     		mvns	r2, r2
 396 0162 52B2     		sxtb	r2, r2
 397 0164 1340     		ands	r3, r2
 398 0166 5BB2     		sxtb	r3, r3
 399 0168 DBB2     		uxtb	r3, r3
 400 016a 0B75     		strb	r3, [r1, #20]
 146:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
 401              		.loc 1 146 0
 402 016c C046     		nop
 403 016e BD46     		mov	sp, r7
 404 0170 02B0     		add	sp, sp, #8
 405              		@ sp needed
 406 0172 80BD     		pop	{r7, pc}
 407              	.L24:
 408              		.align	2
 409              	.L23:
 410 0174 00100240 		.word	1073876992
 411              		.cfi_endproc
 412              	.LFE7:
 414              		.align	2
 415              		.global	graphic_wait_ready
 416              		.code	16
 417              		.thumb_func
 419              	graphic_wait_ready:
 420              	.LFB8:
 147:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
 148:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void graphic_wait_ready()
 149:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
 421              		.loc 1 149 0
 422              		.cfi_startproc
 423              		@ args = 0, pretend = 0, frame = 0
 424              		@ frame_needed = 1, uses_anonymous_args = 0
 425 0178 80B5     		push	{r7, lr}
 426              		.cfi_def_cfa_offset 8
 427              		.cfi_offset 7, -8
 428              		.cfi_offset 14, -4
 429 017a 00AF     		add	r7, sp, #0
 430              		.cfi_def_cfa_register 7
 150:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 431              		.loc 1 150 0
 432 017c 4020     		movs	r0, #64
 433 017e FFF7FEFF 		bl	graphic_ctrl_bit_set
 151:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	GPIO_E.moder = 0x00005555;
 434              		.loc 1 151 0
 435 0182 0F4B     		ldr	r3, .L27
 436 0184 0F4A     		ldr	r2, .L27+4
 437 0186 1A60     		str	r2, [r3]
 152:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 438              		.loc 1 152 0
 439 0188 0120     		movs	r0, #1
 440 018a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 153:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_set(B_RW);
 441              		.loc 1 153 0
 442 018e 0220     		movs	r0, #2
 443 0190 FFF7FEFF 		bl	graphic_ctrl_bit_set
 154:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	delay_500ns();
 444              		.loc 1 154 0
 445 0194 FFF7FEFF 		bl	delay_500ns
 446              	.L26:
 155:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	do
 156:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	{
 157:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		graphic_ctrl_bit_set(B_E);
 447              		.loc 1 157 0 discriminator 1
 448 0198 4020     		movs	r0, #64
 449 019a FFF7FEFF 		bl	graphic_ctrl_bit_set
 158:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		delay_500ns();
 450              		.loc 1 158 0 discriminator 1
 451 019e FFF7FEFF 		bl	delay_500ns
 159:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		graphic_ctrl_bit_set(B_E);
 452              		.loc 1 159 0 discriminator 1
 453 01a2 4020     		movs	r0, #64
 454 01a4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 160:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		delay_500ns();
 455              		.loc 1 160 0 discriminator 1
 456 01a8 FFF7FEFF 		bl	delay_500ns
 161:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	} while ((GPIO_E.idr_high & LCD_BUSY) != 0);
 457              		.loc 1 161 0 discriminator 1
 458 01ac 044B     		ldr	r3, .L27
 459 01ae 5B7C     		ldrb	r3, [r3, #17]
 460 01b0 DBB2     		uxtb	r3, r3
 461 01b2 5BB2     		sxtb	r3, r3
 462 01b4 002B     		cmp	r3, #0
 463 01b6 EFDB     		blt	.L26
 162:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
 464              		.loc 1 162 0
 465 01b8 C046     		nop
 466 01ba BD46     		mov	sp, r7
 467              		@ sp needed
 468 01bc 80BD     		pop	{r7, pc}
 469              	.L28:
 470 01be C046     		.align	2
 471              	.L27:
 472 01c0 00100240 		.word	1073876992
 473 01c4 55550000 		.word	21845
 474              		.cfi_endproc
 475              	.LFE8:
 477              		.align	2
 478              		.global	select_controller
 479              		.code	16
 480              		.thumb_func
 482              	select_controller:
 483              	.LFB9:
 163:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
 164:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void select_controller(uint8_t controller)
 165:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
 484              		.loc 1 165 0
 485              		.cfi_startproc
 486              		@ args = 0, pretend = 0, frame = 8
 487              		@ frame_needed = 1, uses_anonymous_args = 0
 488 01c8 80B5     		push	{r7, lr}
 489              		.cfi_def_cfa_offset 8
 490              		.cfi_offset 7, -8
 491              		.cfi_offset 14, -4
 492 01ca 82B0     		sub	sp, sp, #8
 493              		.cfi_def_cfa_offset 16
 494 01cc 00AF     		add	r7, sp, #0
 495              		.cfi_def_cfa_register 7
 496 01ce 0200     		movs	r2, r0
 497 01d0 FB1D     		adds	r3, r7, #7
 498 01d2 1A70     		strb	r2, [r3]
 166:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	switch(controller)
 499              		.loc 1 166 0
 500 01d4 FB1D     		adds	r3, r7, #7
 501 01d6 1B78     		ldrb	r3, [r3]
 502 01d8 082B     		cmp	r3, #8
 503 01da 0FD0     		beq	.L31
 504 01dc 02DC     		bgt	.L32
 505 01de 002B     		cmp	r3, #0
 506 01e0 05D0     		beq	.L33
 167:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	{
 168:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		case 0: graphic_ctrl_bit_clear(B_CS2);
 169:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 				graphic_ctrl_bit_clear(B_CS1); break;
 170:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		case B_CS1: graphic_ctrl_bit_clear(B_CS2);
 171:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 					graphic_ctrl_bit_set(B_CS1); break;
 172:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		case B_CS2: graphic_ctrl_bit_clear(B_CS1);
 173:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 					graphic_ctrl_bit_set(B_CS2); break;
 174:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		case (B_CS1 | B_CS2): graphic_ctrl_bit_set(B_CS1);
 175:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 					graphic_ctrl_bit_set(B_CS2); break;
 176:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	}
 177:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
 507              		.loc 1 177 0
 508 01e2 1FE0     		b	.L36
 509              	.L32:
 166:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	switch(controller)
 510              		.loc 1 166 0
 511 01e4 102B     		cmp	r3, #16
 512 01e6 10D0     		beq	.L34
 513 01e8 182B     		cmp	r3, #24
 514 01ea 15D0     		beq	.L35
 515              		.loc 1 177 0
 516 01ec 1AE0     		b	.L36
 517              	.L33:
 168:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 				graphic_ctrl_bit_clear(B_CS1); break;
 518              		.loc 1 168 0
 519 01ee 1020     		movs	r0, #16
 520 01f0 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 169:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		case B_CS1: graphic_ctrl_bit_clear(B_CS2);
 521              		.loc 1 169 0
 522 01f4 0820     		movs	r0, #8
 523 01f6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 524 01fa 13E0     		b	.L30
 525              	.L31:
 170:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 					graphic_ctrl_bit_set(B_CS1); break;
 526              		.loc 1 170 0
 527 01fc 1020     		movs	r0, #16
 528 01fe FFF7FEFF 		bl	graphic_ctrl_bit_clear
 171:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		case B_CS2: graphic_ctrl_bit_clear(B_CS1);
 529              		.loc 1 171 0
 530 0202 0820     		movs	r0, #8
 531 0204 FFF7FEFF 		bl	graphic_ctrl_bit_set
 532 0208 0CE0     		b	.L30
 533              	.L34:
 172:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 					graphic_ctrl_bit_set(B_CS2); break;
 534              		.loc 1 172 0
 535 020a 0820     		movs	r0, #8
 536 020c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 173:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		case (B_CS1 | B_CS2): graphic_ctrl_bit_set(B_CS1);
 537              		.loc 1 173 0
 538 0210 1020     		movs	r0, #16
 539 0212 FFF7FEFF 		bl	graphic_ctrl_bit_set
 540 0216 05E0     		b	.L30
 541              	.L35:
 174:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 					graphic_ctrl_bit_set(B_CS2); break;
 542              		.loc 1 174 0
 543 0218 0820     		movs	r0, #8
 544 021a FFF7FEFF 		bl	graphic_ctrl_bit_set
 175:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	}
 545              		.loc 1 175 0
 546 021e 1020     		movs	r0, #16
 547 0220 FFF7FEFF 		bl	graphic_ctrl_bit_set
 548              	.L30:
 549              	.L36:
 550              		.loc 1 177 0
 551 0224 C046     		nop
 552 0226 BD46     		mov	sp, r7
 553 0228 02B0     		add	sp, sp, #8
 554              		@ sp needed
 555 022a 80BD     		pop	{r7, pc}
 556              		.cfi_endproc
 557              	.LFE9:
 559              		.align	2
 560              		.global	graphic_read
 561              		.code	16
 562              		.thumb_func
 564              	graphic_read:
 565              	.LFB10:
 178:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
 179:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** uint8_t graphic_read(uint8_t controller)
 180:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
 566              		.loc 1 180 0
 567              		.cfi_startproc
 568              		@ args = 0, pretend = 0, frame = 16
 569              		@ frame_needed = 1, uses_anonymous_args = 0
 570 022c 80B5     		push	{r7, lr}
 571              		.cfi_def_cfa_offset 8
 572              		.cfi_offset 7, -8
 573              		.cfi_offset 14, -4
 574 022e 84B0     		sub	sp, sp, #16
 575              		.cfi_def_cfa_offset 24
 576 0230 00AF     		add	r7, sp, #0
 577              		.cfi_def_cfa_register 7
 578 0232 0200     		movs	r2, r0
 579 0234 FB1D     		adds	r3, r7, #7
 580 0236 1A70     		strb	r2, [r3]
 181:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 581              		.loc 1 181 0
 582 0238 4020     		movs	r0, #64
 583 023a FFF7FEFF 		bl	graphic_ctrl_bit_set
 182:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	GPIO_E.moder = 0x00005555;
 584              		.loc 1 182 0
 585 023e 1B4B     		ldr	r3, .L41
 586 0240 1B4A     		ldr	r2, .L41+4
 587 0242 1A60     		str	r2, [r3]
 183:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_set(B_RW | B_RS);
 588              		.loc 1 183 0
 589 0244 0320     		movs	r0, #3
 590 0246 FFF7FEFF 		bl	graphic_ctrl_bit_set
 184:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	select_controller(controller);
 591              		.loc 1 184 0
 592 024a FB1D     		adds	r3, r7, #7
 593 024c 1B78     		ldrb	r3, [r3]
 594 024e 1800     		movs	r0, r3
 595 0250 FFF7FEFF 		bl	select_controller
 185:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	delay_500ns();
 596              		.loc 1 185 0
 597 0254 FFF7FEFF 		bl	delay_500ns
 186:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 598              		.loc 1 186 0
 599 0258 4020     		movs	r0, #64
 600 025a FFF7FEFF 		bl	graphic_ctrl_bit_set
 187:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	delay_500ns();
 601              		.loc 1 187 0
 602 025e FFF7FEFF 		bl	delay_500ns
 188:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	uint8_t rv = GPIO_E.idr_high;
 603              		.loc 1 188 0
 604 0262 124A     		ldr	r2, .L41
 605 0264 0F23     		movs	r3, #15
 606 0266 FB18     		adds	r3, r7, r3
 607 0268 527C     		ldrb	r2, [r2, #17]
 608 026a 1A70     		strb	r2, [r3]
 189:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 609              		.loc 1 189 0
 610 026c 4020     		movs	r0, #64
 611 026e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 190:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	GPIO_E.moder = 0x55555555;
 612              		.loc 1 190 0
 613 0272 0E4B     		ldr	r3, .L41
 614 0274 0F4A     		ldr	r2, .L41+8
 615 0276 1A60     		str	r2, [r3]
 191:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	if(controller == B_CS1)
 616              		.loc 1 191 0
 617 0278 FB1D     		adds	r3, r7, #7
 618 027a 1B78     		ldrb	r3, [r3]
 619 027c 082B     		cmp	r3, #8
 620 027e 05D1     		bne	.L38
 192:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	{
 193:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		select_controller(B_CS1);
 621              		.loc 1 193 0
 622 0280 0820     		movs	r0, #8
 623 0282 FFF7FEFF 		bl	select_controller
 194:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		graphic_wait_ready();
 624              		.loc 1 194 0
 625 0286 FFF7FEFF 		bl	graphic_wait_ready
 626 028a 08E0     		b	.L39
 627              	.L38:
 195:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	} else if(controller == B_CS2)
 628              		.loc 1 195 0
 629 028c FB1D     		adds	r3, r7, #7
 630 028e 1B78     		ldrb	r3, [r3]
 631 0290 102B     		cmp	r3, #16
 632 0292 04D1     		bne	.L39
 196:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	{
 197:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		select_controller(B_CS2);
 633              		.loc 1 197 0
 634 0294 1020     		movs	r0, #16
 635 0296 FFF7FEFF 		bl	select_controller
 198:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		graphic_wait_ready();
 636              		.loc 1 198 0
 637 029a FFF7FEFF 		bl	graphic_wait_ready
 638              	.L39:
 199:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	}
 200:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	return rv;
 639              		.loc 1 200 0
 640 029e 0F23     		movs	r3, #15
 641 02a0 FB18     		adds	r3, r7, r3
 642 02a2 1B78     		ldrb	r3, [r3]
 201:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
 643              		.loc 1 201 0
 644 02a4 1800     		movs	r0, r3
 645 02a6 BD46     		mov	sp, r7
 646 02a8 04B0     		add	sp, sp, #16
 647              		@ sp needed
 648 02aa 80BD     		pop	{r7, pc}
 649              	.L42:
 650              		.align	2
 651              	.L41:
 652 02ac 00100240 		.word	1073876992
 653 02b0 55550000 		.word	21845
 654 02b4 55555555 		.word	1431655765
 655              		.cfi_endproc
 656              	.LFE10:
 658              		.align	2
 659              		.global	graphic_write
 660              		.code	16
 661              		.thumb_func
 663              	graphic_write:
 664              	.LFB11:
 202:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
 203:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void graphic_write(uint8_t value, uint8_t controller)
 204:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
 665              		.loc 1 204 0
 666              		.cfi_startproc
 667              		@ args = 0, pretend = 0, frame = 8
 668              		@ frame_needed = 1, uses_anonymous_args = 0
 669 02b8 80B5     		push	{r7, lr}
 670              		.cfi_def_cfa_offset 8
 671              		.cfi_offset 7, -8
 672              		.cfi_offset 14, -4
 673 02ba 82B0     		sub	sp, sp, #8
 674              		.cfi_def_cfa_offset 16
 675 02bc 00AF     		add	r7, sp, #0
 676              		.cfi_def_cfa_register 7
 677 02be 0200     		movs	r2, r0
 678 02c0 FB1D     		adds	r3, r7, #7
 679 02c2 1A70     		strb	r2, [r3]
 680 02c4 BB1D     		adds	r3, r7, #6
 681 02c6 0A1C     		adds	r2, r1, #0
 682 02c8 1A70     		strb	r2, [r3]
 205:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	GPIO_E.odr_high = value;
 683              		.loc 1 205 0
 684 02ca 1B4A     		ldr	r2, .L46
 685 02cc FB1D     		adds	r3, r7, #7
 686 02ce 1B78     		ldrb	r3, [r3]
 687 02d0 5375     		strb	r3, [r2, #21]
 206:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	select_controller(controller);
 688              		.loc 1 206 0
 689 02d2 BB1D     		adds	r3, r7, #6
 690 02d4 1B78     		ldrb	r3, [r3]
 691 02d6 1800     		movs	r0, r3
 692 02d8 FFF7FEFF 		bl	select_controller
 207:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	delay_500ns();
 693              		.loc 1 207 0
 694 02dc FFF7FEFF 		bl	delay_500ns
 208:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 695              		.loc 1 208 0
 696 02e0 4020     		movs	r0, #64
 697 02e2 FFF7FEFF 		bl	graphic_ctrl_bit_set
 209:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	delay_500ns();
 698              		.loc 1 209 0
 699 02e6 FFF7FEFF 		bl	delay_500ns
 210:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 700              		.loc 1 210 0
 701 02ea 4020     		movs	r0, #64
 702 02ec FFF7FEFF 		bl	graphic_ctrl_bit_clear
 211:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	if(controller & B_CS1)
 703              		.loc 1 211 0
 704 02f0 BB1D     		adds	r3, r7, #6
 705 02f2 1B78     		ldrb	r3, [r3]
 706 02f4 0822     		movs	r2, #8
 707 02f6 1340     		ands	r3, r2
 708 02f8 06D0     		beq	.L44
 212:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	{
 213:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		select_controller(controller);
 709              		.loc 1 213 0
 710 02fa BB1D     		adds	r3, r7, #6
 711 02fc 1B78     		ldrb	r3, [r3]
 712 02fe 1800     		movs	r0, r3
 713 0300 FFF7FEFF 		bl	select_controller
 214:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		graphic_wait_ready();
 714              		.loc 1 214 0
 715 0304 FFF7FEFF 		bl	graphic_wait_ready
 716              	.L44:
 215:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	}
 216:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	if(controller & B_CS2)
 717              		.loc 1 216 0
 718 0308 BB1D     		adds	r3, r7, #6
 719 030a 1B78     		ldrb	r3, [r3]
 720 030c 1022     		movs	r2, #16
 721 030e 1340     		ands	r3, r2
 722 0310 04D0     		beq	.L45
 217:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	{
 218:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		select_controller(B_CS2);
 723              		.loc 1 218 0
 724 0312 1020     		movs	r0, #16
 725 0314 FFF7FEFF 		bl	select_controller
 219:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		graphic_wait_ready();
 726              		.loc 1 219 0
 727 0318 FFF7FEFF 		bl	graphic_wait_ready
 728              	.L45:
 220:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	}
 221:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	GPIO_E.odr_high = 0;
 729              		.loc 1 221 0
 730 031c 064B     		ldr	r3, .L46
 731 031e 0022     		movs	r2, #0
 732 0320 5A75     		strb	r2, [r3, #21]
 222:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 733              		.loc 1 222 0
 734 0322 4020     		movs	r0, #64
 735 0324 FFF7FEFF 		bl	graphic_ctrl_bit_set
 223:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	select_controller(0);
 736              		.loc 1 223 0
 737 0328 0020     		movs	r0, #0
 738 032a FFF7FEFF 		bl	select_controller
 224:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
 739              		.loc 1 224 0
 740 032e C046     		nop
 741 0330 BD46     		mov	sp, r7
 742 0332 02B0     		add	sp, sp, #8
 743              		@ sp needed
 744 0334 80BD     		pop	{r7, pc}
 745              	.L47:
 746 0336 C046     		.align	2
 747              	.L46:
 748 0338 00100240 		.word	1073876992
 749              		.cfi_endproc
 750              	.LFE11:
 752              		.align	2
 753              		.global	graphic_write_command
 754              		.code	16
 755              		.thumb_func
 757              	graphic_write_command:
 758              	.LFB12:
 225:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
 226:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void graphic_write_command(uint8_t command, uint8_t controller)
 227:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
 759              		.loc 1 227 0
 760              		.cfi_startproc
 761              		@ args = 0, pretend = 0, frame = 8
 762              		@ frame_needed = 1, uses_anonymous_args = 0
 763 033c 80B5     		push	{r7, lr}
 764              		.cfi_def_cfa_offset 8
 765              		.cfi_offset 7, -8
 766              		.cfi_offset 14, -4
 767 033e 82B0     		sub	sp, sp, #8
 768              		.cfi_def_cfa_offset 16
 769 0340 00AF     		add	r7, sp, #0
 770              		.cfi_def_cfa_register 7
 771 0342 0200     		movs	r2, r0
 772 0344 FB1D     		adds	r3, r7, #7
 773 0346 1A70     		strb	r2, [r3]
 774 0348 BB1D     		adds	r3, r7, #6
 775 034a 0A1C     		adds	r2, r1, #0
 776 034c 1A70     		strb	r2, [r3]
 228:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 777              		.loc 1 228 0
 778 034e 4020     		movs	r0, #64
 779 0350 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 229:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	select_controller(controller);
 780              		.loc 1 229 0
 781 0354 BB1D     		adds	r3, r7, #6
 782 0356 1B78     		ldrb	r3, [r3]
 783 0358 1800     		movs	r0, r3
 784 035a FFF7FEFF 		bl	select_controller
 230:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_clear(B_RS | B_RW);
 785              		.loc 1 230 0
 786 035e 0320     		movs	r0, #3
 787 0360 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 231:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_write(command, controller);
 788              		.loc 1 231 0
 789 0364 BB1D     		adds	r3, r7, #6
 790 0366 1A78     		ldrb	r2, [r3]
 791 0368 FB1D     		adds	r3, r7, #7
 792 036a 1B78     		ldrb	r3, [r3]
 793 036c 1100     		movs	r1, r2
 794 036e 1800     		movs	r0, r3
 795 0370 FFF7FEFF 		bl	graphic_write
 232:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
 796              		.loc 1 232 0
 797 0374 C046     		nop
 798 0376 BD46     		mov	sp, r7
 799 0378 02B0     		add	sp, sp, #8
 800              		@ sp needed
 801 037a 80BD     		pop	{r7, pc}
 802              		.cfi_endproc
 803              	.LFE12:
 805              		.align	2
 806              		.global	graphic_write_data
 807              		.code	16
 808              		.thumb_func
 810              	graphic_write_data:
 811              	.LFB13:
 233:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
 234:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void graphic_write_data(uint8_t data, uint8_t controller)
 235:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
 812              		.loc 1 235 0
 813              		.cfi_startproc
 814              		@ args = 0, pretend = 0, frame = 8
 815              		@ frame_needed = 1, uses_anonymous_args = 0
 816 037c 80B5     		push	{r7, lr}
 817              		.cfi_def_cfa_offset 8
 818              		.cfi_offset 7, -8
 819              		.cfi_offset 14, -4
 820 037e 82B0     		sub	sp, sp, #8
 821              		.cfi_def_cfa_offset 16
 822 0380 00AF     		add	r7, sp, #0
 823              		.cfi_def_cfa_register 7
 824 0382 0200     		movs	r2, r0
 825 0384 FB1D     		adds	r3, r7, #7
 826 0386 1A70     		strb	r2, [r3]
 827 0388 BB1D     		adds	r3, r7, #6
 828 038a 0A1C     		adds	r2, r1, #0
 829 038c 1A70     		strb	r2, [r3]
 236:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_clear(B_E);
 830              		.loc 1 236 0
 831 038e 4020     		movs	r0, #64
 832 0390 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 237:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	select_controller(controller);
 833              		.loc 1 237 0
 834 0394 BB1D     		adds	r3, r7, #6
 835 0396 1B78     		ldrb	r3, [r3]
 836 0398 1800     		movs	r0, r3
 837 039a FFF7FEFF 		bl	select_controller
 238:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_set(B_RS);
 838              		.loc 1 238 0
 839 039e 0120     		movs	r0, #1
 840 03a0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 239:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 841              		.loc 1 239 0
 842 03a4 0220     		movs	r0, #2
 843 03a6 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 240:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_write(data, controller);
 844              		.loc 1 240 0
 845 03aa BB1D     		adds	r3, r7, #6
 846 03ac 1A78     		ldrb	r2, [r3]
 847 03ae FB1D     		adds	r3, r7, #7
 848 03b0 1B78     		ldrb	r3, [r3]
 849 03b2 1100     		movs	r1, r2
 850 03b4 1800     		movs	r0, r3
 851 03b6 FFF7FEFF 		bl	graphic_write
 241:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
 852              		.loc 1 241 0
 853 03ba C046     		nop
 854 03bc BD46     		mov	sp, r7
 855 03be 02B0     		add	sp, sp, #8
 856              		@ sp needed
 857 03c0 80BD     		pop	{r7, pc}
 858              		.cfi_endproc
 859              	.LFE13:
 861 03c2 C046     		.align	2
 862              		.global	graphic_clear_screen
 863              		.code	16
 864              		.thumb_func
 866              	graphic_clear_screen:
 867              	.LFB14:
 242:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
 243:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void graphic_clear_screen()
 244:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
 868              		.loc 1 244 0
 869              		.cfi_startproc
 870              		@ args = 0, pretend = 0, frame = 8
 871              		@ frame_needed = 1, uses_anonymous_args = 0
 872 03c4 80B5     		push	{r7, lr}
 873              		.cfi_def_cfa_offset 8
 874              		.cfi_offset 7, -8
 875              		.cfi_offset 14, -4
 876 03c6 82B0     		sub	sp, sp, #8
 877              		.cfi_def_cfa_offset 16
 878 03c8 00AF     		add	r7, sp, #0
 879              		.cfi_def_cfa_register 7
 880              	.LBB3:
 245:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	for(uint8_t page = 0; page <= 7; page++)
 881              		.loc 1 245 0
 882 03ca FB1D     		adds	r3, r7, #7
 883 03cc 0022     		movs	r2, #0
 884 03ce 1A70     		strb	r2, [r3]
 885 03d0 23E0     		b	.L51
 886              	.L54:
 246:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	{
 247:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 887              		.loc 1 247 0
 888 03d2 FB1D     		adds	r3, r7, #7
 889 03d4 1B78     		ldrb	r3, [r3]
 890 03d6 4822     		movs	r2, #72
 891 03d8 5242     		rsbs	r2, r2, #0
 892 03da 1343     		orrs	r3, r2
 893 03dc DBB2     		uxtb	r3, r3
 894 03de 1821     		movs	r1, #24
 895 03e0 1800     		movs	r0, r3
 896 03e2 FFF7FEFF 		bl	graphic_write_command
 248:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		graphic_write_command(LCD_SET_ADD | 0, B_CS1 | B_CS2);
 897              		.loc 1 248 0
 898 03e6 1821     		movs	r1, #24
 899 03e8 4020     		movs	r0, #64
 900 03ea FFF7FEFF 		bl	graphic_write_command
 901              	.LBB4:
 249:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		for(uint16_t add = 0; add <= 63; add++)
 902              		.loc 1 249 0
 903 03ee 3B1D     		adds	r3, r7, #4
 904 03f0 0022     		movs	r2, #0
 905 03f2 1A80     		strh	r2, [r3]
 906 03f4 08E0     		b	.L52
 907              	.L53:
 250:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		{
 251:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 			graphic_write_data(0, B_CS1 | B_CS2);
 908              		.loc 1 251 0 discriminator 3
 909 03f6 1821     		movs	r1, #24
 910 03f8 0020     		movs	r0, #0
 911 03fa FFF7FEFF 		bl	graphic_write_data
 249:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		for(uint16_t add = 0; add <= 63; add++)
 912              		.loc 1 249 0 discriminator 3
 913 03fe 3B1D     		adds	r3, r7, #4
 914 0400 1A88     		ldrh	r2, [r3]
 915 0402 3B1D     		adds	r3, r7, #4
 916 0404 0132     		adds	r2, r2, #1
 917 0406 1A80     		strh	r2, [r3]
 918              	.L52:
 249:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		for(uint16_t add = 0; add <= 63; add++)
 919              		.loc 1 249 0 is_stmt 0 discriminator 1
 920 0408 3B1D     		adds	r3, r7, #4
 921 040a 1B88     		ldrh	r3, [r3]
 922 040c 3F2B     		cmp	r3, #63
 923 040e F2D9     		bls	.L53
 924              	.LBE4:
 245:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	{
 925              		.loc 1 245 0 is_stmt 1 discriminator 2
 926 0410 FB1D     		adds	r3, r7, #7
 927 0412 1A78     		ldrb	r2, [r3]
 928 0414 FB1D     		adds	r3, r7, #7
 929 0416 0132     		adds	r2, r2, #1
 930 0418 1A70     		strb	r2, [r3]
 931              	.L51:
 245:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	{
 932              		.loc 1 245 0 is_stmt 0 discriminator 1
 933 041a FB1D     		adds	r3, r7, #7
 934 041c 1B78     		ldrb	r3, [r3]
 935 041e 072B     		cmp	r3, #7
 936 0420 D7D9     		bls	.L54
 937              	.LBE3:
 252:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		}
 253:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	}
 254:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
 938              		.loc 1 254 0 is_stmt 1
 939 0422 C046     		nop
 940 0424 BD46     		mov	sp, r7
 941 0426 02B0     		add	sp, sp, #8
 942              		@ sp needed
 943 0428 80BD     		pop	{r7, pc}
 944              		.cfi_endproc
 945              	.LFE14:
 947 042a C046     		.align	2
 948              		.global	graphic_initialize
 949              		.code	16
 950              		.thumb_func
 952              	graphic_initialize:
 953              	.LFB15:
 255:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
 256:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void graphic_initialize()
 257:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
 954              		.loc 1 257 0
 955              		.cfi_startproc
 956              		@ args = 0, pretend = 0, frame = 0
 957              		@ frame_needed = 1, uses_anonymous_args = 0
 958 042c 80B5     		push	{r7, lr}
 959              		.cfi_def_cfa_offset 8
 960              		.cfi_offset 7, -8
 961              		.cfi_offset 14, -4
 962 042e 00AF     		add	r7, sp, #0
 963              		.cfi_def_cfa_register 7
 258:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_set(B_E);
 964              		.loc 1 258 0
 965 0430 4020     		movs	r0, #64
 966 0432 FFF7FEFF 		bl	graphic_ctrl_bit_set
 259:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	delay_micro(10);
 967              		.loc 1 259 0
 968 0436 0A20     		movs	r0, #10
 969 0438 FFF7FEFF 		bl	delay_micro
 260:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_clear(B_RST | B_E | B_CS1 | B_CS2);
 970              		.loc 1 260 0
 971 043c 7820     		movs	r0, #120
 972 043e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 261:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	delay_milli(30);
 973              		.loc 1 261 0
 974 0442 1E20     		movs	r0, #30
 975 0444 FFF7FEFF 		bl	delay_milli
 262:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_ctrl_bit_set(B_RST);
 976              		.loc 1 262 0
 977 0448 2020     		movs	r0, #32
 978 044a FFF7FEFF 		bl	graphic_ctrl_bit_set
 263:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_write_command(LCD_OFF, B_CS1 | B_CS2);
 979              		.loc 1 263 0
 980 044e 1821     		movs	r1, #24
 981 0450 3E20     		movs	r0, #62
 982 0452 FFF7FEFF 		bl	graphic_write_command
 264:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_write_command(LCD_ON, B_CS1 | B_CS2);
 983              		.loc 1 264 0
 984 0456 1821     		movs	r1, #24
 985 0458 3F20     		movs	r0, #63
 986 045a FFF7FEFF 		bl	graphic_write_command
 265:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_write_command(LCD_DISP_START, B_CS1 | B_CS2);
 987              		.loc 1 265 0
 988 045e 1821     		movs	r1, #24
 989 0460 C020     		movs	r0, #192
 990 0462 FFF7FEFF 		bl	graphic_write_command
 266:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_write_command(LCD_SET_ADD, B_CS1 | B_CS2);
 991              		.loc 1 266 0
 992 0466 1821     		movs	r1, #24
 993 0468 4020     		movs	r0, #64
 994 046a FFF7FEFF 		bl	graphic_write_command
 267:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_write_command(LCD_SET_PAGE, B_CS1 | B_CS2);
 995              		.loc 1 267 0
 996 046e 1821     		movs	r1, #24
 997 0470 B820     		movs	r0, #184
 998 0472 FFF7FEFF 		bl	graphic_write_command
 268:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	select_controller(0);
 999              		.loc 1 268 0
 1000 0476 0020     		movs	r0, #0
 1001 0478 FFF7FEFF 		bl	select_controller
 269:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	
 270:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
 1002              		.loc 1 270 0
 1003 047c C046     		nop
 1004 047e BD46     		mov	sp, r7
 1005              		@ sp needed
 1006 0480 80BD     		pop	{r7, pc}
 1007              		.cfi_endproc
 1008              	.LFE15:
 1010 0482 C046     		.align	2
 1011              		.global	main
 1012              		.code	16
 1013              		.thumb_func
 1015              	main:
 1016              	.LFB16:
 271:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 
 272:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** void main(void)
 273:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** {
 1017              		.loc 1 273 0
 1018              		.cfi_startproc
 1019              		@ args = 0, pretend = 0, frame = 0
 1020              		@ frame_needed = 1, uses_anonymous_args = 0
 1021 0484 80B5     		push	{r7, lr}
 1022              		.cfi_def_cfa_offset 8
 1023              		.cfi_offset 7, -8
 1024              		.cfi_offset 14, -4
 1025 0486 00AF     		add	r7, sp, #0
 1026              		.cfi_def_cfa_register 7
 274:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	init_app();
 1027              		.loc 1 274 0
 1028 0488 FFF7FEFF 		bl	init_app
 275:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_initialize();
 1029              		.loc 1 275 0
 1030 048c FFF7FEFF 		bl	graphic_initialize
 276:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_clear_screen();
 1031              		.loc 1 276 0
 1032 0490 FFF7FEFF 		bl	graphic_clear_screen
 277:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_write_command(LCD_SET_ADD | 10, B_CS1 | B_CS2);
 1033              		.loc 1 277 0
 1034 0494 1821     		movs	r1, #24
 1035 0496 4A20     		movs	r0, #74
 1036 0498 FFF7FEFF 		bl	graphic_write_command
 278:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_write_command(LCD_SET_PAGE | 1, B_CS1 | B_CS2);
 1037              		.loc 1 278 0
 1038 049c 1821     		movs	r1, #24
 1039 049e B920     		movs	r0, #185
 1040 04a0 FFF7FEFF 		bl	graphic_write_command
 279:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_write_data(0xFF, B_CS1 | B_CS2);
 1041              		.loc 1 279 0
 1042 04a4 1821     		movs	r1, #24
 1043 04a6 FF20     		movs	r0, #255
 1044 04a8 FFF7FEFF 		bl	graphic_write_data
 280:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 	graphic_wait_ready();
 1045              		.loc 1 280 0
 1046 04ac FFF7FEFF 		bl	graphic_wait_ready
 281:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** 		
 282:/Users/Simon/Dropbox/EDA487/graphicasciidisplay/startup.c **** }
 1047              		.loc 1 282 0
 1048 04b0 C046     		nop
 1049 04b2 BD46     		mov	sp, r7
 1050              		@ sp needed
 1051 04b4 80BD     		pop	{r7, pc}
 1052              		.cfi_endproc
 1053              	.LFE16:
 1055              	.Letext0:
