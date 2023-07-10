/*
** This page will show a list of bookmarked books.
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/app_state.dart';

class BookmarksPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bookmarks')),
      body: Consumer<AppState>(
        builder: (context, appState, child) {
          if (appState.bookmarks.isEmpty) {
            return Center(child: Text('No bookmarks.'));
          } else {
            return ListView.builder(
              itemCount: appState.bookmarks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(appState.bookmarks[index].title),
                  subtitle: Text(appState.bookmarks[index].author),
                );
              },
            );
          }
        },
      ),
    );
  }
}
