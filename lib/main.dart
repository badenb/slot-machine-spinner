import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Spinner'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Random random = Random();
  int? numLeft = 0;
  int? numCenter = 0;
  int? numright = 0;

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];


  void _randomNumber() {
    setState(() {
      numLeft = random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListWheelScrollView(
        itemExtent: 500,
        diameterRatio: 1.5,
        children: [
          ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('Entry ${entries[index]}')),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          )
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomNumber,
        tooltip: 'Spin',
        child: const Icon(Icons.sync),
      ),
    );
  }
}
