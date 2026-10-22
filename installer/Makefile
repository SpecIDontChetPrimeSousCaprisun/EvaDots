CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -Iinclude
TARGET = installer

SRC = $(shell find src -name '*.cpp')
OBJ_DIR = build
OBJ = $(SRC:src/%.cpp=$(OBJ_DIR)/src/%.o)

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(OBJ) -o $(TARGET)

$(OBJ_DIR)/src/%.o: src/%.cpp
	mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR)
	rm -f $(TARGET)

test: all
	./$(TARGET)

.PHONY: all clean
