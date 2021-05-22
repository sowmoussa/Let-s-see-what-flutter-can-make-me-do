import 'dart:io';

import 'package:courses/widgets/adaptive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _title = TextEditingController();
  final _amount = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    if (_amount.text.isEmpty) return;
    final enterTitle = _title.text;
    final enterAmount = double.parse(_amount.text);

    if (enterTitle.isEmpty || enterAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enterTitle,
      enterAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2022),
    ).then((value) {
      if (value == null) return;
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Enter the title"),
                controller: _title,
                onSubmitted: (_) => submitData,
                //onChanged: (value) => titleInput = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Enter the amount"),
                controller: _amount,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                onSubmitted: (_) => submitData,
                //onChanged: (value) => amountInput = value,
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No date chose'
                            : DateFormat.yMMMd().format(_selectedDate),
                      ),
                    ),
                    AdaptativeButton(
                      text: 'Choose Date',
                      handler: () => _presentDatePicker(context),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: submitData,
                child: Text("Add Transaction"),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  textStyle: Theme.of(context).textTheme.button, // check
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
