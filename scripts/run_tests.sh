#!/bin/bash

# Comprehensive Test Runner Script
# Runs all test types with proper reporting

set -e

echo "🧮 Calculator Online - Test Suite"
echo "=================================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Test results
UNIT_PASSED=0
UNIT_FAILED=0
WIDGET_PASSED=0
WIDGET_FAILED=0
INTEGRATION_PASSED=0
INTEGRATION_FAILED=0

# Function to run tests
run_test_suite() {
    local suite_name=$1
    local test_path=$2
    local color=$3
    
    echo -e "${color}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${color}Running $suite_name Tests...${NC}"
    echo -e "${color}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    
    if flutter test "$test_path" --reporter=expanded; then
        echo ""
        echo -e "${GREEN}✅ $suite_name tests passed${NC}"
        eval "${suite_name}_PASSED=1"
        return 0
    else
        echo ""
        echo -e "${RED}❌ $suite_name tests failed${NC}"
        eval "${suite_name}_FAILED=1"
        return 1
    fi
}

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get
echo ""

# Run unit tests
if run_test_suite "Unit" "test/unit/" "$BLUE"; then
    UNIT_PASSED=1
fi
echo ""

# Run widget tests
if run_test_suite "Widget" "test/calculator/ test/currency/ test/graphing/" "$YELLOW"; then
    WIDGET_PASSED=1
fi
echo ""

# Run integration tests
if run_test_suite "Integration" "test/integration/" "$GREEN"; then
    INTEGRATION_PASSED=1
fi
echo ""

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📊 Test Summary"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

if [ $UNIT_PASSED -eq 1 ]; then
    echo -e "${GREEN}✅ Unit Tests: PASSED${NC}"
else
    echo -e "${RED}❌ Unit Tests: FAILED${NC}"
fi

if [ $WIDGET_PASSED -eq 1 ]; then
    echo -e "${GREEN}✅ Widget Tests: PASSED${NC}"
else
    echo -e "${RED}❌ Widget Tests: FAILED${NC}"
fi

if [ $INTEGRATION_PASSED -eq 1 ]; then
    echo -e "${GREEN}✅ Integration Tests: PASSED${NC}"
else
    echo -e "${RED}❌ Integration Tests: FAILED${NC}"
fi

echo ""

# Overall status
if [ $UNIT_PASSED -eq 1 ] && [ $WIDGET_PASSED -eq 1 ] && [ $INTEGRATION_PASSED -eq 1 ]; then
    echo -e "${GREEN}🎉 All tests passed!${NC}"
    exit 0
else
    echo -e "${RED}💥 Some tests failed${NC}"
    exit 1
fi

