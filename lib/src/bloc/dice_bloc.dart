import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'i_dice_bloc.dart';
import 'package:dice_roller/utils/assets.dart';

class DiceBloc extends IDiceBloc {
  bool _dicesAreEqual = true;

  List<AssetImage> _diceImages = [
    AssetImages.diceOne,
    AssetImages.diceTwo,
    AssetImages.diceThree,
    AssetImages.diceFour,
    AssetImages.diceFive,
    AssetImages.diceSix
  ];

  StreamController<List<AssetImage>> _valuesStreamController =
      StreamController<List<AssetImage>>.broadcast();

  List<AssetImage> defaultDice() {
    List<AssetImage> _assetList = [];

    _assetList.add(AssetImages.diceOne);
    _assetList.add(AssetImages.diceOne);

    return _assetList;
  }

  @override
  void dispose() {
    _valuesStreamController.close();
  }

  @override
  void initialize() {}

  void diceRoller() {
    List<AssetImage> _assetList = [];

    _assetList.add(_diceImages[Random().nextInt(6)]);
    _assetList.add(_diceImages[Random().nextInt(6)]);
    _dicesAreEqual = _assetList[0] == _assetList[1];

    _valuesStreamController.sink.add(_assetList);
  }

  bool get dicesAreEqual => _dicesAreEqual;

  @override
  Stream<List<AssetImage>> get valuesStream => _valuesStreamController.stream;
}
