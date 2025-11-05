# CI/CD Setup Guide

This document describes the Continuous Integration and Continuous Deployment setup for the Calculator Online app.

## Overview

The project uses GitHub Actions for CI/CD automation. Tests run automatically on every push and pull request.

## Workflows

### 1. Test Workflow (`.github/workflows/test.yml`)

**Triggers:**
- Push to `main` or `develop` branches
- Pull requests to `main` or `develop` branches

**Jobs:**
- **test**: Runs unit, widget, and integration tests in parallel
- **coverage**: Generates test coverage reports
- **all-tests**: Final validation step

**Steps:**
1. Checkout code
2. Setup Flutter environment
3. Install dependencies
4. Verify code formatting
5. Analyze code
6. Run tests (unit/widget/integration)
7. Generate coverage report
8. Upload artifacts

### 2. Build Workflow (`.github/workflows/build.yml`)

**Triggers:**
- Push to `main` branch
- Tags starting with `v*`
- Manual workflow dispatch

**Jobs:**
- **build-android**: Builds Android APK and App Bundle
- **build-ios**: Builds iOS app (without code signing)
- **build-web**: Builds web application

## Setup Instructions

### Prerequisites

1. **GitHub Repository**: Ensure your code is in a GitHub repository
2. **GitHub Actions**: Enabled by default on public repos, enable for private repos in Settings > Actions

### Initial Setup

1. **Push workflows to repository:**
   ```bash
   git add .github/workflows/
   git commit -m "Add CI/CD workflows"
   git push
   ```

2. **Verify workflows are active:**
   - Go to your GitHub repository
   - Click on "Actions" tab
   - You should see the workflows listed

### Codecov Integration (Optional)

1. **Sign up at [codecov.io](https://codecov.io)**
2. **Add repository to Codecov**
3. **Get upload token** (optional, public repos don't need it)
4. **Add token to GitHub Secrets** (if using private repo):
   - Go to Settings > Secrets > Actions
   - Add new secret: `CODECOV_TOKEN`

The workflow will automatically upload coverage reports to Codecov.

## Running Tests Locally

### Using Flutter CLI

```bash
# All tests
flutter test

# Unit tests only
flutter test test/unit/

# Widget tests only
flutter test test/calculator/ test/currency/ test/graphing/

# Integration tests only
flutter test test/integration/

# With coverage
flutter test --coverage
```

### Using Test Scripts

```bash
# Run all tests
./scripts/run_tests.sh

# Generate coverage report
./scripts/test_coverage.sh

# Using Dart test runner
dart test_runner.dart all
dart test_runner.dart coverage
```

## Coverage Reports

### Viewing Coverage

1. **HTML Report** (if genhtml is installed):
   ```bash
   ./scripts/test_coverage.sh
   open coverage/html/index.html
   ```

2. **LCOV Report**:
   - Generated at `coverage/lcov.info`
   - Can be viewed in VS Code with Coverage Gutters extension
   - Can be uploaded to Codecov

### Coverage Goals

- **Overall**: 80%+
- **Critical Paths**: 100%
- **Business Logic**: 95%+
- **UI Components**: 70%+

## Manual Testing

### Device Testing

Test on multiple devices before merging:

1. **iOS Devices:**
   - iPhone (different sizes)
   - iPad

2. **Android Devices:**
   - Phone (different sizes)
   - Tablet

3. **Web:**
   - Chrome
   - Safari
   - Firefox

4. **Desktop:**
   - macOS
   - Windows
   - Linux

### Screen Size Testing

Test different screen sizes:
- Phone portrait (375x812)
- Phone landscape (812x375)
- Tablet portrait (768x1024)
- Tablet landscape (1024x768)
- Desktop (1920x1080)

## Troubleshooting

### Tests Fail in CI

1. **Check logs**: Go to Actions tab, click on failed workflow
2. **Run locally**: Try to reproduce the failure locally
3. **Check dependencies**: Ensure all dependencies are in `pubspec.yaml`
4. **Check Flutter version**: Ensure CI uses same Flutter version

### Coverage Not Generated

1. **Check coverage directory**: Should exist after `flutter test --coverage`
2. **Install coverage tool**: `dart pub global activate coverage`
3. **Check permissions**: Ensure scripts are executable

### Build Failures

1. **Check Flutter version**: Ensure correct version in workflow
2. **Check dependencies**: All dependencies should be available
3. **Check environment**: Ensure required environment variables are set

## Best Practices

1. **Run tests locally before pushing**
2. **Keep test execution time reasonable** (< 5 minutes)
3. **Fix failing tests immediately**
4. **Maintain test coverage above 80%**
5. **Review coverage reports regularly**
6. **Add tests for new features**
7. **Update tests when refactoring**

## Advanced Configuration

### Custom Test Matrix

Modify `.github/workflows/test.yml` to test on multiple Flutter versions:

```yaml
strategy:
  matrix:
    flutter-version: ['3.32.2', 'stable']
    os: [ubuntu-latest, macos-latest]
```

### Scheduled Runs

Add scheduled test runs:

```yaml
on:
  schedule:
    - cron: '0 0 * * 0'  # Weekly on Sunday
```

### Conditional Builds

Only build on specific conditions:

```yaml
if: github.ref == 'refs/heads/main'
```

## Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Flutter CI/CD Best Practices](https://docs.flutter.dev/deployment/ci)
- [Codecov Documentation](https://docs.codecov.com)

