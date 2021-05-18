import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './../models/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransaction;
  final Function _deleteTransaction;

  TransactionList(this._userTransaction, this._deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _userTransaction.isEmpty
          ? Column(
              children: [
                Text(
                  "No transaction",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 20,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                          child: Text('\$${_userTransaction[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      _userTransaction[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd()
                          .format(_userTransaction[index].date)
                          .toString(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    trailing: IconButton(
                      onPressed: () =>
                          _deleteTransaction(_userTransaction[index].id),
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  ),
                );
              },
              itemCount: _userTransaction.length,
            ),
    );
    /*Column(
            children: transactions
                .map((t) => Card(
                      child: Text(t.title),
                    ))
                .toList(),
          ),*/
  }
}
