#!/bin/bash
set -e  # stop on first error

echo "🧹 Cleaning Flutter project..."
flutter clean

echo "📦 Getting Flutter dependencies..."
flutter pub get

echo "🔍 Checking for Android Gradle wrapper..."

cd android

if [ ! -f "./gradlew" ]; then
  echo "⚠️  Gradle wrapper not found (android/gradlew)"
  echo ""
  echo "👉 Please run the following command once from the project root:"
  echo ""
  echo "   flutter build apk"
  echo ""
  echo "This will generate required Android/Gradle artifacts."
  echo ""
  exit 1
fi

echo "🧹 Cleaning Android Gradle build caches..."
chmod +x gradlew
./gradlew clean

cd ..

echo "✅ Done!"
