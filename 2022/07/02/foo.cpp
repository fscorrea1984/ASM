#include<iostream>
#include<string>
#include<bitset>

using namespace std;

extern "C" unsigned f(unsigned x, unsigned y);

int main(int argc, char **argv){

  unsigned z = f(745738784,546833451);
  bitset<32> baz(z);
  cout << baz.to_string()  << endl;
  return 0;
  
}

/**--

pext --- parallel bits extract --- https://www.felixcloutier.com/x86/pext

--**/
