# Contributing

Thanks for helping improve the Flutter Starter Kit! This guide explains how to collaborate effectively.

## Branching
- Create feature branches from `main`: `git checkout -b feature/<ticket>`
- Keep branches focused and small; open draft PRs early for visibility.

## Development Checklist
1. Run `flutter pub get` after pulling to sync dependencies.
2. Add/Update providers in `core/config/app_providers.dart` when introducing new services.
3. Keep feature boundaries strict—share code only through `core/` or `shared/`.
4. Prefer pure widgets; push state and side-effects down to view models/use cases.
5. Document architectural decisions in the feature README or project wiki.

## Testing & Quality
- Write unit tests that exercise repositories and use cases.
- Add widget tests for new screens or complex UI states.
- Run `flutter analyze` and `flutter test` before every commit.
- If you touch generated files (Envied), re-run `flutter pub run build_runner build`.

## Code Reviews
- Describe both _what_ changed and _why_ in the PR description.
- Link related issues and include screenshots for UI updates.
- Respond to review comments with follow-up commits; avoid force pushes on shared branches.

## Releases
- Keep `CHANGELOG.md` up to date (create one if your team needs it).
- Tag releases following `vMajor.Minor.Patch`.

By contributing, you agree to follow the project’s code of conduct and architectural guidelines.
