/* 
** The main application file. It runs the Flutter app and sets up the top-level ChangeNotifierProvider for the app state.
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'states/app_state.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Book App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
