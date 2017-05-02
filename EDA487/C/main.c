#include <stdio.h>
#include <string.h>
#include <unistd.h>


void printBinary(unsigned short byte)
{
	for(int i = 15; i>=0; i--)
	{
		int bit = (byte >> i) & 0x01;
        printf("%d", bit);
	}
}

void printDecimal(char str[])
{
	unsigned char byte = 0;
	for(int i = 0; i<8; i++)
	{
		if(str[i] == '1')
		{
			byte |= (1<<(7-i));
		}
	}
	printf("%d", byte);
}

void clearscreen()
{
    for(int i=0; i<80; i++)
        printf("\n");
}

void printSpaces(short n)
{
	for(int i=0; i<n; i++)
	{
		printf("%s", " ");
	}
}

void printLines(short n)
{
	for(int i=0; i<n; i++)
	{
		printf("\n");
	}
}


int main()
{
	unsigned short byteRight = 0x8000;
	unsigned short byteLeft = 0x4000;
	unsigned short counter = 0x0000;
	unsigned char goingRight = 0xFF;
	while(1)
	{
		for(int i = 0; i < 14; i++)
		{
			clearscreen();
			if(goingRight == 0xFF)
			{
				counter++;
			} else {
				counter--;
			}
			printSpaces(counter);
			if(counter == 0x0000)
			{
				goingRight = 0xFF;
			} else if(counter == 0x001A)
			{
				goingRight = 0x00;
			}
			if(goingRight == 0xFF)
			{
				counter++;
			} else {
				counter--;
			}
			printSpaces(counter);
			if(counter == 0x0000)
			{
				goingRight = 0xFF;
			} else if(counter == 0x001A)
			{
				goingRight = 0x00;
			}
			byteRight>>=1;
			byteLeft>>=1;
			printBinary(byteLeft | byteRight);
			printLines(counter);
			printf("\n");
			
			usleep(100000);
		}
		for(int i = 14; i >= 0; i--)
		{
			clearscreen();
			if(goingRight == 0xFF)
			{
				counter++;
			} else {
				counter--;
			}
			printSpaces(counter);
			if(counter == 0x0000)
			{
				goingRight = 0xFF;
			} else if(counter == 0x001A)
			{
				goingRight = 0x00;
			}
			if(goingRight == 0xFF)
			{
				counter++;
			} else {
				counter--;
			}
			printSpaces(counter);
			if(counter == 0x0000)
			{
				goingRight = 0xFF;
			} else if(counter == 0x001A)
			{
				goingRight = 0x00;
			}
			byteRight<<=1;
			byteLeft<<=1;
			printBinary(byteLeft | byteRight);
			printLines(counter);
			printf("\n");
			usleep(100000);
		}
		byteRight = 0x8000;
		byteLeft = 0x4000;
	}
}