import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            // onChanged: (val) {
            //   titleInput = val;
            // },
            controller: titleController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Amount'),
            //onChanged: (val) => amountInput = val,
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          Container(
            height: 65,
            child: Row(
              children: [
                const Text('No data choosen!'),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: const Text(
                    'Choose date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          RaisedButton(
            child: const Text('Add Transaction'),
            textColor: Theme.of(context).textTheme.button?.color,
            color: Theme.of(context).primaryColor,
            onPressed: () => submitData(),
          ),
        ]),
      ),
    );
  }
}
