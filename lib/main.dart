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
      body: Column(children: [
        // Card(
        //   child: Container(
        //     color: Colors.yellow,
        //     width: double.infinity,
        //     child: const Text("CHART!"),
        //   ),
        //   elevation: 5,
        // ),
        Container(
          width: double.infinity,
          child: const Card(
            color: Colors.yellow,
            child: Text("CHART!"),
            elevation: 5,
          ),
        ),

        const Card(
          child: Text("List of Tx"),
        ),
      ]),
    );
  }
}
