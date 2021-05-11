import 'package:flutter/material.dart';

import './transaction_item.dart';
import './transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deteteTx;

  TransactionList(this.transaction, this.deteteTx);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Card(
                    color: Colors.teal[100],
                    elevation: 6,
                    child: Text(
                      '    No Transactions added yet...   ',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.5,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(transaction: transaction[index], deteteTx: deteteTx);
            },
            itemCount: transaction.length,
          );
  }
}


