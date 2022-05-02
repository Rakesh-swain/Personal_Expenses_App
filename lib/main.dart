import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 20.37,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 30.68,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.yellow,
                child: Text("CHART!"),
                elevation: 5,
              ),
            ),

            // ignore: prefer_const_literals_to_create_immutables
            Card(
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const TextField(
                        decoration: InputDecoration(labelText: 'Title'),
                      ),
                      const TextField(
                        decoration: InputDecoration(labelText: 'Amount'),
                      ),
                      FlatButton(
                        child: const Text('Add Transaction'),
                        textColor: Colors.purple,
                        onPressed: () {},
                      ),
                    ]),
              ),
            ),
            Column(
              children: transaction.map((tx) {
                return Card(
                  child: Row(children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.black,
                        width: 2,
                      )),
                      child: Text(
                        '₹${tx.amount}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          // DateFormat('dd/MM/yyyy').format(tx.date),
                          //DateFormat.MMMd().format(tx.date),
                          DateFormat().format(tx.date),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ]),
                );
              }).toList(),
            ),
          ]),
    );
  }
}
