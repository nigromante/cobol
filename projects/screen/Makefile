
EXE:=screen


SRCDIR = ./src
BINDIR = ./bin
INSTALLDIR = ../../install

SRCS := $(shell find $(SRCDIR) -name "*.cbl")

TARGET = $(BINDIR)/$(EXE)

ARGS:=-v -x -Wothers -I ./screens 

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
