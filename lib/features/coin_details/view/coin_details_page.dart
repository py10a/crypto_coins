import 'package:flutter/material.dart';

class CoinDetailsPage extends StatefulWidget {
  const CoinDetailsPage({super.key});

  @override
  State<CoinDetailsPage> createState() => _CoinDetailsPageState();
}

class _CoinDetailsPageState extends State<CoinDetailsPage> {
  String coinName = '';
  String coinPrice = '';
  String coinImageUrl = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;

    assert(args != null && args is Map);
    final coinMap = args as Map;
    coinName = coinMap['coin_name'];
    coinPrice = coinMap['coin_prices'].toString();
    coinImageUrl = coinMap['coin_image_url'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(coinName),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: coinName,
                child: Image.network(
                  coinImageUrl,
                  width: 128,
                  height: 128,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                coinName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
              const SizedBox(height: 16),
              Text('Price: \$$coinPrice'),
            ],
          ),
        ),
      ),
    );
  }
}
