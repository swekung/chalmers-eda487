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
  27              		.file 1 "/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c"
   1:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** /*
   2:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c ****  * 	startup.c
   3:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c ****  *
   4:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c ****  */
   5:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 
   7:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** void startup ( void )
   8:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** {
  28              		.loc 1 8 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
   9:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** asm volatile(
  33              		.loc 1 9 0
  34              		.syntax divided
  35              	@ 9 "/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c" 1
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  10:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	" MOV SP,R0\n"
  12:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	" BL main\n"				/* call main */
  13:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	".L1: B .L1\n"				/* never return */
  14:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	) ;
  15:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** }
  42              		.loc 1 15 0
  43              		.thumb
  44              		.syntax unified
  45 000a C046     		nop
  46              		.cfi_endproc
  47              	.LFE0:
  49              		.global	count
  50              		.bss
  51              		.align	1
  54              	count:
  55 0000 0000     		.space	2
  56              		.global	diodes
  59              	diodes:
  60 0002 00       		.space	1
  61              		.text
  62              		.align	2
  63              		.global	resetIRQ
  64              		.code	16
  65              		.thumb_func
  67              	resetIRQ:
  68              	.LFB1:
  16:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 
  17:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** #include "types.h"
  18:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** #include "gpio.h"
  19:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** #include "irq.h"
  20:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** #include "exti.h"
  21:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** #include "syscfg.h"
  22:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 
  23:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** uint16_t count = 0;
  24:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** uint8_t diodes = 0;
  25:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 
  26:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** void resetIRQ(uint8_t rstPin)
  27:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** {
  69              		.loc 1 27 0
  70              		.cfi_startproc
  71              		@ args = 0, pretend = 0, frame = 8
  72              		@ frame_needed = 1, uses_anonymous_args = 0
  73 0000 80B5     		push	{r7, lr}
  74              		.cfi_def_cfa_offset 8
  75              		.cfi_offset 7, -8
  76              		.cfi_offset 14, -4
  77 0002 82B0     		sub	sp, sp, #8
  78              		.cfi_def_cfa_offset 16
  79 0004 00AF     		add	r7, sp, #0
  80              		.cfi_def_cfa_register 7
  81 0006 0200     		movs	r2, r0
  82 0008 FB1D     		adds	r3, r7, #7
  83 000a 1A70     		strb	r2, [r3]
  28:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	GPIO_E.odr_low &= (0xFF & (0x10 << rstPin));
  84              		.loc 1 28 0
  85 000c 1149     		ldr	r1, .L3
  86 000e 114B     		ldr	r3, .L3
  87 0010 1B7D     		ldrb	r3, [r3, #20]
  88 0012 DBB2     		uxtb	r3, r3
  89 0014 5BB2     		sxtb	r3, r3
  90 0016 FA1D     		adds	r2, r7, #7
  91 0018 1278     		ldrb	r2, [r2]
  92 001a 1020     		movs	r0, #16
  93 001c 9040     		lsls	r0, r0, r2
  94 001e 0200     		movs	r2, r0
  95 0020 52B2     		sxtb	r2, r2
  96 0022 1340     		ands	r3, r2
  97 0024 5BB2     		sxtb	r3, r3
  98 0026 DBB2     		uxtb	r3, r3
  99 0028 0B75     		strb	r3, [r1, #20]
  29:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	GPIO_E.odr_low &= (0xFF & ~(0x10 << rstPin));
 100              		.loc 1 29 0
 101 002a 0A49     		ldr	r1, .L3
 102 002c 094B     		ldr	r3, .L3
 103 002e 1B7D     		ldrb	r3, [r3, #20]
 104 0030 DBB2     		uxtb	r3, r3
 105 0032 5BB2     		sxtb	r3, r3
 106 0034 FA1D     		adds	r2, r7, #7
 107 0036 1278     		ldrb	r2, [r2]
 108 0038 1020     		movs	r0, #16
 109 003a 9040     		lsls	r0, r0, r2
 110 003c 0200     		movs	r2, r0
 111 003e 52B2     		sxtb	r2, r2
 112 0040 D243     		mvns	r2, r2
 113 0042 52B2     		sxtb	r2, r2
 114 0044 1340     		ands	r3, r2
 115 0046 5BB2     		sxtb	r3, r3
 116 0048 DBB2     		uxtb	r3, r3
 117 004a 0B75     		strb	r3, [r1, #20]
  30:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** }
 118              		.loc 1 30 0
 119 004c C046     		nop
 120 004e BD46     		mov	sp, r7
 121 0050 02B0     		add	sp, sp, #8
 122              		@ sp needed
 123 0052 80BD     		pop	{r7, pc}
 124              	.L4:
 125              		.align	2
 126              	.L3:
 127 0054 00100240 		.word	1073876992
 128              		.cfi_endproc
 129              	.LFE1:
 131              		.align	2
 132              		.global	irq_handler
 133              		.code	16
 134              		.thumb_func
 136              	irq_handler:
 137              	.LFB2:
  31:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 
  32:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** void irq_handler()
  33:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** {
 138              		.loc 1 33 0
 139              		.cfi_startproc
 140              		@ args = 0, pretend = 0, frame = 8
 141              		@ frame_needed = 1, uses_anonymous_args = 0
 142 0058 80B5     		push	{r7, lr}
 143              		.cfi_def_cfa_offset 8
 144              		.cfi_offset 7, -8
 145              		.cfi_offset 14, -4
 146 005a 82B0     		sub	sp, sp, #8
 147              		.cfi_def_cfa_offset 16
 148 005c 00AF     		add	r7, sp, #0
 149              		.cfi_def_cfa_register 7
  34:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	uint8_t tempIn = GPIO_E.idr_low;
 150              		.loc 1 34 0
 151 005e 1B4A     		ldr	r2, .L10
 152 0060 FB1D     		adds	r3, r7, #7
 153 0062 127C     		ldrb	r2, [r2, #16]
 154 0064 1A70     		strb	r2, [r3]
  35:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	if(tempIn == 0x01)
 155              		.loc 1 35 0
 156 0066 FB1D     		adds	r3, r7, #7
 157 0068 1B78     		ldrb	r3, [r3]
 158 006a 012B     		cmp	r3, #1
 159 006c 08D1     		bne	.L6
  36:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	{
  37:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 		 resetIRQ(0x00); /* Handle interrupt from IRQ0 */
 160              		.loc 1 37 0
 161 006e 0020     		movs	r0, #0
 162 0070 FFF7FEFF 		bl	resetIRQ
  38:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 		 count++;
 163              		.loc 1 38 0
 164 0074 164B     		ldr	r3, .L10+4
 165 0076 1B88     		ldrh	r3, [r3]
 166 0078 0133     		adds	r3, r3, #1
 167 007a 9AB2     		uxth	r2, r3
 168 007c 144B     		ldr	r3, .L10+4
 169 007e 1A80     		strh	r2, [r3]
 170              	.L6:
  39:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	}
  40:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	if(tempIn == 0x02)
 171              		.loc 1 40 0
 172 0080 FB1D     		adds	r3, r7, #7
 173 0082 1B78     		ldrb	r3, [r3]
 174 0084 022B     		cmp	r3, #2
 175 0086 05D1     		bne	.L7
  41:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	{
  42:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 		 resetIRQ(0x01); /* Handle interrupt from IRQ1 */
 176              		.loc 1 42 0
 177 0088 0120     		movs	r0, #1
 178 008a FFF7FEFF 		bl	resetIRQ
  43:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 		 count = 0;
 179              		.loc 1 43 0
 180 008e 104B     		ldr	r3, .L10+4
 181 0090 0022     		movs	r2, #0
 182 0092 1A80     		strh	r2, [r3]
 183              	.L7:
  44:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	}
  45:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	if(tempIn == 0x04)
 184              		.loc 1 45 0
 185 0094 FB1D     		adds	r3, r7, #7
 186 0096 1B78     		ldrb	r3, [r3]
 187 0098 042B     		cmp	r3, #4
 188 009a 0DD1     		bne	.L8
  46:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	{
  47:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 		 resetIRQ(0x02); /* Handle interrupt from IRQ1 */
 189              		.loc 1 47 0
 190 009c 0220     		movs	r0, #2
 191 009e FFF7FEFF 		bl	resetIRQ
  48:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 		 if(diodes == 0)
 192              		.loc 1 48 0
 193 00a2 0C4B     		ldr	r3, .L10+8
 194 00a4 1B78     		ldrb	r3, [r3]
 195 00a6 002B     		cmp	r3, #0
 196 00a8 03D1     		bne	.L9
  49:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 		 {
  50:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 			 diodes = 0xFF;
 197              		.loc 1 50 0
 198 00aa 0A4B     		ldr	r3, .L10+8
 199 00ac FF22     		movs	r2, #255
 200 00ae 1A70     		strb	r2, [r3]
 201 00b0 02E0     		b	.L8
 202              	.L9:
  51:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 		 } else {
  52:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 			 diodes = 0;
 203              		.loc 1 52 0
 204 00b2 084B     		ldr	r3, .L10+8
 205 00b4 0022     		movs	r2, #0
 206 00b6 1A70     		strb	r2, [r3]
 207              	.L8:
  53:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 		 }
  54:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	}
  55:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	EXTI.pr |= (1 << 3);
 208              		.loc 1 55 0
 209 00b8 074B     		ldr	r3, .L10+12
 210 00ba 074A     		ldr	r2, .L10+12
 211 00bc 5269     		ldr	r2, [r2, #20]
 212 00be 0821     		movs	r1, #8
 213 00c0 0A43     		orrs	r2, r1
 214 00c2 5A61     		str	r2, [r3, #20]
  56:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** }
 215              		.loc 1 56 0
 216 00c4 C046     		nop
 217 00c6 BD46     		mov	sp, r7
 218 00c8 02B0     		add	sp, sp, #8
 219              		@ sp needed
 220 00ca 80BD     		pop	{r7, pc}
 221              	.L11:
 222              		.align	2
 223              	.L10:
 224 00cc 00100240 		.word	1073876992
 225 00d0 00000000 		.word	count
 226 00d4 00000000 		.word	diodes
 227 00d8 003C0140 		.word	1073822720
 228              		.cfi_endproc
 229              	.LFE2:
 231              		.align	2
 232              		.global	irq_init
 233              		.code	16
 234              		.thumb_func
 236              	irq_init:
 237              	.LFB3:
  57:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 
  58:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 
  59:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** void irq_init()
  60:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** {
 238              		.loc 1 60 0
 239              		.cfi_startproc
 240              		@ args = 0, pretend = 0, frame = 0
 241              		@ frame_needed = 1, uses_anonymous_args = 0
 242 00dc 80B5     		push	{r7, lr}
 243              		.cfi_def_cfa_offset 8
 244              		.cfi_offset 7, -8
 245              		.cfi_offset 14, -4
 246 00de 00AF     		add	r7, sp, #0
 247              		.cfi_def_cfa_register 7
  61:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	SYSCFG.exticr1 &= 0x0fff;  /* Negates upper 4 bits */
 248              		.loc 1 61 0
 249 00e0 164B     		ldr	r3, .L13
 250 00e2 164A     		ldr	r2, .L13
 251 00e4 9268     		ldr	r2, [r2, #8]
 252 00e6 1205     		lsls	r2, r2, #20
 253 00e8 120D     		lsrs	r2, r2, #20
 254 00ea 9A60     		str	r2, [r3, #8]
  62:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	SYSCFG.exticr1 |= 0x4000;  /* Configures for IRQ3 on ETIX3 */
 255              		.loc 1 62 0
 256 00ec 134B     		ldr	r3, .L13
 257 00ee 134A     		ldr	r2, .L13
 258 00f0 9268     		ldr	r2, [r2, #8]
 259 00f2 8021     		movs	r1, #128
 260 00f4 C901     		lsls	r1, r1, #7
 261 00f6 0A43     		orrs	r2, r1
 262 00f8 9A60     		str	r2, [r3, #8]
  63:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	EXTI.imr |= (1 << 3); /* Configures EXTI3 to generate interrupts */
 263              		.loc 1 63 0
 264 00fa 114B     		ldr	r3, .L13+4
 265 00fc 104A     		ldr	r2, .L13+4
 266 00fe 1268     		ldr	r2, [r2]
 267 0100 0821     		movs	r1, #8
 268 0102 0A43     		orrs	r2, r1
 269 0104 1A60     		str	r2, [r3]
  64:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	EXTI.ftsr |= (1 << 3); /* Configures EXTI3 to trigger on negative flank */
 270              		.loc 1 64 0
 271 0106 0E4B     		ldr	r3, .L13+4
 272 0108 0D4A     		ldr	r2, .L13+4
 273 010a D268     		ldr	r2, [r2, #12]
 274 010c 0821     		movs	r1, #8
 275 010e 0A43     		orrs	r2, r1
 276 0110 DA60     		str	r2, [r3, #12]
  65:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	IRQ.extiLine3 = irq_handler; /* Sets the function irq_handler to handle interrupts from EXTI3 */
 277              		.loc 1 65 0
 278 0112 0C4B     		ldr	r3, .L13+8
 279 0114 0C4A     		ldr	r2, .L13+12
 280 0116 5A66     		str	r2, [r3, #100]
  66:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	*((uint32_t *) 0xE000E100) |= (1<<9); /* Sets NVIC priority */
 281              		.loc 1 66 0
 282 0118 0C4B     		ldr	r3, .L13+16
 283 011a 0C4A     		ldr	r2, .L13+16
 284 011c 1268     		ldr	r2, [r2]
 285 011e 8021     		movs	r1, #128
 286 0120 8900     		lsls	r1, r1, #2
 287 0122 0A43     		orrs	r2, r1
 288 0124 1A60     		str	r2, [r3]
  67:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	RCC_APB2ENR |= 0x4000; /* Sets clock to enable interrupts */
 289              		.loc 1 67 0
 290 0126 0A4B     		ldr	r3, .L13+20
 291 0128 094A     		ldr	r2, .L13+20
 292 012a 1268     		ldr	r2, [r2]
 293 012c 8021     		movs	r1, #128
 294 012e C901     		lsls	r1, r1, #7
 295 0130 0A43     		orrs	r2, r1
 296 0132 1A60     		str	r2, [r3]
  68:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	
  69:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** }
 297              		.loc 1 69 0
 298 0134 C046     		nop
 299 0136 BD46     		mov	sp, r7
 300              		@ sp needed
 301 0138 80BD     		pop	{r7, pc}
 302              	.L14:
 303 013a C046     		.align	2
 304              	.L13:
 305 013c 00380140 		.word	1073821696
 306 0140 003C0140 		.word	1073822720
 307 0144 00C00120 		.word	536985600
 308 0148 00000000 		.word	irq_handler
 309 014c 00E100E0 		.word	-536813312
 310 0150 44380240 		.word	1073887300
 311              		.cfi_endproc
 312              	.LFE3:
 314              		.align	2
 315              		.global	app_init
 316              		.code	16
 317              		.thumb_func
 319              	app_init:
 320              	.LFB4:
  70:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 
  71:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** void app_init()
  72:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** {
 321              		.loc 1 72 0
 322              		.cfi_startproc
 323              		@ args = 0, pretend = 0, frame = 0
 324              		@ frame_needed = 1, uses_anonymous_args = 0
 325 0154 80B5     		push	{r7, lr}
 326              		.cfi_def_cfa_offset 8
 327              		.cfi_offset 7, -8
 328              		.cfi_offset 14, -4
 329 0156 00AF     		add	r7, sp, #0
 330              		.cfi_def_cfa_register 7
  73:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	GPIO_D.moder = 0x55555555;
 331              		.loc 1 73 0
 332 0158 044B     		ldr	r3, .L16
 333 015a 054A     		ldr	r2, .L16+4
 334 015c 1A60     		str	r2, [r3]
  74:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	GPIO_E.moder = 0x00005500;
 335              		.loc 1 74 0
 336 015e 054B     		ldr	r3, .L16+8
 337 0160 AA22     		movs	r2, #170
 338 0162 D201     		lsls	r2, r2, #7
 339 0164 1A60     		str	r2, [r3]
  75:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** }
 340              		.loc 1 75 0
 341 0166 C046     		nop
 342 0168 BD46     		mov	sp, r7
 343              		@ sp needed
 344 016a 80BD     		pop	{r7, pc}
 345              	.L17:
 346              		.align	2
 347              	.L16:
 348 016c 000C0240 		.word	1073875968
 349 0170 55555555 		.word	1431655765
 350 0174 00100240 		.word	1073876992
 351              		.cfi_endproc
 352              	.LFE4:
 354              		.align	2
 355              		.global	main
 356              		.code	16
 357              		.thumb_func
 359              	main:
 360              	.LFB5:
  76:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** void main(void)
  77:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** {
 361              		.loc 1 77 0
 362              		.cfi_startproc
 363              		@ args = 0, pretend = 0, frame = 0
 364              		@ frame_needed = 1, uses_anonymous_args = 0
 365 0178 80B5     		push	{r7, lr}
 366              		.cfi_def_cfa_offset 8
 367              		.cfi_offset 7, -8
 368              		.cfi_offset 14, -4
 369 017a 00AF     		add	r7, sp, #0
 370              		.cfi_def_cfa_register 7
  78:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	app_init();
 371              		.loc 1 78 0
 372 017c FFF7FEFF 		bl	app_init
  79:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	irq_init();
 373              		.loc 1 79 0
 374 0180 FFF7FEFF 		bl	irq_init
 375              	.L19:
  80:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	while(1)
  81:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	{
  82:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 		GPIO_D.odr_low = count;
 376              		.loc 1 82 0 discriminator 1
 377 0184 044A     		ldr	r2, .L20
 378 0186 054B     		ldr	r3, .L20+4
 379 0188 1B88     		ldrh	r3, [r3]
 380 018a DBB2     		uxtb	r3, r3
 381 018c 1375     		strb	r3, [r2, #20]
  83:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 		GPIO_D.odr_high = diodes;
 382              		.loc 1 83 0 discriminator 1
 383 018e 024A     		ldr	r2, .L20
 384 0190 034B     		ldr	r3, .L20+8
 385 0192 1B78     		ldrb	r3, [r3]
 386 0194 5375     		strb	r3, [r2, #21]
  84:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	}
 387              		.loc 1 84 0 discriminator 1
 388 0196 F5E7     		b	.L19
 389              	.L21:
 390              		.align	2
 391              	.L20:
 392 0198 000C0240 		.word	1073875968
 393 019c 00000000 		.word	count
 394 01a0 00000000 		.word	diodes
 395              		.cfi_endproc
 396              	.LFE5:
 398              	.Letext0:
 399              		.file 2 "/Users/Simon/chalmers-eda487/libraries/types.h"
 400              		.file 3 "/Users/Simon/chalmers-eda487/libraries/gpio.h"
 401              		.file 4 "/Users/Simon/chalmers-eda487/libraries/irq.h"
 402              		.file 5 "/Users/Simon/chalmers-eda487/libraries/exti.h"
 403              		.file 6 "/Users/Simon/chalmers-eda487/libraries/syscfg.h"
