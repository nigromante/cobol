
EXE:=./BUILD/RELEASE/$(input)
SRC:=./SRC/APPS/$(input).cbl
ARGS:=-x -I ./SRC/CODE

MOD:=./BUILD/RELEASE/LIB/$(input).so
SRCM:=./SRC/MODULES/$(input).cbl
ARGSM:=-m -I ./SRC/CODE

$(EXE):$(SRC)
	@cobc $(ARGS) -o $(EXE) $(SRC) 

help:
	@clear
	@echo "make input=TAGET clean|compile|run|all|module"
	@echo "o"
	@echo "make -f Makefile.test input=TAGET clean|compile|run|all|module"
	@echo

module:
	@cobc $(ARGSM) -o $(MOD) $(SRCM)

compile:
	@cobc $(ARGS) -o $(EXE) $(SRC)

clean:
	@rm $(EXE)

run:
	@$(EXE)
	@echo

clrscr:
	@clear
	@echo "------------------------------------------------------------------"
	@echo "-- Apps / Cobol                             2025 / Julián Vidal --"
	@echo "------------------------------------------------------------------"

all: clrscr clean compile run 

