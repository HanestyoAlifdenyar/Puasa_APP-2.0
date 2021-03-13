import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puasa APP',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        canvasColor: Colors.orange.shade100,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
