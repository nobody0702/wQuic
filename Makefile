# Makefile

# Compiler and flags
CXX := g++
CXXFLAGS := -std=c++11 -Wall

SRC_DIR := src
BUILD_DIR := $(SRC_DIR)/build

CORE_FILES := $(wildcard $(SRC_DIR)/core/*.cpp)
TEST_FILES := $(wildcard $(SRC_DIR)/test/*.cpp)

CORE_OBJ_FILES := $(patsubst $(SRC_DIR)/core/%.cpp,$(BUILD_DIR)/%.o,$(CORE_FILES))
TEST_OBJ_FILES := $(patsubst $(SRC_DIR)/test/%.cpp,$(BUILD_DIR)/%.o,$(TEST_FILES))

EXECUTABLE := test_engine

.PHONY: all clean

all: $(EXECUTABLE)

$(BUILD_DIR)/%.o: $(SRC_DIR)/core/%.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/test/%.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $< -o $@ -I$(SRC_DIR)

$(EXECUTABLE): $(CORE_OBJ_FILES) $(TEST_OBJ_FILES)
	$(CXX) $^ -o $@

clean:
	rm -rf $(BUILD_DIR) $(EXECUTABLE)
