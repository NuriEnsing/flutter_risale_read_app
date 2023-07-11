# Flutter Risale-i Nur Reader App

This project is a Risale-i Nur book reading app built with Flutter. It provides a list of books that users can select to read. The books are stored as text files and the app dynamically paginates the content for a seamless reading experience. It also includes features such as bookmarking and page tracking.

## Project Structure

The project is structured into five main directories:

- `lib/models`: This directory contains the data models that define the structure of the data used within the application. For example, the `book.dart` file defines the `Book` class.

- `lib/states`: This directory contains the AppState class that manages the state of the application, including the list of books, the current book, and bookmarks.

- `lib/screens`: This directory holds the main screens of the application, such as the Home screen and the Book Detail screen. The Book Content page is responsible for displaying the content of each book.

- `lib/widgets`: This directory contains reusable widgets used throughout the app. For instance, `book_list.dart` and `book_item.dart` are widgets for displaying a list of books and a single book item respectively.

- `assets/book_texts`: This directory contains the text files for the books. 

The entry point of the application is `main.dart`.

## Getting Started

1. Ensure that Flutter and Dart are correctly installed on your system. Refer to the Flutter docs for a comprehensive guide on this.
2. Clone the repository: `git clone <repo_url>`
3. Navigate into the project directory: `cd flutter_risale_read_app`
4. Get Flutter packages: `flutter pub get`
5. Run the app: `flutter run`

## Working with Book Texts

The app reads book texts from text files stored in the `assets/book_texts` directory. You can add your own book texts by placing them in this directory and updating the path to the book in the `loadBookText` function in `book_content_page.dart`. Ensure to update the `pubspec.yaml` with the new paths to your text files.

Remember to run `flutter pub get` after adding or removing assets to ensure the assets are correctly loaded.

## Contribution

Please read `CONTRIBUTING.md` for details on our code of conduct and the process for submitting pull requests to the repository.

## License

This project is licensed under the MIT License. See `LICENSE.md` for more details.
