import 'package:app_expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  var transactions = <Transaction>[].obs;
  Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => transactions.isEmpty
          ? LayoutBuilder(builder: ((context, constraints) {
              return Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.03),
                  Container(
                    height: constraints.maxHeight * 0.15,
                    child: Text(
                      'Nenhuma transação cadastrada!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.03),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            }))
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                //contexto e itens atuais
                Transaction tr = transactions[index];
                return TransactionItem(
                  tr: tr,
                  onRemove: onRemove,
                );
              },
            ),
    );
  }
}
