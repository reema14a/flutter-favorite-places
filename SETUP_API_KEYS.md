# API Keys Setup Guide

This project uses Google Maps API keys that need to be configured for each platform. Follow these steps to set up your development environment.

## Prerequisites

1. Get a Google Maps API key from the [Google Cloud Console](https://console.cloud.google.com/)
2. Enable the following APIs:
   - Maps SDK for Android
   - Maps SDK for iOS
   - Maps JavaScript API
   - Places API (if using places features)

## Platform Setup

### Android

1. Copy the template file:

   ```bash
   cp android/local.properties.template android/local.properties
   ```

2. Edit `android/local.properties` and update:
   - `sdk.dir`: Your Android SDK path
   - `flutter.sdk`: Your Flutter SDK path
   - `MAPS_API_KEY`: Your Google Maps API key

### iOS

1. Copy the template file:

   ```bash
   cp ios/Runner/GoogleMapsConfig.swift.template ios/Runner/GoogleMapsConfig.swift
   ```

2. Edit `ios/Runner/GoogleMapsConfig.swift` and update:
   - `apiKey`: Your Google Maps API key

### Web

1. Copy the template file:

   ```bash
   cp web/config.js.template web/config.js
   ```

2. Edit `web/config.js` and update:
   - `GOOGLE_MAPS_API_KEY`: Your Google Maps API key

### Flutter/Dart

1. Copy the template file:

   ```bash
   cp lib/config/api_keys.dart.template lib/config/api_keys.dart
   ```

2. Edit `lib/config/api_keys.dart` and update:
   - `googleMapsApiKey`: Your Google Maps API key

## Security Notes

- **Never commit** the actual configuration files with real API keys
- All template files are safe to commit
- The `.gitignore` file excludes all sensitive configuration files
- For production, consider using environment variables or secure configuration services

## Testing

After setup, test each platform:

- Android: `flutter run -d android`
- iOS: `flutter run -d ios`
- Web: `flutter run -d chrome`

## Troubleshooting

If you encounter API key errors:

1. Verify the API key is correct
2. Check that the required APIs are enabled in Google Cloud Console
3. Ensure the API key has the correct restrictions (if any)
4. Verify the configuration files are in the correct locations
