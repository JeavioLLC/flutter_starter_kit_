#!/bin/bash
set -e  # stop on first error

echo "Cleaning Flutter project..."
flutter clean

echo "Getting dependencies..."
flutter pub get

echo "🧹 Cleaning Android gradle build caches..."
cd android
./gradlew clean
cd ..

echo "✅ Done!"
