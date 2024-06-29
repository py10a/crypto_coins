import 'package:crypto_coins_app/repositories/coins/abstract_coins_repository.dart';
import 'package:crypto_coins_app/repositories/coins/coins_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'crypto_coins_app.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CoinsRepository(dio: Dio()),
  );
  runApp(const CryptoCoinsApp());
}
