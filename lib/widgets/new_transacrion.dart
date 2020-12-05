import 'package:flutter/material.dart';

//Take new trans from user
class NewTransaction extends StatefulWidget {
  final Function addTransaction;
  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    void submitData() {
      if (titleController.text.isEmpty ||
          double.parse(amountController.text) <= 0) {
        return;
      }

      widget.addTransaction(
        titleController.text,
        double.parse(amountController.text),
      );

      Navigator.of(context).pop();
    }

    return Card(
      elevation: 5.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                onSubmitted: (_) => submitData(),
              ),
              FlatButton(
                onPressed: submitData,
                child: Text('Add Transaction'),
                textColor: Colors.purple,
              )
            ],
          ),
        ),
      ),
    );
  }
}
