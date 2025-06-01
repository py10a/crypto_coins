import 'package:crypto_coins_app/features/coin_list/bloc/coin_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinSearchBar extends StatelessWidget {
  const CoinSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CupertinoSearchTextField(
        placeholder: 'Search',
        onChanged: (query) {
          context.read<CoinListBloc>().add(CoinListSearch(query));
        },
      ),
    );
  }
}
