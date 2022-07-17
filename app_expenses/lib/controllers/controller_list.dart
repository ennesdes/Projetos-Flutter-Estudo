import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import '../models/transaction.dart';
import 'package:app_expenses/components/transactions/transaction_form.dart';

class ControllerList extends GetxController {
  var transactions = (<Transaction>[]).obs;
  var showChart = false.obs;

  RxList<Transaction> get recentTransactions {
    return transactions
        .where((tr) {
          return tr.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
        })
        .toList()
        .obs;
  }

  Future<void> addTransaction(String title, double value, DateTime date) async {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    transactions.add(newTransaction);

    Get.back();
  }

  Future<void> removeTransaction(String id) async {
    transactions.removeWhere((tr) => tr.id == id);
  }

  Future<void> openTransactionFormModal(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(addTransaction);
      },
    );
  }

  Widget getIconButton(IconData icon, Function() fn) {
    return Platform.isIOS
        ? GestureDetector(onTap: fn, child: Icon(icon))
        : IconButton(icon: Icon(icon), onPressed: fn);
  }
}
