import 'package:dice_roller/src/bloc/i_dice_bloc.dart';
import 'package:flutter/material.dart';
import 'utils/assets.dart';
import 'utils/constants.dart';

class DicePage extends StatefulWidget {
  final IDiceBloc bloc;

  DicePage({
    required this.bloc,
  });

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var title = "Try to match the dices";
  List<Widget> _assetList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Dice Roller",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: Constants.appBarTitleFontSize,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: widget.bloc.valuesStream,
        initialData: widget.bloc.defaultDice(),
        builder: (
          context,
          snapshot,
        ) {
          return Container(
            color: widget.bloc.dicesAreEqual ? Colors.green : Colors.red,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontSize: Constants.titleFontSize, color: Colors.white,),
                  ),
                  Text(
                    widget.bloc.dicesAreEqual ? "Dices Matched" : "Keep Trying",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: Constants.answerFontSize,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(
                      Constants.dicesContainerMargin,
                    ),
                    child: _buildImage(snapshot),
                  ),
                  Container(
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
                        padding: EdgeInsets.symmetric(
                          horizontal: Constants.playButtonLeftRightPadding,
                          vertical: Constants.playButtonTopBottomPadding,
                        ),
                      ),
                      onPressed: () {
                        widget.bloc.diceChanger();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImage(AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      _assetList = _buildList(snapshot);
      return ListView.builder(
        itemCount: _assetList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return _assetList[index];
        },
      );
    } else {
      return Container();
    }
  }

  List<Widget> _buildList(AsyncSnapshot snapshot) {
    var _list = snapshot.data.map<Widget>((assetImage) {
      return Image(
        image: assetImage,
        width: Constants.dicesWidthAndHeight,
        height: Constants.dicesWidthAndHeight,
      );
    }).toList();
    return _list;
  }
}
