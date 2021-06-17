import 'package:flutter/material.dart';
import 'dice_page.dart';
import 'src/bloc/dice_bloc.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DiceBloc _diceBloc = DiceBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.black,
      ),
      home: DicePage(
        bloc: _diceBloc,
      ),
    );
  }
}

void main() => runApp(MyApp());
