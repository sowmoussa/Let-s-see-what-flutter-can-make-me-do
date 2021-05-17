import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final title = TextEditingController();

  final amount = TextEditingController();

  void submitData() {
    final enterTitle = title.text;
    final enterAmount = double.parse(amount.text);

    if (enterTitle.isEmpty || enterAmount <= 0) {
      return;
    }

    widget.addTx(
      enterTitle,
      enterAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Enter the title"),
              controller: title,
              onSubmitted: (_) => submitData,
              //onChanged: (value) => titleInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Enter the amount"),
              controller: amount,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) => submitData,
              //onChanged: (value) => amountInput = value,
            ),
            TextButton(
              onPressed: submitData,
              child: Text("Add Transaction"),
              style: TextButton.styleFrom(primary: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
