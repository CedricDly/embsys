GCC = gcc
BIN = shm_reader

all:
	$(GCC) handler.c opts.c shm_reader.c -o $(BIN) \
		-I. -I../gps/include -lrt -lpthread

clean:
	rm -f $(BIN)
