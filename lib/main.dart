/* 
** The main application file. It runs the Flutter app and sets up the route management.
*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';
import 'screens/book_detail_page.dart';
import 'states/app_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      // Wrap your MaterialApp with ChangeNotifierProvider
      create: (context) => AppState(), // Initialize your AppState
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(), // HomePage is mapped to the route '/'
          '/book': (context) =>
              BookDetailPage(), // BookDetailPage is mapped to the route '/book'
          // You can add more routes here as your app grows
        },
      ),
    );
  }
}
