/*
** This widget will represent a book in the GridView on the homepage.
*/

// widgets/book_card.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/app_state.dart';
import '../widgets/book_cover.dart';
import '../models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;

  BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<AppState>(context, listen: false).selectBook(book);
        Navigator.pushNamed(context, '/book');
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Expanded(
              child: BookCover(book: book),
            ),
            Text(book.title),
          ],
        ),
      ),
    );
  }
}
