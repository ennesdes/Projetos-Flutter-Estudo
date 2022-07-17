import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:app_expenses/controllers/controller_list.dart';
import 'body_app.dart';

class MyHomePage extends StatelessWidget {
  var controller = Get.put(ControllerList());

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    RxBool isLandscape = (mediaQuery.orientation == Orientation.landscape).obs;

    final iconList = Platform.isIOS ? CupertinoIcons.list_bullet : Icons.list;
    final chartList =
        Platform.isIOS ? CupertinoIcons.chart_bar_fill : Icons.show_chart;

    final availabelHeight = (mediaQuery.size.height -
            AppBar().preferredSize.height -
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
                    if (isLandscape.value)
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
              child: BodyApp(
                controller: controller,
                isLandscape: isLandscape,
                availabelHeight: availabelHeight,
              ),
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
                  if (isLandscape.value)
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
              body: BodyApp(
                controller: controller,
                isLandscape: isLandscape,
                availabelHeight: availabelHeight,
              ),
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
