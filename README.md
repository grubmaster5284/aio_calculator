# AIO Calculator

A comprehensive Flutter calculator application with advanced mathematical capabilities, currency conversion, unit converters, and graphing functionality. Features both offline and online capabilities with support for all major platforms.

## 🚀 Features

- **🧮 Core Calculator**: Basic arithmetic, scientific functions, history tracking
- **💱 Currency Conversion**: Real-time exchange rates with offline support
- **📊 Graphing Calculator**: Interactive mathematical graphs
- **🔄 Unit Converters**: 13+ conversion types (length, weight, temperature, etc.)
- **📱 Multi-Platform**: Android, iOS, macOS, Linux, Windows, and Web support
- **🎨 Modern UI**: Clean, responsive design optimized for all screen orientations

## 🛠️ Installation

### Prerequisites
- Flutter SDK (>=3.0.0)
- Git

### Setup

1. **Clone and install**
   ```bash
   git clone https://github.com/yourusername/calculator_online.git
   cd calculator_online
   flutter pub get
   ```

2. **Configure API Keys** (Optional - for currency conversion)
   
   Create a `.env` file:
   ```env
   CURRENCY_SERVICE_PROVIDER=exchangerate_api
   EXCHANGERATE_API_KEY=your_api_key_here
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📖 Usage

### Calculator
- Use the number pad for basic calculations
- Access history via the history button
- Switch between portrait/landscape modes

### Currency Converter
- Navigate to Converters → Currency
- Select source and target currencies
- Enter amount for real-time conversion

### Graphing
- Navigate to Graphing from main menu
- Enter mathematical expressions (e.g., `sin(x)`, `x^2`)
- Zoom and pan to explore graphs

### Unit Converters
- Navigate to Converters
- Select desired converter type
- Choose units and enter values

## 🔧 API Setup

### Free Currency API (Recommended)
1. Visit [exchangerate-api.com](https://exchangerate-api.com/)
2. Sign up for free account
3. Add API key to `.env` file

### Without API Keys
The app works without API keys but currency conversion will use cached data only.

## 🏗️ Architecture

Clean Architecture with modular design:
- **Calculator**: Core calculation engine with history tracking
- **Currency**: Real-time exchange rates with offline caching
- **Graphing**: Mathematical visualization and plotting
- **Converters**: Unit conversion utilities (13+ types)
- **Core**: Shared utilities and state management

### Project Structure
```
lib/
├── calculator/          # Core calculator functionality
├── currency_conversion/ # Currency conversion features
├── graphing/           # Mathematical graphing capabilities
├── converters/         # Unit conversion utilities
├── core/              # Shared utilities and state management
├── di/                # Dependency injection
└── main.dart          # Application entry point
```

## 🚀 Building

### Manual Build
```bash
# Android
flutter build apk --release
flutter build appbundle --release

# iOS (requires macOS)
flutter build ios --release

# Web
flutter build web --release

# Desktop
flutter build macos --release
flutter build windows --release
flutter build linux --release
```

### Automated Release
The project includes GitHub Actions for automated releases:

1. **Create a version tag**:
   ```bash
   git tag v1.0.0
   git push origin v1.0.0
   ```

2. **GitHub Actions will automatically**:
   - Build for all platforms (Android, iOS, macOS, Linux, Windows, Web)
   - Create platform-specific archives
   - Generate a GitHub release with all artifacts

See [RELEASE.md](RELEASE.md) for detailed release instructions.

## 🧪 Development

### Running Tests
```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Code Generation
```bash
# Generate code for freezed models and JSON serialization
flutter packages pub run build_runner build

# Watch for changes and regenerate
flutter packages pub run build_runner watch
```

### Development Setup
1. Install Flutter SDK (>=3.0.0)
2. Install platform-specific dependencies:
   - **Android**: Android Studio with Android SDK
   - **iOS**: Xcode (macOS only)
   - **macOS**: Xcode command line tools
   - **Linux**: GTK development libraries
   - **Windows**: Visual Studio with C++ tools

## 📱 Platform Support

| Platform | Status | Notes |
|----------|--------|-------|
| Android | ✅ | APK & AAB support |
| iOS | ✅ | Requires macOS for building |
| macOS | ✅ | Native app support |
| Linux | ✅ | GTK-based desktop app |
| Windows | ✅ | Native Windows executable |
| Web | ✅ | PWA support |

## 🤝 Contributing

1. Fork the repository
2. Create feature branch: `git checkout -b feature/amazing-feature`
3. Make changes and add tests
4. Run tests: `flutter test`
5. Commit and push: `git push origin feature/amazing-feature`
6. Create Pull Request

## 📝 License

MIT License - see [LICENSE](LICENSE) file for details.

---

**Made with ❤️ using Flutter**