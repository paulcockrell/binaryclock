import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'clock_column.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class BinaryTime {
  List<String> binaryIntegers = [];

  BinaryTime() {
    DateTime now = DateTime.now();
    String hhmmss = DateFormat('Hms').format(now).replaceAll(':', '');

    binaryIntegers = hhmmss
        .split('')
        .map((str) => int.parse(str).toRadixString(2).padLeft(4, '0'))
        .toList();
  }

  get hourTens => binaryIntegers[0];
  get hourOnes => binaryIntegers[1];
  get minuteTens => binaryIntegers[2];
  get minuteOnes => binaryIntegers[3];
  get secondTens => binaryIntegers[4];
  get secondOnes => binaryIntegers[5];
}

class _ClockState extends State<Clock> {
  BinaryTime _now = BinaryTime();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _now = BinaryTime();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClockColumn(
            binaryInteger: _now.hourTens,
            title: 'H',
            color: Colors.blue,
            rows: 2,
          ),
          ClockColumn(
            binaryInteger: _now.hourOnes,
            title: 'h',
            color: Colors.lightBlue,
          ),
          ClockColumn(
            binaryInteger: _now.minuteTens,
            title: 'M',
            color: Colors.green,
            rows: 3,
          ),
          ClockColumn(
            binaryInteger: _now.minuteOnes,
            title: 'm',
            color: Colors.lightGreen,
          ),
          ClockColumn(
            binaryInteger: _now.secondTens,
            title: 'S',
            color: Colors.pink,
            rows: 3,
          ),
          ClockColumn(
            binaryInteger: _now.secondOnes,
            title: 's',
            color: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }
}
