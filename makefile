# Makefile for TinyScheme

# there may be much legacy :(
# tidy-up still in progress, sorry

# Unix, generally
COMPILER=gcc
CC=$(COMPILER) -fpic -std=c99 -pedantic -Wall
DEBUG=-g -Wall -Wno-char-subscripts -O
Osuf=o
SOsuf=so
LIBsuf=a
EXE_EXT=
LIBPREFIX=lib
OUT = -o $@
RM= -rm -f
AR= ar crs

# Linux
LD = gcc
LDFLAGS = -shared
DEBUG=-g -Wall -Wno-char-subscripts -O
SYS_LIBS= -ldl -lm
PLATFORM_FEATURES= -DSUN_DL=1

FEATURES = $(PLATFORM_FEATURES) -DUSE_DL=1

OBJS = scheme.$(Osuf) dynload.$(Osuf)

LIBTARGET = $(LIBPREFIX)tinyscheme.$(SOsuf)
STATICLIBTARGET = $(LIBPREFIX)tinyscheme.$(LIBsuf)

execonly: scheme.h scm_priv.h scm_opdf.h
	$(CC) -I. -O2 -o scheme$(EXE_EXT) scheme.c $(SYS_LIBS)
	@echo -------
	@echo Built executable only: ./scheme$(EXE_EXT)
	@echo run 'make all' if need to build libraries

all: $(LIBTARGET) $(STATICLIBTARGET) scheme$(EXE_EXT)
	@echo -------
	@echo All done, enjoy ./scheme$(EXE_EXT)

%.$(Osuf): %.c
	$(CC) -I. -c $(DEBUG) $(FEATURES) $(DL_FLAGS) $<

$(LIBTARGET): $(OBJS)
	$(LD) $(LDFLAGS) $(OUT) $(OBJS) $(SYS_LIBS)

scheme$(EXE_EXT): $(OBJS)
	$(CC) -o $@ $(DEBUG) $(OBJS) $(SYS_LIBS)

$(STATICLIBTARGET): $(OBJS)
	$(AR) $@ $(OBJS)

$(OBJS): scheme.h scm_priv.h scm_opdf.h
dynload.$(Osuf): dynload.h

clean:
	$(RM) $(OBJS) $(LIBTARGET) $(STATICLIBTARGET) scheme$(EXE_EXT)
	$(RM) tinyscheme.ilk tinyscheme.map tinyscheme.pdb tinyscheme.exp
	$(RM) scheme.ilk scheme.map scheme.pdb scheme.lib scheme.exp
	$(RM) *~

TAGS_SRCS = scheme.h scheme.c dynload.h dynload.c

tags: TAGS
TAGS: $(TAGS_SRCS)
	etags $(TAGS_SRCS)
