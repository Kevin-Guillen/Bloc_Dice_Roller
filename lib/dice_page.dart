import 'package:flutter/material.dart';
import 'utils/assets.dart';
import 'utils/constants.dart';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  late AssetImage topDice;
  late AssetImage bottomDice;

  @override
  void initState() {
    super.initState();
    setState(() {
      topDice = diceOne;
      bottomDice = diceOne;
    });
  }

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
