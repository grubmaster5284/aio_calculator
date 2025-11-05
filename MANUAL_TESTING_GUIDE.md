# Manual Testing Guide for Calculator Online

This guide complements the automated test suite by providing comprehensive manual testing procedures for real-world usage scenarios and edge cases that require human verification.

> **Note**: Automated tests run via CI/CD and locally. Manual testing verifies UI/UX, accessibility, and real device behavior.

## 📋 Table of Contents

1. [Pre-Testing Setup](#pre-testing-setup)
2. [App Launch & Navigation](#1-app-launch--navigation)
3. [Calculator Feature Testing](#2-calculator-feature-testing)
4. [Currency Conversion Testing](#3-currency-conversion-testing)
5. [Graphing Feature Testing](#4-graphing-feature-testing)
6. [UI/UX Testing](#5-uiux-testing)
7. [Performance Testing](#6-performance-testing)
8. [Error Handling Testing](#7-error-handling-testing)
9. [Cross-Platform Testing](#8-cross-platform-testing)
10. [Accessibility Testing](#9-accessibility-testing)
11. [Device-Specific Testing](#10-device-specific-testing)

## 🔧 Pre-Testing Setup

### Prerequisites
- [ ] App is built and ready for testing
- [ ] `.env` file configured with API keys (for currency conversion)
- [ ] Test devices prepared (iOS, Android, Web, Desktop)
- [ ] Network connection available
- [ ] Test data prepared (currency codes, amounts, expressions)

### Test Environment
- [ ] Development build installed
- [ ] Debug mode enabled (for logging)
- [ ] Test accounts configured (if applicable)
- [ ] Clean app state (fresh install or cleared data)

## 1. App Launch & Navigation

### ✅ Basic App Launch
- [ ] App starts without crashing
- [ ] Splash screen appears (if implemented)
- [ ] Calculator page loads as default route
- [ ] Dark theme is applied correctly
- [ ] Navigation bar is visible and functional
- [ ] App state initializes correctly
- [ ] No console errors or warnings

**Test Steps:**
1. Launch the app
2. Observe initial load time (< 3 seconds)
3. Verify default screen is calculator
4. Check theme consistency
5. Verify navigation elements are visible

### ✅ Navigation Testing

**Navigation Paths:**
- [ ] Calculator → Converter Modes Page navigation works
- [ ] Calculator → Graphing Page navigation works
- [ ] Converter Modes Page → Currency Converter navigation works
- [ ] Converter Modes Page → Calculator (back button) navigation works
- [ ] Currency Converter → Converter Modes Page (back button) navigation works
- [ ] Currency Converter → Converter Modes Page (via converter icon in nav bar) navigation works
- [ ] Graphing → Calculator navigation works
- [ ] Graphing → Converter Modes Page navigation works (if available)
- [ ] Navigation buttons are tappable/clickable
- [ ] Back navigation works correctly on all screens
- [ ] Navigation state persists correctly
- [ ] Deep linking works (if implemented)

**Converter Modes Page:**
- [ ] Converter modes grid displays all converter types
- [ ] Currency converter tile is tappable and navigates correctly
- [ ] Other converter tiles display correctly (even if not yet implemented)
- [ ] Grid layout adapts to portrait/landscape orientation
- [ ] Navigation bar shows correct buttons

**Test Scenarios:**
1. Navigate through all screens in sequence:
   - Calculator → Converter Modes → Currency Converter
   - Calculator → Graphing (via direct route or URL if on web)
   - Currency Converter → Converter Modes (back button) → Calculator
   - Currency Converter → Converter Modes (via converter icon) → Calculator
   - Graphing → Calculator (via back button or nav bar)
2. Test rapid navigation (tap quickly between screens)
3. Test back button behavior on each screen:
   - From Calculator: Should stay on calculator (no back stack)
   - From Converter Modes: Should return to Calculator
   - From Currency Converter: Should return to Converter Modes
   - From Graphing: Should return to Calculator
4. Test navigation from different entry points:
   - Direct URL navigation (web): `/`, `/converter`, `/graphing`, `/converter/currency`
   - Deep linking (if implemented)
5. Test navigation bar buttons on each screen:
   - Calculator page: Calculator icon (stays on calculator)
   - Converter Modes page: Back button and Converter icon
   - Currency Converter page: Back button and Converter icon
   - Graphing page: Back button and Graphing icon
6. Test navigation from Converter Modes Page:
   - Tap Currency tile → Should navigate to Currency Converter
   - Other converter tiles should display (even if not yet implemented)

## 2. Calculator Feature Testing

### ✅ Basic Arithmetic Operations

**Addition:**
- [ ] Single digit: 1 + 2 = 3
- [ ] Multi-digit: 123 + 456 = 579
- [ ] Decimal: 1.5 + 2.5 = 4.0
- [ ] Negative numbers: -5 + 3 = -2
- [ ] Large numbers: 999999 + 1 = 1000000

**Subtraction:**
- [ ] Simple: 5 - 3 = 2
- [ ] Negative result: 3 - 5 = -2
- [ ] Decimal: 10.5 - 3.2 = 7.3
- [ ] Zero: 5 - 5 = 0

**Multiplication:**
- [ ] Basic: 4 × 3 = 12
- [ ] By zero: 5 × 0 = 0
- [ ] Negative: -5 × 3 = -15
- [ ] Decimal: 2.5 × 4 = 10

**Division:**
- [ ] Basic: 8 ÷ 2 = 4
- [ ] Decimal result: 7 ÷ 2 = 3.5
- [ ] Division by zero: 5 ÷ 0 = Error (properly handled)
- [ ] Repeating decimal: 1 ÷ 3 = 0.333...

### ✅ Advanced Operations

**Unary Operations:**
- [ ] **Square root**: √9 = 3, √25 = 5
- [ ] **Power**: 2^3 = 8, 5^2 = 25
- [ ] **Percentage**: 50% = 0.5 (if implemented)
- [ ] **Reciprocal**: 1/4 = 0.25
- [ ] **Factorial**: 5! = 120

**Trigonometric Functions:**
- [ ] **Sine**: sin(90°) = 1 (degrees mode)
- [ ] **Cosine**: cos(0°) = 1 (degrees mode)
- [ ] **Tangent**: tan(45°) ≈ 1 (degrees mode)
- [ ] **Mode switching**: Degrees ↔ Radians

**Logarithmic Functions:**
- [ ] **Log base 10**: log(100) = 2
- [ ] **Natural log**: ln(e) = 1 (if implemented)
- [ ] **Invalid input**: log(-5) = Error

### ✅ Edge Cases

**Number Formatting:**
- [ ] Very large numbers display correctly (scientific notation if needed)
- [ ] Very small decimals display correctly
- [ ] Negative numbers display with minus sign
- [ ] Zero displays as "0"
- [ ] Trailing zeros are removed

**Input Handling:**
- [ ] Multiple decimal points are rejected
- [ ] Invalid characters are filtered
- [ ] Leading zeros are handled correctly
- [ ] Empty input is handled gracefully
- [ ] Overflow numbers are handled

**Operation Sequences:**
- [ ] Multiple consecutive operations: 1 + 2 + 3 + 4
- [ ] Chained operations: 2 + 3 × 4 (order of operations)
- [ ] Clear after operations resets correctly
- [ ] Backspace removes last digit correctly
- [ ] AC (All Clear) resets everything

### ✅ History Feature

- [ ] History panel displays previous calculations
- [ ] History entries show expression and result
- [ ] History can be cleared
- [ ] History persists between operations
- [ ] Tapping history entry uses that value
- [ ] History doesn't grow indefinitely (has limit)
- [ ] History scrolls correctly (if many entries)

**Test Scenarios:**
1. Perform 10+ calculations
2. Check history is populated
3. Clear history
4. Verify history is empty
5. Perform new calculations
6. Verify history updates

## 3. Currency Conversion Testing

> **Note**: Currency Conversion is accessed via the Converter Modes Page. Navigate to Converter Modes (`/converter`) and tap the "Currency" tile to access the currency converter.

### ✅ Currency Selection

**From Currency:**
- [ ] Dropdown opens and displays currencies
- [ ] Search/filter works (if implemented)
- [ ] Popular currencies are visible (USD, EUR, GBP, JPY, INR)
- [ ] Selection updates display correctly
- [ ] Currency code and name are shown

**To Currency:**
- [ ] Same as From Currency tests
- [ ] Different from From Currency
- [ ] Can select same currency (should show 1:1 rate)

**Swap Functionality:**
- [ ] Swap button exchanges currencies
- [ ] Swap preserves amount input
- [ ] Swap updates rate display
- [ ] Swap animation works smoothly (if implemented)

### ✅ Amount Input

**Valid Inputs:**
- [ ] Integer amounts: 100
- [ ] Decimal amounts: 100.50
- [ ] Large amounts: 1,000,000
- [ ] Small amounts: 0.01
- [ ] Zero: 0

**Input Validation:**
- [ ] Invalid characters are rejected
- [ ] Multiple decimal points are rejected
- [ ] Negative numbers are handled (if allowed)
- [ ] Empty input disables Convert button
- [ ] Input is properly formatted

**Edge Cases:**
- [ ] Very large numbers: 999,999,999.99
- [ ] Very small decimals: 0.000001
- [ ] Scientific notation (if supported)
- [ ] Copy-paste from clipboard

### ✅ Conversion Process

**Normal Flow:**
- [ ] Convert button is enabled with valid input
- [ ] Convert button is disabled when:
  - Amount is empty
  - Same currency selected
  - Invalid input
- [ ] Loading indicator appears during conversion
- [ ] Conversion result displays correctly
- [ ] Exchange rate is shown
- [ ] Result is formatted correctly (currency symbol, decimals)

**Result Display:**
- [ ] Shows converted amount prominently
- [ ] Shows exchange rate
- [ ] Shows timestamp (if available)
- [ ] Shows "Using cached data" indicator when applicable
- [ ] Result is readable and formatted correctly

### ✅ Network & Caching

**Online Mode:**
- [ ] Fresh data loads from API
- [ ] Loading state is visible
- [ ] Error handling for network failures
- [ ] Retry functionality works
- [ ] Rate limits are handled

**Offline Mode:**
- [ ] Cached data is used when offline
- [ ] "Using cached data" indicator appears
- [ ] Conversion works with cached rates
- [ ] Cache expiration is handled
- [ ] Error message shown if no cache available

**Cache Management:**
- [ ] Cache persists between app restarts
- [ ] Cache updates when online
- [ ] Cache doesn't grow indefinitely
- [ ] Old cache is cleared appropriately

## 4. Graphing Feature Testing

### ✅ Graph Loading

- [ ] Graph loads without errors
- [ ] Loading indicator shows initially
- [ ] Graph displays correctly
- [ ] Error handling for loading failures
- [ ] WebView loads correctly (if using WebView)

**Test Scenarios:**
1. Open graphing page
2. Wait for graph to load
3. Verify graph is visible
4. Test with no internet connection

### ✅ Graph Interaction

**Zoom & Pan:**
- [ ] Zoom in works (pinch/spread)
- [ ] Zoom out works
- [ ] Pan works (drag)
- [ ] Zoom limits are enforced
- [ ] Pan limits are enforced

**Expression Input:**
- [ ] Mathematical expressions can be entered
- [ ] Expressions are validated
- [ ] Graph updates with new expressions
- [ ] Invalid expressions show error
- [ ] Multiple expressions can be added

**Expression Types:**
- [ ] Linear: y = x
- [ ] Quadratic: y = x²
- [ ] Trigonometric: y = sin(x)
- [ ] Exponential: y = e^x
- [ ] Logarithmic: y = log(x)

### ✅ Graph Controls

- [ ] Expression panel toggle works
- [ ] Settings/controls are accessible
- [ ] Graph resets correctly
- [ ] Controls are responsive

## 5. UI/UX Testing

### ✅ Responsive Design

**Portrait Mode:**
- [ ] All elements are visible
- [ ] No horizontal scrolling
- [ ] Layout adapts correctly
- [ ] Touch targets are accessible
- [ ] Text is readable

**Landscape Mode:**
- [ ] Layout adapts correctly
- [ ] All features remain accessible
- [ ] Calculator keypad adapts
- [ ] Navigation works correctly

**Screen Sizes:**
- [ ] **Small phones** (iPhone SE, 4.7"): All features work
- [ ] **Medium phones** (iPhone 14, 6.1"): Optimal layout
- [ ] **Large phones** (iPhone 14 Pro Max, 6.7"): Proper spacing
- [ ] **Tablets** (iPad, 10.2"): Layout utilizes space
- [ ] **Desktop** (MacBook, 13"): Mouse interactions work

### ✅ Visual Elements

**Theme:**
- [ ] Dark theme applied consistently
- [ ] Colors match design system
- [ ] Contrast is sufficient
- [ ] Text is readable on all backgrounds

**Icons & Images:**
- [ ] Icons display correctly
- [ ] Icons are properly sized
- [ ] Icons are aligned correctly
- [ ] Images load correctly (if any)

**Typography:**
- [ ] Font sizes are appropriate
- [ ] Text is readable
- [ ] Text doesn't overflow containers
- [ ] Text scaling works (if supported)

**Buttons:**
- [ ] Buttons are properly sized (minimum 44x44)
- [ ] Buttons have proper spacing
- [ ] Button states are visible (pressed, disabled)
- [ ] Button text is readable

### ✅ Animations & Transitions

- [ ] Screen transitions are smooth
- [ ] Button press animations work
- [ ] Loading animations are visible
- [ ] No jarring transitions
- [ ] Performance is acceptable (60fps)

## 6. Performance Testing

### ✅ App Performance

**Launch Time:**
- [ ] App launches in < 3 seconds
- [ ] Initial screen loads quickly
- [ ] No freezing or hanging

**Operations:**
- [ ] Calculator operations are instant (< 100ms)
- [ ] Currency conversion is reasonably fast (< 2 seconds)
- [ ] Graph loading is acceptable (< 3 seconds)
- [ ] Navigation is smooth

**Memory:**
- [ ] App doesn't consume excessive memory (< 200MB)
- [ ] Memory usage is stable during extended use
- [ ] No memory leaks after extended use
- [ ] History doesn't grow indefinitely

**Battery:**
- [ ] Battery usage is acceptable
- [ ] No excessive CPU usage
- [ ] Background tasks don't drain battery

### ✅ Stress Testing

**Extended Use:**
- [ ] App works after 30+ minutes of use
- [ ] No performance degradation
- [ ] Memory usage remains stable
- [ ] No crashes or freezes

**Rapid Input:**
- [ ] Rapid button presses are handled
- [ ] No missed inputs
- [ ] Display updates correctly
- [ ] No lag or stuttering

## 7. Error Handling Testing

### ✅ Network Errors

**Currency Conversion:**
- [ ] Network failure is handled gracefully
- [ ] Error message is clear and helpful
- [ ] Retry button works
- [ ] Offline mode works with cache
- [ ] Timeout is handled correctly

**Graphing:**
- [ ] Network failure shows error
- [ ] Graph loading failure is handled
- [ ] Error message is helpful

### ✅ Input Validation Errors

**Calculator:**
- [ ] Division by zero shows error
- [ ] Invalid operations show error
- [ ] Error messages are clear
- [ ] Recovery from error works

**Currency:**
- [ ] Invalid amounts are rejected
- [ ] Empty fields are handled
- [ ] Special characters are filtered
- [ ] Error messages guide user

### ✅ Edge Cases

- [ ] Very large numbers are handled
- [ ] Very small numbers are handled
- [ ] Invalid expressions are rejected
- [ ] Empty states are handled
- [ ] Null values are handled

## 8. Cross-Platform Testing

### ✅ iOS Specific

**Features:**
- [ ] Haptic feedback works (if implemented)
- [ ] iOS-specific gestures work
- [ ] Status bar styling is correct
- [ ] Safe area insets are respected
- [ ] App Store guidelines compliance

**Devices:**
- [ ] iPhone (various sizes)
- [ ] iPad (various sizes)
- [ ] Different iOS versions

### ✅ Android Specific

**Features:**
- [ ] Back button navigation works
- [ ] Android-specific gestures work
- [ ] Material Design guidelines followed
- [ ] System UI styling is correct
- [ ] Play Store guidelines compliance

**Devices:**
- [ ] Various Android phones
- [ ] Various Android tablets
- [ ] Different Android versions
- [ ] Different screen densities

### ✅ Web Specific

**Browsers:**
- [ ] Chrome works correctly
- [ ] Safari works correctly
- [ ] Firefox works correctly
- [ ] Edge works correctly

**Features:**
- [ ] Keyboard input works
- [ ] Mouse interactions work
- [ ] Responsive design works
- [ ] No console errors

### ✅ Desktop Specific

**Platforms:**
- [ ] macOS works correctly
- [ ] Windows works correctly
- [ ] Linux works correctly

**Features:**
- [ ] Mouse interactions work
- [ ] Keyboard shortcuts work (if implemented)
- [ ] Window resizing works
- [ ] Menu bar integration (if applicable)

## 9. Accessibility Testing

### ✅ Screen Reader Support

- [ ] All elements are labeled
- [ ] Screen reader can navigate app
- [ ] Important actions are announced
- [ ] Error messages are announced
- [ ] Results are announced

**Test with:**
- VoiceOver (iOS)
- TalkBack (Android)
- Screen reader (Web)

### ✅ Visual Accessibility

**High Contrast:**
- [ ] App works in high contrast mode
- [ ] Text is readable
- [ ] Buttons are visible

**Font Scaling:**
- [ ] Large text mode works
- [ ] Text doesn't overflow
- [ ] Layout adapts correctly

**Color Blindness:**
- [ ] Color is not the only indicator
- [ ] Icons accompany colors
- [ ] Text labels are clear

### ✅ Motor Accessibility

**Touch Targets:**
- [ ] Minimum 44x44 pixels
- [ ] Adequate spacing between targets
- [ ] Easy to tap accurately

**Input Methods:**
- [ ] Keyboard navigation works
- [ ] Switch control works (if supported)
- [ ] Voice input works (if supported)

## 10. Device-Specific Testing

### 📱 Phone Testing

**Portrait Orientation:**
- [ ] All features accessible
- [ ] Layout is comfortable
- [ ] No horizontal scrolling
- [ ] Touch targets are accessible

**Landscape Orientation:**
- [ ] Layout adapts correctly
- [ ] Calculator keypad adapts
- [ ] All features work

**Screen Sizes:**
- [ ] Small (iPhone SE): 4.7"
- [ ] Medium (iPhone 14): 6.1"
- [ ] Large (iPhone 14 Pro Max): 6.7"

### 📱 Tablet Testing

**Portrait:**
- [ ] Layout utilizes space effectively
- [ ] Features are accessible
- [ ] Comfortable to use

**Landscape:**
- [ ] Optimal layout
- [ ] Multi-column layouts work
- [ ] All features accessible

**Screen Sizes:**
- [ ] Small tablet (iPad Mini): 8.3"
- [ ] Standard tablet (iPad): 10.2"
- [ ] Large tablet (iPad Pro): 12.9"

### 💻 Desktop Testing

**Window Sizes:**
- [ ] Minimum window size works
- [ ] Maximum window size works
- [ ] Window resizing works smoothly
- [ ] Layout adapts correctly

**Input Methods:**
- [ ] Mouse interactions work
- [ ] Keyboard navigation works
- [ ] Touch screen works (if available)

### 🌐 Web Browser Testing

**Desktop Browsers:**
- [ ] Chrome (latest)
- [ ] Safari (latest)
- [ ] Firefox (latest)
- [ ] Edge (latest)

**Mobile Browsers:**
- [ ] Chrome Mobile
- [ ] Safari Mobile

**Features:**
- [ ] Responsive design works
- [ ] Keyboard input works
- [ ] No console errors
- [ ] Performance is acceptable

## 📊 Test Results Template

```
═══════════════════════════════════════════════════════
Calculator Online - Manual Test Results
═══════════════════════════════════════════════════════

Date: ___________
Tester: ___________
Device: ___________
OS Version: ___________
App Version: ___________

───────────────────────────────────────────────────────
1. App Launch & Navigation
───────────────────────────────────────────────────────
App Launch: ✅/❌
Navigation: ✅/❌
Notes: ___________

───────────────────────────────────────────────────────
2. Calculator Feature
───────────────────────────────────────────────────────
Basic Operations: ✅/❌
Advanced Operations: ✅/❌
Edge Cases: ✅/❌
History: ✅/❌
Notes: ___________

───────────────────────────────────────────────────────
3. Currency Conversion
───────────────────────────────────────────────────────
Currency Selection: ✅/❌
Amount Input: ✅/❌
Conversion: ✅/❌
Caching: ✅/❌
Notes: ___________

───────────────────────────────────────────────────────
4. Graphing Feature
───────────────────────────────────────────────────────
Graph Loading: ✅/❌
Interaction: ✅/❌
Expressions: ✅/❌
Notes: ___________

───────────────────────────────────────────────────────
5. UI/UX
───────────────────────────────────────────────────────
Responsive Design: ✅/❌
Visual Elements: ✅/❌
Animations: ✅/❌
Notes: ___________

───────────────────────────────────────────────────────
6. Performance
───────────────────────────────────────────────────────
Launch Time: ✅/❌
Operations: ✅/❌
Memory Usage: ✅/❌
Notes: ___________

───────────────────────────────────────────────────────
7. Error Handling
───────────────────────────────────────────────────────
Network Errors: ✅/❌
Input Validation: ✅/❌
Edge Cases: ✅/❌
Notes: ___________

───────────────────────────────────────────────────────
8. Accessibility
───────────────────────────────────────────────────────
Screen Reader: ✅/❌
Visual: ✅/❌
Motor: ✅/❌
Notes: ___________

───────────────────────────────────────────────────────
Overall Assessment
───────────────────────────────────────────────────────
Status: ✅ PASS / ❌ FAIL
Critical Issues: ___________
Minor Issues: ___________
Recommendations: ___________

═══════════════════════════════════════════════════════
```

## 🔍 Common Issues & Troubleshooting

### Calculator Issues

**Problem**: Display doesn't update after button press
- **Check**: Button press is registered
- **Check**: State management is working
- **Check**: Console for errors

**Problem**: Operations don't work correctly
- **Check**: Calculator engine logic
- **Check**: Input parsing
- **Check**: Error handling

### Currency Issues

**Problem**: Exchange rates don't load
- **Check**: Network connection
- **Check**: API keys in .env file
- **Check**: API service is working
- **Check**: Cache functionality

**Problem**: Conversion gives wrong results
- **Check**: Rate calculation
- **Check**: Amount parsing
- **Check**: Currency codes

### Graphing Issues

**Problem**: Graph doesn't load
- **Check**: Internet connection
- **Check**: Desmos API key
- **Check**: WebView configuration
- **Check**: JavaScript errors in console

## 🚀 Integration with Automated Testing

### When to Use Manual Testing

- UI/UX validation
- Real device testing
- User experience evaluation
- Accessibility verification
- Performance on real hardware
- Visual regression testing

### When Automated Tests Are Sufficient

- Business logic validation
- Unit testing
- Widget functionality
- Integration workflows
- Regression testing
- CI/CD pipeline validation

### Running Automated Tests

```bash
# Run all automated tests
flutter test

# Run specific test types
flutter test test/unit/
flutter test test/calculator/
flutter test test/integration/

# Generate coverage
flutter test --coverage
```

See [TESTING_STRATEGY.md](TESTING_STRATEGY.md) for comprehensive automated testing guide.

## 📚 Additional Resources

- [TESTING_STRATEGY.md](TESTING_STRATEGY.md) - Comprehensive testing strategy
- [CI_CD_SETUP.md](CI_CD_SETUP.md) - CI/CD pipeline setup
- [Flutter Testing Documentation](https://docs.flutter.dev/testing)
- [Widget Testing Guide](https://docs.flutter.dev/cookbook/testing/widget)
- [Integration Testing](https://docs.flutter.dev/testing/integration-tests)

---

**Happy Testing! 🧪✨**

*Remember: Manual testing complements automated testing. Use both for comprehensive quality assurance.*
