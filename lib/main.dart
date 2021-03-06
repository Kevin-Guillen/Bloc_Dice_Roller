import 'package:flutter/material.dart';
import 'dice_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
      ),
      home: DicePage(),
    );
  }
}

void main() => runApp(MyApp());
