import 'dart:async';

import 'package:crypto_coins_app/features/coin_list/bloc/coin_list_bloc.dart';
import 'package:crypto_coins_app/features/coin_list/widgets/widgets.dart';
import 'package:crypto_coins_app/repositories/coins/abstract_coins_repository.dart';
import 'package:crypto_coins_app/repositories/coins/models/models.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CoinListPage extends StatefulWidget {
  const CoinListPage({super.key});

  @override
  State<CoinListPage> createState() => _CoinListPageState();
}

class _CoinListPageState extends State<CoinListPage> {
  final CoinListBloc _bloc = CoinListBloc(
    GetIt.I<AbstractCoinsRepository>(),
  );

  @override
  initState() {
    super.initState();
    _bloc.add(CoinListFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Your Coins'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer<void>();
          _bloc.add(CoinListFetch(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CoinListBloc, CoinListState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is CoinListLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CoinListLoaded) {
              return Center(
                child: Column(
                  children: [
                    const CoinSearchBar(),
                    Expanded(
                      child: ListView.separated(
                        itemCount: state.coins.length,
                        itemBuilder: (ctx, index) {
                          final coin = state.coins[index];
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
              );
            }
            if (state is CoinListError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Error',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 40),
                    ),
                    const SizedBox(height: 32),
                    Text('${state.message}'),
                  ],
                ),
              );
            }
            return const Center(
              child: Text('Error: default case'),
            );
          },
        ),
      ),
    );
  }
}
