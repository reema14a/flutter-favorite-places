# Flutter Fav Places

A cross-platform Flutter application for managing and exploring your favorite places. Built with modern Flutter practices and featuring Google Maps integration.

## Features

- 📍 **Location Management**: Add, view, and manage your favorite places
- 🗺️ **Google Maps Integration**: Interactive maps for location selection and viewing
- 📱 **Cross-Platform**: Works on Android, iOS, and Web
- 🎨 **Modern UI**: Beautiful Material Design interface
- 🔄 **State Management**: Built with Riverpod for efficient state management
- 🖼️ **Image Support**: Add photos to your places
- 📍 **Location Details**: View detailed information about each place

## Screenshots

_Add screenshots of your app here_

## Tech Stack

- **Framework**: Flutter 3.32.5
- **Language**: Dart 3.8.1
- **State Management**: Riverpod
- **Maps**: Google Maps Flutter
- **UI**: Material Design 3
- **Platforms**: Android, iOS, Web

## Prerequisites

Before running this project, make sure you have:

- Flutter SDK installed (version 3.32.5 or higher)
- Dart SDK installed (version 3.8.1 or higher)
- Android Studio / Xcode (for mobile development)
- Google Maps API key

## Setup Instructions

### 1. Clone the Repository

```bash
git clone <your-repository-url>
cd flutter_fav_places
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Configure API Keys

This project uses Google Maps API keys that need to be configured for each platform. **This is required before running the app.**

📋 **Follow the detailed setup guide**: [SETUP_API_KEYS.md](SETUP_API_KEYS.md)

Quick setup:

1. Copy template files to config files
2. Add your Google Maps API key to each platform's config
3. Enable required APIs in Google Cloud Console

### 4. Run the Application

```bash
# For Android
flutter run -d android

# For iOS
flutter run -d ios

# For Web
flutter run -d chrome
```

## Project Structure

```
lib/
├── config/           # API keys and configuration
├── models/           # Data models (Place, PlaceLocation)
├── providers/        # Riverpod state management
├── screens/          # App screens (Map, Place Details)
├── widgets/          # Reusable UI components
└── main.dart         # App entry point
```

## Key Features Implementation

### Location Management

- Add new places with custom titles and images
- View list of all saved places
- Delete places with swipe-to-delete functionality
- Detailed place information with static map images

### Maps Integration

- Interactive map for location selection
- Real-time location picking
- Static map images for place previews
- Cross-platform map support

### State Management

- Riverpod for efficient state management
- Provider pattern for data sharing
- Reactive UI updates

## Development

### Adding New Features

1. Create new models in `lib/models/`
2. Add providers in `lib/providers/`
3. Create UI components in `lib/widgets/`
4. Add screens in `lib/screens/`

### Code Style

This project follows Flutter's official style guide and uses:

- `flutter_lints` for code quality
- Consistent naming conventions
- Proper error handling
- Documentation for complex functions

## Security

- API keys are properly secured and not committed to version control
- Template files are provided for easy setup
- Configuration files are excluded from git

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## Troubleshooting

### Common Issues

1. **API Key Errors**: Make sure you've followed the [API Keys Setup Guide](SETUP_API_KEYS.md)
2. **Build Errors**: Run `flutter clean && flutter pub get`
3. **Platform-specific Issues**: Check the setup guide for platform-specific configuration

### Getting Help

- Check the [SETUP_API_KEYS.md](SETUP_API_KEYS.md) for API configuration
- Review Flutter documentation: https://docs.flutter.dev/
- Open an issue for bugs or feature requests

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Flutter team for the amazing framework
- Google Maps for location services
- Riverpod for state management
