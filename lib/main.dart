import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, DeviceOrientation;

import 'clock.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            color: Colors.black38,
            fontSize: 30,
          ),
        ),
        fontFamily: 'Alatsi',
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Clock(),
      ),
    );
  }
}
