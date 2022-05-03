import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            // onChanged: (val) {
            //   titleInput = val;
            // },
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            //onChanged: (val) => amountInput = val,
            controller: amountController,
          ),
          FlatButton(
            child: const Text('Add Transaction'),
            textColor: Colors.purple,
            onPressed: () {
              // print(titleInput);
              // print(amountInput);
              print(titleController.text);
              print(amountController.text);
            },
          ),
        ]),
      ),
    );
  }
}
