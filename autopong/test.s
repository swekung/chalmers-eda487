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
  15              		.file	"display.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.align	2
  20              		.global	graphic_ctrl_bit_set
  21              		.code	16
  22              		.thumb_func
  24              	graphic_ctrl_bit_set:
  25              	.LFB0:
  26              		.file 1 "/Users/Simon/Downloads/mop shit/autopong/display.c"
   1:/Users/Simon/Downloads/mop shit/autopong/display.c **** #include "gpio.h"
   2:/Users/Simon/Downloads/mop shit/autopong/display.c **** #include "bitar.h"
   3:/Users/Simon/Downloads/mop shit/autopong/display.c **** #include "delay.h"
   4:/Users/Simon/Downloads/mop shit/autopong/display.c **** 
   5:/Users/Simon/Downloads/mop shit/autopong/display.c **** void graphic_ctrl_bit_set(uint8_t data){
  27              		.loc 1 5 0
  28              		.cfi_startproc
  29              		@ args = 0, pretend = 0, frame = 16
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  31 0000 80B5     		push	{r7, lr}
  32              		.cfi_def_cfa_offset 8
  33              		.cfi_offset 7, -8
  34              		.cfi_offset 14, -4
  35 0002 84B0     		sub	sp, sp, #16
  36              		.cfi_def_cfa_offset 24
  37 0004 00AF     		add	r7, sp, #0
  38              		.cfi_def_cfa_register 7
  39 0006 0200     		movs	r2, r0
  40 0008 FB1D     		adds	r3, r7, #7
  41 000a 1A70     		strb	r2, [r3]
   6:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	uint8_t c;
   7:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	c = GPIO_E.odr_low;
  42              		.loc 1 7 0
  43 000c 124A     		ldr	r2, .L2
  44 000e 0F23     		movs	r3, #15
  45 0010 FB18     		adds	r3, r7, r3
  46 0012 127D     		ldrb	r2, [r2, #20]
  47 0014 1A70     		strb	r2, [r3]
   8:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	c &= ~B_SELECT;
  48              		.loc 1 8 0
  49 0016 0F23     		movs	r3, #15
  50 0018 FB18     		adds	r3, r7, r3
  51 001a 0F22     		movs	r2, #15
  52 001c BA18     		adds	r2, r7, r2
  53 001e 1278     		ldrb	r2, [r2]
  54 0020 0421     		movs	r1, #4
  55 0022 8A43     		bics	r2, r1
  56 0024 1A70     		strb	r2, [r3]
   9:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	c |= (~B_SELECT & data);
  57              		.loc 1 9 0
  58 0026 FB1D     		adds	r3, r7, #7
  59 0028 1B78     		ldrb	r3, [r3]
  60 002a 5BB2     		sxtb	r3, r3
  61 002c 0422     		movs	r2, #4
  62 002e 9343     		bics	r3, r2
  63 0030 5AB2     		sxtb	r2, r3
  64 0032 0F23     		movs	r3, #15
  65 0034 FB18     		adds	r3, r7, r3
  66 0036 1B78     		ldrb	r3, [r3]
  67 0038 5BB2     		sxtb	r3, r3
  68 003a 1343     		orrs	r3, r2
  69 003c 5AB2     		sxtb	r2, r3
  70 003e 0F23     		movs	r3, #15
  71 0040 FB18     		adds	r3, r7, r3
  72 0042 1A70     		strb	r2, [r3]
  10:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	GPIO_E.odr_low = c;
  73              		.loc 1 10 0
  74 0044 044A     		ldr	r2, .L2
  75 0046 0F23     		movs	r3, #15
  76 0048 FB18     		adds	r3, r7, r3
  77 004a 1B78     		ldrb	r3, [r3]
  78 004c 1375     		strb	r3, [r2, #20]
  11:/Users/Simon/Downloads/mop shit/autopong/display.c **** }
  79              		.loc 1 11 0
  80 004e C046     		nop
  81 0050 BD46     		mov	sp, r7
  82 0052 04B0     		add	sp, sp, #16
  83              		@ sp needed
  84 0054 80BD     		pop	{r7, pc}
  85              	.L3:
  86 0056 C046     		.align	2
  87              	.L2:
  88 0058 00100240 		.word	1073876992
  89              		.cfi_endproc
  90              	.LFE0:
  92              		.align	2
  93              		.global	graphic_ctrl_bit_clear
  94              		.code	16
  95              		.thumb_func
  97              	graphic_ctrl_bit_clear:
  98              	.LFB1:
  12:/Users/Simon/Downloads/mop shit/autopong/display.c **** 
  13:/Users/Simon/Downloads/mop shit/autopong/display.c **** void graphic_ctrl_bit_clear(uint8_t data){
  99              		.loc 1 13 0
 100              		.cfi_startproc
 101              		@ args = 0, pretend = 0, frame = 16
 102              		@ frame_needed = 1, uses_anonymous_args = 0
 103 005c 80B5     		push	{r7, lr}
 104              		.cfi_def_cfa_offset 8
 105              		.cfi_offset 7, -8
 106              		.cfi_offset 14, -4
 107 005e 84B0     		sub	sp, sp, #16
 108              		.cfi_def_cfa_offset 24
 109 0060 00AF     		add	r7, sp, #0
 110              		.cfi_def_cfa_register 7
 111 0062 0200     		movs	r2, r0
 112 0064 FB1D     		adds	r3, r7, #7
 113 0066 1A70     		strb	r2, [r3]
  14:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	uint8_t c;
  15:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	c = GPIO_E.odr_low;
 114              		.loc 1 15 0
 115 0068 114A     		ldr	r2, .L5
 116 006a 0F23     		movs	r3, #15
 117 006c FB18     		adds	r3, r7, r3
 118 006e 127D     		ldrb	r2, [r2, #20]
 119 0070 1A70     		strb	r2, [r3]
  16:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	c &= ~B_SELECT;
 120              		.loc 1 16 0
 121 0072 0F23     		movs	r3, #15
 122 0074 FB18     		adds	r3, r7, r3
 123 0076 0F22     		movs	r2, #15
 124 0078 BA18     		adds	r2, r7, r2
 125 007a 1278     		ldrb	r2, [r2]
 126 007c 0421     		movs	r1, #4
 127 007e 8A43     		bics	r2, r1
 128 0080 1A70     		strb	r2, [r3]
  17:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	c &= ~data;
 129              		.loc 1 17 0
 130 0082 FB1D     		adds	r3, r7, #7
 131 0084 1B78     		ldrb	r3, [r3]
 132 0086 5BB2     		sxtb	r3, r3
 133 0088 DB43     		mvns	r3, r3
 134 008a 5BB2     		sxtb	r3, r3
 135 008c 0F22     		movs	r2, #15
 136 008e BA18     		adds	r2, r7, r2
 137 0090 1278     		ldrb	r2, [r2]
 138 0092 52B2     		sxtb	r2, r2
 139 0094 1340     		ands	r3, r2
 140 0096 5AB2     		sxtb	r2, r3
 141 0098 0F23     		movs	r3, #15
 142 009a FB18     		adds	r3, r7, r3
 143 009c 1A70     		strb	r2, [r3]
  18:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	GPIO_E.odr_low = c;
 144              		.loc 1 18 0
 145 009e 044A     		ldr	r2, .L5
 146 00a0 0F23     		movs	r3, #15
 147 00a2 FB18     		adds	r3, r7, r3
 148 00a4 1B78     		ldrb	r3, [r3]
 149 00a6 1375     		strb	r3, [r2, #20]
  19:/Users/Simon/Downloads/mop shit/autopong/display.c **** }
 150              		.loc 1 19 0
 151 00a8 C046     		nop
 152 00aa BD46     		mov	sp, r7
 153 00ac 04B0     		add	sp, sp, #16
 154              		@ sp needed
 155 00ae 80BD     		pop	{r7, pc}
 156              	.L6:
 157              		.align	2
 158              	.L5:
 159 00b0 00100240 		.word	1073876992
 160              		.cfi_endproc
 161              	.LFE1:
 163              		.align	2
 164              		.global	select_controller
 165              		.code	16
 166              		.thumb_func
 168              	select_controller:
 169              	.LFB2:
  20:/Users/Simon/Downloads/mop shit/autopong/display.c **** 
  21:/Users/Simon/Downloads/mop shit/autopong/display.c **** void select_controller(uint8_t data){
 170              		.loc 1 21 0
 171              		.cfi_startproc
 172              		@ args = 0, pretend = 0, frame = 8
 173              		@ frame_needed = 1, uses_anonymous_args = 0
 174 00b4 80B5     		push	{r7, lr}
 175              		.cfi_def_cfa_offset 8
 176              		.cfi_offset 7, -8
 177              		.cfi_offset 14, -4
 178 00b6 82B0     		sub	sp, sp, #8
 179              		.cfi_def_cfa_offset 16
 180 00b8 00AF     		add	r7, sp, #0
 181              		.cfi_def_cfa_register 7
 182 00ba 0200     		movs	r2, r0
 183 00bc FB1D     		adds	r3, r7, #7
 184 00be 1A70     		strb	r2, [r3]
  22:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	switch(data){
 185              		.loc 1 22 0
 186 00c0 FB1D     		adds	r3, r7, #7
 187 00c2 1B78     		ldrb	r3, [r3]
 188 00c4 082B     		cmp	r3, #8
 189 00c6 0CD0     		beq	.L9
 190 00c8 02DC     		bgt	.L10
 191 00ca 002B     		cmp	r3, #0
 192 00cc 05D0     		beq	.L11
  23:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		case 0: 	graphic_ctrl_bit_clear(B_CS1|B_CS2); 
  24:/Users/Simon/Downloads/mop shit/autopong/display.c **** 					break;
  25:/Users/Simon/Downloads/mop shit/autopong/display.c **** 				
  26:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		case B_CS1:	graphic_ctrl_bit_set(B_CS1);
  27:/Users/Simon/Downloads/mop shit/autopong/display.c **** 					graphic_ctrl_bit_clear(B_CS2);	
  28:/Users/Simon/Downloads/mop shit/autopong/display.c **** 					break;
  29:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		
  30:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		case B_CS2:	graphic_ctrl_bit_clear(B_CS1);
  31:/Users/Simon/Downloads/mop shit/autopong/display.c **** 					graphic_ctrl_bit_set(B_CS2);	
  32:/Users/Simon/Downloads/mop shit/autopong/display.c **** 					break;
  33:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		
  34:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		case (B_CS1 | B_CS2):	graphic_ctrl_bit_set(B_CS1|B_CS2);
  35:/Users/Simon/Downloads/mop shit/autopong/display.c **** 					break;
  36:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	}
  37:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	
  38:/Users/Simon/Downloads/mop shit/autopong/display.c **** }
 193              		.loc 1 38 0
 194 00ce 1AE0     		b	.L14
 195              	.L10:
  22:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	switch(data){
 196              		.loc 1 22 0
 197 00d0 102B     		cmp	r3, #16
 198 00d2 0DD0     		beq	.L12
 199 00d4 182B     		cmp	r3, #24
 200 00d6 12D0     		beq	.L13
 201              		.loc 1 38 0
 202 00d8 15E0     		b	.L14
 203              	.L11:
  23:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		case 0: 	graphic_ctrl_bit_clear(B_CS1|B_CS2); 
 204              		.loc 1 23 0
 205 00da 1820     		movs	r0, #24
 206 00dc FFF7FEFF 		bl	graphic_ctrl_bit_clear
  24:/Users/Simon/Downloads/mop shit/autopong/display.c **** 				
 207              		.loc 1 24 0
 208 00e0 11E0     		b	.L8
 209              	.L9:
  26:/Users/Simon/Downloads/mop shit/autopong/display.c **** 					graphic_ctrl_bit_clear(B_CS2);	
 210              		.loc 1 26 0
 211 00e2 0820     		movs	r0, #8
 212 00e4 FFF7FEFF 		bl	graphic_ctrl_bit_set
  27:/Users/Simon/Downloads/mop shit/autopong/display.c **** 					break;
 213              		.loc 1 27 0
 214 00e8 1020     		movs	r0, #16
 215 00ea FFF7FEFF 		bl	graphic_ctrl_bit_clear
  28:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		
 216              		.loc 1 28 0
 217 00ee 0AE0     		b	.L8
 218              	.L12:
  30:/Users/Simon/Downloads/mop shit/autopong/display.c **** 					graphic_ctrl_bit_set(B_CS2);	
 219              		.loc 1 30 0
 220 00f0 0820     		movs	r0, #8
 221 00f2 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  31:/Users/Simon/Downloads/mop shit/autopong/display.c **** 					break;
 222              		.loc 1 31 0
 223 00f6 1020     		movs	r0, #16
 224 00f8 FFF7FEFF 		bl	graphic_ctrl_bit_set
  32:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		
 225              		.loc 1 32 0
 226 00fc 03E0     		b	.L8
 227              	.L13:
  34:/Users/Simon/Downloads/mop shit/autopong/display.c **** 					break;
 228              		.loc 1 34 0
 229 00fe 1820     		movs	r0, #24
 230 0100 FFF7FEFF 		bl	graphic_ctrl_bit_set
  35:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	}
 231              		.loc 1 35 0
 232 0104 C046     		nop
 233              	.L8:
 234              	.L14:
 235              		.loc 1 38 0
 236 0106 C046     		nop
 237 0108 BD46     		mov	sp, r7
 238 010a 02B0     		add	sp, sp, #8
 239              		@ sp needed
 240 010c 80BD     		pop	{r7, pc}
 241              		.cfi_endproc
 242              	.LFE2:
 244 010e C046     		.align	2
 245              		.global	graphic_wait_ready
 246              		.code	16
 247              		.thumb_func
 249              	graphic_wait_ready:
 250              	.LFB3:
  39:/Users/Simon/Downloads/mop shit/autopong/display.c **** 
  40:/Users/Simon/Downloads/mop shit/autopong/display.c **** void graphic_wait_ready(){
 251              		.loc 1 40 0
 252              		.cfi_startproc
 253              		@ args = 0, pretend = 0, frame = 8
 254              		@ frame_needed = 1, uses_anonymous_args = 0
 255 0110 80B5     		push	{r7, lr}
 256              		.cfi_def_cfa_offset 8
 257              		.cfi_offset 7, -8
 258              		.cfi_offset 14, -4
 259 0112 82B0     		sub	sp, sp, #8
 260              		.cfi_def_cfa_offset 16
 261 0114 00AF     		add	r7, sp, #0
 262              		.cfi_def_cfa_register 7
  41:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	uint8_t c;
  42:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_clear(B_E);
 263              		.loc 1 42 0
 264 0116 4020     		movs	r0, #64
 265 0118 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  43:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	GPIO_E.moder = 0x00005555;
 266              		.loc 1 43 0
 267 011c 144B     		ldr	r3, .L21
 268 011e 154A     		ldr	r2, .L21+4
 269 0120 1A60     		str	r2, [r3]
  44:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_clear(B_RS);
 270              		.loc 1 44 0
 271 0122 0120     		movs	r0, #1
 272 0124 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  45:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_set(B_RW);
 273              		.loc 1 45 0
 274 0128 0220     		movs	r0, #2
 275 012a FFF7FEFF 		bl	graphic_ctrl_bit_set
  46:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	delay_500ns();
 276              		.loc 1 46 0
 277 012e FFF7FEFF 		bl	delay_500ns
 278              	.L18:
  47:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	
  48:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	while(1){
  49:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		graphic_ctrl_bit_set(B_E);
 279              		.loc 1 49 0
 280 0132 4020     		movs	r0, #64
 281 0134 FFF7FEFF 		bl	graphic_ctrl_bit_set
  50:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		delay_500ns();
 282              		.loc 1 50 0
 283 0138 FFF7FEFF 		bl	delay_500ns
  51:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		c = GPIO_E.idr_high & LCD_BUSY;
 284              		.loc 1 51 0
 285 013c 0C4B     		ldr	r3, .L21
 286 013e 5B7C     		ldrb	r3, [r3, #17]
 287 0140 DAB2     		uxtb	r2, r3
 288 0142 FB1D     		adds	r3, r7, #7
 289 0144 7F21     		movs	r1, #127
 290 0146 8A43     		bics	r2, r1
 291 0148 1A70     		strb	r2, [r3]
  52:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		graphic_ctrl_bit_clear(B_E);
 292              		.loc 1 52 0
 293 014a 4020     		movs	r0, #64
 294 014c FFF7FEFF 		bl	graphic_ctrl_bit_clear
  53:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		delay_500ns();
 295              		.loc 1 53 0
 296 0150 FFF7FEFF 		bl	delay_500ns
  54:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		if(c == 0) break;
 297              		.loc 1 54 0
 298 0154 FB1D     		adds	r3, r7, #7
 299 0156 1B78     		ldrb	r3, [r3]
 300 0158 002B     		cmp	r3, #0
 301 015a 00D0     		beq	.L20
  55:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	}
 302              		.loc 1 55 0
 303 015c E9E7     		b	.L18
 304              	.L20:
  54:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		if(c == 0) break;
 305              		.loc 1 54 0
 306 015e C046     		nop
  56:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	GPIO_E.moder = 0x55555555;
 307              		.loc 1 56 0
 308 0160 034B     		ldr	r3, .L21
 309 0162 054A     		ldr	r2, .L21+8
 310 0164 1A60     		str	r2, [r3]
  57:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	
  58:/Users/Simon/Downloads/mop shit/autopong/display.c **** }
 311              		.loc 1 58 0
 312 0166 C046     		nop
 313 0168 BD46     		mov	sp, r7
 314 016a 02B0     		add	sp, sp, #8
 315              		@ sp needed
 316 016c 80BD     		pop	{r7, pc}
 317              	.L22:
 318 016e C046     		.align	2
 319              	.L21:
 320 0170 00100240 		.word	1073876992
 321 0174 55550000 		.word	21845
 322 0178 55555555 		.word	1431655765
 323              		.cfi_endproc
 324              	.LFE3:
 326              		.align	2
 327              		.global	graphic_read
 328              		.code	16
 329              		.thumb_func
 331              	graphic_read:
 332              	.LFB4:
  59:/Users/Simon/Downloads/mop shit/autopong/display.c **** 
  60:/Users/Simon/Downloads/mop shit/autopong/display.c **** uint8_t graphic_read(uint8_t controller){
 333              		.loc 1 60 0
 334              		.cfi_startproc
 335              		@ args = 0, pretend = 0, frame = 16
 336              		@ frame_needed = 1, uses_anonymous_args = 0
 337 017c 80B5     		push	{r7, lr}
 338              		.cfi_def_cfa_offset 8
 339              		.cfi_offset 7, -8
 340              		.cfi_offset 14, -4
 341 017e 84B0     		sub	sp, sp, #16
 342              		.cfi_def_cfa_offset 24
 343 0180 00AF     		add	r7, sp, #0
 344              		.cfi_def_cfa_register 7
 345 0182 0200     		movs	r2, r0
 346 0184 FB1D     		adds	r3, r7, #7
 347 0186 1A70     		strb	r2, [r3]
  61:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	uint8_t rv;
  62:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_clear(B_E);
 348              		.loc 1 62 0
 349 0188 4020     		movs	r0, #64
 350 018a FFF7FEFF 		bl	graphic_ctrl_bit_clear
  63:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	GPIO_E.moder = 0x00005555;
 351              		.loc 1 63 0
 352 018e 1B4B     		ldr	r3, .L27
 353 0190 1B4A     		ldr	r2, .L27+4
 354 0192 1A60     		str	r2, [r3]
  64:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_set(B_RS|B_RW);
 355              		.loc 1 64 0
 356 0194 0320     		movs	r0, #3
 357 0196 FFF7FEFF 		bl	graphic_ctrl_bit_set
  65:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	select_controller(controller);
 358              		.loc 1 65 0
 359 019a FB1D     		adds	r3, r7, #7
 360 019c 1B78     		ldrb	r3, [r3]
 361 019e 1800     		movs	r0, r3
 362 01a0 FFF7FEFF 		bl	select_controller
  66:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	delay_500ns();
 363              		.loc 1 66 0
 364 01a4 FFF7FEFF 		bl	delay_500ns
  67:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_set(B_E);
 365              		.loc 1 67 0
 366 01a8 4020     		movs	r0, #64
 367 01aa FFF7FEFF 		bl	graphic_ctrl_bit_set
  68:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	delay_500ns();
 368              		.loc 1 68 0
 369 01ae FFF7FEFF 		bl	delay_500ns
  69:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	rv = GPIO_E.idr_high;
 370              		.loc 1 69 0
 371 01b2 124A     		ldr	r2, .L27
 372 01b4 0F23     		movs	r3, #15
 373 01b6 FB18     		adds	r3, r7, r3
 374 01b8 527C     		ldrb	r2, [r2, #17]
 375 01ba 1A70     		strb	r2, [r3]
  70:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_clear(B_E);
 376              		.loc 1 70 0
 377 01bc 4020     		movs	r0, #64
 378 01be FFF7FEFF 		bl	graphic_ctrl_bit_clear
  71:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	GPIO_E.moder = 0x55555555;
 379              		.loc 1 71 0
 380 01c2 0E4B     		ldr	r3, .L27
 381 01c4 0F4A     		ldr	r2, .L27+8
 382 01c6 1A60     		str	r2, [r3]
  72:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	if(controller == B_CS1){
 383              		.loc 1 72 0
 384 01c8 FB1D     		adds	r3, r7, #7
 385 01ca 1B78     		ldrb	r3, [r3]
 386 01cc 082B     		cmp	r3, #8
 387 01ce 04D1     		bne	.L24
  73:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		select_controller(B_CS1);
 388              		.loc 1 73 0
 389 01d0 0820     		movs	r0, #8
 390 01d2 FFF7FEFF 		bl	select_controller
  74:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		graphic_wait_ready();
 391              		.loc 1 74 0
 392 01d6 FFF7FEFF 		bl	graphic_wait_ready
 393              	.L24:
  75:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	}
  76:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	if(controller == B_CS2){
 394              		.loc 1 76 0
 395 01da FB1D     		adds	r3, r7, #7
 396 01dc 1B78     		ldrb	r3, [r3]
 397 01de 102B     		cmp	r3, #16
 398 01e0 04D1     		bne	.L25
  77:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		select_controller(B_CS2);
 399              		.loc 1 77 0
 400 01e2 1020     		movs	r0, #16
 401 01e4 FFF7FEFF 		bl	select_controller
  78:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		graphic_wait_ready();
 402              		.loc 1 78 0
 403 01e8 FFF7FEFF 		bl	graphic_wait_ready
 404              	.L25:
  79:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	}
  80:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	return rv;
 405              		.loc 1 80 0
 406 01ec 0F23     		movs	r3, #15
 407 01ee FB18     		adds	r3, r7, r3
 408 01f0 1B78     		ldrb	r3, [r3]
  81:/Users/Simon/Downloads/mop shit/autopong/display.c **** }
 409              		.loc 1 81 0
 410 01f2 1800     		movs	r0, r3
 411 01f4 BD46     		mov	sp, r7
 412 01f6 04B0     		add	sp, sp, #16
 413              		@ sp needed
 414 01f8 80BD     		pop	{r7, pc}
 415              	.L28:
 416 01fa C046     		.align	2
 417              	.L27:
 418 01fc 00100240 		.word	1073876992
 419 0200 55550000 		.word	21845
 420 0204 55555555 		.word	1431655765
 421              		.cfi_endproc
 422              	.LFE4:
 424              		.align	2
 425              		.global	graphic_write
 426              		.code	16
 427              		.thumb_func
 429              	graphic_write:
 430              	.LFB5:
  82:/Users/Simon/Downloads/mop shit/autopong/display.c **** 
  83:/Users/Simon/Downloads/mop shit/autopong/display.c **** void graphic_write(uint8_t value, uint8_t controller){
 431              		.loc 1 83 0
 432              		.cfi_startproc
 433              		@ args = 0, pretend = 0, frame = 8
 434              		@ frame_needed = 1, uses_anonymous_args = 0
 435 0208 80B5     		push	{r7, lr}
 436              		.cfi_def_cfa_offset 8
 437              		.cfi_offset 7, -8
 438              		.cfi_offset 14, -4
 439 020a 82B0     		sub	sp, sp, #8
 440              		.cfi_def_cfa_offset 16
 441 020c 00AF     		add	r7, sp, #0
 442              		.cfi_def_cfa_register 7
 443 020e 0200     		movs	r2, r0
 444 0210 FB1D     		adds	r3, r7, #7
 445 0212 1A70     		strb	r2, [r3]
 446 0214 BB1D     		adds	r3, r7, #6
 447 0216 0A1C     		adds	r2, r1, #0
 448 0218 1A70     		strb	r2, [r3]
  84:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	GPIO_E.odr_high = value;
 449              		.loc 1 84 0
 450 021a 1A4A     		ldr	r2, .L32
 451 021c FB1D     		adds	r3, r7, #7
 452 021e 1B78     		ldrb	r3, [r3]
 453 0220 5375     		strb	r3, [r2, #21]
  85:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	select_controller(controller);
 454              		.loc 1 85 0
 455 0222 BB1D     		adds	r3, r7, #6
 456 0224 1B78     		ldrb	r3, [r3]
 457 0226 1800     		movs	r0, r3
 458 0228 FFF7FEFF 		bl	select_controller
  86:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	delay_500ns();
 459              		.loc 1 86 0
 460 022c FFF7FEFF 		bl	delay_500ns
  87:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_set(B_E);
 461              		.loc 1 87 0
 462 0230 4020     		movs	r0, #64
 463 0232 FFF7FEFF 		bl	graphic_ctrl_bit_set
  88:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	delay_500ns();
 464              		.loc 1 88 0
 465 0236 FFF7FEFF 		bl	delay_500ns
  89:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_clear(B_E);
 466              		.loc 1 89 0
 467 023a 4020     		movs	r0, #64
 468 023c FFF7FEFF 		bl	graphic_ctrl_bit_clear
  90:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	if(controller & B_CS1){
 469              		.loc 1 90 0
 470 0240 BB1D     		adds	r3, r7, #6
 471 0242 1B78     		ldrb	r3, [r3]
 472 0244 0822     		movs	r2, #8
 473 0246 1340     		ands	r3, r2
 474 0248 04D0     		beq	.L30
  91:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		select_controller(B_CS1);
 475              		.loc 1 91 0
 476 024a 0820     		movs	r0, #8
 477 024c FFF7FEFF 		bl	select_controller
  92:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		graphic_wait_ready();
 478              		.loc 1 92 0
 479 0250 FFF7FEFF 		bl	graphic_wait_ready
 480              	.L30:
  93:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	}
  94:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	if(controller & B_CS2){
 481              		.loc 1 94 0
 482 0254 BB1D     		adds	r3, r7, #6
 483 0256 1B78     		ldrb	r3, [r3]
 484 0258 1022     		movs	r2, #16
 485 025a 1340     		ands	r3, r2
 486 025c 04D0     		beq	.L31
  95:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		select_controller(B_CS2);
 487              		.loc 1 95 0
 488 025e 1020     		movs	r0, #16
 489 0260 FFF7FEFF 		bl	select_controller
  96:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		graphic_wait_ready();
 490              		.loc 1 96 0
 491 0264 FFF7FEFF 		bl	graphic_wait_ready
 492              	.L31:
  97:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	}
  98:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	GPIO_E.odr_high = 0;
 493              		.loc 1 98 0
 494 0268 064B     		ldr	r3, .L32
 495 026a 0022     		movs	r2, #0
 496 026c 5A75     		strb	r2, [r3, #21]
  99:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_set(B_E);
 497              		.loc 1 99 0
 498 026e 4020     		movs	r0, #64
 499 0270 FFF7FEFF 		bl	graphic_ctrl_bit_set
 100:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	select_controller(0);
 500              		.loc 1 100 0
 501 0274 0020     		movs	r0, #0
 502 0276 FFF7FEFF 		bl	select_controller
 101:/Users/Simon/Downloads/mop shit/autopong/display.c **** }
 503              		.loc 1 101 0
 504 027a C046     		nop
 505 027c BD46     		mov	sp, r7
 506 027e 02B0     		add	sp, sp, #8
 507              		@ sp needed
 508 0280 80BD     		pop	{r7, pc}
 509              	.L33:
 510 0282 C046     		.align	2
 511              	.L32:
 512 0284 00100240 		.word	1073876992
 513              		.cfi_endproc
 514              	.LFE5:
 516              		.align	2
 517              		.global	graphic_write_command
 518              		.code	16
 519              		.thumb_func
 521              	graphic_write_command:
 522              	.LFB6:
 102:/Users/Simon/Downloads/mop shit/autopong/display.c **** 
 103:/Users/Simon/Downloads/mop shit/autopong/display.c **** void graphic_write_command(uint8_t command, uint8_t controller){
 523              		.loc 1 103 0
 524              		.cfi_startproc
 525              		@ args = 0, pretend = 0, frame = 8
 526              		@ frame_needed = 1, uses_anonymous_args = 0
 527 0288 80B5     		push	{r7, lr}
 528              		.cfi_def_cfa_offset 8
 529              		.cfi_offset 7, -8
 530              		.cfi_offset 14, -4
 531 028a 82B0     		sub	sp, sp, #8
 532              		.cfi_def_cfa_offset 16
 533 028c 00AF     		add	r7, sp, #0
 534              		.cfi_def_cfa_register 7
 535 028e 0200     		movs	r2, r0
 536 0290 FB1D     		adds	r3, r7, #7
 537 0292 1A70     		strb	r2, [r3]
 538 0294 BB1D     		adds	r3, r7, #6
 539 0296 0A1C     		adds	r2, r1, #0
 540 0298 1A70     		strb	r2, [r3]
 104:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_clear(B_E);
 541              		.loc 1 104 0
 542 029a 4020     		movs	r0, #64
 543 029c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 105:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	select_controller(controller);
 544              		.loc 1 105 0
 545 02a0 BB1D     		adds	r3, r7, #6
 546 02a2 1B78     		ldrb	r3, [r3]
 547 02a4 1800     		movs	r0, r3
 548 02a6 FFF7FEFF 		bl	select_controller
 106:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_clear(B_RS|B_RW);
 549              		.loc 1 106 0
 550 02aa 0320     		movs	r0, #3
 551 02ac FFF7FEFF 		bl	graphic_ctrl_bit_clear
 107:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_write(command, controller);
 552              		.loc 1 107 0
 553 02b0 BB1D     		adds	r3, r7, #6
 554 02b2 1A78     		ldrb	r2, [r3]
 555 02b4 FB1D     		adds	r3, r7, #7
 556 02b6 1B78     		ldrb	r3, [r3]
 557 02b8 1100     		movs	r1, r2
 558 02ba 1800     		movs	r0, r3
 559 02bc FFF7FEFF 		bl	graphic_write
 108:/Users/Simon/Downloads/mop shit/autopong/display.c **** }
 560              		.loc 1 108 0
 561 02c0 C046     		nop
 562 02c2 BD46     		mov	sp, r7
 563 02c4 02B0     		add	sp, sp, #8
 564              		@ sp needed
 565 02c6 80BD     		pop	{r7, pc}
 566              		.cfi_endproc
 567              	.LFE6:
 569              		.align	2
 570              		.global	graphic_write_data
 571              		.code	16
 572              		.thumb_func
 574              	graphic_write_data:
 575              	.LFB7:
 109:/Users/Simon/Downloads/mop shit/autopong/display.c **** 
 110:/Users/Simon/Downloads/mop shit/autopong/display.c **** void graphic_write_data(uint8_t data, uint8_t controller){
 576              		.loc 1 110 0
 577              		.cfi_startproc
 578              		@ args = 0, pretend = 0, frame = 8
 579              		@ frame_needed = 1, uses_anonymous_args = 0
 580 02c8 80B5     		push	{r7, lr}
 581              		.cfi_def_cfa_offset 8
 582              		.cfi_offset 7, -8
 583              		.cfi_offset 14, -4
 584 02ca 82B0     		sub	sp, sp, #8
 585              		.cfi_def_cfa_offset 16
 586 02cc 00AF     		add	r7, sp, #0
 587              		.cfi_def_cfa_register 7
 588 02ce 0200     		movs	r2, r0
 589 02d0 FB1D     		adds	r3, r7, #7
 590 02d2 1A70     		strb	r2, [r3]
 591 02d4 BB1D     		adds	r3, r7, #6
 592 02d6 0A1C     		adds	r2, r1, #0
 593 02d8 1A70     		strb	r2, [r3]
 111:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_clear(B_E);
 594              		.loc 1 111 0
 595 02da 4020     		movs	r0, #64
 596 02dc FFF7FEFF 		bl	graphic_ctrl_bit_clear
 112:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	select_controller(controller);
 597              		.loc 1 112 0
 598 02e0 BB1D     		adds	r3, r7, #6
 599 02e2 1B78     		ldrb	r3, [r3]
 600 02e4 1800     		movs	r0, r3
 601 02e6 FFF7FEFF 		bl	select_controller
 113:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_set(B_RS);
 602              		.loc 1 113 0
 603 02ea 0120     		movs	r0, #1
 604 02ec FFF7FEFF 		bl	graphic_ctrl_bit_set
 114:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_clear(B_RW);
 605              		.loc 1 114 0
 606 02f0 0220     		movs	r0, #2
 607 02f2 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 115:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_write(data, controller);
 608              		.loc 1 115 0
 609 02f6 BB1D     		adds	r3, r7, #6
 610 02f8 1A78     		ldrb	r2, [r3]
 611 02fa FB1D     		adds	r3, r7, #7
 612 02fc 1B78     		ldrb	r3, [r3]
 613 02fe 1100     		movs	r1, r2
 614 0300 1800     		movs	r0, r3
 615 0302 FFF7FEFF 		bl	graphic_write
 116:/Users/Simon/Downloads/mop shit/autopong/display.c **** 
 117:/Users/Simon/Downloads/mop shit/autopong/display.c **** }
 616              		.loc 1 117 0
 617 0306 C046     		nop
 618 0308 BD46     		mov	sp, r7
 619 030a 02B0     		add	sp, sp, #8
 620              		@ sp needed
 621 030c 80BD     		pop	{r7, pc}
 622              		.cfi_endproc
 623              	.LFE7:
 625 030e C046     		.align	2
 626              		.global	graphic_read_data
 627              		.code	16
 628              		.thumb_func
 630              	graphic_read_data:
 631              	.LFB8:
 118:/Users/Simon/Downloads/mop shit/autopong/display.c **** 
 119:/Users/Simon/Downloads/mop shit/autopong/display.c **** uint8_t graphic_read_data(uint8_t controller){
 632              		.loc 1 119 0
 633              		.cfi_startproc
 634              		@ args = 0, pretend = 0, frame = 8
 635              		@ frame_needed = 1, uses_anonymous_args = 0
 636 0310 80B5     		push	{r7, lr}
 637              		.cfi_def_cfa_offset 8
 638              		.cfi_offset 7, -8
 639              		.cfi_offset 14, -4
 640 0312 82B0     		sub	sp, sp, #8
 641              		.cfi_def_cfa_offset 16
 642 0314 00AF     		add	r7, sp, #0
 643              		.cfi_def_cfa_register 7
 644 0316 0200     		movs	r2, r0
 645 0318 FB1D     		adds	r3, r7, #7
 646 031a 1A70     		strb	r2, [r3]
 120:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	(void) graphic_read(controller);
 647              		.loc 1 120 0
 648 031c FB1D     		adds	r3, r7, #7
 649 031e 1B78     		ldrb	r3, [r3]
 650 0320 1800     		movs	r0, r3
 651 0322 FFF7FEFF 		bl	graphic_read
 121:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	return graphic_read (controller);
 652              		.loc 1 121 0
 653 0326 FB1D     		adds	r3, r7, #7
 654 0328 1B78     		ldrb	r3, [r3]
 655 032a 1800     		movs	r0, r3
 656 032c FFF7FEFF 		bl	graphic_read
 657 0330 0300     		movs	r3, r0
 122:/Users/Simon/Downloads/mop shit/autopong/display.c **** }
 658              		.loc 1 122 0
 659 0332 1800     		movs	r0, r3
 660 0334 BD46     		mov	sp, r7
 661 0336 02B0     		add	sp, sp, #8
 662              		@ sp needed
 663 0338 80BD     		pop	{r7, pc}
 664              		.cfi_endproc
 665              	.LFE8:
 667 033a C046     		.align	2
 668              		.global	graphic_initialize
 669              		.code	16
 670              		.thumb_func
 672              	graphic_initialize:
 673              	.LFB9:
 123:/Users/Simon/Downloads/mop shit/autopong/display.c **** 
 124:/Users/Simon/Downloads/mop shit/autopong/display.c **** void graphic_initialize(){
 674              		.loc 1 124 0
 675              		.cfi_startproc
 676              		@ args = 0, pretend = 0, frame = 0
 677              		@ frame_needed = 1, uses_anonymous_args = 0
 678 033c 80B5     		push	{r7, lr}
 679              		.cfi_def_cfa_offset 8
 680              		.cfi_offset 7, -8
 681              		.cfi_offset 14, -4
 682 033e 00AF     		add	r7, sp, #0
 683              		.cfi_def_cfa_register 7
 125:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_set(B_E);
 684              		.loc 1 125 0
 685 0340 4020     		movs	r0, #64
 686 0342 FFF7FEFF 		bl	graphic_ctrl_bit_set
 126:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	delay_micro(10);
 687              		.loc 1 126 0
 688 0346 0A20     		movs	r0, #10
 689 0348 FFF7FEFF 		bl	delay_micro
 127:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_clear(B_CS1|B_CS2|B_RST|B_E);
 690              		.loc 1 127 0
 691 034c 7820     		movs	r0, #120
 692 034e FFF7FEFF 		bl	graphic_ctrl_bit_clear
 128:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	delay_milli(30);
 693              		.loc 1 128 0
 694 0352 1E20     		movs	r0, #30
 695 0354 FFF7FEFF 		bl	delay_milli
 129:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_ctrl_bit_set(B_RST);
 696              		.loc 1 129 0
 697 0358 2020     		movs	r0, #32
 698 035a FFF7FEFF 		bl	graphic_ctrl_bit_set
 130:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	delay_milli(100);
 699              		.loc 1 130 0
 700 035e 6420     		movs	r0, #100
 701 0360 FFF7FEFF 		bl	delay_milli
 131:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_write_command(LCD_OFF, 			B_CS1|B_CS2);
 702              		.loc 1 131 0
 703 0364 1821     		movs	r1, #24
 704 0366 3E20     		movs	r0, #62
 705 0368 FFF7FEFF 		bl	graphic_write_command
 132:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_write_command(LCD_ON, 			B_CS1|B_CS2);			//toggla display
 706              		.loc 1 132 0
 707 036c 1821     		movs	r1, #24
 708 036e 3F20     		movs	r0, #63
 709 0370 FFF7FEFF 		bl	graphic_write_command
 133:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_write_command(LCD_DISP_START, 	B_CS1|B_CS2);	//start = 0
 710              		.loc 1 133 0
 711 0374 1821     		movs	r1, #24
 712 0376 C020     		movs	r0, #192
 713 0378 FFF7FEFF 		bl	graphic_write_command
 134:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_write_command(LCD_SET_ADD, 		B_CS1|B_CS2);	//add = 0
 714              		.loc 1 134 0
 715 037c 1821     		movs	r1, #24
 716 037e 4020     		movs	r0, #64
 717 0380 FFF7FEFF 		bl	graphic_write_command
 135:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_write_command(LCD_SET_PAGE, 	B_CS1|B_CS2);	//page = 0		
 718              		.loc 1 135 0
 719 0384 1821     		movs	r1, #24
 720 0386 B820     		movs	r0, #184
 721 0388 FFF7FEFF 		bl	graphic_write_command
 136:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	select_controller(0); 								//deaktivera både CS-signalerna
 722              		.loc 1 136 0
 723 038c 0020     		movs	r0, #0
 724 038e FFF7FEFF 		bl	select_controller
 137:/Users/Simon/Downloads/mop shit/autopong/display.c **** }
 725              		.loc 1 137 0
 726 0392 C046     		nop
 727 0394 BD46     		mov	sp, r7
 728              		@ sp needed
 729 0396 80BD     		pop	{r7, pc}
 730              		.cfi_endproc
 731              	.LFE9:
 733              		.align	2
 734              		.global	graphic_clear_screen
 735              		.code	16
 736              		.thumb_func
 738              	graphic_clear_screen:
 739              	.LFB10:
 138:/Users/Simon/Downloads/mop shit/autopong/display.c **** 
 139:/Users/Simon/Downloads/mop shit/autopong/display.c **** void graphic_clear_screen(){
 740              		.loc 1 139 0
 741              		.cfi_startproc
 742              		@ args = 0, pretend = 0, frame = 8
 743              		@ frame_needed = 1, uses_anonymous_args = 0
 744 0398 80B5     		push	{r7, lr}
 745              		.cfi_def_cfa_offset 8
 746              		.cfi_offset 7, -8
 747              		.cfi_offset 14, -4
 748 039a 82B0     		sub	sp, sp, #8
 749              		.cfi_def_cfa_offset 16
 750 039c 00AF     		add	r7, sp, #0
 751              		.cfi_def_cfa_register 7
 140:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	uint8_t i, j;
 141:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	for(j = 0; j < 8; j++){
 752              		.loc 1 141 0
 753 039e BB1D     		adds	r3, r7, #6
 754 03a0 0022     		movs	r2, #0
 755 03a2 1A70     		strb	r2, [r3]
 756 03a4 23E0     		b	.L40
 757              	.L43:
 142:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 758              		.loc 1 142 0
 759 03a6 BB1D     		adds	r3, r7, #6
 760 03a8 1B78     		ldrb	r3, [r3]
 761 03aa 4822     		movs	r2, #72
 762 03ac 5242     		rsbs	r2, r2, #0
 763 03ae 1343     		orrs	r3, r2
 764 03b0 DBB2     		uxtb	r3, r3
 765 03b2 1821     		movs	r1, #24
 766 03b4 1800     		movs	r0, r3
 767 03b6 FFF7FEFF 		bl	graphic_write_command
 143:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
 768              		.loc 1 143 0
 769 03ba 1821     		movs	r1, #24
 770 03bc 4020     		movs	r0, #64
 771 03be FFF7FEFF 		bl	graphic_write_command
 144:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		for(i = 0; i <= 63; i++){
 772              		.loc 1 144 0
 773 03c2 FB1D     		adds	r3, r7, #7
 774 03c4 0022     		movs	r2, #0
 775 03c6 1A70     		strb	r2, [r3]
 776 03c8 08E0     		b	.L41
 777              	.L42:
 145:/Users/Simon/Downloads/mop shit/autopong/display.c **** 			graphic_write_data(0, B_CS1|B_CS2);
 778              		.loc 1 145 0 discriminator 3
 779 03ca 1821     		movs	r1, #24
 780 03cc 0020     		movs	r0, #0
 781 03ce FFF7FEFF 		bl	graphic_write_data
 144:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		for(i = 0; i <= 63; i++){
 782              		.loc 1 144 0 discriminator 3
 783 03d2 FB1D     		adds	r3, r7, #7
 784 03d4 1A78     		ldrb	r2, [r3]
 785 03d6 FB1D     		adds	r3, r7, #7
 786 03d8 0132     		adds	r2, r2, #1
 787 03da 1A70     		strb	r2, [r3]
 788              	.L41:
 144:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		for(i = 0; i <= 63; i++){
 789              		.loc 1 144 0 is_stmt 0 discriminator 1
 790 03dc FB1D     		adds	r3, r7, #7
 791 03de 1B78     		ldrb	r3, [r3]
 792 03e0 3F2B     		cmp	r3, #63
 793 03e2 F2D9     		bls	.L42
 141:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 794              		.loc 1 141 0 is_stmt 1 discriminator 2
 795 03e4 BB1D     		adds	r3, r7, #6
 796 03e6 1A78     		ldrb	r2, [r3]
 797 03e8 BB1D     		adds	r3, r7, #6
 798 03ea 0132     		adds	r2, r2, #1
 799 03ec 1A70     		strb	r2, [r3]
 800              	.L40:
 141:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		graphic_write_command(LCD_SET_PAGE | j, B_CS1|B_CS2);
 801              		.loc 1 141 0 is_stmt 0 discriminator 1
 802 03ee BB1D     		adds	r3, r7, #6
 803 03f0 1B78     		ldrb	r3, [r3]
 804 03f2 072B     		cmp	r3, #7
 805 03f4 D7D9     		bls	.L43
 146:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		}
 147:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	}
 148:/Users/Simon/Downloads/mop shit/autopong/display.c **** }
 806              		.loc 1 148 0 is_stmt 1
 807 03f6 C046     		nop
 808 03f8 BD46     		mov	sp, r7
 809 03fa 02B0     		add	sp, sp, #8
 810              		@ sp needed
 811 03fc 80BD     		pop	{r7, pc}
 812              		.cfi_endproc
 813              	.LFE10:
 815 03fe C046     		.align	2
 816              		.global	pixel
 817              		.code	16
 818              		.thumb_func
 820              	pixel:
 821              	.LFB11:
 149:/Users/Simon/Downloads/mop shit/autopong/display.c **** 
 150:/Users/Simon/Downloads/mop shit/autopong/display.c **** void pixel(uint32_t x, uint32_t y, uint8_t set){
 822              		.loc 1 150 0
 823              		.cfi_startproc
 824              		@ args = 0, pretend = 0, frame = 32
 825              		@ frame_needed = 1, uses_anonymous_args = 0
 826 0400 90B5     		push	{r4, r7, lr}
 827              		.cfi_def_cfa_offset 12
 828              		.cfi_offset 4, -12
 829              		.cfi_offset 7, -8
 830              		.cfi_offset 14, -4
 831 0402 89B0     		sub	sp, sp, #36
 832              		.cfi_def_cfa_offset 48
 833 0404 00AF     		add	r7, sp, #0
 834              		.cfi_def_cfa_register 7
 835 0406 F860     		str	r0, [r7, #12]
 836 0408 B960     		str	r1, [r7, #8]
 837 040a FB1D     		adds	r3, r7, #7
 838 040c 1A70     		strb	r2, [r3]
 151:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	uint8_t mask, c, controller;
 152:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	int index;
 153:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	if((x < 1) || (y < 1) || (x > 128) || (y > 64)) return;
 839              		.loc 1 153 0
 840 040e FB68     		ldr	r3, [r7, #12]
 841 0410 002B     		cmp	r3, #0
 842 0412 00D1     		bne	.LCB689
 843 0414 B3E0     		b	.L63	@long jump
 844              	.LCB689:
 845              		.loc 1 153 0 is_stmt 0 discriminator 1
 846 0416 BB68     		ldr	r3, [r7, #8]
 847 0418 002B     		cmp	r3, #0
 848 041a 00D1     		bne	.LCB692
 849 041c AFE0     		b	.L63	@long jump
 850              	.LCB692:
 851              		.loc 1 153 0 discriminator 2
 852 041e FB68     		ldr	r3, [r7, #12]
 853 0420 802B     		cmp	r3, #128
 854 0422 00D9     		bls	.LCB695
 855 0424 ABE0     		b	.L63	@long jump
 856              	.LCB695:
 857              		.loc 1 153 0 discriminator 3
 858 0426 BB68     		ldr	r3, [r7, #8]
 859 0428 402B     		cmp	r3, #64
 860 042a 00D9     		bls	.LCB698
 861 042c A7E0     		b	.L63	@long jump
 862              	.LCB698:
 154:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	
 155:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	index = (y-1)/8;
 863              		.loc 1 155 0 is_stmt 1
 864 042e BB68     		ldr	r3, [r7, #8]
 865 0430 013B     		subs	r3, r3, #1
 866 0432 DB08     		lsrs	r3, r3, #3
 867 0434 BB61     		str	r3, [r7, #24]
 156:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	
 157:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	switch((y-1)%8){
 868              		.loc 1 157 0
 869 0436 BB68     		ldr	r3, [r7, #8]
 870 0438 013B     		subs	r3, r3, #1
 871 043a 0722     		movs	r2, #7
 872 043c 1340     		ands	r3, r2
 873 043e 072B     		cmp	r3, #7
 874 0440 2CD8     		bhi	.L48
 875 0442 9A00     		lsls	r2, r3, #2
 876 0444 504B     		ldr	r3, .L64
 877 0446 D318     		adds	r3, r2, r3
 878 0448 1B68     		ldr	r3, [r3]
 879 044a 9F46     		mov	pc, r3
 880              		.section	.rodata
 881              		.align	2
 882              	.L50:
 883 0000 4C040000 		.word	.L49
 884 0004 56040000 		.word	.L51
 885 0008 60040000 		.word	.L52
 886 000c 6A040000 		.word	.L53
 887 0010 74040000 		.word	.L54
 888 0014 7E040000 		.word	.L55
 889 0018 88040000 		.word	.L56
 890 001c 92040000 		.word	.L57
 891              		.text
 892              	.L49:
 158:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		case 0: mask = 1; break;
 893              		.loc 1 158 0
 894 044c 1F23     		movs	r3, #31
 895 044e FB18     		adds	r3, r7, r3
 896 0450 0122     		movs	r2, #1
 897 0452 1A70     		strb	r2, [r3]
 898 0454 22E0     		b	.L48
 899              	.L51:
 159:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		case 1: mask = 2; break;
 900              		.loc 1 159 0
 901 0456 1F23     		movs	r3, #31
 902 0458 FB18     		adds	r3, r7, r3
 903 045a 0222     		movs	r2, #2
 904 045c 1A70     		strb	r2, [r3]
 905 045e 1DE0     		b	.L48
 906              	.L52:
 160:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		case 2: mask = 4; break;
 907              		.loc 1 160 0
 908 0460 1F23     		movs	r3, #31
 909 0462 FB18     		adds	r3, r7, r3
 910 0464 0422     		movs	r2, #4
 911 0466 1A70     		strb	r2, [r3]
 912 0468 18E0     		b	.L48
 913              	.L53:
 161:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		case 3: mask = 8; break;
 914              		.loc 1 161 0
 915 046a 1F23     		movs	r3, #31
 916 046c FB18     		adds	r3, r7, r3
 917 046e 0822     		movs	r2, #8
 918 0470 1A70     		strb	r2, [r3]
 919 0472 13E0     		b	.L48
 920              	.L54:
 162:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		case 4: mask = 0x10; break;
 921              		.loc 1 162 0
 922 0474 1F23     		movs	r3, #31
 923 0476 FB18     		adds	r3, r7, r3
 924 0478 1022     		movs	r2, #16
 925 047a 1A70     		strb	r2, [r3]
 926 047c 0EE0     		b	.L48
 927              	.L55:
 163:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		case 5: mask = 0x20; break;
 928              		.loc 1 163 0
 929 047e 1F23     		movs	r3, #31
 930 0480 FB18     		adds	r3, r7, r3
 931 0482 2022     		movs	r2, #32
 932 0484 1A70     		strb	r2, [r3]
 933 0486 09E0     		b	.L48
 934              	.L56:
 164:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		case 6: mask = 0x40; break;
 935              		.loc 1 164 0
 936 0488 1F23     		movs	r3, #31
 937 048a FB18     		adds	r3, r7, r3
 938 048c 4022     		movs	r2, #64
 939 048e 1A70     		strb	r2, [r3]
 940 0490 04E0     		b	.L48
 941              	.L57:
 165:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		case 7: mask = 0x80; break;
 942              		.loc 1 165 0
 943 0492 1F23     		movs	r3, #31
 944 0494 FB18     		adds	r3, r7, r3
 945 0496 8022     		movs	r2, #128
 946 0498 1A70     		strb	r2, [r3]
 947 049a C046     		nop
 948              	.L48:
 166:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	}
 167:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	if(set == 0){
 949              		.loc 1 167 0
 950 049c FB1D     		adds	r3, r7, #7
 951 049e 1B78     		ldrb	r3, [r3]
 952 04a0 002B     		cmp	r3, #0
 953 04a2 06D1     		bne	.L58
 168:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		mask = ~mask;
 954              		.loc 1 168 0
 955 04a4 1F23     		movs	r3, #31
 956 04a6 FB18     		adds	r3, r7, r3
 957 04a8 1F22     		movs	r2, #31
 958 04aa BA18     		adds	r2, r7, r2
 959 04ac 1278     		ldrb	r2, [r2]
 960 04ae D243     		mvns	r2, r2
 961 04b0 1A70     		strb	r2, [r3]
 962              	.L58:
 169:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	}
 170:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	if(x > 64){
 963              		.loc 1 170 0
 964 04b2 FB68     		ldr	r3, [r7, #12]
 965 04b4 402B     		cmp	r3, #64
 966 04b6 07D9     		bls	.L59
 171:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		controller = B_CS2;
 967              		.loc 1 171 0
 968 04b8 1E23     		movs	r3, #30
 969 04ba FB18     		adds	r3, r7, r3
 970 04bc 1022     		movs	r2, #16
 971 04be 1A70     		strb	r2, [r3]
 172:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		x = x-65;
 972              		.loc 1 172 0
 973 04c0 FB68     		ldr	r3, [r7, #12]
 974 04c2 413B     		subs	r3, r3, #65
 975 04c4 FB60     		str	r3, [r7, #12]
 976 04c6 06E0     		b	.L60
 977              	.L59:
 173:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	}
 174:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	else{
 175:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		controller = B_CS1;
 978              		.loc 1 175 0
 979 04c8 1E23     		movs	r3, #30
 980 04ca FB18     		adds	r3, r7, r3
 981 04cc 0822     		movs	r2, #8
 982 04ce 1A70     		strb	r2, [r3]
 176:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		x = x-1;
 983              		.loc 1 176 0
 984 04d0 FB68     		ldr	r3, [r7, #12]
 985 04d2 013B     		subs	r3, r3, #1
 986 04d4 FB60     		str	r3, [r7, #12]
 987              	.L60:
 177:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	}
 178:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_write_command(LCD_SET_ADD 	| x, 		controller);
 988              		.loc 1 178 0
 989 04d6 FB68     		ldr	r3, [r7, #12]
 990 04d8 DBB2     		uxtb	r3, r3
 991 04da 4022     		movs	r2, #64
 992 04dc 1343     		orrs	r3, r2
 993 04de DAB2     		uxtb	r2, r3
 994 04e0 1E23     		movs	r3, #30
 995 04e2 FB18     		adds	r3, r7, r3
 996 04e4 1B78     		ldrb	r3, [r3]
 997 04e6 1900     		movs	r1, r3
 998 04e8 1000     		movs	r0, r2
 999 04ea FFF7FEFF 		bl	graphic_write_command
 179:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_write_command(LCD_SET_PAGE 	| index, 	controller);
 1000              		.loc 1 179 0
 1001 04ee BB69     		ldr	r3, [r7, #24]
 1002 04f0 5BB2     		sxtb	r3, r3
 1003 04f2 4822     		movs	r2, #72
 1004 04f4 5242     		rsbs	r2, r2, #0
 1005 04f6 1343     		orrs	r3, r2
 1006 04f8 5BB2     		sxtb	r3, r3
 1007 04fa DAB2     		uxtb	r2, r3
 1008 04fc 1E23     		movs	r3, #30
 1009 04fe FB18     		adds	r3, r7, r3
 1010 0500 1B78     		ldrb	r3, [r3]
 1011 0502 1900     		movs	r1, r3
 1012 0504 1000     		movs	r0, r2
 1013 0506 FFF7FEFF 		bl	graphic_write_command
 180:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	c = graphic_read_data(controller);
 1014              		.loc 1 180 0
 1015 050a 1723     		movs	r3, #23
 1016 050c FC18     		adds	r4, r7, r3
 1017 050e 1E23     		movs	r3, #30
 1018 0510 FB18     		adds	r3, r7, r3
 1019 0512 1B78     		ldrb	r3, [r3]
 1020 0514 1800     		movs	r0, r3
 1021 0516 FFF7FEFF 		bl	graphic_read_data
 1022 051a 0300     		movs	r3, r0
 1023 051c 2370     		strb	r3, [r4]
 181:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_write_command(LCD_SET_ADD 	| x, 		controller);
 1024              		.loc 1 181 0
 1025 051e FB68     		ldr	r3, [r7, #12]
 1026 0520 DBB2     		uxtb	r3, r3
 1027 0522 4022     		movs	r2, #64
 1028 0524 1343     		orrs	r3, r2
 1029 0526 DAB2     		uxtb	r2, r3
 1030 0528 1E23     		movs	r3, #30
 1031 052a FB18     		adds	r3, r7, r3
 1032 052c 1B78     		ldrb	r3, [r3]
 1033 052e 1900     		movs	r1, r3
 1034 0530 1000     		movs	r0, r2
 1035 0532 FFF7FEFF 		bl	graphic_write_command
 182:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	
 183:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	if(set){
 1036              		.loc 1 183 0
 1037 0536 FB1D     		adds	r3, r7, #7
 1038 0538 1B78     		ldrb	r3, [r3]
 1039 053a 002B     		cmp	r3, #0
 1040 053c 0AD0     		beq	.L61
 184:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		mask = mask | c;
 1041              		.loc 1 184 0
 1042 053e 1F23     		movs	r3, #31
 1043 0540 FB18     		adds	r3, r7, r3
 1044 0542 1F22     		movs	r2, #31
 1045 0544 B918     		adds	r1, r7, r2
 1046 0546 1722     		movs	r2, #23
 1047 0548 BA18     		adds	r2, r7, r2
 1048 054a 0978     		ldrb	r1, [r1]
 1049 054c 1278     		ldrb	r2, [r2]
 1050 054e 0A43     		orrs	r2, r1
 1051 0550 1A70     		strb	r2, [r3]
 1052 0552 09E0     		b	.L62
 1053              	.L61:
 185:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	}
 186:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	else{
 187:/Users/Simon/Downloads/mop shit/autopong/display.c **** 		mask = mask & c;
 1054              		.loc 1 187 0
 1055 0554 1F23     		movs	r3, #31
 1056 0556 FB18     		adds	r3, r7, r3
 1057 0558 1F22     		movs	r2, #31
 1058 055a BA18     		adds	r2, r7, r2
 1059 055c 1721     		movs	r1, #23
 1060 055e 7918     		adds	r1, r7, r1
 1061 0560 1278     		ldrb	r2, [r2]
 1062 0562 0978     		ldrb	r1, [r1]
 1063 0564 0A40     		ands	r2, r1
 1064 0566 1A70     		strb	r2, [r3]
 1065              	.L62:
 188:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	}
 189:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	graphic_write_data(mask, controller);
 1066              		.loc 1 189 0
 1067 0568 1E23     		movs	r3, #30
 1068 056a FB18     		adds	r3, r7, r3
 1069 056c 1A78     		ldrb	r2, [r3]
 1070 056e 1F23     		movs	r3, #31
 1071 0570 FB18     		adds	r3, r7, r3
 1072 0572 1B78     		ldrb	r3, [r3]
 1073 0574 1100     		movs	r1, r2
 1074 0576 1800     		movs	r0, r3
 1075 0578 FFF7FEFF 		bl	graphic_write_data
 1076 057c 00E0     		b	.L44
 1077              	.L63:
 153:/Users/Simon/Downloads/mop shit/autopong/display.c **** 	
 1078              		.loc 1 153 0
 1079 057e C046     		nop
 1080              	.L44:
 190:/Users/Simon/Downloads/mop shit/autopong/display.c **** }...
 1081              		.loc 1 190 0
 1082 0580 BD46     		mov	sp, r7
 1083 0582 09B0     		add	sp, sp, #36
 1084              		@ sp needed
 1085 0584 90BD     		pop	{r4, r7, pc}
 1086              	.L65:
 1087 0586 C046     		.align	2
 1088              	.L64:
 1089 0588 00000000 		.word	.L50
 1090              		.cfi_endproc
 1091              	.LFE11:
 1093              	.Letext0:
 1094              		.file 2 "/Users/Simon/Downloads/mop shit/autopong/gpio.h"
