CFLAGS = -std=c99 -W -Wall -O3 -D_GNU_SOURCE=1 -g -fsanitize=address
LDLIBS = -lm -llapacke

all: encode decode

test: encode decode
	./encode input.ppm /dev/null
#	./encode input.ppm /dev/stdout | ./decode /dev/stdin output.ppm

%: %.c *.h
	$(CC) $(CFLAGS) $< $(LDLIBS) -o $@

clean:
	rm -f encode decode

