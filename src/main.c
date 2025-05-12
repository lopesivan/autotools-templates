#ifdef HAVE_CONFIG_H
#include "config.h"
#endif
#include <stdio.h>

int main(void) {
  printf("Autor: %s\n", AUTHOR_NAME);
  printf("Versão: %s\n", PACKAGE_VERSION);
  printf("Porta: %d\n", DEFAULT_PORT);

#ifdef DEBUG
  puts("Compilado com DEBUG!");
#endif

#ifdef ABOBRINHA
  puts("Compilado com ABOBRINHA!");
#endif

  if (SECURITY)
    puts("SECURITY LIGADO");
  else
    puts("SECURITY DESLIGADO");

  return 0;
}
