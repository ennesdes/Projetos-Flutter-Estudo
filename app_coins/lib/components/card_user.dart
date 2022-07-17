import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_coins/controllers/user_data_controller.dart';
import 'shimmer_widget.dart';

class CardUser extends StatelessWidget {
  final UserDataController _userDataController = Get.find<UserDataController>();

  CardUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _userDataController.getUserData().then((userData) {
      _userDataController.walletId.value = userData.walletId!;
      _userDataController.userBalance.value = userData.userBalance!;
    });
    return Obx(
      () => Card(
        color: Theme.of(context).colorScheme.primary,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _userDataController.isLoadingUser
                  ? Column(children: const [
                      ShimmerWidget.rectangular(heigth: 20),
                      SizedBox(height: 5),
                      ShimmerWidget.rectangular(heigth: 15),
                      SizedBox(height: 40),
                      ShimmerWidget.rectangular(heigth: 15),
                      SizedBox(height: 5),
                      ShimmerWidget.rectangular(heigth: 30),
                    ])
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Seja bem vindo!',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'ID carteira: ${_userDataController.walletId.value}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          'Saldo disponível:',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'R\$ ${_userDataController.userBalance.value}',
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
