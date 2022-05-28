import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fswitch_nullsafety/fswitch_nullsafety.dart';
import 'images.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: const Color(0xffc0a971),
        ),
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
  final images = [
    arch!, bells!, bouquet!, champagne!, dnd!, pmgmlv!, seven!, swan!
  ];

  Random random = Random();

  bool switchState = true;

  int numLeft = 0;
  int numCenter = 0;
  int numRight = 0;

  setStateOfLeftWheelIndex() {
    int num = random.nextInt(100);
    while ( num == numLeft) {
      num = random.nextInt(100);
    }
    numLeft = num;
    _controllerLeft.animateToItem(numLeft, duration: const Duration(milliseconds: 2000), curve: Curves.bounceOut);
  }

  setStateOfCenterWheelIndex() {
    int num = random.nextInt(100);
    while ( num == numCenter) {
      num = random.nextInt(100);
    }
    numCenter = num;
    _controllerCenter.animateToItem(numCenter, duration: const Duration(milliseconds: 3000), curve: Curves.bounceOut);
  }

  setStateOfRightWheelIndex() {
    int num = random.nextInt(100);
    while ( num == numRight) {
      num = random.nextInt(100);
    }
    numRight = num;
    _controllerRight.animateToItem(numRight, duration: const Duration(milliseconds: 4000), curve: Curves.bounceOut);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: ListWheelScrollView.useDelegate(
              physics: const NeverScrollableScrollPhysics(parent: null),
              controller: _controllerLeft,
              itemExtent: 300,
              diameterRatio: 6,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: List<Widget>.generate(images.length, (index) => Card(
                  color: Colors.white,
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
                          child: Image.asset(
                            images[index],
                            height: 200,
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
            flex: 2,
            child: ListWheelScrollView.useDelegate(
              physics: const NeverScrollableScrollPhysics(parent: null),
              controller: _controllerCenter,
              itemExtent: 300,
              diameterRatio: 6,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: List<Widget>.generate(images.length, (index) => Card(
                  color: Colors.white,
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
                          child: Image.asset(
                            images[index],
                            height: 200,
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
            flex: 2,
            child: ListWheelScrollView.useDelegate(
              physics: const NeverScrollableScrollPhysics(parent: null),
              controller: _controllerRight,
              itemExtent: 300,
              diameterRatio: 6,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: List<Widget>.generate(images.length, (index) => Card(
                  color: Colors.white,
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
                          child: Image.asset(
                            images[index],
                            height: 200,
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
            child: RotatedBox(
              quarterTurns: 3,
              child: FSwitch(
                color: const Color(0xffc0a971),
                openColor: const Color.fromARGB(255, 225, 211, 102),
                open: switchState,
                width: 400,
                height: 100,
                onChanged: (bool value) { 
                  setState(() {
                    switchState = false;
                  });
                  setStateOfLeftWheelIndex();
                  setStateOfCenterWheelIndex();
                  setStateOfRightWheelIndex();
                  setState(() {
                    switchState = true;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
