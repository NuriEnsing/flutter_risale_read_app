# Flutter Risale-i Nur Reader App

This project is a Risale-i Nur book reading app built with Flutter. It provides a list of books that users can select to read, download and search from. It also includes features such as bookmarking, login, etc.

## Project Structure

The project is structured into four main directories:

- `lib/models`: This directory contains the data models that define the structure of the data used within the application. For example, the `book.dart` file defines the `Book` class.

- `lib/services`: This directory contains the logic related to data storage, network communication, and other services. For instance, the `book_service.dart` file contains logic for fetching and storing books.

- `lib/screens`: This directory holds the main screens of the application, such as the Home screen and the Book Detail screen.

- `lib/widgets`: This directory contains reusable widgets used throughout the app. For instance, `book_list.dart` and `book_item.dart` are widgets for displaying a list of books and a single book item respectively.

The entry point of the application is `main.dart`.

## Getting Started

1. Clone the repository: `git clone <repo_url>`
2. Navigate into the project directory: `cd flutter_risale_read_app`
3. Get Flutter packages: `flutter pub get`
4. Run the app: `flutter run`

## Contribution

Please read `CONTRIBUTING.md` for details on code of conduct and the process for submitting pull requests to the repository.

## License

This project is licensed under the MIT License. See `LICENSE.md` for more details.
