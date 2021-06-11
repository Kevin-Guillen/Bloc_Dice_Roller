import 'package:flutter/material.dart';
import 'Dice.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
      ),
      home: Dice(),
    );
  }
}

void main() => runApp(MyApp());