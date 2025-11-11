
EXE:=./BUILD/$(input)
SRC:=./TEST/$(input).cbl
#ARGS:=-x -I ./LIB
ARGS:=-v -x -I ./LIB -I ./LIBT


$(EXE): $(SRC)
	@clear
	@cobc $(ARGS) -o $(EXE) $(SRC)


compile:
	@cobc $(ARGS) -o $(EXE) $(SRC)

clean:
	@rm $(EXE)

run:
	@echo "------------------------------------------------------------------"
	@$(EXE)
	@echo

clrscr:
	@clear
	@echo "------------------------------------------------------------------"
	@echo "-- Monto Escrito / Cobol                    2025 / Julián Vidal --"
	@echo "------------------------------------------------------------------"

all: clrscr clean compile run 

