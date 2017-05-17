#ifndef KEYPAD_H
#define KEYPAD_H

typedef struct tKey {
  uint8_t lastKey;
  uint8_t done;
  uint8_t nextChar;
} key;
uint8_t keyb();
key t9();

#endif
