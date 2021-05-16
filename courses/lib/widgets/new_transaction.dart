import 'package:courses/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final title = TextEditingController();
  final amount = TextEditingController();

  NewTransaction(this.addTx);

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
              //onChanged: (value) => titleInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Enter the amount"),
              controller: amount,
              //onChanged: (value) => amountInput = value,
            ),
            TextButton(
              onPressed: () {
                addTx(title.text, double.parse(amount.text));
                print(title.text);
                //print("$titleInput, $amountInput");
              },
              child: Text("Add Transaction"),
              style: TextButton.styleFrom(primary: Colors.purple),
            )
          ],
        ),
      ),
    );
  }
}
