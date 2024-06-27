import 'package:crypto_coins_app/router/router.dart';
import 'package:crypto_coins_app/theme/theme.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
