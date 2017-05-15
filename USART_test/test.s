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
  51              		.global	iniuart
  52              		.code	16
  53              		.thumb_func
  55              	iniuart:
  56              	.LFB1:
  16:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 
  17:/Users/Simon/chalmers-eda487/USART_test/startup.c **** #include "types.h"
  18:/Users/Simon/chalmers-eda487/USART_test/startup.c **** //#include "usart.h"
  19:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 
  20:/Users/Simon/chalmers-eda487/USART_test/startup.c **** typedef struct tag_usart
  21:/Users/Simon/chalmers-eda487/USART_test/startup.c **** {
  22:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t sr;
  23:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t Unused0;
  24:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t dr;
  25:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t Unused1;
  26:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t brr;
  27:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t Unused2;
  28:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t cr1;
  29:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t Unused3;
  30:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t cr2;
  31:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t Unused4;
  32:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t cr3;
  33:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t Unused5;
  34:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t gtpr;
  35:/Users/Simon/chalmers-eda487/USART_test/startup.c **** } USART;
  36:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 
  37:/Users/Simon/chalmers-eda487/USART_test/startup.c **** typedef volatile USART* usartptr;
  38:/Users/Simon/chalmers-eda487/USART_test/startup.c **** #define USART1 (*((usartptr)0x40011000)) 
  39:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 
  40:/Users/Simon/chalmers-eda487/USART_test/startup.c **** void iniuart()
  41:/Users/Simon/chalmers-eda487/USART_test/startup.c **** {
  57              		.loc 1 41 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  42:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	USART1.brr = 0x2D9;
  67              		.loc 1 42 0
  68 0004 054B     		ldr	r3, .L3
  69 0006 D922     		movs	r2, #217
  70 0008 1A71     		strb	r2, [r3, #4]
  43:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	USART1.cr2 = 0;
  71              		.loc 1 43 0
  72 000a 044B     		ldr	r3, .L3
  73 000c 0022     		movs	r2, #0
  74 000e 1A72     		strb	r2, [r3, #8]
  44:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	USART1.cr1 = (1<<13) | (1<<3) | (1<<2);
  75              		.loc 1 44 0
  76 0010 024B     		ldr	r3, .L3
  77 0012 0C22     		movs	r2, #12
  78 0014 9A71     		strb	r2, [r3, #6]
  45:/Users/Simon/chalmers-eda487/USART_test/startup.c **** }
  79              		.loc 1 45 0
  80 0016 C046     		nop
  81 0018 BD46     		mov	sp, r7
  82              		@ sp needed
  83 001a 80BD     		pop	{r7, pc}
  84              	.L4:
  85              		.align	2
  86              	.L3:
  87 001c 00100140 		.word	1073811456
  88              		.cfi_endproc
  89              	.LFE1:
  91              		.align	2
  92              		.global	tstchar
  93              		.code	16
  94              		.thumb_func
  96              	tstchar:
  97              	.LFB2:
  46:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 
  47:/Users/Simon/chalmers-eda487/USART_test/startup.c **** uint8_t tstchar()
  48:/Users/Simon/chalmers-eda487/USART_test/startup.c **** {
  98              		.loc 1 48 0
  99              		.cfi_startproc
 100              		@ args = 0, pretend = 0, frame = 0
 101              		@ frame_needed = 1, uses_anonymous_args = 0
 102 0020 80B5     		push	{r7, lr}
 103              		.cfi_def_cfa_offset 8
 104              		.cfi_offset 7, -8
 105              		.cfi_offset 14, -4
 106 0022 00AF     		add	r7, sp, #0
 107              		.cfi_def_cfa_register 7
  49:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	if( (USART1.sr & (1<<5) ) ==0)
 108              		.loc 1 49 0
 109 0024 074B     		ldr	r3, .L8
 110 0026 1B78     		ldrb	r3, [r3]
 111 0028 DBB2     		uxtb	r3, r3
 112 002a 1A00     		movs	r2, r3
 113 002c 2023     		movs	r3, #32
 114 002e 1340     		ands	r3, r2
 115 0030 01D1     		bne	.L6
  50:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	{
  51:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 		return 0;
 116              		.loc 1 51 0
 117 0032 0023     		movs	r3, #0
 118 0034 02E0     		b	.L7
 119              	.L6:
  52:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	}
  53:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	return (uint8_t) USART1.dr;
 120              		.loc 1 53 0
 121 0036 034B     		ldr	r3, .L8
 122 0038 9B78     		ldrb	r3, [r3, #2]
 123 003a DBB2     		uxtb	r3, r3
 124              	.L7:
  54:/Users/Simon/chalmers-eda487/USART_test/startup.c **** }
 125              		.loc 1 54 0
 126 003c 1800     		movs	r0, r3
 127 003e BD46     		mov	sp, r7
 128              		@ sp needed
 129 0040 80BD     		pop	{r7, pc}
 130              	.L9:
 131 0042 C046     		.align	2
 132              	.L8:
 133 0044 00100140 		.word	1073811456
 134              		.cfi_endproc
 135              	.LFE2:
 137              		.align	2
 138              		.global	outchar
 139              		.code	16
 140              		.thumb_func
 142              	outchar:
 143              	.LFB3:
  55:/Users/Simon/chalmers-eda487/USART_test/startup.c **** void outchar ( uint8_t c )
  56:/Users/Simon/chalmers-eda487/USART_test/startup.c **** {
 144              		.loc 1 56 0
 145              		.cfi_startproc
 146              		@ args = 0, pretend = 0, frame = 8
 147              		@ frame_needed = 1, uses_anonymous_args = 0
 148 0048 80B5     		push	{r7, lr}
 149              		.cfi_def_cfa_offset 8
 150              		.cfi_offset 7, -8
 151              		.cfi_offset 14, -4
 152 004a 82B0     		sub	sp, sp, #8
 153              		.cfi_def_cfa_offset 16
 154 004c 00AF     		add	r7, sp, #0
 155              		.cfi_def_cfa_register 7
 156 004e 0200     		movs	r2, r0
 157 0050 FB1D     		adds	r3, r7, #7
 158 0052 1A70     		strb	r2, [r3]
  57:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	while ((USART1.sr & (1<<7)) == 0) ;
 159              		.loc 1 57 0
 160 0054 C046     		nop
 161              	.L11:
 162              		.loc 1 57 0 is_stmt 0 discriminator 1
 163 0056 074B     		ldr	r3, .L12
 164 0058 1B78     		ldrb	r3, [r3]
 165 005a DBB2     		uxtb	r3, r3
 166 005c 5BB2     		sxtb	r3, r3
 167 005e 002B     		cmp	r3, #0
 168 0060 F9DA     		bge	.L11
  58:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	USART1.dr = (uint16_t) c;
 169              		.loc 1 58 0 is_stmt 1
 170 0062 044A     		ldr	r2, .L12
 171 0064 FB1D     		adds	r3, r7, #7
 172 0066 1B78     		ldrb	r3, [r3]
 173 0068 9370     		strb	r3, [r2, #2]
  59:/Users/Simon/chalmers-eda487/USART_test/startup.c **** }
 174              		.loc 1 59 0
 175 006a C046     		nop
 176 006c BD46     		mov	sp, r7
 177 006e 02B0     		add	sp, sp, #8
 178              		@ sp needed
 179 0070 80BD     		pop	{r7, pc}
 180              	.L13:
 181 0072 C046     		.align	2
 182              	.L12:
 183 0074 00100140 		.word	1073811456
 184              		.cfi_endproc
 185              	.LFE3:
 187              		.align	2
 188              		.global	inchar
 189              		.code	16
 190              		.thumb_func
 192              	inchar:
 193              	.LFB4:
  60:/Users/Simon/chalmers-eda487/USART_test/startup.c **** uint8_t inchar ()
  61:/Users/Simon/chalmers-eda487/USART_test/startup.c **** {
 194              		.loc 1 61 0
 195              		.cfi_startproc
 196              		@ args = 0, pretend = 0, frame = 8
 197              		@ frame_needed = 1, uses_anonymous_args = 0
 198 0078 90B5     		push	{r4, r7, lr}
 199              		.cfi_def_cfa_offset 12
 200              		.cfi_offset 4, -12
 201              		.cfi_offset 7, -8
 202              		.cfi_offset 14, -4
 203 007a 83B0     		sub	sp, sp, #12
 204              		.cfi_def_cfa_offset 24
 205 007c 00AF     		add	r7, sp, #0
 206              		.cfi_def_cfa_register 7
 207              	.L15:
  62:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t c;
  63:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	while( (c=tstchar() ) == 0);
 208              		.loc 1 63 0 discriminator 1
 209 007e FC1D     		adds	r4, r7, #7
 210 0080 FFF7FEFF 		bl	tstchar
 211 0084 0300     		movs	r3, r0
 212 0086 2370     		strb	r3, [r4]
 213 0088 FB1D     		adds	r3, r7, #7
 214 008a 1B78     		ldrb	r3, [r3]
 215 008c 002B     		cmp	r3, #0
 216 008e F6D0     		beq	.L15
  64:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	return c;
 217              		.loc 1 64 0
 218 0090 FB1D     		adds	r3, r7, #7
 219 0092 1B78     		ldrb	r3, [r3]
  65:/Users/Simon/chalmers-eda487/USART_test/startup.c **** }
 220              		.loc 1 65 0
 221 0094 1800     		movs	r0, r3
 222 0096 BD46     		mov	sp, r7
 223 0098 03B0     		add	sp, sp, #12
 224              		@ sp needed
 225 009a 90BD     		pop	{r4, r7, pc}
 226              		.cfi_endproc
 227              	.LFE4:
 229              		.align	2
 230              		.global	main
 231              		.code	16
 232              		.thumb_func
 234              	main:
 235              	.LFB5:
  66:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 
  67:/Users/Simon/chalmers-eda487/USART_test/startup.c **** void main(void)
  68:/Users/Simon/chalmers-eda487/USART_test/startup.c **** {
 236              		.loc 1 68 0
 237              		.cfi_startproc
 238              		@ args = 0, pretend = 0, frame = 8
 239              		@ frame_needed = 1, uses_anonymous_args = 0
 240 009c 90B5     		push	{r4, r7, lr}
 241              		.cfi_def_cfa_offset 12
 242              		.cfi_offset 4, -12
 243              		.cfi_offset 7, -8
 244              		.cfi_offset 14, -4
 245 009e 83B0     		sub	sp, sp, #12
 246              		.cfi_def_cfa_offset 24
 247 00a0 00AF     		add	r7, sp, #0
 248              		.cfi_def_cfa_register 7
  69:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	uint8_t c;
  70:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	iniuart();
 249              		.loc 1 70 0
 250 00a2 FFF7FEFF 		bl	iniuart
 251              	.L19:
  71:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	while(1)
  72:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	{
  73:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 		c = tstchar();
 252              		.loc 1 73 0
 253 00a6 FC1D     		adds	r4, r7, #7
 254 00a8 FFF7FEFF 		bl	tstchar
 255 00ac 0300     		movs	r3, r0
 256 00ae 2370     		strb	r3, [r4]
  74:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 		if ( c )
 257              		.loc 1 74 0
 258 00b0 FB1D     		adds	r3, r7, #7
 259 00b2 1B78     		ldrb	r3, [r3]
 260 00b4 002B     		cmp	r3, #0
 261 00b6 F6D0     		beq	.L19
  75:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 		{
  76:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 			outchar(c);
 262              		.loc 1 76 0
 263 00b8 FB1D     		adds	r3, r7, #7
 264 00ba 1B78     		ldrb	r3, [r3]
 265 00bc 1800     		movs	r0, r3
 266 00be FFF7FEFF 		bl	outchar
  77:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 		}
  78:/Users/Simon/chalmers-eda487/USART_test/startup.c **** 	}
 267              		.loc 1 78 0
 268 00c2 F0E7     		b	.L19
 269              		.cfi_endproc
 270              	.LFE5:
 272              	.Letext0:
 273              		.file 2 "/Users/Simon/chalmers-eda487/libraries/types.h"
