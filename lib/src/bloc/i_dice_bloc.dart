import 'package:flutter/cupertino.dart';

import 'bloc.dart';

abstract class IDiceBloc extends Bloc {
  Stream<List<AssetImage>> get valuesStream;
  List<AssetImage> defaultDice();
  bool get dicesAreEqual;
  void diceChanger();
}
