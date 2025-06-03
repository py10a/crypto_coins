import 'package:dio/dio.dart';

import 'abstract_coins_repository.dart';
import 'models/models.dart';

class CoinsRepository implements AbstractCoinsRepository {
  CoinsRepository({required this.dio});

  final Dio dio;
  final String baseUrl =
      'https://min-api.cryptocompare.com/data/pricemultifull';
  final List<String> supportedCurrencies = [
    'USD',
    'EUR',
    'PLN',
  ];
  final List<String> supportedCoins = [
    'BTC',
    'ETH',
    'BNB',
    'USDT',
    'ADA',
    'DOT',
    'XRP',
  ];

  /// Fetches json data from the given URL.
  Future<Map<String, dynamic>> fetchJson(String url) async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load data from $url');
    }
  }

  /// Constructs a full URL with the given coins and currencies.
  String getFullUrlWithParams(List<String> coins, List<String> currencies) {
    final coinsParam = coins.join(',');
    final currenciesParam = currencies.join(',');

    if (coinsParam.isEmpty || currenciesParam.isEmpty) {
      throw ArgumentError('Coins and currencies cannot be empty');
    }
    if (coinsParam.length > 100 || currenciesParam.length > 100) {
      throw ArgumentError('Too many coins or currencies specified');
    }
    if (coinsParam.length > 50 || currenciesParam.length > 50) {
      throw ArgumentError('Too many characters in coins or currencies');
    }
    if (coinsParam.contains(' ') || currenciesParam.contains(' ')) {
      throw ArgumentError('Coins and currencies cannot contain spaces');
    }

    return '$baseUrl?fsyms=$coinsParam&tsyms=$currenciesParam';
  }

/// Fetches a list of coins with their prices in different currencies.
  @override
  Future<List<Coin>> getCoins() async {
    final url = getFullUrlWithParams(supportedCoins, supportedCurrencies);
    final data = await fetchJson(url);
    final dataCoins = data['DISPLAY'] as Map<String, dynamic>;
    final coinsParsed = dataCoins.entries.map((e) {
      final coinName = e.key;
      final coinCurrencies = e.value as Map<String, dynamic>;
      final coinImageUrl =
          'https://cryptocompare.com/${coinCurrencies['USD']['IMAGEURL']}';
      return Coin(
        name: coinName,
        prices: coinCurrencies,
        imageUrl: coinImageUrl,
      );
    }).toList();
    return coinsParsed;
  }
