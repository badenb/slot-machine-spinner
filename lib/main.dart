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
      home: const MyHomePage(title: 'Spin To Win'),
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
  final list = List<int>.generate(7, (i) => i);

  Random random = Random();

  int numLeft = 0;
  int numCenter = 0;
  int numRight = 0;

  setStateOfLeftWheelIndex() {
    int num = random.nextInt(7);
    while ( num == numLeft) {
      num = random.nextInt(7);
    }
    numLeft = num;
    _controllerLeft.animateToItem(numLeft, duration: const Duration(milliseconds: 2000), curve: Curves.easeInOut);
  }

  setStateOfCenterWheelIndex() {
    int num = random.nextInt(7);
    while ( num == numCenter) {
      num = random.nextInt(7);
    }
    numCenter = num;
    _controllerCenter.animateToItem(numCenter, duration: const Duration(milliseconds: 2000), curve: Curves.easeInOut);
  }

  setStateOfRightWheelIndex() {
    int num = random.nextInt(7);
    while ( num == numRight) {
      num = random.nextInt(7);
    }
    numRight = num;
    _controllerRight.animateToItem(numRight, duration: const Duration(milliseconds: 2000), curve: Curves.easeInOut);
  }
 
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
              physics: const NeverScrollableScrollPhysics(parent: null),
              controller: _controllerLeft,
              itemExtent: 300,
              diameterRatio: 6,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: List<Widget>.generate(list.length, (index) => Card(
                  color: Colors.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5.0),
                        ),
                        title: Center(
                          child: Text(
                            "${list[index]}",
                          )
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
              physics: const NeverScrollableScrollPhysics(parent: null),
              controller: _controllerCenter,
              itemExtent: 300,
              diameterRatio: 6,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: List<Widget>.generate(list.length, (index) => Card(
                  color: Colors.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5.0),
                        ),
                        title: Center(
                          child: Text(
                            "${list[index]}",
                          ),
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
              physics: const NeverScrollableScrollPhysics(parent: null),
              controller: _controllerRight,
              itemExtent: 300,
              diameterRatio: 6,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: List<Widget>.generate(list.length, (index) => Card(
                  color: Colors.blue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5.0),
                        ),
                        title: Center(
                          child: Text(
                            "${list[index]}",
                          ),
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
          setStateOfLeftWheelIndex();
          setStateOfCenterWheelIndex();
          setStateOfRightWheelIndex();
        },
        tooltip: 'Spin',
        child: const Icon(Icons.sync),
      ),
    );
  }
}
