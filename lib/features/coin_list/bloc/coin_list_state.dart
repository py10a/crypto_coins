part of 'coin_list_bloc.dart';

abstract class CoinListState extends Equatable {}

class CoinListInitial extends CoinListState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CoinListLoading extends CoinListState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CoinListLoaded extends CoinListState {
  CoinListLoaded({required this.coins});
  final List<Coin> coins;

  @override
  List<Object?> get props => [coins];
}

class CoinListError extends CoinListState {
  CoinListError({this.message});
  final Object? message;

  @override
  List<Object?> get props => [message];
}
