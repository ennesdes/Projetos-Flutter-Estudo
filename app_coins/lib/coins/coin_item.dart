import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_coins/controllers/user_data_controller.dart';
import 'package:app_coins/coins/coin_shimmer.dart';
import 'package:app_coins/modals/coin.dart';

class CoinItem extends StatelessWidget {
  final UserDataController _userDataController = Get.find<UserDataController>();
  final Coin coin;

  CoinItem({Key? key, required this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: _userDataController.isLoadingCoin.value
            ? CoinShimmer().buildCoinShimmer()
            : InkWell(
                onTap: () {
                  SnackBarCoin(context);
                },
                child: Stack(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(coin.imageUrl!),
                        radius: 30,
                      ),
                      title: Text(
                        coin.currencyName!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        coin.symbol!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Valor: R\$ ${_userDataController.mapPriceUsd![coin.symbol]}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(228, 1, 61, 212),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Qtd: ${coin.cotation}',
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  void SnackBarCoin(BuildContext context) {
    Get.snackbar(
      "${coin.currencyName}",
      "Sobre: \n${coin.details.about} \n\n Taxa: ${coin.details.fee}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Theme.of(context).colorScheme.primary,
      colorText: Colors.white,
      duration: const Duration(seconds: 7),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
    );
  }
}
