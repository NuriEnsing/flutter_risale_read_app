// models/book.dart

import 'package:namer_app/models/page.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String? coverUrl; // make this field nullable
  final List<Page> pages;

  Book({
    required this.id,
    required this.title,
    required this.author,
    this.coverUrl, // this field is now optional
    this.pages = const [], // this field now has a default value
  });
}
