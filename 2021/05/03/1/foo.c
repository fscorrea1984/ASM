#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

char str[13] = "Hello World!\0";

int main(int argc,char **argv) {

  write(0x01,str,0xd);

  return 0;
  
}
