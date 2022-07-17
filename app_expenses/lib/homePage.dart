import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_expenses/controllers/controller_list.dart';
import 'package:app_expenses/components/transactions/transaction_list.dart';
import 'package:app_expenses/components/chart.dart';
import 'components/chart.dart';

import 'dart:io';

class MyHomePage extends StatelessWidget {
  var controller = Get.put(ControllerList());

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // se está paisagem
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final iconList = Platform.isIOS ? CupertinoIcons.list_bullet : Icons.list;
    final chartList =
        Platform.isIOS ? CupertinoIcons.chart_bar_fill : Icons.show_chart;

    final actions = <Widget>[
      if (isLandscape)
        controller.getIconButton(
            controller.showChart.value ? iconList : chartList, () {
          return controller.showChart.value = !controller.showChart.value;
        }),
      controller.getIconButton(
        Platform.isIOS ? CupertinoIcons.add : Icons.add,
        () {
          return controller.openTransactionFormModal(context);
        },
      ),
    ];

    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
          fontSize: 20 * mediaQuery.textScaleFactor,
        ),
      ),
      actions: <Widget>[
        if (isLandscape)
          controller.getIconButton(
              controller.showChart.value ? iconList : chartList, () {
            return controller.showChart.value = !controller.showChart.value;
          }),
        controller.getIconButton(
          Platform.isIOS ? CupertinoIcons.add : Icons.add,
          () {
            return controller.openTransactionFormModal(context);
          },
        ),
      ],
    );

    final availabelHeight = (mediaQuery.size.height -
            appBar.preferredSize.height -
            mediaQuery.padding.top)
        .obs;

    return Platform.isIOS
        ? Obx(
            () => CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: const Text('Despesas Pessoais'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (isLandscape)
                      controller.getIconButton(
                          controller.showChart.value ? iconList : chartList,
                          () {
                        return controller.showChart.value =
                            !controller.showChart.value;
                      }),
                    controller.getIconButton(
                      Platform.isIOS ? CupertinoIcons.add : Icons.add,
                      () {
                        return controller.openTransactionFormModal(context);
                      },
                    ),
                  ],
                ),
              ),
              child: SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    if (controller.showChart.value || !isLandscape)
                      SizedBox(
                        height: availabelHeight * (isLandscape ? 0.85 : 0.25),
                        child: Chart(controller.recentTransactions),
                      ),
                    if (!controller.showChart.value || !isLandscape)
                      SizedBox(
                        height: availabelHeight * (isLandscape ? 1 : 0.75),
                        child: TransactionList(
                          controller.transactions,
                          controller.removeTransaction,
                        ),
                      ),
                  ],
                ),
              )),
            ),
          )
        : Obx(
            () => Scaffold(
              appBar: AppBar(
                title: Text(
                  'Despesas Pessoais',
                  style: TextStyle(
                    fontSize: 20 * mediaQuery.textScaleFactor,
                  ),
                ),
                actions: <Widget>[
                  if (isLandscape)
                    controller.getIconButton(
                        controller.showChart.value ? iconList : chartList, () {
                      return controller.showChart.value =
                          !controller.showChart.value;
                    }),
                  controller.getIconButton(
                    Platform.isIOS ? CupertinoIcons.add : Icons.add,
                    () {
                      return controller.openTransactionFormModal(context);
                    },
                  ),
                ],
              ),
              body: SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    if (controller.showChart.value || !isLandscape)
                      SizedBox(
                        height: availabelHeight * (isLandscape ? 0.85 : 0.25),
                        child: Chart(controller.recentTransactions),
                      ),
                    if (!controller.showChart.value || !isLandscape)
                      SizedBox(
                        height: availabelHeight * (isLandscape ? 1 : 0.75),
                        child: TransactionList(
                          controller.transactions,
                          controller.removeTransaction,
                        ),
                      ),
                  ],
                ),
              )),
              floatingActionButton: FloatingActionButton(
                onPressed: () => controller.openTransactionFormModal(context),
                child: const Icon(Icons.add),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            ),
          );
  }
}
