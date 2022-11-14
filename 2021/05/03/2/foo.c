#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int add(int,int);

int main(int argc,char **argv) {

  
  int x;

  x = add(2,3);

  printf("x = %d\n",x);

  return 0;
  
}
