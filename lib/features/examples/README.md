# Example Features

This directory contains **sample features** that demonstrate how to structure features in this Flutter starter kit. These features are **optional** and can be safely removed if you don't need them.

## What's Included

- **home**: Dashboard page with navigation shell
- **settings**: Settings page with theme mode selector
- **users**: Complete feature with data/domain/presentation layers, including API integration

## Structure

Each example feature follows a consistent structure:

```
feature_name/
  ├── data/           # Data layer (repositories, DTOs, services)
  ├── domain/         # Domain layer (models, use cases)
  └── presentation/   # Presentation layer (pages, widgets, viewmodels)
      ├── pages/
      ├── widgets/
      ├── routes/      # Feature route definitions
      └── di/          # Dependency injection registration
```

## How to Use

Example features are registered in `main.dart`. To opt into a feature:

1. Import the feature's route and DI registration:
```dart
import 'features/examples/users/presentation/routes/users_routes.dart';
import 'features/examples/users/data/di/users_di.dart';
```

2. Register dependencies:
```dart
final providers = [
  ...registerCoreDependencies(),
  ...registerUsersFeature(), // Add feature DI
];
```

3. Add routes:
```dart
final router = appRouter(
  featureRoutes: [
    UsersRoutes(), // Add feature routes
  ],
);
```

## Removing Example Features

You can safely delete the entire `lib/features/examples` directory if you don't need these samples. The app will still boot, but you'll need to:

1. Remove feature imports from `main.dart`
2. Remove feature registrations from dependency injection
3. Remove feature routes from the router

The core of the app does not depend on these examples - they are completely decoupled.

## Creating Your Own Features

Use these examples as a reference when creating your own features. Key principles:

1. **Feature-owned routing**: Each feature exposes routes via `FeatureRoute` implementation
2. **Feature-owned DI**: Each feature exposes a `register<FeatureName>Feature()` function
3. **No core dependencies**: Features can depend on core, but core never depends on features
4. **Composition in main**: All feature composition happens in `main.dart` or `main_*.dart` files

