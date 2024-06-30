import 'package:crypto_coins_app/router/router.dart';
import 'package:crypto_coins_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class CryptoCoinsApp extends StatelessWidget {
  const CryptoCoinsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Coins',
      themeMode: ThemeMode.dark,
      theme: darkTheme,
      initialRoute: '/coin_list',
      routes: routes,
      navigatorObservers: [TalkerRouteObserver(GetIt.I<Talker>())],
    );
  }
}
