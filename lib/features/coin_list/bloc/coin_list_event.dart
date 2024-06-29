part of 'coin_list_bloc.dart';

abstract class CoinListEvent {}

class CoinListFetch extends CoinListEvent {
  CoinListFetch({this.completer});
  final Completer<void>? completer;
}
