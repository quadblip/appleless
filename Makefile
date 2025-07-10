CC_CPP := g++
CC_C := gcc
CFLAGS := -Iincludes -Wall -Wextra -std=c++17
SRC_DIR := sources
OBJ_DIR := obj
TARGET := appleless

C_SOURCES := $(wildcard $(SRC_DIR)/*.c)
CPP_SOURCES := $(wildcard $(SRC_DIR)/*.cpp)

C_OBJECTS := $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(C_SOURCES))
CPP_OBJECTS := $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(CPP_SOURCES))

OBJECTS := $(C_OBJECTS) $(CPP_OBJECTS)

all: $(OBJ_DIR) $(TARGET)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC_C) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CC_CPP) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJECTS)
	$(CC_CPP) $(OBJECTS) -o $(TARGET)

clean:
	rm -rf $(OBJ_DIR) $(TARGET)

.PHONY: all clean
