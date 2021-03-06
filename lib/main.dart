import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_shine/flutter_shine.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double x;
  double y;

  @override
  void initState() {
    super.initState();

    x = -100;
    y = -100;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          onLongPressMoveUpdate: _onLongPressMoveUpdate,
          child: Center(
            child: FlutterShine(
              config: Config(shadowColor: Colors.cyan[800]),
              light: Light(intensity: 1, position: Point(x, y)),
              builder: (BuildContext context, ShineShadow shineShadow) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      "Envi",
                      style: TextStyle(
                          fontFamily: "JetBrainsMono",
                          fontSize: 150,
                          color: Colors.grey,
                          shadows: shineShadow?.shadows),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _onLongPressMoveUpdate(LongPressMoveUpdateDetails details) {
    setState(() {
      this.x = details.offsetFromOrigin.dx;
      this.y = details.offsetFromOrigin.dy;
    });
  }
}