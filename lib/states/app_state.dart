/*
** Contains the AppState class which manages the list of books, current book, and bookmarks.
*/

import 'package:flutter/foundation.dart';
import '../models/book.dart';
import 'package:flutter/services.dart';

class AppState extends ChangeNotifier {
  List<Book> books = [
    Book(title: 'The Tenth Word', author: 'Said Nursi', id: '1')
  ];
  Book? currentBook;
  int currentBookPage = 0;

  List<Book> bookmarks = [];

  void selectBook(Book book) {
    currentBook = book;
    notifyListeners();
  }

  void addBookmark(Book book) {
    bookmarks.add(book);
    notifyListeners();
  }

  void removeBookmark(Book book) {
    bookmarks.remove(book);
    notifyListeners();
  }

  Future<List<String>> loadBookPages(String title) async {
    final bookText =
        await rootBundle.loadString('assets/book_texts/$title.txt');
    final pages = bookText.split('\n\n');
    return pages;
  }
}
