# Apple Notes Clone

A Flutter application that replicates the core functionality of Apple's Notes app, providing a simple and efficient note-taking experience.

## Features

- Create, read, update, and delete notes
- Real-time saving as you type
- Search functionality
- Light and dark theme support
- Persistent storage using SharedPreferences

## Getting Started

### Prerequisites

- Flutter SDK (Channel stable, 2.5.0 or higher)
- Dart 2.14.0 or higher
- Android Studio / VS Code / IntelliJ IDEA

### Installation

1. Clone the repository:
git clone https://github.com/yourusername/apple-notes-clone.git
Copy
2. Navigate to the project directory:
cd apple-notes-clone
Copy
3. Install dependencies:
flutter pub get
Copy
4. Run the app:
flutter run

## Project Structure
lib/
├── main.dart
├── models/
│   └── note.dart
├── screens/
│   ├── note_list_screen.dart
│   └── note_edit_screen.dart
├── widgets/
│   ├── note_list_item.dart
│   └── note_search_delegate.dart
├── services/
│   └── note_service.dart
└── theme/
└── app_theme.dart

## Dependencies

- [provider](https://pub.dev/packages/provider): ^6.0.0
- [shared_preferences](https://pub.dev/packages/shared_preferences): ^2.0.15

## Usage

1. Launch the app to view your list of notes
2. Tap the floating action button to create a new note
3. Tap on an existing note to edit it
4. Use the search icon in the app bar to search through your notes
5. The app automatically saves your changes as you type

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

TBD

## Acknowledgments

- Inspired by Apple's Notes application
- Built with Flutter framework

## Future Improvements

- Add support for rich text formatting
- Implement note categories or folders
- Add cloud sync functionality
- Enhance search with filters and sorting options

