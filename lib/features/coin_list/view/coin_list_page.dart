import 'package:crypto_coins_app/features/coin_list/widgets/widgets.dart';
import "package:flutter/material.dart";

class CoinListPage extends StatefulWidget {
  const CoinListPage({super.key});

  @override
  State<CoinListPage> createState() => _CoinListPageState();
}

class _CoinListPageState extends State<CoinListPage> {
  AppBar get appBar {
    return AppBar(
      centerTitle: true,
      title: const Text('Your Coins'),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(22),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: ListView.separated(
          itemCount: 100,
          itemBuilder: (ctx, index) => const CoinListTile(),
          separatorBuilder: (ctx, index) =>
              const Divider(height: 8, indent: 20),
        ),
      ),
    );
  }
}
