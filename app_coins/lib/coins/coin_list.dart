import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_data_controller.dart';
import 'package:app_coins/coins/coin_item.dart';
import '../modals/coin.dart';

class CoinList extends StatelessWidget {
  final UserDataController _userDataController = Get.find<UserDataController>();

  CoinList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _userDataController.listCoins.isEmpty
          ? LayoutBuilder(builder: (((context, constraints) {
              return Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.03),
                  Container(
                    height: constraints.maxHeight * 0.15,
                    child: const Text(
                      'Nenhuma criptomoeda na carteira',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            })))
          : ListView.builder(
              itemCount: _userDataController.listCoins.length,
              itemBuilder: (context, index) {
                Coin coin = _userDataController.listCoins[index];

                _userDataController.getValue(coin).then((resultGetValue) {
                  _userDataController.mapPriceUsd!
                      .addAll({coin.symbol!: resultGetValue.toPrecision(2)});

                  _userDataController.isLoadingCoin.value = false;
                });
                return CoinItem(coin: coin);
              },
            ),
    );
  }
}
