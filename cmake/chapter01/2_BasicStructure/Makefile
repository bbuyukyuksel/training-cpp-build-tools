#############
## TARGETS ##
#############

build: main.o my_lib.o
	g++ -o main main.o my_lib.o

main.o:
	g++ -c main.cc

my_lib.o:
	g++ -c my_lib.cc

execute:
	./main

clean:
	rm -f *.o
	rm -f main