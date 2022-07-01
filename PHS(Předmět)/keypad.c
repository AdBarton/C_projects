#include <AT89C51CC03.h>

#include "typy.h"


__bit KeyHit(void)
{
	register byte i=255,key=0;
	P0=0x0F;
	do{
	
	   if(key!=P0)
	   {
		  key=P0;
		  i=0;
	   }

	}while(--i);
	return key!=0xF;
}


byte KeyByte(void)
{
	register byte key,i;
	while(!KeyHit());
	P0=0xEF;
	i=2;
	do{} while(--i);
	key=P0;
	P0=0xFF;
	switch(key) {
	  case 0xEE: return 1;
	  case 0xED: return 2;
	  case 0xEB: return 3;
	  case 0xE7: return 0xA;
	}

	P0=0xDF;
	i=2;
	do{} while(--i);
	key=P0;
	P0=0xFF;
	switch(key) {
	  case 0xDE: return 4 ;
	  case 0xDD: return 5;
	  case 0xDB: return 6;
	  case 0xD7: return 0xB;
	}
	P0=0xBF;
	i=2;
	do{} while(--i);
	key=P0;
	P0=0xFF;
	switch(key) {
	  case 0xBE: return 7;
	  case 0xBD: return 8;
	  case 0xBB: return 9;
	  case 0xB7: return 0xC;
	}
	P0=0x7F;
	i=2;
	do{} while(--i);
	key=P0;
	P0=0xFF;
	switch(key) {
	  case 0x7E: return 0xE;
	  case 0x7D: return 0;
	  case 0x7B: return 0xF;
	  case 0x77: return 0xD;
	}
	return 0xFF;
}

char KeyChar(void)
{
	register byte key,i;
	while(!KeyHit());
	P0=0xEF;
	i=2;
	do{} while(--i);
	key=P0;
	P0=0xFF;
	switch(key) {

	  case 0xEE: return '1';
	  case 0xED: return '2';
	  case 0xEB: return '3';
	  case 0xE7: return 'A';
	}

	P0=0xDF;
	i=2;
	do{} while(--i);
	key=P0;
	P0=0xFF;
	switch(key) {

	  case 0xDE: return '4';
	  case 0xDD: return '5';
	  case 0xDB: return '6';
	  case 0xD7: return 'B';
	}
	P0=0xBF;
	i=2;
	do{} while(--i);
	key=P0;
	P0=0xFF;
	switch(key) {

	  case 0xBE: return '7';
	  case 0xBD: return '8';
	  case 0xBB: return '9';
	  case 0xB7: return 'C';
	}
	P0=0x7F;
	i=2;
	do{} while(--i);
	key=P0;
	P0=0xFF;
	switch(key) {

	  case 0x7E: return '*';
	  case 0x7D: return '0';
	  case 0x7B: return '#';
	  case 0x77: return 'D';
	}
	return '\0';

}
