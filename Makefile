
EXE:=./BUILD/$(input)
SRC:=./APPS/$(input).cbl
ARGS:=-x -I ./LIB
MOD:=./BUILD/$(input).so
ARGSM:=-m -I ./LIB


$(EXE): $(SRC)
	@clear
	@cobc $(ARGS) -o $(EXE) $(SRC)

module:
	@cobc $(ARGSM) -o $(MOD) $(SRC)

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

