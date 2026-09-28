# CoStock

A cross-platform Flutter application built with a layered architecture and reactive state management.

## Overview

CoStock is a Flutter application built around user accounts, application preferences, localized UI, and data-driven screens.

The project focuses on maintainable application architecture rather than a single-screen prototype. It uses BLoC-based state management, repository abstractions, local storage, Firebase/Firestore integration, and declarative routing.

## Architecture

The project follows a layered structure:

* **Presentation** — screens, widgets, navigation, UI state
* **Application** — BLoCs and application-level services
* **Domain** — core models and business abstractions
* **Data** — repositories, local storage, and external data sources

Some of the architectural decisions demonstrated in the project include:

* BLoC-based state management
* Repository abstractions
* Dependency injection through repository managers
* Abstract local-storage interface with a concrete `SharedPreferences` implementation
* Declarative navigation with `AutoRoute`
* Localized application UI
* Reactive and cancellable asynchronous operations

## Technical Highlights

### Reactive state management

The application uses `flutter_bloc` together with `Freezed` for typed events and states.

Some asynchronous operations use restartable event transformers and explicit cancellation handling to prevent outdated requests from updating application state.

### Local storage abstraction

Local persistence is accessed through an abstraction layer rather than directly from application code. The current implementation uses `SharedPreferences`, allowing the storage mechanism to be replaced independently of the rest of the application.

### Navigation and authentication state

Navigation is implemented with `AutoRoute`, including route guards for authenticated and unauthenticated application states.

### Firebase / Firestore

The project integrates Firebase and Cloud Firestore for remote application data.

### Localization

The application supports multiple locales through `easy_localization`.

### Custom UI infrastructure

The project also uses a customized fork of [`reorderable_grid`](https://github.com/DolBich/reorderable_grid) with additional drag-and-drop behavior.

## Tech Stack

* Flutter / Dart
* BLoC / Cubit
* Freezed
* Firebase / Cloud Firestore
* AutoRoute
* RxDart
* FPDart
* SharedPreferences
* Easy Localization
* JSON serialization

## Platforms

The project contains Flutter targets for:

* Android
* iOS
* Web
* Windows
* macOS
* Linux

## Project Structure

```text
lib/
├── application/
├── data/
├── domain/
└── presentation/
```

The project is primarily intended as a demonstration of Flutter application architecture, state management, asynchronous workflows, and integration with external services.
