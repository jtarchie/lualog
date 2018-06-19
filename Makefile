all: lib run

lib:
	ragel -C -G2 -e parse.rl
	gcc -dynamiclib -fPIC -o libparse.dylib -Wall parse.c

run:
	busted

clean:
	rm *.so
