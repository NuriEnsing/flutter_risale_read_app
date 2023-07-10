import 'package:flutter/material.dart';
import '../models/book.dart';

class BookCover extends StatelessWidget {
  final Book book;

  BookCover({required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[800], // bordeaux rood
      child: Center(
        child: Text(
          book.title,
          style: TextStyle(
            color: Colors.amber[600], // goud
          ),
        ),
      ),
    );
  }
}
