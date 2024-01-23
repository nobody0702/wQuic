# Makefile

# Compiler and flags
CXX := g++
CXXFLAGS := -std=c++11 -Wall

SRC_DIR := src
BUILD_DIR := $(SRC_DIR)/build

NET_FILES := $(wildcard $(SRC_DIR)/net/*.cpp)
TEST_FILES := $(wildcard $(SRC_DIR)/test/*.cpp)

NET_OBJ_FILES := $(patsubst $(SRC_DIR)/net/%.cpp,$(BUILD_DIR)/%.o,$(NET_FILES))
TEST_OBJ_FILES := $(patsubst $(SRC_DIR)/test/%.cpp,$(BUILD_DIR)/%.o,$(TEST_FILES))

EXECUTABLE := test_conn

.PHONY: all clean

all: $(EXECUTABLE)

$(BUILD_DIR)/%.o: $(SRC_DIR)/net/%.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $< -o $@ -I$(SRC_DIR)

$(BUILD_DIR)/%.o: $(SRC_DIR)/test/%.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $< -o $@ -I$(SRC_DIR)

$(EXECUTABLE): $(NET_OBJ_FILES) $(TEST_OBJ_FILES)
	$(CXX) $^ -o $@

clean:
	rm -rf $(BUILD_DIR) $(EXECUTABLE)
