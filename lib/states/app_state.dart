/*
** Contains the AppState class which manages the list of books, current book, and bookmarks.
*/

import 'package:flutter/foundation.dart';
import '../models/book.dart';

class AppState extends ChangeNotifier {
  List<Book> books = [];
  Book? currentBook;
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
}
