# AIO Calculator

An all-in-one Flutter calculator application with advanced mathematical capabilities, currency conversion, unit converters, and graphing functionality. Features both offline and online capabilities.

## 🚀 Features

- **🧮 Core Calculator**: Basic arithmetic, scientific functions, history tracking
- **💱 Currency Conversion**: Real-time exchange rates with offline support
- **📊 Graphing Calculator**: Interactive mathematical graphs
- **🔄 Unit Converters**: 13+ conversion types (length, weight, temperature, etc.)
- **📱 Responsive Design**: Optimized for all screen orientations

## 🛠️ Installation

### Prerequisites
- Flutter SDK (>=3.0.0)
- Git

### Setup

1. **Clone and install**
   ```bash
   git clone https://github.com/grubmaster5284/aio_calculator.git
   cd aio_calculator
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
- **Calculator**: Core calculation engine
- **Currency**: Real-time exchange rates with caching
- **Graphing**: Mathematical visualization
- **Converters**: Unit conversion utilities

## 🚀 Building

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# Desktop
flutter build macos --release
flutter build windows --release
flutter build linux --release
```

## 🤝 Contributing

1. Fork the [repository](https://github.com/grubmaster5284/aio_calculator)
2. Create feature branch: `git checkout -b feature/amazing-feature`
3. Make changes and add tests
4. Run tests: `flutter test`
5. Commit and push: `git push origin feature/amazing-feature`
6. Create Pull Request

## 📝 License

MIT License - see [LICENSE](LICENSE) file for details.

---

**Made with ❤️ using Flutter**