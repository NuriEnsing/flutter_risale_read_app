/* 
** The main application file. It runs the Flutter app and sets up the route management.
*/
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/book_detail_page.dart';

void main() {
  runApp(MyApp()); // This is where the app starts executing.
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(), // HomePage is mapped to the route '/'
        '/book': (context) =>
            BookDetailPage(), // BookDetailPage is mapped to the route '/book'
        // You can add more routes here as your app grows
      },
    );
  }
}
