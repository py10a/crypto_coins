import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoinListTile extends StatelessWidget {
  const CoinListTile({super.key});

  final int index = 1000; // TODO: Replace with actual coin price

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        'assets/svg/bitcoin_logo.svg',
        width: 32,
        height: 32,
      ),
      title: const Text(
        'Bitcoin',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      subtitle: Text('Price: ${index.toString()}'),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin_detailed',
          arguments: {
            'coin_name': 'Bitcoin', // TODO: Replace with actual coin name
            'coin_price': index * 10, // TODO: Replace with actual coin price
          },
        );
      },
    );
  }
}
