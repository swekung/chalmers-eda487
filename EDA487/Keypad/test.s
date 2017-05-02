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
  27              		.file 1 "/Users/Simon/Dropbox/EDA487/Keypad/startup.c"
   1:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** /*
   2:/Users/Simon/Dropbox/EDA487/Keypad/startup.c ****  * 	startup.c
   3:/Users/Simon/Dropbox/EDA487/Keypad/startup.c ****  *
   4:/Users/Simon/Dropbox/EDA487/Keypad/startup.c ****  */
   5:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** #include "gpio.h"
   6:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 
   7:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   8:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** typedef volatile int* port32ptr;
   9:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** typedef volatile long* port16ptr;
  10:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** typedef volatile char* port8ptr;
  11:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** #define GPIO_D_ADDR 0x40020C00
  12:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** #define GPIO_MODER ((port32ptr)GPIO_D_ADDR)
  13:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** #define GPIO_OTYPER ((port32ptr)(GPIO_D_ADDR + 0x04))
  14:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** #define GPIO_OSPEEDR ((port32ptr)(GPIO_D_ADDR + 0x08))
  15:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** #define GPIO_PUPDR ((port32ptr)(GPIO_D_ADDR + 0x0C))
  16:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** #define GPIO_IDR_LOW ((port8ptr)(GPIO_D_ADDR + 0x10))
  17:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** #define GPIO_IDR_HIGH ((port8ptr)(GPIO_D_ADDR + 0x11))
  18:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** #define GPIO_ODR_LOW ((port8ptr)(GPIO_D_ADDR + 0x14))
  19:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** #define GPIO_ODR_HIGH ((port8ptr)(GPIO_D_ADDR + 0x15))
  20:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** unsigned char keypad[16] = {1,2,3,10,4,5,6,11,7,8,9,12,14,0,15,13};
  21:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 
  22:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 
  23:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** void startup ( void )
  24:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** {
  28              		.loc 1 24 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
  25:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** asm volatile(
  33              		.loc 1 25 0
  34              		.syntax divided
  35              	@ 25 "/Users/Simon/Dropbox/EDA487/Keypad/startup.c" 1
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  26:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  27:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	" MOV SP,R0\n"
  28:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	" BL main\n"				/* call main */
  29:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	".L1: B .L1\n"				/* never return */
  30:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	) ;
  31:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** }
  42              		.loc 1 31 0
  43              		.thumb
  44              		.syntax unified
  45 000a C046     		nop
  46              		.cfi_endproc
  47              	.LFE0:
  49              		.global	keypad
  50              		.data
  51              		.align	2
  54              	keypad:
  55 0000 01       		.byte	1
  56 0001 02       		.byte	2
  57 0002 03       		.byte	3
  58 0003 0A       		.byte	10
  59 0004 04       		.byte	4
  60 0005 05       		.byte	5
  61 0006 06       		.byte	6
  62 0007 0B       		.byte	11
  63 0008 07       		.byte	7
  64 0009 08       		.byte	8
  65 000a 09       		.byte	9
  66 000b 0C       		.byte	12
  67 000c 0E       		.byte	14
  68 000d 00       		.byte	0
  69 000e 0F       		.byte	15
  70 000f 0D       		.byte	13
  71              		.text
  72              		.align	2
  73              		.global	initApp
  74              		.code	16
  75              		.thumb_func
  77              	initApp:
  78              	.LFB1:
  32:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 
  33:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 
  34:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** void initApp()
  35:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** {
  79              		.loc 1 35 0
  80              		.cfi_startproc
  81              		@ args = 0, pretend = 0, frame = 0
  82              		@ frame_needed = 1, uses_anonymous_args = 0
  83 0000 80B5     		push	{r7, lr}
  84              		.cfi_def_cfa_offset 8
  85              		.cfi_offset 7, -8
  86              		.cfi_offset 14, -4
  87 0002 00AF     		add	r7, sp, #0
  88              		.cfi_def_cfa_register 7
  36:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	*GPIO_MODER = 0x55005555;
  89              		.loc 1 36 0
  90 0004 0C4B     		ldr	r3, .L3
  91 0006 0D4A     		ldr	r2, .L3+4
  92 0008 1A60     		str	r2, [r3]
  37:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	*GPIO_OTYPER &= 0x00FF;
  93              		.loc 1 37 0
  94 000a 0D4B     		ldr	r3, .L3+8
  95 000c 0C4A     		ldr	r2, .L3+8
  96 000e 1268     		ldr	r2, [r2]
  97 0010 FF21     		movs	r1, #255
  98 0012 0A40     		ands	r2, r1
  99 0014 1A60     		str	r2, [r3]
  38:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	*GPIO_PUPDR |= 0x00AA0000;
 100              		.loc 1 38 0
 101 0016 0B4B     		ldr	r3, .L3+12
 102 0018 0A4A     		ldr	r2, .L3+12
 103 001a 1268     		ldr	r2, [r2]
 104 001c AA21     		movs	r1, #170
 105 001e 0904     		lsls	r1, r1, #16
 106 0020 0A43     		orrs	r2, r1
 107 0022 1A60     		str	r2, [r3]
  39:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	RCC_AHB1ENR |= RCC_GPIO_D | RCC_GPIO_E;
 108              		.loc 1 39 0
 109 0024 084B     		ldr	r3, .L3+16
 110 0026 084A     		ldr	r2, .L3+16
 111 0028 1268     		ldr	r2, [r2]
 112 002a 1821     		movs	r1, #24
 113 002c 0A43     		orrs	r2, r1
 114 002e 1A60     		str	r2, [r3]
  40:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** }
 115              		.loc 1 40 0
 116 0030 C046     		nop
 117 0032 BD46     		mov	sp, r7
 118              		@ sp needed
 119 0034 80BD     		pop	{r7, pc}
 120              	.L4:
 121 0036 C046     		.align	2
 122              	.L3:
 123 0038 000C0240 		.word	1073875968
 124 003c 55550055 		.word	1426085205
 125 0040 040C0240 		.word	1073875972
 126 0044 0C0C0240 		.word	1073875980
 127 0048 30380240 		.word	1073887280
 128              		.cfi_endproc
 129              	.LFE1:
 131              		.align	2
 132              		.global	kbdActivate
 133              		.code	16
 134              		.thumb_func
 136              	kbdActivate:
 137              	.LFB2:
  41:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 
  42:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 
  43:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** void kbdActivate( unsigned int row )
  44:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** {
 138              		.loc 1 44 0
 139              		.cfi_startproc
 140              		@ args = 0, pretend = 0, frame = 8
 141              		@ frame_needed = 1, uses_anonymous_args = 0
 142 004c 80B5     		push	{r7, lr}
 143              		.cfi_def_cfa_offset 8
 144              		.cfi_offset 7, -8
 145              		.cfi_offset 14, -4
 146 004e 82B0     		sub	sp, sp, #8
 147              		.cfi_def_cfa_offset 16
 148 0050 00AF     		add	r7, sp, #0
 149              		.cfi_def_cfa_register 7
 150 0052 7860     		str	r0, [r7, #4]
  45:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	switch( row )
 151              		.loc 1 45 0
 152 0054 7B68     		ldr	r3, [r7, #4]
 153 0056 042B     		cmp	r3, #4
 154 0058 19D8     		bhi	.L13
 155 005a 7B68     		ldr	r3, [r7, #4]
 156 005c 9A00     		lsls	r2, r3, #2
 157 005e 0E4B     		ldr	r3, .L14
 158 0060 D318     		adds	r3, r2, r3
 159 0062 1B68     		ldr	r3, [r3]
 160 0064 9F46     		mov	pc, r3
 161              		.section	.rodata
 162              		.align	2
 163              	.L8:
 164 0000 86000000 		.word	.L7
 165 0004 66000000 		.word	.L9
 166 0008 6E000000 		.word	.L10
 167 000c 76000000 		.word	.L11
 168 0010 7E000000 		.word	.L12
 169              		.text
 170              	.L9:
  46:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	{
  47:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 1: *GPIO_ODR_HIGH = 0x10; break; 
 171              		.loc 1 47 0
 172 0066 0D4B     		ldr	r3, .L14+4
 173 0068 1022     		movs	r2, #16
 174 006a 1A70     		strb	r2, [r3]
 175 006c 0FE0     		b	.L6
 176              	.L10:
  48:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 2: *GPIO_ODR_HIGH = 0x20; break; 
 177              		.loc 1 48 0
 178 006e 0B4B     		ldr	r3, .L14+4
 179 0070 2022     		movs	r2, #32
 180 0072 1A70     		strb	r2, [r3]
 181 0074 0BE0     		b	.L6
 182              	.L11:
  49:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 3: *GPIO_ODR_HIGH = 0x40; break; 
 183              		.loc 1 49 0
 184 0076 094B     		ldr	r3, .L14+4
 185 0078 4022     		movs	r2, #64
 186 007a 1A70     		strb	r2, [r3]
 187 007c 07E0     		b	.L6
 188              	.L12:
  50:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 4: *GPIO_ODR_HIGH = 0x80; break; 
 189              		.loc 1 50 0
 190 007e 074B     		ldr	r3, .L14+4
 191 0080 8022     		movs	r2, #128
 192 0082 1A70     		strb	r2, [r3]
 193 0084 03E0     		b	.L6
 194              	.L7:
  51:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 0: *GPIO_ODR_HIGH = 0x00; break;
 195              		.loc 1 51 0
 196 0086 054B     		ldr	r3, .L14+4
 197 0088 0022     		movs	r2, #0
 198 008a 1A70     		strb	r2, [r3]
 199 008c C046     		nop
 200              	.L6:
 201              	.L13:
  52:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	}
  53:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** }
 202              		.loc 1 53 0
 203 008e C046     		nop
 204 0090 BD46     		mov	sp, r7
 205 0092 02B0     		add	sp, sp, #8
 206              		@ sp needed
 207 0094 80BD     		pop	{r7, pc}
 208              	.L15:
 209 0096 C046     		.align	2
 210              	.L14:
 211 0098 00000000 		.word	.L8
 212 009c 150C0240 		.word	1073875989
 213              		.cfi_endproc
 214              	.LFE2:
 216              		.align	2
 217              		.global	kbdGetCol
 218              		.code	16
 219              		.thumb_func
 221              	kbdGetCol:
 222              	.LFB3:
  54:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 
  55:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** int kbdGetCol ( void )
  56:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** {
 223              		.loc 1 56 0
 224              		.cfi_startproc
 225              		@ args = 0, pretend = 0, frame = 8
 226              		@ frame_needed = 1, uses_anonymous_args = 0
 227 00a0 80B5     		push	{r7, lr}
 228              		.cfi_def_cfa_offset 8
 229              		.cfi_offset 7, -8
 230              		.cfi_offset 14, -4
 231 00a2 82B0     		sub	sp, sp, #8
 232              		.cfi_def_cfa_offset 16
 233 00a4 00AF     		add	r7, sp, #0
 234              		.cfi_def_cfa_register 7
  57:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	unsigned char c;
  58:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	c = *GPIO_IDR_HIGH;
 235              		.loc 1 58 0
 236 00a6 124A     		ldr	r2, .L22
 237 00a8 FB1D     		adds	r3, r7, #7
 238 00aa 1278     		ldrb	r2, [r2]
 239 00ac 1A70     		strb	r2, [r3]
  59:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	if ( c & 0x8 ) return 4; 
 240              		.loc 1 59 0
 241 00ae FB1D     		adds	r3, r7, #7
 242 00b0 1B78     		ldrb	r3, [r3]
 243 00b2 0822     		movs	r2, #8
 244 00b4 1340     		ands	r3, r2
 245 00b6 01D0     		beq	.L17
 246              		.loc 1 59 0 is_stmt 0 discriminator 1
 247 00b8 0423     		movs	r3, #4
 248 00ba 14E0     		b	.L16
 249              	.L17:
  60:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	if ( c & 0x4 ) return 3; 
 250              		.loc 1 60 0 is_stmt 1
 251 00bc FB1D     		adds	r3, r7, #7
 252 00be 1B78     		ldrb	r3, [r3]
 253 00c0 0422     		movs	r2, #4
 254 00c2 1340     		ands	r3, r2
 255 00c4 01D0     		beq	.L19
 256              		.loc 1 60 0 is_stmt 0 discriminator 1
 257 00c6 0323     		movs	r3, #3
 258 00c8 0DE0     		b	.L16
 259              	.L19:
  61:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	if ( c & 0x2 ) return 2; 
 260              		.loc 1 61 0 is_stmt 1
 261 00ca FB1D     		adds	r3, r7, #7
 262 00cc 1B78     		ldrb	r3, [r3]
 263 00ce 0222     		movs	r2, #2
 264 00d0 1340     		ands	r3, r2
 265 00d2 01D0     		beq	.L20
 266              		.loc 1 61 0 is_stmt 0 discriminator 1
 267 00d4 0223     		movs	r3, #2
 268 00d6 06E0     		b	.L16
 269              	.L20:
  62:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	if ( c & 0x1 ) return 1;
 270              		.loc 1 62 0 is_stmt 1
 271 00d8 FB1D     		adds	r3, r7, #7
 272 00da 1B78     		ldrb	r3, [r3]
 273 00dc 0122     		movs	r2, #1
 274 00de 1340     		ands	r3, r2
 275 00e0 01D0     		beq	.L21
 276              		.loc 1 62 0 is_stmt 0 discriminator 1
 277 00e2 0123     		movs	r3, #1
 278 00e4 FFE7     		b	.L16
 279              	.L21:
 280              	.L16:
  63:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** }
 281              		.loc 1 63 0 is_stmt 1
 282 00e6 1800     		movs	r0, r3
 283 00e8 BD46     		mov	sp, r7
 284 00ea 02B0     		add	sp, sp, #8
 285              		@ sp needed
 286 00ec 80BD     		pop	{r7, pc}
 287              	.L23:
 288 00ee C046     		.align	2
 289              	.L22:
 290 00f0 110C0240 		.word	1073875985
 291              		.cfi_endproc
 292              	.LFE3:
 294              		.align	2
 295              		.global	keyb
 296              		.code	16
 297              		.thumb_func
 299              	keyb:
 300              	.LFB4:
  64:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 
  65:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** unsigned char keyb(void)
  66:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** { 
 301              		.loc 1 66 0
 302              		.cfi_startproc
 303              		@ args = 0, pretend = 0, frame = 8
 304              		@ frame_needed = 1, uses_anonymous_args = 0
 305 00f4 80B5     		push	{r7, lr}
 306              		.cfi_def_cfa_offset 8
 307              		.cfi_offset 7, -8
 308              		.cfi_offset 14, -4
 309 00f6 82B0     		sub	sp, sp, #8
 310              		.cfi_def_cfa_offset 16
 311 00f8 00AF     		add	r7, sp, #0
 312              		.cfi_def_cfa_register 7
  67:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	int row = 0;
 313              		.loc 1 67 0
 314 00fa 0023     		movs	r3, #0
 315 00fc 7B60     		str	r3, [r7, #4]
  68:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	int col = 0;
 316              		.loc 1 68 0
 317 00fe 0023     		movs	r3, #0
 318 0100 3B60     		str	r3, [r7]
  69:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	for (row=1; row <=4 ; row++ ) 
 319              		.loc 1 69 0
 320 0102 0123     		movs	r3, #1
 321 0104 7B60     		str	r3, [r7, #4]
 322 0106 16E0     		b	.L25
 323              	.L28:
  70:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		{
  71:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		kbdActivate( row );
 324              		.loc 1 71 0
 325 0108 7B68     		ldr	r3, [r7, #4]
 326 010a 1800     		movs	r0, r3
 327 010c FFF7FEFF 		bl	kbdActivate
  72:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		if( (col = kbdGetCol () ) )
 328              		.loc 1 72 0
 329 0110 FFF7FEFF 		bl	kbdGetCol
 330 0114 0300     		movs	r3, r0
 331 0116 3B60     		str	r3, [r7]
 332 0118 3B68     		ldr	r3, [r7]
 333 011a 002B     		cmp	r3, #0
 334 011c 08D0     		beq	.L26
  73:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 			{ 
  74:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 				return keypad [4*(row-1)+(col-1) ];
 335              		.loc 1 74 0
 336 011e 7B68     		ldr	r3, [r7, #4]
 337 0120 013B     		subs	r3, r3, #1
 338 0122 9A00     		lsls	r2, r3, #2
 339 0124 3B68     		ldr	r3, [r7]
 340 0126 013B     		subs	r3, r3, #1
 341 0128 D318     		adds	r3, r2, r3
 342 012a 074A     		ldr	r2, .L29
 343 012c D35C     		ldrb	r3, [r2, r3]
 344 012e 06E0     		b	.L27
 345              	.L26:
  69:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		{
 346              		.loc 1 69 0 discriminator 2
 347 0130 7B68     		ldr	r3, [r7, #4]
 348 0132 0133     		adds	r3, r3, #1
 349 0134 7B60     		str	r3, [r7, #4]
 350              	.L25:
  69:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		{
 351              		.loc 1 69 0 is_stmt 0 discriminator 1
 352 0136 7B68     		ldr	r3, [r7, #4]
 353 0138 042B     		cmp	r3, #4
 354 013a E5DD     		ble	.L28
  75:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 			}
  76:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		} 
  77:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	return 0xFF;
 355              		.loc 1 77 0 is_stmt 1
 356 013c FF23     		movs	r3, #255
 357              	.L27:
  78:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	kbdActivate( 0 );
  79:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** }
 358              		.loc 1 79 0
 359 013e 1800     		movs	r0, r3
 360 0140 BD46     		mov	sp, r7
 361 0142 02B0     		add	sp, sp, #8
 362              		@ sp needed
 363 0144 80BD     		pop	{r7, pc}
 364              	.L30:
 365 0146 C046     		.align	2
 366              	.L29:
 367 0148 00000000 		.word	keypad
 368              		.cfi_endproc
 369              	.LFE4:
 371              		.align	2
 372              		.global	out7seg
 373              		.code	16
 374              		.thumb_func
 376              	out7seg:
 377              	.LFB5:
  80:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 
  81:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** void out7seg ( unsigned char c)
  82:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** {
 378              		.loc 1 82 0
 379              		.cfi_startproc
 380              		@ args = 0, pretend = 0, frame = 8
 381              		@ frame_needed = 1, uses_anonymous_args = 0
 382 014c 80B5     		push	{r7, lr}
 383              		.cfi_def_cfa_offset 8
 384              		.cfi_offset 7, -8
 385              		.cfi_offset 14, -4
 386 014e 82B0     		sub	sp, sp, #8
 387              		.cfi_def_cfa_offset 16
 388 0150 00AF     		add	r7, sp, #0
 389              		.cfi_def_cfa_register 7
 390 0152 0200     		movs	r2, r0
 391 0154 FB1D     		adds	r3, r7, #7
 392 0156 1A70     		strb	r2, [r3]
  83:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	switch(c)
 393              		.loc 1 83 0
 394 0158 FB1D     		adds	r3, r7, #7
 395 015a 1B78     		ldrb	r3, [r3]
 396 015c 082B     		cmp	r3, #8
 397 015e 40D0     		beq	.L33
 398 0160 10DC     		bgt	.L34
 399 0162 032B     		cmp	r3, #3
 400 0164 29D0     		beq	.L35
 401 0166 05DC     		bgt	.L36
 402 0168 012B     		cmp	r3, #1
 403 016a 1ED0     		beq	.L37
 404 016c 21DC     		bgt	.L38
 405 016e 002B     		cmp	r3, #0
 406 0170 17D0     		beq	.L39
  84:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	{
  85:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 0: *GPIO_ODR_LOW = 0x3F; break;
  86:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 1: *GPIO_ODR_LOW = 0x06; break; 
  87:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 2: *GPIO_ODR_LOW  = 0x5B; break; 
  88:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 3: *GPIO_ODR_LOW  = 0x4F; break; 
  89:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 4: *GPIO_ODR_LOW  = 0x66; break; 
  90:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 5: *GPIO_ODR_LOW  = 0x6D; break; 
  91:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 6: *GPIO_ODR_LOW  = 0x7D; break; 
  92:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 7: *GPIO_ODR_LOW  = 0x07; break; 
  93:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 8: *GPIO_ODR_LOW  = 0x7F; break; 
  94:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 9: *GPIO_ODR_LOW  = 0x67; break; 
  95:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 10: *GPIO_ODR_LOW  = 0x77; break; 
  96:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 11: *GPIO_ODR_LOW  = 0x7C; break; 
  97:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 12: *GPIO_ODR_LOW  = 0x39; break; 
  98:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 13: *GPIO_ODR_LOW  = 0x5E; break; 
  99:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 14: *GPIO_ODR_LOW  = 0x79; break; 
 100:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 15: *GPIO_ODR_LOW  = 0x71; break; 
 101:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 0xFF: *GPIO_ODR_LOW = 0x00; break;
 102:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	}
 103:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** }
 407              		.loc 1 103 0
 408 0172 5AE0     		b	.L54
 409              	.L36:
  83:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	switch(c)
 410              		.loc 1 83 0
 411 0174 052B     		cmp	r3, #5
 412 0176 28D0     		beq	.L40
 413 0178 23DB     		blt	.L41
 414 017a 062B     		cmp	r3, #6
 415 017c 29D0     		beq	.L42
 416 017e 072B     		cmp	r3, #7
 417 0180 2BD0     		beq	.L43
 418              		.loc 1 103 0
 419 0182 52E0     		b	.L54
 420              	.L34:
  83:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	switch(c)
 421              		.loc 1 83 0
 422 0184 0C2B     		cmp	r3, #12
 423 0186 3CD0     		beq	.L44
 424 0188 03DC     		bgt	.L45
 425 018a 0A2B     		cmp	r3, #10
 426 018c 31D0     		beq	.L46
 427 018e 34DC     		bgt	.L47
 428 0190 2BE0     		b	.L53
 429              	.L45:
 430 0192 0E2B     		cmp	r3, #14
 431 0194 3DD0     		beq	.L49
 432 0196 38DB     		blt	.L50
 433 0198 0F2B     		cmp	r3, #15
 434 019a 3ED0     		beq	.L51
 435 019c FF2B     		cmp	r3, #255
 436 019e 40D0     		beq	.L52
 437              		.loc 1 103 0
 438 01a0 43E0     		b	.L54
 439              	.L39:
  85:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 1: *GPIO_ODR_LOW = 0x06; break; 
 440              		.loc 1 85 0
 441 01a2 244B     		ldr	r3, .L55
 442 01a4 3F22     		movs	r2, #63
 443 01a6 1A70     		strb	r2, [r3]
 444 01a8 3FE0     		b	.L32
 445              	.L37:
  86:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 2: *GPIO_ODR_LOW  = 0x5B; break; 
 446              		.loc 1 86 0
 447 01aa 224B     		ldr	r3, .L55
 448 01ac 0622     		movs	r2, #6
 449 01ae 1A70     		strb	r2, [r3]
 450 01b0 3BE0     		b	.L32
 451              	.L38:
  87:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 3: *GPIO_ODR_LOW  = 0x4F; break; 
 452              		.loc 1 87 0
 453 01b2 204B     		ldr	r3, .L55
 454 01b4 5B22     		movs	r2, #91
 455 01b6 1A70     		strb	r2, [r3]
 456 01b8 37E0     		b	.L32
 457              	.L35:
  88:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 4: *GPIO_ODR_LOW  = 0x66; break; 
 458              		.loc 1 88 0
 459 01ba 1E4B     		ldr	r3, .L55
 460 01bc 4F22     		movs	r2, #79
 461 01be 1A70     		strb	r2, [r3]
 462 01c0 33E0     		b	.L32
 463              	.L41:
  89:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 5: *GPIO_ODR_LOW  = 0x6D; break; 
 464              		.loc 1 89 0
 465 01c2 1C4B     		ldr	r3, .L55
 466 01c4 6622     		movs	r2, #102
 467 01c6 1A70     		strb	r2, [r3]
 468 01c8 2FE0     		b	.L32
 469              	.L40:
  90:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 6: *GPIO_ODR_LOW  = 0x7D; break; 
 470              		.loc 1 90 0
 471 01ca 1A4B     		ldr	r3, .L55
 472 01cc 6D22     		movs	r2, #109
 473 01ce 1A70     		strb	r2, [r3]
 474 01d0 2BE0     		b	.L32
 475              	.L42:
  91:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 7: *GPIO_ODR_LOW  = 0x07; break; 
 476              		.loc 1 91 0
 477 01d2 184B     		ldr	r3, .L55
 478 01d4 7D22     		movs	r2, #125
 479 01d6 1A70     		strb	r2, [r3]
 480 01d8 27E0     		b	.L32
 481              	.L43:
  92:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 8: *GPIO_ODR_LOW  = 0x7F; break; 
 482              		.loc 1 92 0
 483 01da 164B     		ldr	r3, .L55
 484 01dc 0722     		movs	r2, #7
 485 01de 1A70     		strb	r2, [r3]
 486 01e0 23E0     		b	.L32
 487              	.L33:
  93:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 9: *GPIO_ODR_LOW  = 0x67; break; 
 488              		.loc 1 93 0
 489 01e2 144B     		ldr	r3, .L55
 490 01e4 7F22     		movs	r2, #127
 491 01e6 1A70     		strb	r2, [r3]
 492 01e8 1FE0     		b	.L32
 493              	.L53:
  94:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 10: *GPIO_ODR_LOW  = 0x77; break; 
 494              		.loc 1 94 0
 495 01ea 124B     		ldr	r3, .L55
 496 01ec 6722     		movs	r2, #103
 497 01ee 1A70     		strb	r2, [r3]
 498 01f0 1BE0     		b	.L32
 499              	.L46:
  95:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 11: *GPIO_ODR_LOW  = 0x7C; break; 
 500              		.loc 1 95 0
 501 01f2 104B     		ldr	r3, .L55
 502 01f4 7722     		movs	r2, #119
 503 01f6 1A70     		strb	r2, [r3]
 504 01f8 17E0     		b	.L32
 505              	.L47:
  96:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 12: *GPIO_ODR_LOW  = 0x39; break; 
 506              		.loc 1 96 0
 507 01fa 0E4B     		ldr	r3, .L55
 508 01fc 7C22     		movs	r2, #124
 509 01fe 1A70     		strb	r2, [r3]
 510 0200 13E0     		b	.L32
 511              	.L44:
  97:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 13: *GPIO_ODR_LOW  = 0x5E; break; 
 512              		.loc 1 97 0
 513 0202 0C4B     		ldr	r3, .L55
 514 0204 3922     		movs	r2, #57
 515 0206 1A70     		strb	r2, [r3]
 516 0208 0FE0     		b	.L32
 517              	.L50:
  98:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 14: *GPIO_ODR_LOW  = 0x79; break; 
 518              		.loc 1 98 0
 519 020a 0A4B     		ldr	r3, .L55
 520 020c 5E22     		movs	r2, #94
 521 020e 1A70     		strb	r2, [r3]
 522 0210 0BE0     		b	.L32
 523              	.L49:
  99:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 15: *GPIO_ODR_LOW  = 0x71; break; 
 524              		.loc 1 99 0
 525 0212 084B     		ldr	r3, .L55
 526 0214 7922     		movs	r2, #121
 527 0216 1A70     		strb	r2, [r3]
 528 0218 07E0     		b	.L32
 529              	.L51:
 100:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		case 0xFF: *GPIO_ODR_LOW = 0x00; break;
 530              		.loc 1 100 0
 531 021a 064B     		ldr	r3, .L55
 532 021c 7122     		movs	r2, #113
 533 021e 1A70     		strb	r2, [r3]
 534 0220 03E0     		b	.L32
 535              	.L52:
 101:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	}
 536              		.loc 1 101 0
 537 0222 044B     		ldr	r3, .L55
 538 0224 0022     		movs	r2, #0
 539 0226 1A70     		strb	r2, [r3]
 540 0228 C046     		nop
 541              	.L32:
 542              	.L54:
 543              		.loc 1 103 0
 544 022a C046     		nop
 545 022c BD46     		mov	sp, r7
 546 022e 02B0     		add	sp, sp, #8
 547              		@ sp needed
 548 0230 80BD     		pop	{r7, pc}
 549              	.L56:
 550 0232 C046     		.align	2
 551              	.L55:
 552 0234 140C0240 		.word	1073875988
 553              		.cfi_endproc
 554              	.LFE5:
 556              		.align	2
 557              		.global	main
 558              		.code	16
 559              		.thumb_func
 561              	main:
 562              	.LFB6:
 104:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** void main(void)
 105:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** {
 563              		.loc 1 105 0
 564              		.cfi_startproc
 565              		@ args = 0, pretend = 0, frame = 0
 566              		@ frame_needed = 1, uses_anonymous_args = 0
 567 0238 80B5     		push	{r7, lr}
 568              		.cfi_def_cfa_offset 8
 569              		.cfi_offset 7, -8
 570              		.cfi_offset 14, -4
 571 023a 00AF     		add	r7, sp, #0
 572              		.cfi_def_cfa_register 7
 106:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	initApp();
 573              		.loc 1 106 0
 574 023c FFF7FEFF 		bl	initApp
 575              	.L58:
 107:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	while(1)
 108:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	{
 109:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 		out7seg(keyb());
 576              		.loc 1 109 0 discriminator 1
 577 0240 FFF7FEFF 		bl	keyb
 578 0244 0300     		movs	r3, r0
 579 0246 1800     		movs	r0, r3
 580 0248 FFF7FEFF 		bl	out7seg
 110:/Users/Simon/Dropbox/EDA487/Keypad/startup.c **** 	}
 581              		.loc 1 110 0 discriminator 1
 582 024c F8E7     		b	.L58
 583              		.cfi_endproc
 584              	.LFE6:
 586              	.Letext0:
 587              		.file 2 "/Users/Simon/Dropbox/EDA487/Keypad/gpio.h"
