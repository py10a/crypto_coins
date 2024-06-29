import 'package:dio/dio.dart';
import 'abstract_coins_repository.dart';
import 'models/models.dart';

class CoinsRepository implements AbstractCoinsRepository {
  CoinsRepository({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<Coin>> getCoins() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,USDT,ADA,DOT,XRP&tsyms=USD,EUR,PLN');
    final data = response.data as Map<String, dynamic>;
    final dataCoins = data['DISPLAY'] as Map<String, dynamic>;
    final coinsParsed = dataCoins.entries.map((e) {
      final coinName = e.key; // BTC, ETH, BNB, USDT, ADA, DOT, XRP
      final coinCurrencies = e.value as Map<String, dynamic>; // USD, EUR, PLN
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
}
