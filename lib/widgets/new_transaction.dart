import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectDate == null) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectDate);
    Navigator.of(context).pop();
  }

  void _presentDataPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((PickedDate) {
      if (PickedDate == null) {
        return;
      }
      setState(() {
        _selectDate = PickedDate;
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
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              // onChanged: (val) {
              //   titleInput = val;
              // },
              controller: _titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              //onChanged: (val) => amountInput = val,
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            // ignore: prefer_const_literals_to_create_immutables
            Container(
              height: 65,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectDate == null
                        ? 'No data choosen!'
                        : 'pickedDate: ${DateFormat.yMMMMd().format(_selectDate!)}'),
                  ),
                  AdaptiveFlatButton('Choose Date', _presentDataPicker),
                ],
              ),
            ),
            RaisedButton(
              child: const Text('Add Transaction'),
              textColor: Theme.of(context).textTheme.button?.color,
              color: Theme.of(context).primaryColor,
              onPressed: () => _submitData(),
            ),
          ]),
        ),
      ),
    );
  }
}
