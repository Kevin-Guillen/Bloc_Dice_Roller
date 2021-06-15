import 'package:flutter/material.dart';
import 'utils/assets.dart';
import 'dart:math';
import 'utils/constants.dart';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  late AssetImage topDice;
  late AssetImage bottomDice;
  var answer = "Try to match the dices";
  @override
  void initState() {
    super.initState();
    setState(() {
      topDice = diceOne;
      bottomDice = diceOne;
    });
  }

  void diceChanger() {
    int topDiceNewValue = (1 + Random().nextInt(6));
    int bottomDiceNewValue = (1 + Random().nextInt(6));
    AssetImage firstImage;
    AssetImage secondImage;
    switch (topDiceNewValue) {
      case 1:
        firstImage = diceOne;
        break;
      case 2:
        firstImage = diceTwo;
        break;
      case 3:
        firstImage = diceThree;
        break;
      case 4:
        firstImage = diceFour;
        break;
      case 5:
        firstImage = diceFive;
        break;
      case 6:
        firstImage = diceSix;
        break;
    }
    switch (bottomDiceNewValue) {
      case 1:
        secondImage = diceOne;
        break;
      case 2:
        secondImage = diceTwo;
        break;
      case 3:
        secondImage = diceThree;
        break;
      case 4:
        secondImage = diceFour;
        break;
      case 5:
        secondImage = diceFive;
        break;
      case 6:
        secondImage = diceSix;
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
              Text(
                answer,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 35.0,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(
                  Constants.dicesContainerMarginLeftTopRight,
                  Constants.dicesContainerMarginLeftTopRight,
                  Constants.dicesContainerMarginLeftTopRight,
                  Constants.dicesContainerMarginBottom,
                ),
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
                margin: EdgeInsets.only(top: Constants.playButtonTopMargin),
                child: ElevatedButton(
                  child: Text(
                    'Good luck!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: Constants.playButtonFontSize,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Constants.playButtonBorderRadius,
                      ),
                    ),
                    primary: Colors.blue,
                    padding: EdgeInsets.fromLTRB(
                      Constants.playButtonTopBottomPadding,
                      Constants.playButtonLeftRightPadding,
                      Constants.playButtonTopBottomPadding,
                      Constants.playButtonLeftRightPadding,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
