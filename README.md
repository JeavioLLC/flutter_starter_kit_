# Flutter Starter Kit

A production-ready Flutter template that follows Clean Architecture + MVVM. Clone it to accelerate new projects with a consistent foundation for routing, dependency injection, state management, and testing.

## Architecture Overview

- **Feature-first structure** – every feature ships with `data`, `domain`, and `presentation` layers that own their models, use-cases, repositories, and widgets.
- **Clean Architecture with MVVM** – `ViewModel`s (ChangeNotifiers) expose immutable state to the UI and orchestrate `UseCase`s.
- **Decoupled core** – Core modules never import features. Features depend on core, but core remains feature-agnostic.
- **Feature-owned routing** – Each feature exposes routes via `FeatureRoute` interface. App router aggregates routes from features.
- **Feature-owned DI** – Each feature exposes a `register<FeatureName>Feature()` function. Composition happens in `main.dart`.
- **Provider-based DI** – Core dependencies registered in `core/config/dependencies.dart`. Feature dependencies registered per-feature.
- **GoRouter navigation** – `core/routing/app_router.dart` aggregates routes from feature route instances.
- **Shared services** – HTTP, configuration, theming, and reusable widgets live under `core/` and `shared/`.
- **Envied configuration** – `core/env/env.dart` reads a `.env` file and generates strongly typed constants.
- **Testing-first** – Sample unit and widget tests demonstrate how to isolate domain logic and UI.

```
lib/
├── core/                  # Core modules (feature-agnostic)
│   ├── config/            # Core dependency registration only
│   ├── env/               # Envied setup (.env → env.g.dart)
│   ├── routing/           # GoRouter + FeatureRoute interface
│   ├── theme/             # Theme data, typography, extensions, provider
│   └── utils/             # Result, strings, offline mixins
├── features/
│   └── examples/          # Example features (optional, can be deleted)
│       ├── home/          # Navigation shell + dashboard
│       ├── settings/      # Theme controls
│       └── users/         # Complete feature (data/domain/presentation)
└── shared/
    ├── services/api/      # ApiConfig, ApiHandler (generic)
    └── widgets/           # Error/empty/loading widgets
```

## Getting Started

1. **Install dependencies**
   ```bash
   flutter pub get
   ```
2. **Configure environment**
   ```bash
   cp .env_dev .env
   # Fill API_BASE_URL and API_KEY
   ```
3. **Generate Envied files**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. **Run the app**
   ```bash
   flutter run
   ```

## Development Workflow

- **Core dependencies**: Register core services in `core/config/dependencies.dart`.
- **Feature dependencies**: Each feature exposes a `register<FeatureName>Feature()` function. Register them in `main.dart`.
- **Feature routes**: Each feature implements `FeatureRoute` interface. Add feature routes to `appRouter()` in `main.dart`.
- **Composition**: All feature composition (DI + routing) happens in `main.dart` or `main_*.dart` files.
- Keep cross-feature widgets/services inside `lib/shared`.
- Prefer `const` constructors and immutable models. Only mutate state inside view models.
- Lean on the provided `scripts/create_feature.sh` helper to scaffold new vertical slices quickly.

## Example Features

The `lib/features/examples` directory contains **optional sample features** that demonstrate the architecture:

- **home**: Dashboard page with navigation shell (`HomeShell`)
- **settings**: Settings page with theme mode selector
- **users**: Complete feature with data/domain/presentation layers, including API integration

### Using Example Features

Example features are registered in `main.dart`. To opt into a feature:

1. Import the feature's route and DI registration
2. Call `register<FeatureName>Feature()` in dependency providers
3. Add `<FeatureName>Routes()` to `appRouter()` featureRoutes

### Removing Example Features

You can **safely delete** the entire `lib/features/examples` directory if you don't need these samples. The app will still boot. Just remove the feature imports and registrations from `main.dart`.

See [`lib/features/examples/README.md`](lib/features/examples/README.md) for more details.

## Testing

```
flutter test
```

Included specs:

- `test/domain/use_cases/get_users_use_case_test.dart` – verifies domain logic against a mocked repository.
- `test/presentation/users/users_page_test.dart` – pumps the `UsersPage` with a fake repository to validate the widget tree.

Add more tests mirroring your feature folders (e.g., `test/features/<feature>/...`).

## CI/CD

`.github/workflows/ci.yaml` runs `flutter pub get`, `flutter analyze`, and `flutter test` on every push or pull request to `main`.

## Renaming The App

The project includes a script to simplify renaming the application. `flutter_rename.sh` handles changing the app name and package/application ID across the project.

**Usage**

```bash
./scripts/flutter_rename.sh -n "New App Name" -b "com.new.bundle.id"
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for branch strategy, code style, and review guidance.
