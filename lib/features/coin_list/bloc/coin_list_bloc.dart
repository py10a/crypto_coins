import 'dart:async';

import 'package:crypto_coins_app/repositories/coins/abstract_coins_repository.dart';
import 'package:crypto_coins_app/repositories/coins/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'coin_list_event.dart';
part 'coin_list_state.dart';

class CoinListBloc extends Bloc<CoinListEvent, CoinListState> {
  final List<Coin> _allCoins = [];
  CoinListBloc(this.coinsRepository) : super(CoinListInitial()) {
    on<CoinListFetch>(_load);
    on<CoinListSearch>(_search);
  }

  /// The repository used to fetch the list of coins.
  AbstractCoinsRepository coinsRepository;

  /// Loads the list of coins from the repository and emits the appropriate state.
  Future<void> _load(
    CoinListFetch event,
    Emitter<CoinListState> emit,
  ) async {
    try {
      if (state is! CoinListLoaded) {
        emit(CoinListLoading());
      }
      final coinsList = await coinsRepository.getCoins();
      _allCoins
        ..clear()
        ..addAll(coinsList);
      emit(CoinListLoaded(coins: coinsList));
    } catch (e) {
      emit(CoinListError(message: e));
      GetIt.I<Talker>().handle(e);
    } finally {
      event.completer?.complete();
    }
  }

  /// Handles search events by filtering the loaded coins.
  Future<void> _search(
    CoinListSearch event,
    Emitter<CoinListState> emit,
  ) async {
    final query = event.query.trim().toLowerCase();
    if (query.isEmpty) {
      emit(CoinListLoaded(coins: List.from(_allCoins)));
    } else {
      final filtered =
          _allCoins.where((c) => c.name.toLowerCase().contains(query)).toList();
      emit(CoinListLoaded(coins: filtered));
    }
  }

  /// Handles errors by logging them to the Talker service.
  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
