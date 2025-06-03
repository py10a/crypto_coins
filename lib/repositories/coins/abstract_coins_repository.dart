import 'models/models.dart';

/// An abstract class that defines the contract for a coins repository.
abstract interface class AbstractCoinsRepository {
  /// Fetches a list of coins with their prices in different currencies.
  Future<List<Coin>> getCoins();
}
