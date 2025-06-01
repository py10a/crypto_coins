import 'package:flutter/material.dart';

class CoinListTile extends StatelessWidget {
  const CoinListTile({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.prices,
  });

  final String imageUrl;
  final String name;
  final Map<String, dynamic> prices;

  String get subtitle {
    final pricesInDifferentCurrencies =
        prices.entries.map((e) => e.value['PRICE']).toList();
    return pricesInDifferentCurrencies.join(' • ');
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: name,
        child: Image.network(imageUrl, width: 32, height: 32),
      ),
      title: Text(name),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin_detailed',
          arguments: {
            'coin_name': name,
            'coin_prices': prices,
            'coin_image_url': imageUrl,
          },
        );
      },
    );
  }
}
