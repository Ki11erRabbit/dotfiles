#include <unistd.h>

int main () {

  while (1) {
    //does nothing to stay alive so that it can be killed off
    sleep(100);
  }
  return 0;
}
