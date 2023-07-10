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
      // The drawer is a sidebar that can be swiped in from the left.
      drawer: Drawer(
        // ListView ensures the drawer can be scrolled if there is not enough vertical space.
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("User Name"),
              accountEmail: Text("User Email"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "U",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Bookmarks'),
              onTap: () {
                Navigator.pushNamed(context, '/bookmarks');
                // Navigates to the '/bookmarks' route when this ListTile is tapped.
              },
            ),
            // Add more ListTiles here for other pages, remember to add corresponding icons
          ],
        ),
      ),
      // The body contains a ListView of books. Each book is a BookCard.
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
        child: Consumer<AppState>(
          builder: (context, appState, child) {
            return Column(
              children: [
                if (appState.currentBook != null)
                  Expanded(
                    child: Row(
                      children: [
                        // The currently selected book is displayed here.
                        Expanded(child: BookCard(book: appState.currentBook!)),
                        Expanded(
                          child: Column(
                            children: [
                              Text(appState.currentBook!.title),
                              Text(
                                  'Last read at page X'), // replace X with last read page
                              Text(
                                  'Total read time: X minutes'), // replace X with total read time
                            ],
                          ),
                        ),
                      ],
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
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: BookCard(book: book),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
