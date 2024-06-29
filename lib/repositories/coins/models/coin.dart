class Coin {
  Coin({
    required this.imageUrl,
    required this.name,
    required this.prices,
  });

  final String imageUrl;
  final String name;
  final Map<String, dynamic> prices;
}
