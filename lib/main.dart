import 'package:flutter/material.dart';

import 'ui/page/home/home_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bargen',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurpleAccent,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: HomePage(),
    );
  }
}
