all: lib run

lib:
	ragel -C -G2 -e src/syslog/parser/parse.rl -o src/syslog/parser/parse.c
	gcc -dynamiclib -fPIC -o libparse.dylib -O3 -Wextra -Wall src/syslog/parser/parse.c

run:
	busted

clean:
	rm *.so
