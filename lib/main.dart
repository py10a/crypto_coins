import 'dart:async';

import 'package:crypto_coins_app/repositories/coins/abstract_coins_repository.dart';
import 'package:crypto_coins_app/repositories/coins/coins_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'crypto_coins_app.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton<Talker>(talker);
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CoinsRepository(dio: Dio()),
  );

  runZonedGuarded(
    () => runApp(const CryptoCoinsApp()),
    (error, stackTrace) {
      GetIt.I<Talker>().handle(error, stackTrace);
    },
  );
}
