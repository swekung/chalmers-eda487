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
  15              		.file	"usart.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.align	2
  20              		.global	iniuart
  21              		.code	16
  22              		.thumb_func
  24              	iniuart:
  25              	.LFB0:
  26              		.file 1 "/Users/Simon/chalmers-eda487/Final/usart.c"
   1:/Users/Simon/chalmers-eda487/Final/usart.c **** #include "gpio.h"
   2:/Users/Simon/chalmers-eda487/Final/usart.c **** #include "usart.h"
   3:/Users/Simon/chalmers-eda487/Final/usart.c **** 
   4:/Users/Simon/chalmers-eda487/Final/usart.c **** void iniuart()
   5:/Users/Simon/chalmers-eda487/Final/usart.c **** {
  27              		.loc 1 5 0
  28              		.cfi_startproc
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  31 0000 80B5     		push	{r7, lr}
  32              		.cfi_def_cfa_offset 8
  33              		.cfi_offset 7, -8
  34              		.cfi_offset 14, -4
  35 0002 00AF     		add	r7, sp, #0
  36              		.cfi_def_cfa_register 7
   6:/Users/Simon/chalmers-eda487/Final/usart.c **** 	USART1.brr = 0x2D9;
  37              		.loc 1 6 0
  38 0004 054B     		ldr	r3, .L2
  39 0006 064A     		ldr	r2, .L2+4
  40 0008 1A81     		strh	r2, [r3, #8]
   7:/Users/Simon/chalmers-eda487/Final/usart.c **** 	USART1.cr2 = 0;
  41              		.loc 1 7 0
  42 000a 044B     		ldr	r3, .L2
  43 000c 0022     		movs	r2, #0
  44 000e 1A82     		strh	r2, [r3, #16]
   8:/Users/Simon/chalmers-eda487/Final/usart.c **** 	USART1.cr1 = (1<<13) | (1<<3) | (1<<2);
  45              		.loc 1 8 0
  46 0010 024B     		ldr	r3, .L2
  47 0012 044A     		ldr	r2, .L2+8
  48 0014 9A81     		strh	r2, [r3, #12]
   9:/Users/Simon/chalmers-eda487/Final/usart.c **** }
  49              		.loc 1 9 0
  50 0016 C046     		nop
  51 0018 BD46     		mov	sp, r7
  52              		@ sp needed
  53 001a 80BD     		pop	{r7, pc}
  54              	.L3:
  55              		.align	2
  56              	.L2:
  57 001c 00100140 		.word	1073811456
  58 0020 D9020000 		.word	729
  59 0024 0C200000 		.word	8204
  60              		.cfi_endproc
  61              	.LFE0:
  63              		.align	2
  64              		.global	tstchar
  65              		.code	16
  66              		.thumb_func
  68              	tstchar:
  69              	.LFB1:
  10:/Users/Simon/chalmers-eda487/Final/usart.c **** 
  11:/Users/Simon/chalmers-eda487/Final/usart.c **** uint8_t tstchar()
  12:/Users/Simon/chalmers-eda487/Final/usart.c **** {
  70              		.loc 1 12 0
  71              		.cfi_startproc
  72              		@ args = 0, pretend = 0, frame = 0
  73              		@ frame_needed = 1, uses_anonymous_args = 0
  74 0028 80B5     		push	{r7, lr}
  75              		.cfi_def_cfa_offset 8
  76              		.cfi_offset 7, -8
  77              		.cfi_offset 14, -4
  78 002a 00AF     		add	r7, sp, #0
  79              		.cfi_def_cfa_register 7
  13:/Users/Simon/chalmers-eda487/Final/usart.c **** 	if((USART1.sr & 0x20) == 0)
  80              		.loc 1 13 0
  81 002c 074B     		ldr	r3, .L7
  82 002e 1B88     		ldrh	r3, [r3]
  83 0030 9BB2     		uxth	r3, r3
  84 0032 1A00     		movs	r2, r3
  85 0034 2023     		movs	r3, #32
  86 0036 1340     		ands	r3, r2
  87 0038 01D1     		bne	.L5
  14:/Users/Simon/chalmers-eda487/Final/usart.c **** 	{
  15:/Users/Simon/chalmers-eda487/Final/usart.c **** 		return 0;
  88              		.loc 1 15 0
  89 003a 0023     		movs	r3, #0
  90 003c 03E0     		b	.L6
  91              	.L5:
  16:/Users/Simon/chalmers-eda487/Final/usart.c **** 	}
  17:/Users/Simon/chalmers-eda487/Final/usart.c **** 	return (uint8_t) USART1.dr;
  92              		.loc 1 17 0
  93 003e 034B     		ldr	r3, .L7
  94 0040 9B88     		ldrh	r3, [r3, #4]
  95 0042 9BB2     		uxth	r3, r3
  96 0044 DBB2     		uxtb	r3, r3
  97              	.L6:
  18:/Users/Simon/chalmers-eda487/Final/usart.c **** }
  98              		.loc 1 18 0
  99 0046 1800     		movs	r0, r3
 100 0048 BD46     		mov	sp, r7
 101              		@ sp needed
 102 004a 80BD     		pop	{r7, pc}
 103              	.L8:
 104              		.align	2
 105              	.L7:
 106 004c 00100140 		.word	1073811456
 107              		.cfi_endproc
 108              	.LFE1:
 110              		.align	2
 111              		.global	outchar
 112              		.code	16
 113              		.thumb_func
 115              	outchar:
 116              	.LFB2:
  19:/Users/Simon/chalmers-eda487/Final/usart.c **** void outchar ( uint8_t c )
  20:/Users/Simon/chalmers-eda487/Final/usart.c **** {
 117              		.loc 1 20 0
 118              		.cfi_startproc
 119              		@ args = 0, pretend = 0, frame = 8
 120              		@ frame_needed = 1, uses_anonymous_args = 0
 121 0050 80B5     		push	{r7, lr}
 122              		.cfi_def_cfa_offset 8
 123              		.cfi_offset 7, -8
 124              		.cfi_offset 14, -4
 125 0052 82B0     		sub	sp, sp, #8
 126              		.cfi_def_cfa_offset 16
 127 0054 00AF     		add	r7, sp, #0
 128              		.cfi_def_cfa_register 7
 129 0056 0200     		movs	r2, r0
 130 0058 FB1D     		adds	r3, r7, #7
 131 005a 1A70     		strb	r2, [r3]
  21:/Users/Simon/chalmers-eda487/Final/usart.c **** 	USART1.dr = (uint16_t) c;
 132              		.loc 1 21 0
 133 005c 0C4A     		ldr	r2, .L14
 134 005e FB1D     		adds	r3, r7, #7
 135 0060 1B78     		ldrb	r3, [r3]
 136 0062 9BB2     		uxth	r3, r3
 137 0064 9380     		strh	r3, [r2, #4]
  22:/Users/Simon/chalmers-eda487/Final/usart.c **** 	while((USART1.sr & 0x80) == 0)
 138              		.loc 1 22 0
 139 0066 00E0     		b	.L10
 140              	.L11:
  23:/Users/Simon/chalmers-eda487/Final/usart.c **** 	{
  24:/Users/Simon/chalmers-eda487/Final/usart.c **** 		asm volatile(
 141              		.loc 1 24 0
 142              		.syntax divided
 143              	@ 24 "/Users/Simon/chalmers-eda487/Final/usart.c" 1
 144 0068 C046     		NOP
 145              	
 146              	@ 0 "" 2
 147              		.thumb
 148              		.syntax unified
 149              	.L10:
  22:/Users/Simon/chalmers-eda487/Final/usart.c **** 	while((USART1.sr & 0x80) == 0)
 150              		.loc 1 22 0
 151 006a 094B     		ldr	r3, .L14
 152 006c 1B88     		ldrh	r3, [r3]
 153 006e 9BB2     		uxth	r3, r3
 154 0070 1A00     		movs	r2, r3
 155 0072 8023     		movs	r3, #128
 156 0074 1340     		ands	r3, r2
 157 0076 F7D0     		beq	.L11
  25:/Users/Simon/chalmers-eda487/Final/usart.c **** 			"NOP\n"
  26:/Users/Simon/chalmers-eda487/Final/usart.c **** 		) ;
  27:/Users/Simon/chalmers-eda487/Final/usart.c **** 	}
  28:/Users/Simon/chalmers-eda487/Final/usart.c **** 	if( c == '\n')
 158              		.loc 1 28 0
 159 0078 FB1D     		adds	r3, r7, #7
 160 007a 1B78     		ldrb	r3, [r3]
 161 007c 0A2B     		cmp	r3, #10
 162 007e 02D1     		bne	.L13
  29:/Users/Simon/chalmers-eda487/Final/usart.c **** 	{
  30:/Users/Simon/chalmers-eda487/Final/usart.c **** 		outchar('\r');
 163              		.loc 1 30 0
 164 0080 0D20     		movs	r0, #13
 165 0082 FFF7FEFF 		bl	outchar
 166              	.L13:
  31:/Users/Simon/chalmers-eda487/Final/usart.c **** 	}
  32:/Users/Simon/chalmers-eda487/Final/usart.c **** }
 167              		.loc 1 32 0
 168 0086 C046     		nop
 169 0088 BD46     		mov	sp, r7
 170 008a 02B0     		add	sp, sp, #8
 171              		@ sp needed
 172 008c 80BD     		pop	{r7, pc}
 173              	.L15:
 174 008e C046     		.align	2
 175              	.L14:
 176 0090 00100140 		.word	1073811456
 177              		.cfi_endproc
 178              	.LFE2:
 180              		.align	2
 181              		.global	inchar
 182              		.code	16
 183              		.thumb_func
 185              	inchar:
 186              	.LFB3:
  33:/Users/Simon/chalmers-eda487/Final/usart.c **** uint8_t inchar ()
  34:/Users/Simon/chalmers-eda487/Final/usart.c **** {
 187              		.loc 1 34 0
 188              		.cfi_startproc
 189              		@ args = 0, pretend = 0, frame = 8
 190              		@ frame_needed = 1, uses_anonymous_args = 0
 191 0094 90B5     		push	{r4, r7, lr}
 192              		.cfi_def_cfa_offset 12
 193              		.cfi_offset 4, -12
 194              		.cfi_offset 7, -8
 195              		.cfi_offset 14, -4
 196 0096 83B0     		sub	sp, sp, #12
 197              		.cfi_def_cfa_offset 24
 198 0098 00AF     		add	r7, sp, #0
 199              		.cfi_def_cfa_register 7
 200              	.L17:
  35:/Users/Simon/chalmers-eda487/Final/usart.c **** 	uint8_t c;
  36:/Users/Simon/chalmers-eda487/Final/usart.c **** 	while( (c=tstchar() ) == 0);
 201              		.loc 1 36 0 discriminator 1
 202 009a FC1D     		adds	r4, r7, #7
 203 009c FFF7FEFF 		bl	tstchar
 204 00a0 0300     		movs	r3, r0
 205 00a2 2370     		strb	r3, [r4]
 206 00a4 FB1D     		adds	r3, r7, #7
 207 00a6 1B78     		ldrb	r3, [r3]
 208 00a8 002B     		cmp	r3, #0
 209 00aa F6D0     		beq	.L17
  37:/Users/Simon/chalmers-eda487/Final/usart.c **** 	return c;
 210              		.loc 1 37 0
 211 00ac FB1D     		adds	r3, r7, #7
 212 00ae 1B78     		ldrb	r3, [r3]
  38:/Users/Simon/chalmers-eda487/Final/usart.c **** }
 213              		.loc 1 38 0
 214 00b0 1800     		movs	r0, r3
 215 00b2 BD46     		mov	sp, r7
 216 00b4 03B0     		add	sp, sp, #12
 217              		@ sp needed
 218 00b6 90BD     		pop	{r4, r7, pc}
 219              		.cfi_endproc
 220              	.LFE3:
 222              	.Letext0:
 223              		.file 2 "/Users/Simon/chalmers-eda487/libraries/types.h"
 224              		.file 3 "/Users/Simon/chalmers-eda487/Final/usart.h"
