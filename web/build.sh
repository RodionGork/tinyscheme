docker run --rm -v $(pwd)/..:/src -u $(id -u):$(id -g) emscripten/emsdk emcc \
  -DSTANDALONE=0 web/my.c scheme.c \
  -s EXPORTED_FUNCTIONS='["_scheme_exec", "_get_version"]' \
  -s EXPORTED_RUNTIME_METHODS='["ccall","cwrap"]' \
  --embed-file init.scm \
  -o web/scheme.js --pre-js web/setup-pre.js
