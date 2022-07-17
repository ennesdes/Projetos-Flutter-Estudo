import 'package:app_coins/modals/details_coins.dart';

class Coin {
  String? currencyName = "";
  String cotation = "";
  String? symbol = "";
  String? imageUrl = "";
  DetailsCoin details;

  Coin({
    required this.currencyName,
    required this.cotation,
    required this.symbol,
    required this.imageUrl,
    required this.details,
  });

  factory Coin.fromJson(Map<String, dynamic> coinsJson) => Coin(
        currencyName: coinsJson['currency_name'],
        cotation: coinsJson['cotation'],
        symbol: coinsJson['symbol'],
        imageUrl: coinsJson['image_url'],
        details: DetailsCoin.fromJson(coinsJson['details']),
      );
}
