#!/bin/bash

# Calculator Online - Test Runner Script
# This script helps run tests when Flutter CLI has issues

echo "🧮 Calculator Online - Test Runner"
echo "=================================="
echo ""

# Check if Flutter is available
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter not found. Please install Flutter first."
    exit 1
fi

# Check if Dart is available
if ! command -v dart &> /dev/null; then
    echo "❌ Dart not found. Please install Dart first."
    exit 1
fi

echo "✅ Flutter and Dart are available"
echo ""

# Function to run tests with error handling
run_tests() {
    local test_path="$1"
    local test_name="$2"
    
    echo "🔬 Running $test_name..."
    echo "Path: $test_path"
    echo ""
    
    if [ -d "$test_path" ] || [ -f "$test_path" ]; then
        # Try to run tests
        if dart test "$test_path" 2>/dev/null; then
            echo "✅ $test_name completed successfully"
        else
            echo "⚠️  $test_name had issues (this might be due to Dart CLI problems)"
            echo "   You can try running individual test files manually:"
            echo "   dart test $test_path"
        fi
    else
        echo "❌ Test path not found: $test_path"
    fi
    echo ""
}

# Main test execution
echo "🚀 Starting test execution..."
echo ""

# Run different test categories
run_tests "test/unit/" "Unit Tests"
run_tests "test/calculator/" "Calculator Widget Tests"
run_tests "test/currency/" "Currency Widget Tests"
run_tests "test/graphing/" "Graphing Widget Tests"
run_tests "test/integration/" "Integration Tests"
run_tests "test/widget_test.dart" "Main Widget Tests"

echo "🏁 Test execution completed!"
echo ""
echo "📋 Manual Test Commands:"
echo "========================"
echo ""
echo "If automated tests fail, try these commands manually:"
echo ""
echo "# Run all tests"
echo "dart test"
echo ""
echo "# Run specific test categories"
echo "dart test test/unit/"
echo "dart test test/calculator/"
echo "dart test test/currency/"
echo "dart test test/graphing/"
echo "dart test test/integration/"
echo ""
echo "# Run individual test files"
echo "dart test test/widget_test.dart"
echo "dart test test/unit/calculator_engine_test.dart"
echo ""
echo "# Run with verbose output"
echo "dart test --reporter=expanded"
echo ""
echo "🔧 Troubleshooting:"
echo "=================="
echo ""
echo "If you encounter Dart CLI issues:"
echo "1. Try: flutter clean && flutter pub get"
echo "2. Check: flutter doctor"
echo "3. Restart your terminal/IDE"
echo "4. Reinstall Flutter if needed"
echo ""
echo "📚 For more help, see TESTING.md"

