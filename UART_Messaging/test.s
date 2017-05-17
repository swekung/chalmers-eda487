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
  27              		.file 1 "/Users/Simon/chalmers-eda487/UART_Messaging/startup.c"
   1:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** /*
   2:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c ****  * 	startup.c
   3:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c ****  *
   4:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c ****  */
   5:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 
   7:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** void startup ( void )
   8:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** {
  28              		.loc 1 8 0
  29              		.cfi_startproc
  30              		@ Naked Function: prologue and epilogue provided by programmer.
  31              		@ args = 0, pretend = 0, frame = 0
  32              		@ frame_needed = 1, uses_anonymous_args = 0
   9:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** asm volatile(
  33              		.loc 1 9 0
  34              		.syntax divided
  35              	@ 9 "/Users/Simon/chalmers-eda487/UART_Messaging/startup.c" 1
  36 0000 0248     		 LDR R0,=0x2001C000
  37 0002 8546     	 MOV SP,R0
  38 0004 FFF7FEFF 	 BL main
  39 0008 FEE7     	.L1: B .L1
  40              	
  41              	@ 0 "" 2
  10:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	" MOV SP,R0\n"
  12:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	" BL main\n"				/* call main */
  13:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	".L1: B .L1\n"				/* never return */
  14:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	) ;
  15:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** }
  42              		.loc 1 15 0
  43              		.thumb
  44              		.syntax unified
  45 000a C046     		nop
  46              		.cfi_endproc
  47              	.LFE0:
  49              		.data
  50              		.align	2
  53              	mailicon_bits:
  54 0000 FF       		.byte	-1
  55 0001 FF       		.byte	-1
  56 0002 FF       		.byte	-1
  57 0003 FF       		.byte	-1
  58 0004 FF       		.byte	-1
  59 0005 FF       		.byte	-1
  60 0006 FF       		.byte	-1
  61 0007 FF       		.byte	-1
  62 0008 FF       		.byte	-1
  63 0009 FF       		.byte	-1
  64 000a FF       		.byte	-1
  65 000b FF       		.byte	-1
  66 000c FF       		.byte	-1
  67 000d FF       		.byte	-1
  68 000e FF       		.byte	-1
  69 000f FF       		.byte	-1
  70 0010 FF       		.byte	-1
  71 0011 FF       		.byte	-1
  72 0012 FF       		.byte	-1
  73 0013 FF       		.byte	-1
  74 0014 FF       		.byte	-1
  75 0015 FF       		.byte	-1
  76 0016 FF       		.byte	-1
  77 0017 FF       		.byte	-1
  78 0018 FF       		.byte	-1
  79 0019 FF       		.byte	-1
  80 001a FF       		.byte	-1
  81 001b FF       		.byte	-1
  82 001c FF       		.byte	-1
  83 001d FF       		.byte	-1
  84 001e FF       		.byte	-1
  85 001f FF       		.byte	-1
  86 0020 FF       		.byte	-1
  87 0021 FF       		.byte	-1
  88 0022 FF       		.byte	-1
  89 0023 FF       		.byte	-1
  90 0024 FF       		.byte	-1
  91 0025 FF       		.byte	-1
  92 0026 FF       		.byte	-1
  93 0027 FF       		.byte	-1
  94 0028 FF       		.byte	-1
  95 0029 FF       		.byte	-1
  96 002a FF       		.byte	-1
  97 002b FF       		.byte	-1
  98 002c FF       		.byte	-1
  99 002d FF       		.byte	-1
 100 002e FF       		.byte	-1
 101 002f FF       		.byte	-1
 102 0030 FF       		.byte	-1
 103 0031 FF       		.byte	-1
 104 0032 FF       		.byte	-1
 105 0033 FF       		.byte	-1
 106 0034 FF       		.byte	-1
 107 0035 FF       		.byte	-1
 108 0036 FF       		.byte	-1
 109 0037 FF       		.byte	-1
 110 0038 FF       		.byte	-1
 111 0039 FF       		.byte	-1
 112 003a FF       		.byte	-1
 113 003b FF       		.byte	-1
 114 003c FF       		.byte	-1
 115 003d FF       		.byte	-1
 116 003e FF       		.byte	-1
 117 003f FF       		.byte	-1
 118 0040 FF       		.byte	-1
 119 0041 FF       		.byte	-1
 120 0042 FF       		.byte	-1
 121 0043 FF       		.byte	-1
 122 0044 FF       		.byte	-1
 123 0045 FF       		.byte	-1
 124 0046 FF       		.byte	-1
 125 0047 0F       		.byte	15
 126 0048 00       		.byte	0
 127 0049 00       		.byte	0
 128 004a 00       		.byte	0
 129 004b 00       		.byte	0
 130 004c 00       		.byte	0
 131 004d 00       		.byte	0
 132 004e F0       		.byte	-16
 133 004f FF       		.byte	-1
 134 0050 FF       		.byte	-1
 135 0051 1F       		.byte	31
 136 0052 00       		.byte	0
 137 0053 00       		.byte	0
 138 0054 00       		.byte	0
 139 0055 00       		.byte	0
 140 0056 00       		.byte	0
 141 0057 00       		.byte	0
 142 0058 F8       		.byte	-8
 143 0059 FF       		.byte	-1
 144 005a FF       		.byte	-1
 145 005b 3F       		.byte	63
 146 005c 00       		.byte	0
 147 005d 00       		.byte	0
 148 005e 00       		.byte	0
 149 005f 00       		.byte	0
 150 0060 00       		.byte	0
 151 0061 00       		.byte	0
 152 0062 FC       		.byte	-4
 153 0063 FF       		.byte	-1
 154 0064 FF       		.byte	-1
 155 0065 7F       		.byte	127
 156 0066 00       		.byte	0
 157 0067 00       		.byte	0
 158 0068 00       		.byte	0
 159 0069 00       		.byte	0
 160 006a 00       		.byte	0
 161 006b 00       		.byte	0
 162 006c FE       		.byte	-2
 163 006d FF       		.byte	-1
 164 006e FF       		.byte	-1
 165 006f FF       		.byte	-1
 166 0070 00       		.byte	0
 167 0071 00       		.byte	0
 168 0072 00       		.byte	0
 169 0073 00       		.byte	0
 170 0074 00       		.byte	0
 171 0075 00       		.byte	0
 172 0076 FF       		.byte	-1
 173 0077 FF       		.byte	-1
 174 0078 FF       		.byte	-1
 175 0079 FF       		.byte	-1
 176 007a 01       		.byte	1
 177 007b 00       		.byte	0
 178 007c 00       		.byte	0
 179 007d 00       		.byte	0
 180 007e 00       		.byte	0
 181 007f 80       		.byte	-128
 182 0080 FF       		.byte	-1
 183 0081 FF       		.byte	-1
 184 0082 FF       		.byte	-1
 185 0083 FF       		.byte	-1
 186 0084 03       		.byte	3
 187 0085 00       		.byte	0
 188 0086 00       		.byte	0
 189 0087 00       		.byte	0
 190 0088 00       		.byte	0
 191 0089 C0       		.byte	-64
 192 008a FF       		.byte	-1
 193 008b FE       		.byte	-2
 194 008c FF       		.byte	-1
 195 008d FE       		.byte	-2
 196 008e 07       		.byte	7
 197 008f 00       		.byte	0
 198 0090 00       		.byte	0
 199 0091 00       		.byte	0
 200 0092 00       		.byte	0
 201 0093 E0       		.byte	-32
 202 0094 7F       		.byte	127
 203 0095 FE       		.byte	-2
 204 0096 FF       		.byte	-1
 205 0097 FC       		.byte	-4
 206 0098 0F       		.byte	15
 207 0099 00       		.byte	0
 208 009a 00       		.byte	0
 209 009b 00       		.byte	0
 210 009c 00       		.byte	0
 211 009d F0       		.byte	-16
 212 009e 3F       		.byte	63
 213 009f FE       		.byte	-2
 214 00a0 FF       		.byte	-1
 215 00a1 F8       		.byte	-8
 216 00a2 1F       		.byte	31
 217 00a3 00       		.byte	0
 218 00a4 00       		.byte	0
 219 00a5 00       		.byte	0
 220 00a6 00       		.byte	0
 221 00a7 F8       		.byte	-8
 222 00a8 1F       		.byte	31
 223 00a9 FE       		.byte	-2
 224 00aa FF       		.byte	-1
 225 00ab F0       		.byte	-16
 226 00ac 3F       		.byte	63
 227 00ad 00       		.byte	0
 228 00ae 00       		.byte	0
 229 00af 00       		.byte	0
 230 00b0 00       		.byte	0
 231 00b1 FC       		.byte	-4
 232 00b2 0F       		.byte	15
 233 00b3 FE       		.byte	-2
 234 00b4 FF       		.byte	-1
 235 00b5 E0       		.byte	-32
 236 00b6 7F       		.byte	127
 237 00b7 00       		.byte	0
 238 00b8 00       		.byte	0
 239 00b9 00       		.byte	0
 240 00ba 00       		.byte	0
 241 00bb FE       		.byte	-2
 242 00bc 07       		.byte	7
 243 00bd FE       		.byte	-2
 244 00be FF       		.byte	-1
 245 00bf C0       		.byte	-64
 246 00c0 FF       		.byte	-1
 247 00c1 00       		.byte	0
 248 00c2 00       		.byte	0
 249 00c3 00       		.byte	0
 250 00c4 00       		.byte	0
 251 00c5 FF       		.byte	-1
 252 00c6 03       		.byte	3
 253 00c7 FE       		.byte	-2
 254 00c8 FF       		.byte	-1
 255 00c9 80       		.byte	-128
 256 00ca FF       		.byte	-1
 257 00cb 01       		.byte	1
 258 00cc 00       		.byte	0
 259 00cd 00       		.byte	0
 260 00ce 80       		.byte	-128
 261 00cf FF       		.byte	-1
 262 00d0 01       		.byte	1
 263 00d1 FE       		.byte	-2
 264 00d2 FF       		.byte	-1
 265 00d3 00       		.byte	0
 266 00d4 FF       		.byte	-1
 267 00d5 03       		.byte	3
 268 00d6 00       		.byte	0
 269 00d7 00       		.byte	0
 270 00d8 C0       		.byte	-64
 271 00d9 FF       		.byte	-1
 272 00da 00       		.byte	0
 273 00db FE       		.byte	-2
 274 00dc FF       		.byte	-1
 275 00dd 00       		.byte	0
 276 00de FE       		.byte	-2
 277 00df 07       		.byte	7
 278 00e0 00       		.byte	0
 279 00e1 00       		.byte	0
 280 00e2 E0       		.byte	-32
 281 00e3 7F       		.byte	127
 282 00e4 00       		.byte	0
 283 00e5 FE       		.byte	-2
 284 00e6 FF       		.byte	-1
 285 00e7 00       		.byte	0
 286 00e8 FC       		.byte	-4
 287 00e9 0F       		.byte	15
 288 00ea 00       		.byte	0
 289 00eb 00       		.byte	0
 290 00ec F0       		.byte	-16
 291 00ed 3F       		.byte	63
 292 00ee 00       		.byte	0
 293 00ef FE       		.byte	-2
 294 00f0 FF       		.byte	-1
 295 00f1 00       		.byte	0
 296 00f2 F8       		.byte	-8
 297 00f3 1F       		.byte	31
 298 00f4 00       		.byte	0
 299 00f5 00       		.byte	0
 300 00f6 F8       		.byte	-8
 301 00f7 1F       		.byte	31
 302 00f8 00       		.byte	0
 303 00f9 FE       		.byte	-2
 304 00fa FF       		.byte	-1
 305 00fb 00       		.byte	0
 306 00fc F0       		.byte	-16
 307 00fd 3F       		.byte	63
 308 00fe 00       		.byte	0
 309 00ff 00       		.byte	0
 310 0100 FC       		.byte	-4
 311 0101 0F       		.byte	15
 312 0102 00       		.byte	0
 313 0103 FE       		.byte	-2
 314 0104 FF       		.byte	-1
 315 0105 00       		.byte	0
 316 0106 E0       		.byte	-32
 317 0107 7F       		.byte	127
 318 0108 00       		.byte	0
 319 0109 00       		.byte	0
 320 010a FE       		.byte	-2
 321 010b 07       		.byte	7
 322 010c 00       		.byte	0
 323 010d FE       		.byte	-2
 324 010e FF       		.byte	-1
 325 010f 00       		.byte	0
 326 0110 C0       		.byte	-64
 327 0111 FF       		.byte	-1
 328 0112 00       		.byte	0
 329 0113 00       		.byte	0
 330 0114 FF       		.byte	-1
 331 0115 03       		.byte	3
 332 0116 00       		.byte	0
 333 0117 FE       		.byte	-2
 334 0118 FF       		.byte	-1
 335 0119 00       		.byte	0
 336 011a 80       		.byte	-128
 337 011b FF       		.byte	-1
 338 011c 01       		.byte	1
 339 011d 80       		.byte	-128
 340 011e FF       		.byte	-1
 341 011f 01       		.byte	1
 342 0120 00       		.byte	0
 343 0121 FE       		.byte	-2
 344 0122 FF       		.byte	-1
 345 0123 00       		.byte	0
 346 0124 00       		.byte	0
 347 0125 FF       		.byte	-1
 348 0126 03       		.byte	3
 349 0127 C0       		.byte	-64
 350 0128 FF       		.byte	-1
 351 0129 00       		.byte	0
 352 012a 00       		.byte	0
 353 012b FE       		.byte	-2
 354 012c FF       		.byte	-1
 355 012d 00       		.byte	0
 356 012e 00       		.byte	0
 357 012f FE       		.byte	-2
 358 0130 07       		.byte	7
 359 0131 E0       		.byte	-32
 360 0132 7F       		.byte	127
 361 0133 00       		.byte	0
 362 0134 00       		.byte	0
 363 0135 FE       		.byte	-2
 364 0136 FF       		.byte	-1
 365 0137 00       		.byte	0
 366 0138 00       		.byte	0
 367 0139 FF       		.byte	-1
 368 013a 0F       		.byte	15
 369 013b F0       		.byte	-16
 370 013c FF       		.byte	-1
 371 013d 00       		.byte	0
 372 013e 00       		.byte	0
 373 013f FE       		.byte	-2
 374 0140 FF       		.byte	-1
 375 0141 00       		.byte	0
 376 0142 80       		.byte	-128
 377 0143 FF       		.byte	-1
 378 0144 1F       		.byte	31
 379 0145 F8       		.byte	-8
 380 0146 FF       		.byte	-1
 381 0147 01       		.byte	1
 382 0148 00       		.byte	0
 383 0149 FE       		.byte	-2
 384 014a FF       		.byte	-1
 385 014b 00       		.byte	0
 386 014c C0       		.byte	-64
 387 014d FF       		.byte	-1
 388 014e 3F       		.byte	63
 389 014f FC       		.byte	-4
 390 0150 FF       		.byte	-1
 391 0151 03       		.byte	3
 392 0152 00       		.byte	0
 393 0153 FE       		.byte	-2
 394 0154 FF       		.byte	-1
 395 0155 00       		.byte	0
 396 0156 E0       		.byte	-32
 397 0157 FF       		.byte	-1
 398 0158 FF       		.byte	-1
 399 0159 FF       		.byte	-1
 400 015a FF       		.byte	-1
 401 015b 07       		.byte	7
 402 015c 00       		.byte	0
 403 015d FE       		.byte	-2
 404 015e FF       		.byte	-1
 405 015f 00       		.byte	0
 406 0160 F0       		.byte	-16
 407 0161 FF       		.byte	-1
 408 0162 FF       		.byte	-1
 409 0163 FF       		.byte	-1
 410 0164 FF       		.byte	-1
 411 0165 0F       		.byte	15
 412 0166 00       		.byte	0
 413 0167 FE       		.byte	-2
 414 0168 FF       		.byte	-1
 415 0169 00       		.byte	0
 416 016a F8       		.byte	-8
 417 016b 9F       		.byte	-97
 418 016c FF       		.byte	-1
 419 016d FF       		.byte	-1
 420 016e F9       		.byte	-7
 421 016f 1F       		.byte	31
 422 0170 00       		.byte	0
 423 0171 FE       		.byte	-2
 424 0172 FF       		.byte	-1
 425 0173 00       		.byte	0
 426 0174 FC       		.byte	-4
 427 0175 0F       		.byte	15
 428 0176 FF       		.byte	-1
 429 0177 FF       		.byte	-1
 430 0178 F0       		.byte	-16
 431 0179 3F       		.byte	63
 432 017a 00       		.byte	0
 433 017b FE       		.byte	-2
 434 017c FF       		.byte	-1
 435 017d 00       		.byte	0
 436 017e FE       		.byte	-2
 437 017f 07       		.byte	7
 438 0180 FE       		.byte	-2
 439 0181 7F       		.byte	127
 440 0182 E0       		.byte	-32
 441 0183 7F       		.byte	127
 442 0184 00       		.byte	0
 443 0185 FE       		.byte	-2
 444 0186 FF       		.byte	-1
 445 0187 00       		.byte	0
 446 0188 FF       		.byte	-1
 447 0189 03       		.byte	3
 448 018a FC       		.byte	-4
 449 018b 3F       		.byte	63
 450 018c C0       		.byte	-64
 451 018d FF       		.byte	-1
 452 018e 00       		.byte	0
 453 018f FE       		.byte	-2
 454 0190 FF       		.byte	-1
 455 0191 80       		.byte	-128
 456 0192 FF       		.byte	-1
 457 0193 01       		.byte	1
 458 0194 F0       		.byte	-16
 459 0195 0F       		.byte	15
 460 0196 80       		.byte	-128
 461 0197 FF       		.byte	-1
 462 0198 01       		.byte	1
 463 0199 FE       		.byte	-2
 464 019a FF       		.byte	-1
 465 019b C0       		.byte	-64
 466 019c FF       		.byte	-1
 467 019d 00       		.byte	0
 468 019e C0       		.byte	-64
 469 019f 03       		.byte	3
 470 01a0 00       		.byte	0
 471 01a1 FF       		.byte	-1
 472 01a2 03       		.byte	3
 473 01a3 FE       		.byte	-2
 474 01a4 FF       		.byte	-1
 475 01a5 E0       		.byte	-32
 476 01a6 7F       		.byte	127
 477 01a7 00       		.byte	0
 478 01a8 00       		.byte	0
 479 01a9 00       		.byte	0
 480 01aa 00       		.byte	0
 481 01ab FE       		.byte	-2
 482 01ac 07       		.byte	7
 483 01ad FE       		.byte	-2
 484 01ae FF       		.byte	-1
 485 01af F0       		.byte	-16
 486 01b0 3F       		.byte	63
 487 01b1 00       		.byte	0
 488 01b2 00       		.byte	0
 489 01b3 00       		.byte	0
 490 01b4 00       		.byte	0
 491 01b5 FC       		.byte	-4
 492 01b6 0F       		.byte	15
 493 01b7 FE       		.byte	-2
 494 01b8 FF       		.byte	-1
 495 01b9 F8       		.byte	-8
 496 01ba 1F       		.byte	31
 497 01bb 00       		.byte	0
 498 01bc 00       		.byte	0
 499 01bd 00       		.byte	0
 500 01be 00       		.byte	0
 501 01bf F8       		.byte	-8
 502 01c0 1F       		.byte	31
 503 01c1 FE       		.byte	-2
 504 01c2 FF       		.byte	-1
 505 01c3 FC       		.byte	-4
 506 01c4 0F       		.byte	15
 507 01c5 00       		.byte	0
 508 01c6 00       		.byte	0
 509 01c7 00       		.byte	0
 510 01c8 00       		.byte	0
 511 01c9 F0       		.byte	-16
 512 01ca 3F       		.byte	63
 513 01cb FE       		.byte	-2
 514 01cc FF       		.byte	-1
 515 01cd FE       		.byte	-2
 516 01ce 07       		.byte	7
 517 01cf 00       		.byte	0
 518 01d0 00       		.byte	0
 519 01d1 00       		.byte	0
 520 01d2 00       		.byte	0
 521 01d3 E0       		.byte	-32
 522 01d4 7F       		.byte	127
 523 01d5 FE       		.byte	-2
 524 01d6 FF       		.byte	-1
 525 01d7 FF       		.byte	-1
 526 01d8 03       		.byte	3
 527 01d9 00       		.byte	0
 528 01da 00       		.byte	0
 529 01db 00       		.byte	0
 530 01dc 00       		.byte	0
 531 01dd C0       		.byte	-64
 532 01de FF       		.byte	-1
 533 01df FE       		.byte	-2
 534 01e0 FF       		.byte	-1
 535 01e1 FF       		.byte	-1
 536 01e2 01       		.byte	1
 537 01e3 00       		.byte	0
 538 01e4 00       		.byte	0
 539 01e5 00       		.byte	0
 540 01e6 00       		.byte	0
 541 01e7 80       		.byte	-128
 542 01e8 FF       		.byte	-1
 543 01e9 FF       		.byte	-1
 544 01ea FF       		.byte	-1
 545 01eb FF       		.byte	-1
 546 01ec 00       		.byte	0
 547 01ed 00       		.byte	0
 548 01ee 00       		.byte	0
 549 01ef 00       		.byte	0
 550 01f0 00       		.byte	0
 551 01f1 00       		.byte	0
 552 01f2 FF       		.byte	-1
 553 01f3 FF       		.byte	-1
 554 01f4 FF       		.byte	-1
 555 01f5 7F       		.byte	127
 556 01f6 00       		.byte	0
 557 01f7 00       		.byte	0
 558 01f8 00       		.byte	0
 559 01f9 00       		.byte	0
 560 01fa 00       		.byte	0
 561 01fb 00       		.byte	0
 562 01fc FE       		.byte	-2
 563 01fd FF       		.byte	-1
 564 01fe FF       		.byte	-1
 565 01ff 3F       		.byte	63
 566 0200 00       		.byte	0
 567 0201 00       		.byte	0
 568 0202 00       		.byte	0
 569 0203 00       		.byte	0
 570 0204 00       		.byte	0
 571 0205 00       		.byte	0
 572 0206 FC       		.byte	-4
 573 0207 FF       		.byte	-1
 574 0208 FF       		.byte	-1
 575 0209 1F       		.byte	31
 576 020a 00       		.byte	0
 577 020b 00       		.byte	0
 578 020c 00       		.byte	0
 579 020d 00       		.byte	0
 580 020e 00       		.byte	0
 581 020f 00       		.byte	0
 582 0210 F8       		.byte	-8
 583 0211 FF       		.byte	-1
 584 0212 FF       		.byte	-1
 585 0213 0F       		.byte	15
 586 0214 00       		.byte	0
 587 0215 00       		.byte	0
 588 0216 00       		.byte	0
 589 0217 00       		.byte	0
 590 0218 00       		.byte	0
 591 0219 00       		.byte	0
 592 021a F0       		.byte	-16
 593 021b FF       		.byte	-1
 594 021c FF       		.byte	-1
 595 021d FF       		.byte	-1
 596 021e FF       		.byte	-1
 597 021f FF       		.byte	-1
 598 0220 FF       		.byte	-1
 599 0221 FF       		.byte	-1
 600 0222 FF       		.byte	-1
 601 0223 FF       		.byte	-1
 602 0224 FF       		.byte	-1
 603 0225 FF       		.byte	-1
 604 0226 FF       		.byte	-1
 605 0227 FF       		.byte	-1
 606 0228 FF       		.byte	-1
 607 0229 FF       		.byte	-1
 608 022a FF       		.byte	-1
 609 022b FF       		.byte	-1
 610 022c FF       		.byte	-1
 611 022d FF       		.byte	-1
 612 022e FF       		.byte	-1
 613 022f FF       		.byte	-1
 614 0230 FF       		.byte	-1
 615 0231 FF       		.byte	-1
 616 0232 FF       		.byte	-1
 617 0233 FF       		.byte	-1
 618 0234 FF       		.byte	-1
 619 0235 FF       		.byte	-1
 620 0236 FF       		.byte	-1
 621 0237 FF       		.byte	-1
 622 0238 FF       		.byte	-1
 623 0239 FF       		.byte	-1
 624 023a FF       		.byte	-1
 625 023b FF       		.byte	-1
 626 023c FF       		.byte	-1
 627 023d FF       		.byte	-1
 628 023e FF       		.byte	-1
 629 023f FF       		.byte	-1
 630 0240 FF       		.byte	-1
 631 0241 FF       		.byte	-1
 632 0242 FF       		.byte	-1
 633 0243 FF       		.byte	-1
 634 0244 FF       		.byte	-1
 635 0245 FF       		.byte	-1
 636 0246 FF       		.byte	-1
 637 0247 FF       		.byte	-1
 638 0248 FF       		.byte	-1
 639 0249 FF       		.byte	-1
 640 024a FF       		.byte	-1
 641 024b FF       		.byte	-1
 642 024c FF       		.byte	-1
 643 024d FF       		.byte	-1
 644 024e FF       		.byte	-1
 645 024f FF       		.byte	-1
 646 0250 FF       		.byte	-1
 647 0251 FF       		.byte	-1
 648 0252 FF       		.byte	-1
 649 0253 FF       		.byte	-1
 650 0254 FF       		.byte	-1
 651 0255 FF       		.byte	-1
 652 0256 FF       		.byte	-1
 653 0257 FF       		.byte	-1
 654 0258 FF       		.byte	-1
 655 0259 FF       		.byte	-1
 656 025a FF       		.byte	-1
 657 025b FF       		.byte	-1
 658 025c FF       		.byte	-1
 659 025d FF       		.byte	-1
 660 025e FF       		.byte	-1
 661 025f FF       		.byte	-1
 662 0260 FF       		.byte	-1
 663 0261 FF       		.byte	-1
 664              		.text
 665              		.align	2
 666              		.code	16
 667              		.thumb_func
 669              	load_sprite:
 670              	.LFB1:
  16:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 
  17:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** #include "types.h"
  18:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** #include "usart.h"
  19:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** #include "object.h"
  20:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** #include "mailicon.xbm"
  21:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 
  22:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** #define SIMULATOR
  23:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 
  24:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** typedef struct
  25:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** {
  26:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	unsigned char width;
  27:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	unsigned char height;
  28:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	unsigned char* data;
  29:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** } sprite;
  30:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 
  31:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** static void load_sprite(sprite* s, unsigned char* data, int width, int height) {
 671              		.loc 1 31 0
 672              		.cfi_startproc
 673              		@ args = 0, pretend = 0, frame = 16
 674              		@ frame_needed = 1, uses_anonymous_args = 0
 675 0000 80B5     		push	{r7, lr}
 676              		.cfi_def_cfa_offset 8
 677              		.cfi_offset 7, -8
 678              		.cfi_offset 14, -4
 679 0002 84B0     		sub	sp, sp, #16
 680              		.cfi_def_cfa_offset 24
 681 0004 00AF     		add	r7, sp, #0
 682              		.cfi_def_cfa_register 7
 683 0006 F860     		str	r0, [r7, #12]
 684 0008 B960     		str	r1, [r7, #8]
 685 000a 7A60     		str	r2, [r7, #4]
 686 000c 3B60     		str	r3, [r7]
  32:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	s->width = width;
 687              		.loc 1 32 0
 688 000e 7B68     		ldr	r3, [r7, #4]
 689 0010 DAB2     		uxtb	r2, r3
 690 0012 FB68     		ldr	r3, [r7, #12]
 691 0014 1A70     		strb	r2, [r3]
  33:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	s->height = height;
 692              		.loc 1 33 0
 693 0016 3B68     		ldr	r3, [r7]
 694 0018 DAB2     		uxtb	r2, r3
 695 001a FB68     		ldr	r3, [r7, #12]
 696 001c 5A70     		strb	r2, [r3, #1]
  34:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	s->data = data;
 697              		.loc 1 34 0
 698 001e FB68     		ldr	r3, [r7, #12]
 699 0020 BA68     		ldr	r2, [r7, #8]
 700 0022 5A60     		str	r2, [r3, #4]
  35:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** }
 701              		.loc 1 35 0
 702 0024 C046     		nop
 703 0026 BD46     		mov	sp, r7
 704 0028 04B0     		add	sp, sp, #16
 705              		@ sp needed
 706 002a 80BD     		pop	{r7, pc}
 707              		.cfi_endproc
 708              	.LFE1:
 710              		.align	2
 711              		.global	draw_sprite
 712              		.code	16
 713              		.thumb_func
 715              	draw_sprite:
 716              	.LFB2:
  36:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 
  37:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** void draw_sprite(sprite* s, int x, int y, int set) { 
 717              		.loc 1 37 0
 718              		.cfi_startproc
 719              		@ args = 0, pretend = 0, frame = 40
 720              		@ frame_needed = 1, uses_anonymous_args = 0
 721 002c 80B5     		push	{r7, lr}
 722              		.cfi_def_cfa_offset 8
 723              		.cfi_offset 7, -8
 724              		.cfi_offset 14, -4
 725 002e 8AB0     		sub	sp, sp, #40
 726              		.cfi_def_cfa_offset 48
 727 0030 00AF     		add	r7, sp, #0
 728              		.cfi_def_cfa_register 7
 729 0032 F860     		str	r0, [r7, #12]
 730 0034 B960     		str	r1, [r7, #8]
 731 0036 7A60     		str	r2, [r7, #4]
 732 0038 3B60     		str	r3, [r7]
  38:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	int i,j,k, width_in_bytes;
  39:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	if (s->width % 8 == 0)
 733              		.loc 1 39 0
 734 003a FB68     		ldr	r3, [r7, #12]
 735 003c 1B78     		ldrb	r3, [r3]
 736 003e 0722     		movs	r2, #7
 737 0040 1340     		ands	r3, r2
 738 0042 DBB2     		uxtb	r3, r3
 739 0044 002B     		cmp	r3, #0
 740 0046 05D1     		bne	.L4
  40:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		 width_in_bytes = s->width / 8;
 741              		.loc 1 40 0
 742 0048 FB68     		ldr	r3, [r7, #12]
 743 004a 1B78     		ldrb	r3, [r3]
 744 004c DB08     		lsrs	r3, r3, #3
 745 004e DBB2     		uxtb	r3, r3
 746 0050 BB61     		str	r3, [r7, #24]
 747 0052 05E0     		b	.L5
 748              	.L4:
  41:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	else
  42:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		width_in_bytes = s->width / 8 + 1;
 749              		.loc 1 42 0
 750 0054 FB68     		ldr	r3, [r7, #12]
 751 0056 1B78     		ldrb	r3, [r3]
 752 0058 DB08     		lsrs	r3, r3, #3
 753 005a DBB2     		uxtb	r3, r3
 754 005c 0133     		adds	r3, r3, #1
 755 005e BB61     		str	r3, [r7, #24]
 756              	.L5:
  43:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	for (i = 0; i < s->height; i++)
 757              		.loc 1 43 0
 758 0060 0023     		movs	r3, #0
 759 0062 7B62     		str	r3, [r7, #36]
 760 0064 39E0     		b	.L6
 761              	.L12:
  44:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		 for (j = 0; j < width_in_bytes; j++) {
 762              		.loc 1 44 0
 763 0066 0023     		movs	r3, #0
 764 0068 3B62     		str	r3, [r7, #32]
 765 006a 2FE0     		b	.L7
 766              	.L11:
 767              	.LBB2:
  45:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 			 unsigned char byte = s->data[i * width_in_bytes + j];
 768              		.loc 1 45 0
 769 006c FB68     		ldr	r3, [r7, #12]
 770 006e 5B68     		ldr	r3, [r3, #4]
 771 0070 7A6A     		ldr	r2, [r7, #36]
 772 0072 B969     		ldr	r1, [r7, #24]
 773 0074 5143     		muls	r1, r2
 774 0076 3A6A     		ldr	r2, [r7, #32]
 775 0078 8A18     		adds	r2, r1, r2
 776 007a 9A18     		adds	r2, r3, r2
 777 007c 1723     		movs	r3, #23
 778 007e FB18     		adds	r3, r7, r3
 779 0080 1278     		ldrb	r2, [r2]
 780 0082 1A70     		strb	r2, [r3]
  46:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 			 for (k =0; k < 8; k++) {
 781              		.loc 1 46 0
 782 0084 0023     		movs	r3, #0
 783 0086 FB61     		str	r3, [r7, #28]
 784 0088 1AE0     		b	.L8
 785              	.L10:
  47:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 				 if (byte & (1 << k))
 786              		.loc 1 47 0
 787 008a 1723     		movs	r3, #23
 788 008c FB18     		adds	r3, r7, r3
 789 008e 1A78     		ldrb	r2, [r3]
 790 0090 FB69     		ldr	r3, [r7, #28]
 791 0092 1A41     		asrs	r2, r2, r3
 792 0094 1300     		movs	r3, r2
 793 0096 0122     		movs	r2, #1
 794 0098 1340     		ands	r3, r2
 795 009a 0ED0     		beq	.L9
 796              	.LBB3:
  48:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 					pixel(8 * j + k + x + 1, i + y + 1, set);
 797              		.loc 1 48 0
 798 009c 3B6A     		ldr	r3, [r7, #32]
 799 009e DA00     		lsls	r2, r3, #3
 800 00a0 FB69     		ldr	r3, [r7, #28]
 801 00a2 D218     		adds	r2, r2, r3
 802 00a4 BB68     		ldr	r3, [r7, #8]
 803 00a6 D318     		adds	r3, r2, r3
 804 00a8 581C     		adds	r0, r3, #1
 805 00aa 7A6A     		ldr	r2, [r7, #36]
 806 00ac 7B68     		ldr	r3, [r7, #4]
 807 00ae D318     		adds	r3, r2, r3
 808 00b0 0133     		adds	r3, r3, #1
 809 00b2 3A68     		ldr	r2, [r7]
 810 00b4 1900     		movs	r1, r3
 811 00b6 FFF7FEFF 		bl	pixel
 812              	.L9:
 813              	.LBE3:
  46:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 			 for (k =0; k < 8; k++) {
 814              		.loc 1 46 0 discriminator 2
 815 00ba FB69     		ldr	r3, [r7, #28]
 816 00bc 0133     		adds	r3, r3, #1
 817 00be FB61     		str	r3, [r7, #28]
 818              	.L8:
  46:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 			 for (k =0; k < 8; k++) {
 819              		.loc 1 46 0 is_stmt 0 discriminator 1
 820 00c0 FB69     		ldr	r3, [r7, #28]
 821 00c2 072B     		cmp	r3, #7
 822 00c4 E1DD     		ble	.L10
 823              	.LBE2:
  44:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 			 unsigned char byte = s->data[i * width_in_bytes + j];
 824              		.loc 1 44 0 is_stmt 1 discriminator 2
 825 00c6 3B6A     		ldr	r3, [r7, #32]
 826 00c8 0133     		adds	r3, r3, #1
 827 00ca 3B62     		str	r3, [r7, #32]
 828              	.L7:
  44:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 			 unsigned char byte = s->data[i * width_in_bytes + j];
 829              		.loc 1 44 0 is_stmt 0 discriminator 1
 830 00cc 3A6A     		ldr	r2, [r7, #32]
 831 00ce BB69     		ldr	r3, [r7, #24]
 832 00d0 9A42     		cmp	r2, r3
 833 00d2 CBDB     		blt	.L11
  43:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		 for (j = 0; j < width_in_bytes; j++) {
 834              		.loc 1 43 0 is_stmt 1 discriminator 2
 835 00d4 7B6A     		ldr	r3, [r7, #36]
 836 00d6 0133     		adds	r3, r3, #1
 837 00d8 7B62     		str	r3, [r7, #36]
 838              	.L6:
  43:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		 for (j = 0; j < width_in_bytes; j++) {
 839              		.loc 1 43 0 is_stmt 0 discriminator 1
 840 00da FB68     		ldr	r3, [r7, #12]
 841 00dc 5B78     		ldrb	r3, [r3, #1]
 842 00de 1A00     		movs	r2, r3
 843 00e0 7B6A     		ldr	r3, [r7, #36]
 844 00e2 9A42     		cmp	r2, r3
 845 00e4 BFDC     		bgt	.L12
  49:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 			}
  50:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 
  51:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		} 
  52:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** }
 846              		.loc 1 52 0 is_stmt 1
 847 00e6 C046     		nop
 848 00e8 BD46     		mov	sp, r7
 849 00ea 0AB0     		add	sp, sp, #40
 850              		@ sp needed
 851 00ec 80BD     		pop	{r7, pc}
 852              		.cfi_endproc
 853              	.LFE2:
 855              		.comm	mail,8,4
 856 00ee C046     		.align	2
 857              		.global	writeMessage
 858              		.code	16
 859              		.thumb_func
 861              	writeMessage:
 862              	.LFB3:
  53:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 
  54:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** sprite mail;
  55:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 
  56:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 
  57:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** void writeMessage()
  58:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** {
 863              		.loc 1 58 0
 864              		.cfi_startproc
 865              		@ args = 0, pretend = 0, frame = 8
 866              		@ frame_needed = 1, uses_anonymous_args = 0
 867 00f0 90B5     		push	{r4, r7, lr}
 868              		.cfi_def_cfa_offset 12
 869              		.cfi_offset 4, -12
 870              		.cfi_offset 7, -8
 871              		.cfi_offset 14, -4
 872 00f2 83B0     		sub	sp, sp, #12
 873              		.cfi_def_cfa_offset 24
 874 00f4 00AF     		add	r7, sp, #0
 875              		.cfi_def_cfa_register 7
  59:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	uint16_t index = 1;
 876              		.loc 1 59 0
 877 00f6 BB1D     		adds	r3, r7, #6
 878 00f8 0122     		movs	r2, #1
 879 00fa 1A80     		strh	r2, [r3]
  60:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	ascii_gotoxy(0,0);
 880              		.loc 1 60 0
 881 00fc 0021     		movs	r1, #0
 882 00fe 0020     		movs	r0, #0
 883 0100 FFF7FEFF 		bl	ascii_gotoxy
  61:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	uint8_t tempChar = inchar();
 884              		.loc 1 61 0
 885 0104 7C1D     		adds	r4, r7, #5
 886 0106 FFF7FEFF 		bl	inchar
 887 010a 0300     		movs	r3, r0
 888 010c 2370     		strb	r3, [r4]
  62:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	while(tempChar == 0)
 889              		.loc 1 62 0
 890 010e 04E0     		b	.L14
 891              	.L15:
  63:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	{
  64:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		tempChar = inchar();
 892              		.loc 1 64 0
 893 0110 7C1D     		adds	r4, r7, #5
 894 0112 FFF7FEFF 		bl	inchar
 895 0116 0300     		movs	r3, r0
 896 0118 2370     		strb	r3, [r4]
 897              	.L14:
  62:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	while(tempChar == 0)
 898              		.loc 1 62 0
 899 011a 7B1D     		adds	r3, r7, #5
 900 011c 1B78     		ldrb	r3, [r3]
 901 011e 002B     		cmp	r3, #0
 902 0120 F6D0     		beq	.L15
  65:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	}
  66:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	pixel(1,1,1);
 903              		.loc 1 66 0
 904 0122 0122     		movs	r2, #1
 905 0124 0121     		movs	r1, #1
 906 0126 0120     		movs	r0, #1
 907 0128 FFF7FEFF 		bl	pixel
  67:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	display_on();
 908              		.loc 1 67 0
 909 012c FFF7FEFF 		bl	display_on
  68:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	draw_sprite(&mail, 0, 0, 1);
 910              		.loc 1 68 0
 911 0130 1F48     		ldr	r0, .L23
 912 0132 0123     		movs	r3, #1
 913 0134 0022     		movs	r2, #0
 914 0136 0021     		movs	r1, #0
 915 0138 FFF7FEFF 		bl	draw_sprite
  69:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	ascii_command(0x01, 2000);
 916              		.loc 1 69 0
 917 013c FA23     		movs	r3, #250
 918 013e DB00     		lsls	r3, r3, #3
 919 0140 1900     		movs	r1, r3
 920 0142 0120     		movs	r0, #1
 921 0144 FFF7FEFF 		bl	ascii_command
 922              	.L20:
  70:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	while(1)
  71:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	{
  72:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		if(index < 21)
 923              		.loc 1 72 0
 924 0148 BB1D     		adds	r3, r7, #6
 925 014a 1B88     		ldrh	r3, [r3]
 926 014c 142B     		cmp	r3, #20
 927 014e 0BD8     		bhi	.L16
 928              	.LBB4:
  73:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		{
  74:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 			ascii_gotoxy(index, 1);
 929              		.loc 1 74 0
 930 0150 BB1D     		adds	r3, r7, #6
 931 0152 1B88     		ldrh	r3, [r3]
 932 0154 0121     		movs	r1, #1
 933 0156 1800     		movs	r0, r3
 934 0158 FFF7FEFF 		bl	ascii_gotoxy
  75:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 			ascii_write_char(tempChar);
 935              		.loc 1 75 0
 936 015c 7B1D     		adds	r3, r7, #5
 937 015e 1B78     		ldrb	r3, [r3]
 938 0160 1800     		movs	r0, r3
 939 0162 FFF7FEFF 		bl	ascii_write_char
 940              	.LBE4:
 941 0166 0FE0     		b	.L17
 942              	.L16:
  76:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		} else if( index >= 21){
 943              		.loc 1 76 0
 944 0168 BB1D     		adds	r3, r7, #6
 945 016a 1B88     		ldrh	r3, [r3]
 946 016c 142B     		cmp	r3, #20
 947 016e 0BD9     		bls	.L17
 948              	.LBB5:
  77:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 			ascii_gotoxy(index - 20, 2);
 949              		.loc 1 77 0
 950 0170 BB1D     		adds	r3, r7, #6
 951 0172 1B88     		ldrh	r3, [r3]
 952 0174 143B     		subs	r3, r3, #20
 953 0176 0221     		movs	r1, #2
 954 0178 1800     		movs	r0, r3
 955 017a FFF7FEFF 		bl	ascii_gotoxy
  78:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 			ascii_write_char(tempChar);
 956              		.loc 1 78 0
 957 017e 7B1D     		adds	r3, r7, #5
 958 0180 1B78     		ldrb	r3, [r3]
 959 0182 1800     		movs	r0, r3
 960 0184 FFF7FEFF 		bl	ascii_write_char
 961              	.L17:
 962              	.LBE5:
  79:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		}
  80:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		tempChar = inchar();
 963              		.loc 1 80 0
 964 0188 7C1D     		adds	r4, r7, #5
 965 018a FFF7FEFF 		bl	inchar
 966 018e 0300     		movs	r3, r0
 967 0190 2370     		strb	r3, [r4]
  81:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		if(tempChar == 47)
 968              		.loc 1 81 0
 969 0192 7B1D     		adds	r3, r7, #5
 970 0194 1B78     		ldrb	r3, [r3]
 971 0196 2F2B     		cmp	r3, #47
 972 0198 05D0     		beq	.L22
  82:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 			break;
  83:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		index++;
 973              		.loc 1 83 0
 974 019a BB1D     		adds	r3, r7, #6
 975 019c 1A88     		ldrh	r2, [r3]
 976 019e BB1D     		adds	r3, r7, #6
 977 01a0 0132     		adds	r2, r2, #1
 978 01a2 1A80     		strh	r2, [r3]
  84:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	}
 979              		.loc 1 84 0
 980 01a4 D0E7     		b	.L20
 981              	.L22:
  82:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 			break;
 982              		.loc 1 82 0
 983 01a6 C046     		nop
  85:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** }
 984              		.loc 1 85 0
 985 01a8 C046     		nop
 986 01aa BD46     		mov	sp, r7
 987 01ac 03B0     		add	sp, sp, #12
 988              		@ sp needed
 989 01ae 90BD     		pop	{r4, r7, pc}
 990              	.L24:
 991              		.align	2
 992              	.L23:
 993 01b0 00000000 		.word	mail
 994              		.cfi_endproc
 995              	.LFE3:
 997              		.align	2
 998              		.global	app_init
 999              		.code	16
 1000              		.thumb_func
 1002              	app_init:
 1003              	.LFB4:
  86:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 
  87:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** void app_init()
  88:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** {
 1004              		.loc 1 88 0
 1005              		.cfi_startproc
 1006              		@ args = 0, pretend = 0, frame = 0
 1007              		@ frame_needed = 1, uses_anonymous_args = 0
 1008 01b4 80B5     		push	{r7, lr}
 1009              		.cfi_def_cfa_offset 8
 1010              		.cfi_offset 7, -8
 1011              		.cfi_offset 14, -4
 1012 01b6 00AF     		add	r7, sp, #0
 1013              		.cfi_def_cfa_register 7
  89:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	GPIO_E.moder = 0x55555555;   /*port E utport*/
 1014              		.loc 1 89 0
 1015 01b8 074B     		ldr	r3, .L26
 1016 01ba 084A     		ldr	r2, .L26+4
 1017 01bc 1A60     		str	r2, [r3]
  90:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	GPIO_E.otyper = 0x00000000;  /*push pull*/
 1018              		.loc 1 90 0
 1019 01be 064B     		ldr	r3, .L26
 1020 01c0 0022     		movs	r2, #0
 1021 01c2 9A80     		strh	r2, [r3, #4]
  91:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	GPIO_E.ospeedr = 0x55555555; /*medium speed, om problem sätt till låg*/
 1022              		.loc 1 91 0
 1023 01c4 044B     		ldr	r3, .L26
 1024 01c6 054A     		ldr	r2, .L26+4
 1025 01c8 9A60     		str	r2, [r3, #8]
  92:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	GPIO_E.pupdr = 0x55550000;   /* pullup inputs*/
 1026              		.loc 1 92 0
 1027 01ca 034B     		ldr	r3, .L26
 1028 01cc 044A     		ldr	r2, .L26+8
 1029 01ce DA60     		str	r2, [r3, #12]
  93:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** }
 1030              		.loc 1 93 0
 1031 01d0 C046     		nop
 1032 01d2 BD46     		mov	sp, r7
 1033              		@ sp needed
 1034 01d4 80BD     		pop	{r7, pc}
 1035              	.L27:
 1036 01d6 C046     		.align	2
 1037              	.L26:
 1038 01d8 00100240 		.word	1073876992
 1039 01dc 55555555 		.word	1431655765
 1040 01e0 00005555 		.word	1431633920
 1041              		.cfi_endproc
 1042              	.LFE4:
 1044              		.align	2
 1045              		.global	main
 1046              		.code	16
 1047              		.thumb_func
 1049              	main:
 1050              	.LFB5:
  94:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 
  95:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** void main(void)
  96:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** {
 1051              		.loc 1 96 0
 1052              		.cfi_startproc
 1053              		@ args = 0, pretend = 0, frame = 0
 1054              		@ frame_needed = 1, uses_anonymous_args = 0
 1055 01e4 80B5     		push	{r7, lr}
 1056              		.cfi_def_cfa_offset 8
 1057              		.cfi_offset 7, -8
 1058              		.cfi_offset 14, -4
 1059 01e6 00AF     		add	r7, sp, #0
 1060              		.cfi_def_cfa_register 7
  97:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	uint8_t c;
  98:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	iniuart();
 1061              		.loc 1 98 0
 1062 01e8 FFF7FEFF 		bl	iniuart
  99:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	load_sprite(&mail, mailicon_bits, mailicon_width, mailicon_height);
 1063              		.loc 1 99 0
 1064 01ec 1049     		ldr	r1, .L30
 1065 01ee 1148     		ldr	r0, .L30+4
 1066 01f0 3D23     		movs	r3, #61
 1067 01f2 5022     		movs	r2, #80
 1068 01f4 FFF704FF 		bl	load_sprite
 100:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	app_init();
 1069              		.loc 1 100 0
 1070 01f8 FFF7FEFF 		bl	app_init
 101:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	ascii_init();
 1071              		.loc 1 101 0
 1072 01fc FFF7FEFF 		bl	ascii_init
 102:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	//graphic_initialize();
 103:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	graphic_clear_screen();
 1073              		.loc 1 103 0
 1074 0200 FFF7FEFF 		bl	graphic_clear_screen
 104:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	display_off();
 1075              		.loc 1 104 0
 1076 0204 FFF7FEFF 		bl	display_off
 1077              	.L29:
 1078              	.LBB6:
 105:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	//draw_sprite(&mail, 0, 0, 1);
 106:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	while(1)
 107:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	{
 108:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		writeMessage();
 1079              		.loc 1 108 0 discriminator 1
 1080 0208 FFF7FEFF 		bl	writeMessage
 109:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		delay_ms(2000);
 1081              		.loc 1 109 0 discriminator 1
 1082 020c FA23     		movs	r3, #250
 1083 020e DB00     		lsls	r3, r3, #3
 1084 0210 1800     		movs	r0, r3
 1085 0212 FFF7FEFF 		bl	delay_ms
 110:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		pixel(1,1,0);
 1086              		.loc 1 110 0 discriminator 1
 1087 0216 0022     		movs	r2, #0
 1088 0218 0121     		movs	r1, #1
 1089 021a 0120     		movs	r0, #1
 1090 021c FFF7FEFF 		bl	pixel
 111:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 		draw_sprite(&mail, 0, 0, 0);
 1091              		.loc 1 111 0 discriminator 1
 1092 0220 0448     		ldr	r0, .L30+4
 1093 0222 0023     		movs	r3, #0
 1094 0224 0022     		movs	r2, #0
 1095 0226 0021     		movs	r1, #0
 1096 0228 FFF7FEFF 		bl	draw_sprite
 1097              	.LBE6:
 112:/Users/Simon/chalmers-eda487/UART_Messaging/startup.c **** 	}
 1098              		.loc 1 112 0 discriminator 1
 1099 022c ECE7     		b	.L29
 1100              	.L31:
 1101 022e C046     		.align	2
 1102              	.L30:
 1103 0230 00000000 		.word	mailicon_bits
 1104 0234 00000000 		.word	mail
 1105              		.cfi_endproc
 1106              	.LFE5:
 1108              	.Letext0:
 1109              		.file 2 "/Users/Simon/chalmers-eda487/UART_Messaging/types.h"
 1110              		.file 3 "/Users/Simon/chalmers-eda487/UART_Messaging/gpio.h"
 1111              		.file 4 "/Users/Simon/chalmers-eda487/UART_Messaging/mailicon.xbm"
