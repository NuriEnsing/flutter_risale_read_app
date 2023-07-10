// models/book.dart

import 'package:namer_app/models/page.dart';

class Book {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final List<Page> pages;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.pages,
  });
}
