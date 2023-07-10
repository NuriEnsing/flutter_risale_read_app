/*
** This widget will represent a book in the GridView on the homepage.
*/

// widgets/book_card.dart

import 'package:flutter/material.dart';
import '../models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // Handle book click
        },
        child: Center(
          child: Text(book.title), // Replace this with actual book title
        ),
      ),
    );
  }
}
