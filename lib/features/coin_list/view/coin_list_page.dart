import 'package:crypto_coins_app/features/coin_list/widgets/widgets.dart';
import 'package:crypto_coins_app/repositories/coins/abstract_coins_repository.dart';
import 'package:crypto_coins_app/repositories/coins/coins_repository.dart';
import 'package:crypto_coins_app/repositories/coins/models/models.dart';
import "package:flutter/material.dart";
import 'package:get_it/get_it.dart';

class CoinListPage extends StatefulWidget {
  const CoinListPage({super.key});

  @override
  State<CoinListPage> createState() => _CoinListPageState();
}

class _CoinListPageState extends State<CoinListPage> {
  List<Coin>? _coins;

  @override
  initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    _coins = await GetIt.I<AbstractCoinsRepository>().getCoins();
    setState(() {});
  }

  FloatingActionButton get floatingActionButton {
    return FloatingActionButton(
      onPressed: () => fetchData,
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Coins'),
      ),
      body: Center(
        child: (_coins == null)
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  const CoinSearchBar(),
                  Expanded(
                    child: ListView.separated(
                      itemCount: _coins!.length,
                      itemBuilder: (ctx, index) {
                        final coin = _coins![index];
                        return CoinListTile(
                          name: coin.name,
                          prices: coin.prices,
                          imageUrl: coin.imageUrl,
                        );
                      },
                      separatorBuilder: (ctx, index) =>
                          const Divider(height: 8, indent: 22),
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
