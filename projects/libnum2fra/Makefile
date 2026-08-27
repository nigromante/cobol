
BIN:=libnum2fra.so


SRCDIR = ./src
CODEDIR = ./code
BINDIR = ./bin
INSTALLDIR = ../../install

SRCS := $(shell find $(SRCDIR) -name "*.cbl")

TARGET = $(BINDIR)/$(BIN)

ARGS:=-v -m -Wothers -I $(CODEDIR)

all: clean build install

build: $(TARGET)

$(TARGET):$(SRCS)
	cobc $(ARGS) -o $@ $^

clean:
	@rm -rf $(BINDIR)/*

run:
	@$(TARGET)

install:
	cp $(TARGET) $(INSTALLDIR)
