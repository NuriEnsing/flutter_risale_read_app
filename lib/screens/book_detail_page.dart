/*
** This page will show the details of a selected book and will allow you to navigate to the BookContentPage to read the book.
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/app_state.dart';
import '../screens/book_content_page.dart';

class BookDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Details')),
      body: Consumer<AppState>(
        builder: (context, appState, child) {
          final book = appState.currentBook;
          if (book == null) {
            return Center(child: Text('No book selected.'));
          } else {
            return Column(
              children: [
                Text(book.title),
                Text(book.author),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookContentPage(),
                      ),
                    );
                  },
                  child: Text('Read this book'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Terug naar de hoofdpagina'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
