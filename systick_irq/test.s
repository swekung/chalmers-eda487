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
  15              		.file	"object.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.align	2
  20              		.global	set_object_speed
  21              		.code	16
  22              		.thumb_func
  24              	set_object_speed:
  25              	.LFB0:
  26              		.file 1 "/Users/Simon/chalmers-eda487/libraries/object.c"
   1:/Users/Simon/chalmers-eda487/libraries/object.c **** #include "gpio.h"
   2:/Users/Simon/chalmers-eda487/libraries/object.c **** #include "object.h"
   3:/Users/Simon/chalmers-eda487/libraries/object.c **** 
   4:/Users/Simon/chalmers-eda487/libraries/object.c **** /*
   5:/Users/Simon/chalmers-eda487/libraries/object.c **** typedef struct tPoint
   6:/Users/Simon/chalmers-eda487/libraries/object.c **** {
   7:/Users/Simon/chalmers-eda487/libraries/object.c **** 	uint8_t x;
   8:/Users/Simon/chalmers-eda487/libraries/object.c **** 	uint8_t y;
   9:/Users/Simon/chalmers-eda487/libraries/object.c **** } POINT;
  10:/Users/Simon/chalmers-eda487/libraries/object.c **** 
  11:/Users/Simon/chalmers-eda487/libraries/object.c **** typedef struct tGeometry
  12:/Users/Simon/chalmers-eda487/libraries/object.c **** {
  13:/Users/Simon/chalmers-eda487/libraries/object.c **** 	uint32_t numpoints;	
  14:/Users/Simon/chalmers-eda487/libraries/object.c **** 	uint32_t sizex;
  15:/Users/Simon/chalmers-eda487/libraries/object.c **** 	uint32_t sizey;
  16:/Users/Simon/chalmers-eda487/libraries/object.c **** 	POINT px[MAX_POINTS];
  17:/Users/Simon/chalmers-eda487/libraries/object.c **** } GEOMETRY, *PGEOMETRY;
  18:/Users/Simon/chalmers-eda487/libraries/object.c **** 
  19:/Users/Simon/chalmers-eda487/libraries/object.c **** typedef struct tObject
  20:/Users/Simon/chalmers-eda487/libraries/object.c **** {
  21:/Users/Simon/chalmers-eda487/libraries/object.c **** 	PGEOMETRY geo;
  22:/Users/Simon/chalmers-eda487/libraries/object.c **** 	sint32_t dirx,diry;
  23:/Users/Simon/chalmers-eda487/libraries/object.c **** 	uint32_t posx,posy;
  24:/Users/Simon/chalmers-eda487/libraries/object.c **** 	void (* draw) (struct tObj *);
  25:/Users/Simon/chalmers-eda487/libraries/object.c **** 	void (* clear) (struct tObj *);
  26:/Users/Simon/chalmers-eda487/libraries/object.c **** 	void (* move) (struct tObj *);
  27:/Users/Simon/chalmers-eda487/libraries/object.c **** 	void (* set_speed) (struct tObj *, sint32_t, sint32_t);
  28:/Users/Simon/chalmers-eda487/libraries/object.c **** } OBJECT, *POBJECT;
  29:/Users/Simon/chalmers-eda487/libraries/object.c **** */
  30:/Users/Simon/chalmers-eda487/libraries/object.c **** 
  31:/Users/Simon/chalmers-eda487/libraries/object.c **** void set_object_speed(POBJECT o, sint32_t speedx, sint32_t speedy){
  27              		.loc 1 31 0
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
  39 0006 F860     		str	r0, [r7, #12]
  40 0008 B960     		str	r1, [r7, #8]
  41 000a 7A60     		str	r2, [r7, #4]
  32:/Users/Simon/chalmers-eda487/libraries/object.c **** 	o->dirx = speedx;
  42              		.loc 1 32 0
  43 000c BA68     		ldr	r2, [r7, #8]
  44 000e FB68     		ldr	r3, [r7, #12]
  45 0010 5A60     		str	r2, [r3, #4]
  33:/Users/Simon/chalmers-eda487/libraries/object.c **** 	o->diry = speedy;
  46              		.loc 1 33 0
  47 0012 7A68     		ldr	r2, [r7, #4]
  48 0014 FB68     		ldr	r3, [r7, #12]
  49 0016 9A60     		str	r2, [r3, #8]
  34:/Users/Simon/chalmers-eda487/libraries/object.c **** }
  50              		.loc 1 34 0
  51 0018 C046     		nop
  52 001a BD46     		mov	sp, r7
  53 001c 04B0     		add	sp, sp, #16
  54              		@ sp needed
  55 001e 80BD     		pop	{r7, pc}
  56              		.cfi_endproc
  57              	.LFE0:
  59              		.align	2
  60              		.global	draw_object
  61              		.code	16
  62              		.thumb_func
  64              	draw_object:
  65              	.LFB1:
  35:/Users/Simon/chalmers-eda487/libraries/object.c **** 
  36:/Users/Simon/chalmers-eda487/libraries/object.c **** void draw_object(POBJECT o){
  66              		.loc 1 36 0
  67              		.cfi_startproc
  68              		@ args = 0, pretend = 0, frame = 16
  69              		@ frame_needed = 1, uses_anonymous_args = 0
  70 0020 80B5     		push	{r7, lr}
  71              		.cfi_def_cfa_offset 8
  72              		.cfi_offset 7, -8
  73              		.cfi_offset 14, -4
  74 0022 84B0     		sub	sp, sp, #16
  75              		.cfi_def_cfa_offset 24
  76 0024 00AF     		add	r7, sp, #0
  77              		.cfi_def_cfa_register 7
  78 0026 7860     		str	r0, [r7, #4]
  79              	.LBB2:
  37:/Users/Simon/chalmers-eda487/libraries/object.c **** 	for(uint32_t i = 0; i < o->geo->numpoints; i++){
  80              		.loc 1 37 0
  81 0028 0023     		movs	r3, #0
  82 002a FB60     		str	r3, [r7, #12]
  83 002c 1EE0     		b	.L3
  84              	.L4:
  85              	.LBB3:
  38:/Users/Simon/chalmers-eda487/libraries/object.c **** 		POINT px = o->geo->px[i];
  86              		.loc 1 38 0 discriminator 3
  87 002e 7B68     		ldr	r3, [r7, #4]
  88 0030 1968     		ldr	r1, [r3]
  89 0032 0823     		movs	r3, #8
  90 0034 FB18     		adds	r3, r7, r3
  91 0036 FA68     		ldr	r2, [r7, #12]
  92 0038 0432     		adds	r2, r2, #4
  93 003a 0420     		movs	r0, #4
  94 003c 5200     		lsls	r2, r2, #1
  95 003e 8A18     		adds	r2, r1, r2
  96 0040 1218     		adds	r2, r2, r0
  97 0042 1288     		ldrh	r2, [r2]
  98 0044 1A80     		strh	r2, [r3]
  39:/Users/Simon/chalmers-eda487/libraries/object.c **** 		pixel(o->posx + px.x, o->posy + px.y,1);
  99              		.loc 1 39 0 discriminator 3
 100 0046 7B68     		ldr	r3, [r7, #4]
 101 0048 DB68     		ldr	r3, [r3, #12]
 102 004a 0822     		movs	r2, #8
 103 004c BA18     		adds	r2, r7, r2
 104 004e 1278     		ldrb	r2, [r2]
 105 0050 9818     		adds	r0, r3, r2
 106 0052 7B68     		ldr	r3, [r7, #4]
 107 0054 1B69     		ldr	r3, [r3, #16]
 108 0056 0822     		movs	r2, #8
 109 0058 BA18     		adds	r2, r7, r2
 110 005a 5278     		ldrb	r2, [r2, #1]
 111 005c 9B18     		adds	r3, r3, r2
 112 005e 0122     		movs	r2, #1
 113 0060 1900     		movs	r1, r3
 114 0062 FFF7FEFF 		bl	pixel
 115              	.LBE3:
  37:/Users/Simon/chalmers-eda487/libraries/object.c **** 	for(uint32_t i = 0; i < o->geo->numpoints; i++){
 116              		.loc 1 37 0 discriminator 3
 117 0066 FB68     		ldr	r3, [r7, #12]
 118 0068 0133     		adds	r3, r3, #1
 119 006a FB60     		str	r3, [r7, #12]
 120              	.L3:
  37:/Users/Simon/chalmers-eda487/libraries/object.c **** 	for(uint32_t i = 0; i < o->geo->numpoints; i++){
 121              		.loc 1 37 0 is_stmt 0 discriminator 1
 122 006c 7B68     		ldr	r3, [r7, #4]
 123 006e 1B68     		ldr	r3, [r3]
 124 0070 1A68     		ldr	r2, [r3]
 125 0072 FB68     		ldr	r3, [r7, #12]
 126 0074 9A42     		cmp	r2, r3
 127 0076 DAD8     		bhi	.L4
 128              	.LBE2:
  40:/Users/Simon/chalmers-eda487/libraries/object.c **** 	}
  41:/Users/Simon/chalmers-eda487/libraries/object.c **** }
 129              		.loc 1 41 0 is_stmt 1
 130 0078 C046     		nop
 131 007a BD46     		mov	sp, r7
 132 007c 04B0     		add	sp, sp, #16
 133              		@ sp needed
 134 007e 80BD     		pop	{r7, pc}
 135              		.cfi_endproc
 136              	.LFE1:
 138              		.align	2
 139              		.global	clear_object
 140              		.code	16
 141              		.thumb_func
 143              	clear_object:
 144              	.LFB2:
  42:/Users/Simon/chalmers-eda487/libraries/object.c **** 
  43:/Users/Simon/chalmers-eda487/libraries/object.c **** void clear_object(POBJECT o){
 145              		.loc 1 43 0
 146              		.cfi_startproc
 147              		@ args = 0, pretend = 0, frame = 16
 148              		@ frame_needed = 1, uses_anonymous_args = 0
 149 0080 80B5     		push	{r7, lr}
 150              		.cfi_def_cfa_offset 8
 151              		.cfi_offset 7, -8
 152              		.cfi_offset 14, -4
 153 0082 84B0     		sub	sp, sp, #16
 154              		.cfi_def_cfa_offset 24
 155 0084 00AF     		add	r7, sp, #0
 156              		.cfi_def_cfa_register 7
 157 0086 7860     		str	r0, [r7, #4]
 158              	.LBB4:
  44:/Users/Simon/chalmers-eda487/libraries/object.c **** 	for(uint32_t i = 0; i < o->geo->numpoints; i++){
 159              		.loc 1 44 0
 160 0088 0023     		movs	r3, #0
 161 008a FB60     		str	r3, [r7, #12]
 162 008c 1EE0     		b	.L6
 163              	.L7:
 164              	.LBB5:
  45:/Users/Simon/chalmers-eda487/libraries/object.c **** 		POINT px = o->geo->px[i];
 165              		.loc 1 45 0 discriminator 3
 166 008e 7B68     		ldr	r3, [r7, #4]
 167 0090 1968     		ldr	r1, [r3]
 168 0092 0823     		movs	r3, #8
 169 0094 FB18     		adds	r3, r7, r3
 170 0096 FA68     		ldr	r2, [r7, #12]
 171 0098 0432     		adds	r2, r2, #4
 172 009a 0420     		movs	r0, #4
 173 009c 5200     		lsls	r2, r2, #1
 174 009e 8A18     		adds	r2, r1, r2
 175 00a0 1218     		adds	r2, r2, r0
 176 00a2 1288     		ldrh	r2, [r2]
 177 00a4 1A80     		strh	r2, [r3]
  46:/Users/Simon/chalmers-eda487/libraries/object.c **** 		pixel(o->posx + px.x, o->posy + px.y,0);
 178              		.loc 1 46 0 discriminator 3
 179 00a6 7B68     		ldr	r3, [r7, #4]
 180 00a8 DB68     		ldr	r3, [r3, #12]
 181 00aa 0822     		movs	r2, #8
 182 00ac BA18     		adds	r2, r7, r2
 183 00ae 1278     		ldrb	r2, [r2]
 184 00b0 9818     		adds	r0, r3, r2
 185 00b2 7B68     		ldr	r3, [r7, #4]
 186 00b4 1B69     		ldr	r3, [r3, #16]
 187 00b6 0822     		movs	r2, #8
 188 00b8 BA18     		adds	r2, r7, r2
 189 00ba 5278     		ldrb	r2, [r2, #1]
 190 00bc 9B18     		adds	r3, r3, r2
 191 00be 0022     		movs	r2, #0
 192 00c0 1900     		movs	r1, r3
 193 00c2 FFF7FEFF 		bl	pixel
 194              	.LBE5:
  44:/Users/Simon/chalmers-eda487/libraries/object.c **** 	for(uint32_t i = 0; i < o->geo->numpoints; i++){
 195              		.loc 1 44 0 discriminator 3
 196 00c6 FB68     		ldr	r3, [r7, #12]
 197 00c8 0133     		adds	r3, r3, #1
 198 00ca FB60     		str	r3, [r7, #12]
 199              	.L6:
  44:/Users/Simon/chalmers-eda487/libraries/object.c **** 	for(uint32_t i = 0; i < o->geo->numpoints; i++){
 200              		.loc 1 44 0 is_stmt 0 discriminator 1
 201 00cc 7B68     		ldr	r3, [r7, #4]
 202 00ce 1B68     		ldr	r3, [r3]
 203 00d0 1A68     		ldr	r2, [r3]
 204 00d2 FB68     		ldr	r3, [r7, #12]
 205 00d4 9A42     		cmp	r2, r3
 206 00d6 DAD8     		bhi	.L7
 207              	.LBE4:
  47:/Users/Simon/chalmers-eda487/libraries/object.c **** 	}
  48:/Users/Simon/chalmers-eda487/libraries/object.c **** }
 208              		.loc 1 48 0 is_stmt 1
 209 00d8 C046     		nop
 210 00da BD46     		mov	sp, r7
 211 00dc 04B0     		add	sp, sp, #16
 212              		@ sp needed
 213 00de 80BD     		pop	{r7, pc}
 214              		.cfi_endproc
 215              	.LFE2:
 217              		.align	2
 218              		.global	move_object
 219              		.code	16
 220              		.thumb_func
 222              	move_object:
 223              	.LFB3:
  49:/Users/Simon/chalmers-eda487/libraries/object.c **** 
  50:/Users/Simon/chalmers-eda487/libraries/object.c **** void move_object(POBJECT o){
 224              		.loc 1 50 0
 225              		.cfi_startproc
 226              		@ args = 0, pretend = 0, frame = 8
 227              		@ frame_needed = 1, uses_anonymous_args = 0
 228 00e0 80B5     		push	{r7, lr}
 229              		.cfi_def_cfa_offset 8
 230              		.cfi_offset 7, -8
 231              		.cfi_offset 14, -4
 232 00e2 82B0     		sub	sp, sp, #8
 233              		.cfi_def_cfa_offset 16
 234 00e4 00AF     		add	r7, sp, #0
 235              		.cfi_def_cfa_register 7
 236 00e6 7860     		str	r0, [r7, #4]
  51:/Users/Simon/chalmers-eda487/libraries/object.c **** 	clear_object(o);
 237              		.loc 1 51 0
 238 00e8 7B68     		ldr	r3, [r7, #4]
 239 00ea 1800     		movs	r0, r3
 240 00ec FFF7FEFF 		bl	clear_object
  52:/Users/Simon/chalmers-eda487/libraries/object.c **** 	o->posx += o->dirx;
 241              		.loc 1 52 0
 242 00f0 7B68     		ldr	r3, [r7, #4]
 243 00f2 DA68     		ldr	r2, [r3, #12]
 244 00f4 7B68     		ldr	r3, [r7, #4]
 245 00f6 5B68     		ldr	r3, [r3, #4]
 246 00f8 D218     		adds	r2, r2, r3
 247 00fa 7B68     		ldr	r3, [r7, #4]
 248 00fc DA60     		str	r2, [r3, #12]
  53:/Users/Simon/chalmers-eda487/libraries/object.c **** 	o->posy += o->diry;
 249              		.loc 1 53 0
 250 00fe 7B68     		ldr	r3, [r7, #4]
 251 0100 1A69     		ldr	r2, [r3, #16]
 252 0102 7B68     		ldr	r3, [r7, #4]
 253 0104 9B68     		ldr	r3, [r3, #8]
 254 0106 D218     		adds	r2, r2, r3
 255 0108 7B68     		ldr	r3, [r7, #4]
 256 010a 1A61     		str	r2, [r3, #16]
  54:/Users/Simon/chalmers-eda487/libraries/object.c **** 	if((o->posx < 1 ) || (o->posx > 128)){
 257              		.loc 1 54 0
 258 010c 7B68     		ldr	r3, [r7, #4]
 259 010e DB68     		ldr	r3, [r3, #12]
 260 0110 002B     		cmp	r3, #0
 261 0112 03D0     		beq	.L9
 262              		.loc 1 54 0 is_stmt 0 discriminator 1
 263 0114 7B68     		ldr	r3, [r7, #4]
 264 0116 DB68     		ldr	r3, [r3, #12]
 265 0118 802B     		cmp	r3, #128
 266 011a 04D9     		bls	.L10
 267              	.L9:
  55:/Users/Simon/chalmers-eda487/libraries/object.c **** 		o->dirx = -o->dirx;
 268              		.loc 1 55 0 is_stmt 1
 269 011c 7B68     		ldr	r3, [r7, #4]
 270 011e 5B68     		ldr	r3, [r3, #4]
 271 0120 5A42     		rsbs	r2, r3, #0
 272 0122 7B68     		ldr	r3, [r7, #4]
 273 0124 5A60     		str	r2, [r3, #4]
 274              	.L10:
  56:/Users/Simon/chalmers-eda487/libraries/object.c **** 	}
  57:/Users/Simon/chalmers-eda487/libraries/object.c **** 	if((o->posy < 1 ) || (o->posy > 64)){
 275              		.loc 1 57 0
 276 0126 7B68     		ldr	r3, [r7, #4]
 277 0128 1B69     		ldr	r3, [r3, #16]
 278 012a 002B     		cmp	r3, #0
 279 012c 03D0     		beq	.L11
 280              		.loc 1 57 0 is_stmt 0 discriminator 1
 281 012e 7B68     		ldr	r3, [r7, #4]
 282 0130 1B69     		ldr	r3, [r3, #16]
 283 0132 402B     		cmp	r3, #64
 284 0134 04D9     		bls	.L12
 285              	.L11:
  58:/Users/Simon/chalmers-eda487/libraries/object.c **** 		o->diry = -o->diry;
 286              		.loc 1 58 0 is_stmt 1
 287 0136 7B68     		ldr	r3, [r7, #4]
 288 0138 9B68     		ldr	r3, [r3, #8]
 289 013a 5A42     		rsbs	r2, r3, #0
 290 013c 7B68     		ldr	r3, [r7, #4]
 291 013e 9A60     		str	r2, [r3, #8]
 292              	.L12:
  59:/Users/Simon/chalmers-eda487/libraries/object.c **** 	}
  60:/Users/Simon/chalmers-eda487/libraries/object.c **** 	draw_object(o);
 293              		.loc 1 60 0
 294 0140 7B68     		ldr	r3, [r7, #4]
 295 0142 1800     		movs	r0, r3
 296 0144 FFF7FEFF 		bl	draw_object
  61:/Users/Simon/chalmers-eda487/libraries/object.c **** }...
 297              		.loc 1 61 0
 298 0148 C046     		nop
 299 014a BD46     		mov	sp, r7
 300 014c 02B0     		add	sp, sp, #8
 301              		@ sp needed
 302 014e 80BD     		pop	{r7, pc}
 303              		.cfi_endproc
 304              	.LFE3:
 306              	.Letext0:
 307              		.file 2 "/Users/Simon/chalmers-eda487/libraries/gpio.h"
 308              		.file 3 "/Users/Simon/chalmers-eda487/libraries/object.h"
