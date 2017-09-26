CC = gcc
OPT = -S

SUFFIXES = .c .o .s

# .SUFFIXES: $(SUFFIXES) .

PROG = hello_world
SRC = src/$(PROG).c
# OBJ = $(SRC:.c=.o)


all: $(PROG)

project:
	mkdir src
	mkdir bin
	@mv $(PROG).c $(PROG).s src
	@mv $(PROG).o $(PROG) bin

$(PROG): $(PROG).o $(PROG).s
	$(CC) -o bin/$(PROG) bin/$<
	rm src/*.s

%.o: src/%.c
	$(CC) -o bin/$@ -c $< 
	
%.s: src/%.c
	$(CC) $(OPT) -o src/$@ -c $<

clean:
	rm *.s *.o
	
# $< nom de la première dépendance
# $@ nom de la cible
# $^ liste de toute les dépendances
# $* nom du fichier dans suffixe
# $? liste des dépendances plus récentes que la cible
#
# FORMAT:
# 
# Cible [Cibles ... ]: {dépendances}
#	[TAB] action