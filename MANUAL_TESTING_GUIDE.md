# Manual Testing Guide for Calculator Online

Since there are Dart CLI issues preventing automated test execution, here's a comprehensive manual testing guide to verify your app works correctly.

## 🧪 Manual Testing Checklist

### 1. App Launch & Navigation

#### ✅ Basic App Launch
- [ ] App starts without crashing
- [ ] Calculator page loads as default
- [ ] Dark theme is applied correctly
- [ ] Navigation bar is visible

#### ✅ Navigation Testing
- [ ] Tap navigation buttons to switch between features
- [ ] Calculator → Currency Converter
- [ ] Currency Converter → Graphing
- [ ] Graphing → Calculator
- [ ] Back navigation works correctly

### 2. Calculator Feature Testing

#### ✅ Basic Operations
- [ ] **Addition**: 1 + 2 = 3
- [ ] **Subtraction**: 5 - 3 = 2
- [ ] **Multiplication**: 4 × 3 = 12
- [ ] **Division**: 8 ÷ 2 = 4
- [ ] **Decimal operations**: 1.5 + 2.5 = 4

#### ✅ Advanced Operations
- [ ] **Percentage**: 50% = 0.5
- [ ] **Square root**: √9 = 3
- [ ] **Power**: 2^3 = 8
- [ ] **Clear (AC)**: Clears display to 0
- [ ] **Backspace**: Removes last digit

#### ✅ Edge Cases
- [ ] Division by zero handling
- [ ] Very large numbers
- [ ] Very small decimal numbers
- [ ] Multiple consecutive operations
- [ ] Clear after operations

#### ✅ History Feature
- [ ] History panel shows previous calculations
- [ ] History can be cleared
- [ ] History persists between operations
- [ ] History-only mode works

### 3. Currency Conversion Testing

#### ✅ Currency Selection
- [ ] From currency dropdown works
- [ ] To currency dropdown works
- [ ] Currency swap button works
- [ ] Popular currencies are available (USD, EUR, GBP, JPY)

#### ✅ Amount Input
- [ ] Amount field accepts numbers
- [ ] Decimal amounts work (e.g., 100.50)
- [ ] Large amounts work (e.g., 1000000)
- [ ] Input validation works

#### ✅ Conversion Process
- [ ] Convert button is enabled when valid input
- [ ] Loading indicator shows during conversion
- [ ] Conversion result displays correctly
- [ ] Exchange rate is shown
- [ ] Error handling for network issues

#### ✅ Caching
- [ ] Cached data indicator appears
- [ ] Offline conversion works with cached rates
- [ ] Fresh data loads when available

### 4. Graphing Feature Testing

#### ✅ Graph Loading
- [ ] Graph loads without errors
- [ ] Loading indicator shows initially
- [ ] Graph displays mathematical functions
- [ ] Error handling for loading failures

#### ✅ Graph Interaction
- [ ] Graph is interactive (zoom, pan)
- [ ] Mathematical expressions can be entered
- [ ] Graph updates with new expressions
- [ ] Graph controls work properly

### 5. UI/UX Testing

#### ✅ Responsive Design
- [ ] Portrait mode layout works
- [ ] Landscape mode layout works
- [ ] Orientation changes handled smoothly
- [ ] Different screen sizes supported

#### ✅ Visual Elements
- [ ] Dark theme applied consistently
- [ ] Colors match design system
- [ ] Icons display correctly
- [ ] Text is readable
- [ ] Buttons are properly sized

#### ✅ Accessibility
- [ ] Screen reader compatibility
- [ ] High contrast support
- [ ] Large text support
- [ ] Touch targets are adequate size

### 6. Performance Testing

#### ✅ App Performance
- [ ] App launches quickly (< 3 seconds)
- [ ] Smooth animations
- [ ] No memory leaks during extended use
- [ ] Calculator operations are instant
- [ ] Currency conversion is reasonably fast

#### ✅ Memory Usage
- [ ] App doesn't consume excessive memory
- [ ] History doesn't grow indefinitely
- [ ] Cache doesn't grow too large

### 7. Error Handling Testing

#### ✅ Network Errors
- [ ] Currency conversion handles network failures
- [ ] Appropriate error messages shown
- [ ] Retry functionality works
- [ ] Offline mode works with cached data

#### ✅ Input Validation
- [ ] Invalid amounts are rejected
- [ ] Empty fields are handled
- [ ] Special characters are filtered
- [ ] Overflow numbers are handled

### 8. Cross-Platform Testing

#### ✅ Platform-Specific Features
- [ ] **iOS**: Haptic feedback works
- [ ] **Android**: Back button navigation
- [ ] **Web**: Keyboard input works
- [ ] **Desktop**: Mouse interactions work

## 🐛 Common Issues to Check

### Calculator Issues
- [ ] Display doesn't update after button press
- [ ] Operations don't work correctly
- [ ] History doesn't save
- [ ] Clear doesn't reset state

### Currency Issues
- [ ] Exchange rates don't load
- [ ] Conversion gives wrong results
- [ ] Currency selection doesn't work
- [ ] Cache doesn't persist

### Graphing Issues
- [ ] Graph doesn't load
- [ ] Mathematical expressions don't work
- [ ] Graph is not interactive
- [ ] Error messages are unclear

## 📱 Device Testing

### Test on Multiple Devices
- [ ] **Phone**: iPhone, Android phone
- [ ] **Tablet**: iPad, Android tablet
- [ ] **Desktop**: Mac, Windows, Linux
- [ ] **Web**: Chrome, Safari, Firefox

### Test Different Orientations
- [ ] **Portrait**: All features work
- [ ] **Landscape**: Layout adapts correctly
- [ ] **Rotation**: Smooth transitions

## 🔧 Debugging Tips

### If Calculator Doesn't Work
1. Check if button presses are registered
2. Verify display updates
3. Test with simple operations first
4. Check for console errors

### If Currency Conversion Fails
1. Check network connection
2. Verify API keys in .env file
3. Test with different currencies
4. Check cache functionality

### If Graphing Doesn't Load
1. Check internet connection
2. Verify Desmos API key
3. Test with simple expressions
4. Check for JavaScript errors

## 📊 Test Results Template

```
Date: ___________
Tester: ___________
Device: ___________
OS Version: ___________

Calculator Tests:
- Basic Operations: ✅/❌
- Advanced Operations: ✅/❌
- History: ✅/❌

Currency Tests:
- Selection: ✅/❌
- Conversion: ✅/❌
- Caching: ✅/❌

Graphing Tests:
- Loading: ✅/❌
- Interaction: ✅/❌
- Expressions: ✅/❌

Overall: ✅/❌
Notes: ___________
```

## 🚀 Next Steps

Once manual testing is complete:

1. **Fix any issues found** during manual testing
2. **Document bugs** with steps to reproduce
3. **Test on multiple devices** and platforms
4. **Get user feedback** from beta testers
5. **Set up automated testing** when Dart CLI issues are resolved

## 📚 Additional Resources

- [Flutter Testing Documentation](https://docs.flutter.dev/testing)
- [Widget Testing Guide](https://docs.flutter.dev/cookbook/testing/widget)
- [Integration Testing](https://docs.flutter.dev/testing/integration-tests)

---

**Happy Testing! 🧪✨**

