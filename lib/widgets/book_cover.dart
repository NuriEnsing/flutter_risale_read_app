import 'package:flutter/material.dart';
import '../models/book.dart';

class BookCover extends StatelessWidget {
  final Book book;

  BookCover({required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[800],
      child: Center(
        // Add Center widget
        child: Align(
          alignment: Alignment.center, // Align to the center
          child: Text(
            book.title,
            textAlign: TextAlign.center, // Center text
            style: TextStyle(
              color: Colors.amber[600],
            ),
          ),
        ),
      ),
    );
  }
}
