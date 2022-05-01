import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            const Card(
              color: Colors.red,
              child: Text("List of Tx"),
            ),
          ]),
    );
  }
}
