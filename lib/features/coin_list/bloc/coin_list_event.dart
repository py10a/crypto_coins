part of 'coin_list_bloc.dart';

abstract class CoinListEvent {}

/// Represents an event to fetch the list of coins.
class CoinListFetch extends CoinListEvent {
  CoinListFetch({this.completer});
  final Completer<void>? completer;
}

/// Event to filter coins by search query.
class CoinListSearch extends CoinListEvent {
  final String query;
  CoinListSearch(this.query);
}
