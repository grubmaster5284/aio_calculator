#!/bin/bash

# Test Coverage Script
# Generates comprehensive test coverage reports

set -e

echo "🧮 Calculator Online - Test Coverage Report"
echo "============================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}❌ Flutter is not installed${NC}"
    exit 1
fi

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Run tests with coverage
echo ""
echo "🧪 Running tests with coverage..."
flutter test --coverage

# Check if coverage directory exists
if [ ! -d "coverage" ]; then
    echo -e "${RED}❌ Coverage directory not found${NC}"
    exit 1
fi

# Format coverage
echo ""
echo "📊 Formatting coverage report..."
dart pub global activate coverage 2>/dev/null || true
dart pub global run coverage:format_coverage \
    --lcov \
    --in=coverage \
    --out=coverage/lcov.info \
    --packages=.dart_tool/package_config.json \
    --report-on=lib

# Generate HTML report if genhtml is available
if command -v genhtml &> /dev/null; then
    echo ""
    echo "📄 Generating HTML coverage report..."
    genhtml coverage/lcov.info -o coverage/html --no-function-coverage
    echo -e "${GREEN}✅ HTML report generated at: coverage/html/index.html${NC}"
else
    echo -e "${YELLOW}⚠️  genhtml not found. Install lcov to generate HTML reports${NC}"
    echo "   macOS: brew install lcov"
    echo "   Linux: sudo apt-get install lcov"
fi

# Calculate coverage percentage
if [ -f "coverage/lcov.info" ]; then
    echo ""
    echo "📈 Coverage Summary:"
    echo "--------------------"
    
    # Extract coverage percentage (basic parsing)
    TOTAL_LINES=$(grep -c "^SF:" coverage/lcov.info || echo "0")
    HIT_LINES=$(grep "^DA:" coverage/lcov.info | grep -v ",0$" | wc -l || echo "0")
    ALL_LINES=$(grep "^DA:" coverage/lcov.info | wc -l || echo "0")
    
    if [ "$ALL_LINES" -gt 0 ]; then
        COVERAGE=$(awk "BEGIN {printf \"%.2f\", ($HIT_LINES/$ALL_LINES)*100}")
        echo "Total Lines: $ALL_LINES"
        echo "Covered Lines: $HIT_LINES"
        echo "Coverage: ${COVERAGE}%"
        
        # Color code based on coverage
        if (( $(echo "$COVERAGE >= 80" | bc -l) )); then
            echo -e "${GREEN}✅ Coverage meets target (80%+)${NC}"
        elif (( $(echo "$COVERAGE >= 60" | bc -l) )); then
            echo -e "${YELLOW}⚠️  Coverage is below target (60-80%)${NC}"
        else
            echo -e "${RED}❌ Coverage is low (< 60%)${NC}"
        fi
    fi
fi

echo ""
echo "✅ Coverage report generation complete!"
echo ""
echo "📁 Files generated:"
echo "   - coverage/lcov.info (LCOV format)"
if [ -d "coverage/html" ]; then
    echo "   - coverage/html/index.html (HTML report)"
fi

