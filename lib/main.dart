import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const CryptoApp());
}

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Coins',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ThemeData(
          colorScheme: ThemeData.dark().colorScheme.copyWith(
                primary: Colors.yellow,
                surface: const Color.fromARGB(255, 243, 243, 243),
              ),
        ).colorScheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 227, 197, 29),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/coin_list',
      routes: {
        '/coin_list': (context) => const CoinListPage(),
        '/coin_detailed': (context) => const CoinDetailsPage(),
      },
    );
  }
}

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
          itemBuilder: (ctx, index) {
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
              subtitle: Text('Price: \$${index * 10}'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/coin_detailed',
                  arguments: {
                    'coin_name': 'Bitcoin',
                    'coin_price': index * 10,
                  },
                );
              },
            );
          },
          separatorBuilder: (ctx, index) => const Divider(
            height: 8,
            indent: 20,
          ),
        ),
      ),
    );
  }
}

class CoinDetailsPage extends StatefulWidget {
  const CoinDetailsPage({super.key});

  @override
  State<CoinDetailsPage> createState() => _CoinDetailsPageState();
}

class _CoinDetailsPageState extends State<CoinDetailsPage> {
  String coin_name = '';
  String coin_price = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;

    assert(args != null && args is! Map, 'Arguments are null');

    if (args == null) {
      log('No arguments found');
      return;
    } else if (args is! Map) {
      log('Arguments are not a map');
      return;
    }

    coin_name = args['coin_name'];
    coin_price = args['coin_price'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(coin_name),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(22),
        )),
      ),
      body: Center(
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
            Text('Price: \$$coin_price'),
          ],
        ),
      ),
    );
  }
}
