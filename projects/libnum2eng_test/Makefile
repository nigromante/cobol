
BIN:=libnum2eng_test


SRCDIR = ./src
BINDIR = ./bin
INSTALLDIR = ../../install

SRCS := $(shell find $(SRCDIR) -name "*.cbl")

TARGET = $(BINDIR)/$(BIN)

ARGS:=-v -x -Wothers -I ./screen 

all: clean build install

build: $(TARGET)

$(TARGET):$(SRCS)
	cobc $(ARGS) -o $@ $^

clean:
	@rm -rf $(BINDIR)/*

run:
	bash ../../scripts/runlib.sh $(TARGET)

install:
	cp $(TARGET) $(INSTALLDIR)
