/*
** The homepage which displays a grid of books. When a book is clicked, it selects that book in the AppState and navigates to the BookDetailPage.
*/
// screens/home_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/app_state.dart';
import '../widgets/book_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Bookmarks'),
              onTap: () {
                Navigator.pushNamed(context, '/bookmarks');
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.yellow.shade100,
              Colors.brown.shade100,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0), // Add padding at the top
          child: Consumer<AppState>(
            builder: (context, appState, child) {
              return Column(
                children: [
                  if (appState.currentBook != null)
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BookCard(book: appState.currentBook!),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(appState.currentBook!.title),
                                Text(
                                    'Last read at page ${appState.currentBookPage}'), // Updated text
                                Text('Total read time: X minutes'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  Divider(),
                  Expanded(
                    flex: 2,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: appState.books.length,
                      itemBuilder: (context, index) {
                        final book = appState.books[index];
                        return GestureDetector(
                          onTap: () {
                            appState.currentBook = book;
                            if (appState.currentBookPage > 0) {
                              Navigator.pushNamed(context, '/bookContent');
                            } else {
                              Navigator.pushNamed(context, '/bookDetail');
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: BookCard(book: book),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
