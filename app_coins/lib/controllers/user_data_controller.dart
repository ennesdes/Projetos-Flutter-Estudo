import 'dart:convert';
import 'dart:async' show Future;
import 'package:app_coins/modals/coin.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:coingecko_api/coingecko_api.dart';

import 'package:app_coins/modals/user_data.dart';

class UserDataController extends GetxController {
  var listCoins = (<Coin>[]).obs;
  final _isLoadingUser = true.obs;
  final isLoadingCoin = true.obs;
  var walletId = "".obs;
  var userBalance = "".obs;
  RxDouble? totalValueCoinInUsd = 0.0.obs;
  RxMap? mapPriceUsd = {}.obs;

  UserData userData = UserData(
    message: "",
    walletId: "",
    userBalance: "",
    data: [],
  );

  bool get isLoadingUser => _isLoadingUser.value;

  Future<String> _getInformationsJson() async {
    return await rootBundle.loadString('assets/criptomoedas.json');
  }

  Future<UserData> getUserData() async {
    try {
      String jsonString = await _getInformationsJson();

      final jsonResponse = json.decode(jsonString);

      userData = UserData.fromJson(jsonResponse);

      for (var coin in userData.data) {
        listCoins.add(
          Coin(
            cotation: coin.cotation,
            currencyName: coin.currencyName,
            details: coin.details,
            imageUrl: coin.imageUrl,
            symbol: coin.symbol,
          ),
        );
      }
      return userData;
    } finally {
      _isLoadingUser(false);
    }
  }

  Future<double> getValue(Coin coin) async {
    CoinGeckoApi api = CoinGeckoApi();

    var coinGeckInfo = await api.coins.listCoinMarkets(
      vsCurrency: 'usd',
    );
    coin.symbol = coin.symbol!.toLowerCase();

    for (var apiResult in coinGeckInfo.data) {
      if (coin.symbol == apiResult.symbol) {
        mapPriceUsd!.addAll({coin.symbol!: apiResult.currentPrice!});

        if (mapPriceUsd![coin.symbol] != null) {
          double? valueCoinCotation = double.parse(coin.cotation);
          double? valueCoinInUsd = mapPriceUsd![coin.symbol];

          totalValueCoinInUsd!.value =
              (valueCoinCotation * valueCoinInUsd!) * 5.24;

          totalValueCoinInUsd!.value = totalValueCoinInUsd!.value -
              (totalValueCoinInUsd!.value * (coin.details.fee! / 100));
        }
      }
    }
    return totalValueCoinInUsd!.value;
  }
}
