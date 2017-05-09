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
  56              		.text
  57              		.align	2
  58              		.global	irq_handler
  59              		.code	16
  60              		.thumb_func
  62              	irq_handler:
  63              	.LFB1:
  16:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 
  17:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** #include "types.h"
  18:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** #include "gpio.h"
  19:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** #include "irq.h"
  20:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** #include "exti.h"
  21:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** #include "syscfg.h"
  22:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 
  23:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** uint16_t count = 0;
  24:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 
  25:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** void irq_handler()
  26:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** {
  64              		.loc 1 26 0
  65              		.cfi_startproc
  66              		@ args = 0, pretend = 0, frame = 0
  67              		@ frame_needed = 1, uses_anonymous_args = 0
  68 0000 80B5     		push	{r7, lr}
  69              		.cfi_def_cfa_offset 8
  70              		.cfi_offset 7, -8
  71              		.cfi_offset 14, -4
  72 0002 00AF     		add	r7, sp, #0
  73              		.cfi_def_cfa_register 7
  27:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	count++;
  74              		.loc 1 27 0
  75 0004 074B     		ldr	r3, .L3
  76 0006 1B88     		ldrh	r3, [r3]
  77 0008 0133     		adds	r3, r3, #1
  78 000a 9AB2     		uxth	r2, r3
  79 000c 054B     		ldr	r3, .L3
  80 000e 1A80     		strh	r2, [r3]
  28:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	EXTI.pr |= (1 << 3);
  81              		.loc 1 28 0
  82 0010 054B     		ldr	r3, .L3+4
  83 0012 054A     		ldr	r2, .L3+4
  84 0014 5269     		ldr	r2, [r2, #20]
  85 0016 0821     		movs	r1, #8
  86 0018 0A43     		orrs	r2, r1
  87 001a 5A61     		str	r2, [r3, #20]
  29:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** }
  88              		.loc 1 29 0
  89 001c C046     		nop
  90 001e BD46     		mov	sp, r7
  91              		@ sp needed
  92 0020 80BD     		pop	{r7, pc}
  93              	.L4:
  94 0022 C046     		.align	2
  95              	.L3:
  96 0024 00000000 		.word	count
  97 0028 003C0140 		.word	1073822720
  98              		.cfi_endproc
  99              	.LFE1:
 101              		.align	2
 102              		.global	irq_init
 103              		.code	16
 104              		.thumb_func
 106              	irq_init:
 107              	.LFB2:
  30:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 
  31:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 
  32:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** void irq_init()
  33:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** {
 108              		.loc 1 33 0
 109              		.cfi_startproc
 110              		@ args = 0, pretend = 0, frame = 0
 111              		@ frame_needed = 1, uses_anonymous_args = 0
 112 002c 80B5     		push	{r7, lr}
 113              		.cfi_def_cfa_offset 8
 114              		.cfi_offset 7, -8
 115              		.cfi_offset 14, -4
 116 002e 00AF     		add	r7, sp, #0
 117              		.cfi_def_cfa_register 7
  34:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	SYSCFG.exticr1 &= 0x0fff;  /* Negates upper 4 bits */
 118              		.loc 1 34 0
 119 0030 164B     		ldr	r3, .L6
 120 0032 164A     		ldr	r2, .L6
 121 0034 9268     		ldr	r2, [r2, #8]
 122 0036 1205     		lsls	r2, r2, #20
 123 0038 120D     		lsrs	r2, r2, #20
 124 003a 9A60     		str	r2, [r3, #8]
  35:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	SYSCFG.exticr1 |= 0x4000;  /* Configures for IRQ3 on ETIX3 */
 125              		.loc 1 35 0
 126 003c 134B     		ldr	r3, .L6
 127 003e 134A     		ldr	r2, .L6
 128 0040 9268     		ldr	r2, [r2, #8]
 129 0042 8021     		movs	r1, #128
 130 0044 C901     		lsls	r1, r1, #7
 131 0046 0A43     		orrs	r2, r1
 132 0048 9A60     		str	r2, [r3, #8]
  36:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	EXTI.imr |= (1 << 3); /* Configures EXTI3 to generate interrupts */
 133              		.loc 1 36 0
 134 004a 114B     		ldr	r3, .L6+4
 135 004c 104A     		ldr	r2, .L6+4
 136 004e 1268     		ldr	r2, [r2]
 137 0050 0821     		movs	r1, #8
 138 0052 0A43     		orrs	r2, r1
 139 0054 1A60     		str	r2, [r3]
  37:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	EXTI.ftsr |= (1 << 3); /* Configures EXTI3 to trigger on negative flank */
 140              		.loc 1 37 0
 141 0056 0E4B     		ldr	r3, .L6+4
 142 0058 0D4A     		ldr	r2, .L6+4
 143 005a D268     		ldr	r2, [r2, #12]
 144 005c 0821     		movs	r1, #8
 145 005e 0A43     		orrs	r2, r1
 146 0060 DA60     		str	r2, [r3, #12]
  38:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	IRQ.extiLine3 = irq_handler; /* Sets the function irq_handler to handle interrupts from EXTI3 */
 147              		.loc 1 38 0
 148 0062 0C4B     		ldr	r3, .L6+8
 149 0064 0C4A     		ldr	r2, .L6+12
 150 0066 5A66     		str	r2, [r3, #100]
  39:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	*((uint32_t *) 0xE000E100) |= (1<<9); /* Sets NVIC priority */
 151              		.loc 1 39 0
 152 0068 0C4B     		ldr	r3, .L6+16
 153 006a 0C4A     		ldr	r2, .L6+16
 154 006c 1268     		ldr	r2, [r2]
 155 006e 8021     		movs	r1, #128
 156 0070 8900     		lsls	r1, r1, #2
 157 0072 0A43     		orrs	r2, r1
 158 0074 1A60     		str	r2, [r3]
  40:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	RCC_APB2ENR |= 0x4000; /* Sets clock to enable interrupts */
 159              		.loc 1 40 0
 160 0076 0A4B     		ldr	r3, .L6+20
 161 0078 094A     		ldr	r2, .L6+20
 162 007a 1268     		ldr	r2, [r2]
 163 007c 8021     		movs	r1, #128
 164 007e C901     		lsls	r1, r1, #7
 165 0080 0A43     		orrs	r2, r1
 166 0082 1A60     		str	r2, [r3]
  41:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	
  42:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** }
 167              		.loc 1 42 0
 168 0084 C046     		nop
 169 0086 BD46     		mov	sp, r7
 170              		@ sp needed
 171 0088 80BD     		pop	{r7, pc}
 172              	.L7:
 173 008a C046     		.align	2
 174              	.L6:
 175 008c 00380140 		.word	1073821696
 176 0090 003C0140 		.word	1073822720
 177 0094 00C00120 		.word	536985600
 178 0098 00000000 		.word	irq_handler
 179 009c 00E100E0 		.word	-536813312
 180 00a0 44380240 		.word	1073887300
 181              		.cfi_endproc
 182              	.LFE2:
 184              		.align	2
 185              		.global	app_init
 186              		.code	16
 187              		.thumb_func
 189              	app_init:
 190              	.LFB3:
  43:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 
  44:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** void app_init()
  45:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** {
 191              		.loc 1 45 0
 192              		.cfi_startproc
 193              		@ args = 0, pretend = 0, frame = 0
 194              		@ frame_needed = 1, uses_anonymous_args = 0
 195 00a4 80B5     		push	{r7, lr}
 196              		.cfi_def_cfa_offset 8
 197              		.cfi_offset 7, -8
 198              		.cfi_offset 14, -4
 199 00a6 00AF     		add	r7, sp, #0
 200              		.cfi_def_cfa_register 7
  46:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	GPIO_D.moder = 0x00005555;
 201              		.loc 1 46 0
 202 00a8 044B     		ldr	r3, .L9
 203 00aa 054A     		ldr	r2, .L9+4
 204 00ac 1A60     		str	r2, [r3]
  47:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	GPIO_E.moder = 0x00005500;
 205              		.loc 1 47 0
 206 00ae 054B     		ldr	r3, .L9+8
 207 00b0 AA22     		movs	r2, #170
 208 00b2 D201     		lsls	r2, r2, #7
 209 00b4 1A60     		str	r2, [r3]
  48:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** }
 210              		.loc 1 48 0
 211 00b6 C046     		nop
 212 00b8 BD46     		mov	sp, r7
 213              		@ sp needed
 214 00ba 80BD     		pop	{r7, pc}
 215              	.L10:
 216              		.align	2
 217              	.L9:
 218 00bc 000C0240 		.word	1073875968
 219 00c0 55550000 		.word	21845
 220 00c4 00100240 		.word	1073876992
 221              		.cfi_endproc
 222              	.LFE3:
 224              		.align	2
 225              		.global	main
 226              		.code	16
 227              		.thumb_func
 229              	main:
 230              	.LFB4:
  49:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** void main(void)
  50:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** {
 231              		.loc 1 50 0
 232              		.cfi_startproc
 233              		@ args = 0, pretend = 0, frame = 0
 234              		@ frame_needed = 1, uses_anonymous_args = 0
 235 00c8 80B5     		push	{r7, lr}
 236              		.cfi_def_cfa_offset 8
 237              		.cfi_offset 7, -8
 238              		.cfi_offset 14, -4
 239 00ca 00AF     		add	r7, sp, #0
 240              		.cfi_def_cfa_register 7
  51:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	app_init();
 241              		.loc 1 51 0
 242 00cc FFF7FEFF 		bl	app_init
  52:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	irq_init();
 243              		.loc 1 52 0
 244 00d0 FFF7FEFF 		bl	irq_init
 245              	.L12:
  53:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	while(1)
  54:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	{
  55:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 		GPIO_D.odr_low = count;
 246              		.loc 1 55 0 discriminator 1
 247 00d4 024A     		ldr	r2, .L13
 248 00d6 034B     		ldr	r3, .L13+4
 249 00d8 1B88     		ldrh	r3, [r3]
 250 00da DBB2     		uxtb	r3, r3
 251 00dc 1375     		strb	r3, [r2, #20]
  56:/Users/Simon/chalmers-eda487/flip_flop_irq_ack/startup.c **** 	}
 252              		.loc 1 56 0 discriminator 1
 253 00de F9E7     		b	.L12
 254              	.L14:
 255              		.align	2
 256              	.L13:
 257 00e0 000C0240 		.word	1073875968
 258 00e4 00000000 		.word	count
 259              		.cfi_endproc
 260              	.LFE4:
 262              	.Letext0:
 263              		.file 2 "/Users/Simon/chalmers-eda487/flip_flop_irq_ack/types.h"
 264              		.file 3 "/Users/Simon/chalmers-eda487/libraries/gpio.h"
 265              		.file 4 "/Users/Simon/chalmers-eda487/libraries/irq.h"
 266              		.file 5 "/Users/Simon/chalmers-eda487/flip_flop_irq_ack/exti.h"
 267              		.file 6 "/Users/Simon/chalmers-eda487/flip_flop_irq_ack/syscfg.h"
