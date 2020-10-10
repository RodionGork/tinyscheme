#include <stdio.h>

#include "../scheme.h"
#include "../scm_priv.h"

static scheme sc;
static int initialized = 0;

void scheme_exec(char*s) {
  if (!initialized) {
    scheme_init(&sc);
    scheme_set_output_port_file(&sc, stdout);
    initialized = 1;
    setvbuf(stdout, NULL, _IONBF, 0);
  }
  scheme_load_string(&sc, s);
}
