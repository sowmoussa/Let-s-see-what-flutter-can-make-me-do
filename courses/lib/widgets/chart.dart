import 'package:courses/widgets/bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './../models/Transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactionsValues.fold(0.0, (previousValue, element) {
      return previousValue + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionsValues.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: BarChart(
                e['day'],
                e['amount'],
                maxSpending == 0.0
                    ? 0.0
                    : (e['amount'] as double) / maxSpending,
              ),
            );
            //return Text('${e['day']}: ${e['amount']}');
          }).toList(),
        ),
      ),
    );
  }
}
