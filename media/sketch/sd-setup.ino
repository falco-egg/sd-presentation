#include<SPI.h>
#include<SD.h>

void setup {
  if(!SD.begin(4)) {
    //error
    while(true);
  }

  // success
}
