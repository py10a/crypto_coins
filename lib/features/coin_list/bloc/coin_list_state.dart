part of 'coin_list_bloc.dart';

abstract class CoinListState extends Equatable {}

/// Represents the initial state in the CoinListBloc.
class CoinListInitial extends CoinListState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

/// Represents a loading state in the CoinListBloc.
class CoinListLoading extends CoinListState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

/// Represents a loaded state in the CoinListBloc.
class CoinListLoaded extends CoinListState {
  CoinListLoaded({required this.coins});
  final List<Coin> coins;

  @override
  List<Object?> get props => [coins];
}

/// Represents an error state in the CoinListBloc.
class CoinListError extends CoinListState {
  CoinListError({this.message});

  late final Object? message;

  @override
  List<Object?> get props => [message];
}
