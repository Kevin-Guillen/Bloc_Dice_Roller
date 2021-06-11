import 'package:flutter/material.dart';
import 'dart:math';
import 'assets/assets.dart';
import 'utils/constants.dart';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  AssetImage topDice, bottomDice;
  var answer = "Try to match the dices";

  @override
  void initState() {
    super.initState();
    setState(() {
      topDice = one;
      bottomDice = one;
    });
  }

  void diceChanger() {
    int topDiceNewValue = (1 + Random().nextInt(6));
    int bottomDiceNewValue = (1 + Random().nextInt(6));
    AssetImage firstImage;
    AssetImage secondImage;
    switch (topDiceNewValue) {
      case 1:
        firstImage = one;
        break;
      case 2:
        firstImage = two;
        break;
      case 3:
        firstImage = three;
        break;
      case 4:
        firstImage = four;
        break;
      case 5:
        firstImage = five;
        break;
      case 6:
        firstImage = six;
        break;
    }
    switch (bottomDiceNewValue) {
      case 1:
        secondImage = one;
        break;
      case 2:
        secondImage = two;
        break;
      case 3:
        secondImage = three;
        break;
      case 4:
        secondImage = four;
        break;
      case 5:
        secondImage = five;
        break;
      case 6:
        secondImage = six;
        break;
    }
    setState(
      () {
        topDice = firstImage;
        bottomDice = secondImage;
        if (topDice == bottomDice) {
          answer = "Dices Matched";
        } else {
          answer = "Keep Trying";
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      if (topDice == bottomDice) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    }

    return Scaffold(
      backgroundColor: getColor(),
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
              Text(
                answer,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 35.0,
                ),
              ),
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
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
