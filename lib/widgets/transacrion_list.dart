import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

//only show the list
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transaction added before! ',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 300,
                  child: Image.asset('assets/images/waiting.png'),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 50,
                      child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text("\$${transactions[index].amount}")),
                    ),
                    title: Text(
                      "${transactions[index].title}",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
