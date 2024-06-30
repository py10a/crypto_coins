import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoinDetailsPage extends StatefulWidget {
  const CoinDetailsPage({super.key});

  @override
  State<CoinDetailsPage> createState() => _CoinDetailsPageState();
}

class _CoinDetailsPageState extends State<CoinDetailsPage> {
  String coinName = '';
  String coinPrice = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;

    // Check if the arguments are null or not a map
    assert(args != null && args is Map, 'Arguments are null');

    final coinMap = args as Map;
    coinName = coinMap['coin_name'];
    coinPrice = coinMap['coin_prices'].toString();
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
              SvgPicture.asset(
                'assets/svg/bitcoin_logo.svg',
                width: 128,
                height: 128,
              ),
              const SizedBox(height: 16),
              const Text(
                'Bitcoin',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
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
