docker run --rm -v $(pwd)/..:/workdir -u $(id -u):$(id -g) mwaeckerlin/mingw \
  x86_64-w64-mingw32-gcc -o extras/scheme.exe scheme.c
