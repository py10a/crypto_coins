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
  CoinListBloc(this.coinsRepository) : super(CoinListInitial()) {
    on<CoinListFetch>(_load);
  }

  AbstractCoinsRepository coinsRepository;

  Future<void> _load(
    CoinListFetch event,
    Emitter<CoinListState> emit,
  ) async {
    try {
      if (state is! CoinListLoaded) {
        emit(CoinListLoading());
      }
      final coinsList = await coinsRepository.getCoins();
      emit(CoinListLoaded(coins: coinsList));
    } catch (e) {
      emit(CoinListError(message: e));
      GetIt.I<Talker>().handle(e);
    } finally {
      event.completer?.complete();
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    GetIt.I<Talker>().handle(error, stackTrace);
  }
}
