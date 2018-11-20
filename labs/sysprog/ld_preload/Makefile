SONAME = libhook.so
GCC = gcc

all : hook

hook:
	$(GCC) -g -c -fPIC hook.c -o hook.o
	$(GCC) -g -shared -Wl,-soname,$(SONAME) -o $(SONAME) hook.o
	mv $(SONAME) ../gps/lib


#cp hook.h ../include