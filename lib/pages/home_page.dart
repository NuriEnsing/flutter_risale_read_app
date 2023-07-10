/*
** The homepage which displays a grid of books. When a book is clicked, it selects that book in the AppState and navigates to the BookDetailPage.
*/
// pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../states/app_state.dart';
import '../widgets/book_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed appBar
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        child: ListView(
          // Removed padding
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("User Name"), // Replace with actual user name
              accountEmail:
                  Text("User Email"), // Replace with actual user email
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "U", // Replace with user's initial
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.bookmark), // Added icon
              title: Text('Bookmarks'),
              onTap: () {
                Navigator.pushNamed(context, '/bookmarks');
              },
            ),
            // Add more ListTiles here for other pages, remember to add corresponding icons
          ],
        ),
      ),
      body: Consumer<AppState>(
        builder: (context, appState, child) {
          if (appState.books.isEmpty) {
            // Show a CircularProgressIndicator if the books have not loaded yet
            return Center(child: CircularProgressIndicator());
          } else {
            // Once the books have loaded, display them in a GridView
            return GridView.builder(
              padding: const EdgeInsets.all(10.0), // Added padding
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Change this number as needed
                crossAxisSpacing: 10.0, // Added horizontal spacing
                mainAxisSpacing: 10.0, // Added vertical spacing
              ),
              itemCount: appState.books.length,
              itemBuilder: (context, index) {
                final book = appState.books[index];
                return BookCard(book: book);
              },
            );
          }
        },
      ),
    );
  }
}
