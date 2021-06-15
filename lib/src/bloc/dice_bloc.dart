import 'i_bloc.dart';

abstract class IDiceRollBloc extends Ibloc{
  int get currentState;
  Stream<Int>
  void diceChanger();
}
