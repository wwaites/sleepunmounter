#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  if (fork() == 0) {
    argv++;

    chdir("/");
    close(0);
    close(1);
    close(2);

    execv(argv[0], argv);
  }
}
