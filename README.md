![image](https://github.com/user-attachments/assets/86b14114-cf30-420e-a848-20d731c007c3)


# Crypto Coins App

A Flutter application to explore and view details of various cryptocurrencies right in your pocket.

## Features

- Browse a list of cryptocurrencies with real-time data fetched from a public API
- View detailed information for each coin, including market data, price charts, and more
- Clean and modular code structure using Flutter BLoC pattern for state management
- Dependency injection with get_it for easy scalability and testing
- Custom theming support with light and dark modes

## Screenshots

[//]: # (TODO: Uncomment the following lines to show screenshots)

[//]: # (![Coin List Screen]&#40;assets/screenshots/coin_list.png&#41;)

[//]: # (![Coin Details Screen]&#40;assets/screenshots/coin_details.png&#41;)

## Getting Started

### Prerequisites

- Flutter SDK >= 3.7.0
- Dart SDK >= 3.4.1
- An IDE or editor such as Android Studio, VS Code, or IntelliJ IDEA

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/crypto_coins_app.git
   cd crypto_coins_app
   ```
2. Fetch dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── crypto_coins_app.dart     # App entry point and configuration
├── main.dart                # Main function
├── features/
│   ├── coin_list/           # UI and BLoC for listing coins
│   └── coin_details/        # UI and BLoC for coin details
├── repositories/
│   └── coins/               # Data layer: API calls and models
├── router/
│   └── router.dart          # App navigation setup
└── theme/
    └── theme.dart           # App theming and styling
```

## Dependencies

- flutter_bloc: State management with BLoC
- dio: HTTP client for API requests
- get_it: Simple service locator for dependency injection
- equatable: Value equality for Dart objects
- flutter_svg: Rendering SVG assets
- talker_flutter: Logging and error reporting

For the full list, see `pubspec.yaml`.

## API

This app uses the CoinGecko public API to fetch cryptocurrency data:

- Base URL: `https://api.coingecko.com/api/v3/`
- Endpoints:
    - `/coins/markets` for market listings
    - `/coins/{id}` for coin details

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests for bug fixes and new
features.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
