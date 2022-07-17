import '../../controllers/controller_list.dart';
import '../../components/chart.dart';
import '../../components/transactions/transaction_list.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BodyApp extends StatelessWidget {
  final ControllerList controller;
  RxBool isLandscape = false.obs;
  RxDouble availabelHeight = 800.00.obs;

  BodyApp({
    Key? key,
    required this.controller,
    required this.isLandscape,
    required this.availabelHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (controller.showChart.value || !isLandscape.value)
                SizedBox(
                  height: availabelHeight * (isLandscape.value ? 0.85 : 0.25),
                  child: Chart(controller.recentTransactions),
                ),
              if (!controller.showChart.value || !isLandscape.value)
                SizedBox(
                  height: availabelHeight * (isLandscape.value ? 1 : 0.75),
                  child: TransactionList(
                    controller.transactions,
                    controller.removeTransaction,
                  ),
                ),
            ],
          ),
        )));
  }
}
