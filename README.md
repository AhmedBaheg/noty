# Note Book - Note Taking App

A modern, clean, and feature-rich offline note-taking application built with **Flutter**, **BLoC/Cubit**, and **Hive** local storage.

---

## 📱 Features

- **Organized Notes**: View notes sorted and categorized with smooth animations.
- **Pin Notes**: Pin essential notes to the top for quick access.
- **Categories**: Organize notes into custom categories (Personal, Work, Ideas).
- **Search & Filter**: Search through your notes instantly.
- **Trash Bin**: Safely delete notes with the option to restore or permanently erase them.
- **Custom Drawer Navigation**: Convenient drawer navigation showing note counts dynamically.
- **Local Persistence**: Fast offline storage powered by Hive.
- **Custom Theming & Design**: Clean Material design with custom colors, typography, and responsive layouts.

---

## 🏗️ Architecture & Project Structure

The project follows a **Feature-First / Clean Architecture** approach:

```text
lib/
├── core/                       # Shared utilities, widgets, theme, and constants
│   └── utils/                  # App colors, styles, texts, assets
├── features/                   # Core application features
│   ├── home/                   # Home screen, note list display, filtering, drawer
│   │   ├── data/               # Models (NoteModel, Hive adapter)
│   │   └── presentation/       # Cubits, screens, and reusable widgets
│   ├── add_note/               # Add note functionality and state management
│   ├── note_details/           # View & edit existing notes
│   └── trash_note/             # Recycle bin management (restore & delete)
└── main.dart                   # App entrypoint, Hive initialization, Bloc providers
```

---

## 🛠️ Tech Stack & Dependencies

- **Framework**: [Flutter](https://flutter.dev) (Dart SDK `^3.13.1`)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc) (`^9.1.1`) / [bloc](https://pub.dev/packages/bloc)
- **Local Storage**: [hive](https://pub.dev/packages/hive) & [hive_flutter](https://pub.dev/packages/hive_flutter)
- **Code Generation**: [hive_generator](https://pub.dev/packages/hive_generator) & [build_runner](https://pub.dev/packages/build_runner)
- **Fonts & Icons**: [google_fonts](https://pub.dev/packages/google_fonts), [cupertino_icons](https://pub.dev/packages/cupertino_icons)
- **Date Formatting**: [intl](https://pub.dev/packages/intl)

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.13.1 or higher)
- Android Studio / VS Code
- A connected physical device or Android/iOS Emulator

### Installation & Run

1. **Clone the repository**:
   ```bash
   git clone <repo-url>
   cd noty
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Generate Hive Adapters** (if modifying models):
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the application**:
   ```bash
   flutter run
   ```

---

## 📄 License

This project is licensed under the MIT License.
