import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  Coin({
    required this.imageUrl,
    required this.name,
    required this.prices,
  });

  final String imageUrl;
  final String name;
  final Map<String, dynamic> prices;

  @override
  List<Object?> get props => [imageUrl, name, prices];
}
