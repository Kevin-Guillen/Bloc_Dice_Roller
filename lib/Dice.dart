import 'package:flutter/material.dart';

import 'assets/assets.dart';
import 'utils/constants.dart';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  AssetImage topDice, bottomDice;

  @override
  void initState() {
    super.initState();
    setState(() {
      topDice = one;
      bottomDice = one;
    });
  }

  void diceChanger() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Dice Roller",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: Constants.titleFontSize,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: topDice,
                      width: Constants.dicesWidthAndHeight,
                      height: Constants.dicesWidthAndHeight,
                    ),
                    Image(
                      image: bottomDice,
                      width: Constants.dicesWidthAndHeight,
                      height: Constants.dicesWidthAndHeight,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Constants.buttonTopMargin),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 20.0),
                  child: Text(
                    'Good luck!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Constants.playButtonFontSize,
                    ),
                  ),
                  color: Colors.blue,
                  onPressed: diceChanger,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(Constants.playButtonBorderRadius),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
