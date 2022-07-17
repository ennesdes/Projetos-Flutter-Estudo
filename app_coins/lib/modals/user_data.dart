import 'package:app_coins/modals/coin.dart';

class UserData {
  String? message = "";
  String? walletId = "";
  String? userBalance = "";
  List<Coin> data;

  UserData({
    required this.message,
    required this.walletId,
    required this.userBalance,
    required this.data,
  });

  factory UserData.fromJson(Map<String, dynamic> parsedJson) {
    return UserData(
      message: parsedJson['message'],
      walletId: parsedJson['wallet_id'],
      userBalance: parsedJson['user_balance'],
      data: (parsedJson['data'] as List)
          .map((content) => Coin.fromJson(content))
          .toList(),
    );
  }
}
