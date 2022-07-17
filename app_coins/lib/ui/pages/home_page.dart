import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_coins/coins/coin_list.dart';
import 'package:app_coins/components/card_user.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final availabelHeight = (mediaQuery.size.height -
            AppBar().preferredSize.height -
            mediaQuery.padding.top)
        .obs;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/Coins-Logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            const Text(" Teste Coins"),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: availabelHeight * 0.25,
                child: CardUser(),
              ),
              SizedBox(
                height: availabelHeight * 0.75,
                child: CoinList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
