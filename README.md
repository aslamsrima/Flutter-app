# The Character Viewer

## Table of Contents

- [Project Structure](#project-structure)
  - [Core](#core)
  - [Data](#data)
  - [Domain](#domain)
  - [Presentation](#presentation)
  - [Miscellaneous Files](#miscellaneous-files)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Run Flutter Scripts](#run-flutter-scripts)

## Project Structure

Organized structure of your project:

### Core

The `core` directory houses fundamental components and utilities:

- `constants`: Contains constants like API URLs, database names, or any global configurations.
- `error`: Defines exceptions and failures for error handling in a structured way.
- `helpers`: Provides common utility functions, possibly used across different parts of the application.

### Data

The `data` directory manages data-related operations:

- `data_sources`: Contains data sources, such as API clients or database handlers.
- `models`: Defines data models that map to the structure of data retrieved from sources.
- `repositories`: Implements repository interfaces that define how data is fetched and stored.

### Domain

The `domain` directory encapsulates the core business logic:

- `entities`: Contains domain entities, which are pure representations of core concepts in your app.
- `repositories`: Specifies repository interfaces, allowing the domain layer to access data without caring about the source.
- `usecases`: Defines the application's use cases, orchestrating the business logic by interacting with the domain layer.

### Presentation

The `presentation` directory handles UI and user interaction:

- `blocs`: Houses BLoCs (Business Logic Components) that manage state for specific UI elements.
- `screens`: Contains the actual UI screens the user interacts with, such as character detail or search screens.
- `widgets`: Provides reusable UI components that can be used in different screens, improving code modularity.

### Miscellaneous Files

- `flavors.dart`: Defines different app flavors or configurations for various environments.
- `main.dart`, `main_simpsonsviewer.dart`, `main_wireviewer.dart`: Entry points for different app flavors, each with its own configuration.

## Getting Started

To get started with this project, follow these steps...

...

## Usage

## Run below command to use flutter scripts

```bash
 dart pub global activate rps

```

```bash
# Install project dependencies
flutter pub get
```

## Run

```bash
# To run Simpsons Viewer
rps run-sv
```

```bash
# To run Wire Viewer
rps run-wv
```

## Run Test cases

```bash
flutter test
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Run below command to use flutter scripts

> > dart pub global activate rps

## Run

> > rps run-sv

To run simpsons viewer

> > rps run-wv

To run wire viewer
