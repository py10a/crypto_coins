import 'models/models.dart';

abstract class AbstractCoinsRepository {
  Future<List<Coin>> getCoins();
}
