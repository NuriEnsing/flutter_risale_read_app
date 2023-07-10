/*
**  This page will show the content of a selected book.
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/app_state.dart';

class BookContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Content')),
      body: Consumer<AppState>(
        builder: (context, appState, child) {
          final book = appState.currentBook;
          if (book == null) {
            return Center(child: Text('No book selected.'));
          } else {
            return ListView.builder(
              itemCount: book.pages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Page ${book.pages[index].pageNumber}'),
                  subtitle: Text(book.pages[index].content),
                );
              },
            );
          }
        },
      ),
    );
  }
}
