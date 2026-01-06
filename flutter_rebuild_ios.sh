#!/bin/bash
set -e  # stop on first error

echo "Cleaning Flutter project..."
flutter clean

echo "Getting dependencies..."
flutter pub get

echo "Installing iOS pods..."
cd ios
pod install
cd ..

echo "✅ Done!"
