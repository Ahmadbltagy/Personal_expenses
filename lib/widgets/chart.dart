import 'package:flutter/material.dart';
import './chart_bar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalAmountSum = 0.0;

      for (int i = 0; i < recentTransactions.length; i++)
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year)
          totalAmountSum += recentTransactions[i].amount;

      print(DateFormat.E().format(weekDay));
      print(totalAmountSum);
      return {
        'day': DateFormat.E().format(weekDay),
        'amount': totalAmountSum,
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: groupedTransactionValues.map((d) {
          return ChartBar(
              d['day'],
              d['amount'],
              totalSpending == 0.0
                  ? 0.0
                  : (d['amount'] as double) / totalSpending);
        }).toList(),
      ),
    );
  }
}
