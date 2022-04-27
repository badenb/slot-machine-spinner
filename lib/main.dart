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
  final FixedExtentScrollController _controllerLeft = FixedExtentScrollController();
  final FixedExtentScrollController _controllerCenter = FixedExtentScrollController();
  final FixedExtentScrollController _controllerRight = FixedExtentScrollController();

  Random random = Random();
  int? numLeft = 0;
  int? numCenter = 0;
  int? numright = 0;
  
  final list = List<int>.generate(15, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: _controllerLeft,
              itemExtent: 200,
              diameterRatio: 6,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: List<Widget>.generate(list.length, (index) => Card(
                  color: Colors.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5.0),
                        ),
                        title: Text(
                          "${list[index]}",
                        ),
                      )
                    ],
                  ),
                ),)
              ),
              onSelectedItemChanged: (index) => {
                setState(() {
                  numLeft = index;
                })
              },
            ),
          ),
          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: _controllerCenter,
              itemExtent: 200,
              diameterRatio: 6,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: List<Widget>.generate(list.length, (index) => Card(
                  color: Colors.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5.0),
                        ),
                        title: Text(
                          "${list[index]}",
                        ),
                      )
                    ],
                  ),
                ),)
              ),
            ),
          ),
          Expanded(
            child: ListWheelScrollView.useDelegate(
              controller: _controllerRight,
              itemExtent: 200,
              diameterRatio: 6,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: List<Widget>.generate(list.length, (index) => Card(
                  color: Colors.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5.0),
                        ),
                        title: Text(
                          "${list[index]}",
                        ),
                      )
                    ],
                  ),
                ),)
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controllerLeft.animateToItem(random.nextInt(15),
          duration: const Duration(milliseconds: 2000), 
          curve: Curves.linear);
          _controllerCenter.animateToItem(random.nextInt(15),
          duration: const Duration(milliseconds: 2000), 
          curve: Curves.linear);
          _controllerRight.animateToItem(random.nextInt(15),
          duration: const Duration(milliseconds: 2000), 
          curve: Curves.linear);
        },
        tooltip: 'Spin',
        child: const Icon(Icons.sync),
      ),
    );
  }
}
