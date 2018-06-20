all: lib run

lib:
	ragel -C -G2 -e parse.rl
	gcc -dynamiclib -fPIC -o libparse.dylib -O3 -Wextra -Wall parse.c

run:
	busted

clean:
	rm *.so
