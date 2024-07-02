import 'dart:async';

import 'package:crypto_coins_app/firebase_options.dart';
import 'package:crypto_coins_app/repositories/coins/abstract_coins_repository.dart';
import 'package:crypto_coins_app/repositories/coins/coins_repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'crypto_coins_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final talker = TalkerFlutter.init();
  final app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  GetIt.I.registerSingleton<Talker>(talker);
  GetIt.I.registerSingleton<Dio>(Dio());
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
    () => CoinsRepository(dio: GetIt.I<Dio>()),
  );
  // ignore: avoid_print
  GetIt.I<Talker>().info(app.options.projectId);
  GetIt.I.registerSingleton<FirebaseApp>(app);

  runApp(const CryptoCoinsApp());

  // runZonedGuarded(
  //   () => runApp(const CryptoCoinsApp()),
  //   (error, stackTrace) {
  //     GetIt.I<Talker>().handle(error, stackTrace);
  //   },
  // );
}
