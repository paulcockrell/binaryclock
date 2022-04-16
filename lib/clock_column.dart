import 'dart:math';

import 'package:flutter/material.dart';

class ClockColumn extends StatelessWidget {
  final String binaryInteger;
  final String title;
  final Color color;
  final int rows;
  late final List<String> bits;

  ClockColumn(
      {required this.binaryInteger,
      required this.title,
      required this.color,
      this.rows = 4,
      Key? key})
      : super(key: key) {
    bits = binaryInteger.split('');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ...[
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          )
        ],
        ...bits.asMap().entries.map((entry) {
          int idx = entry.key;
          String bit = entry.value;

          bool isActive = bit == '1';
          int binaryCellValue = pow(2, 3 - idx).toInt();

          return AnimatedContainer(
            duration: const Duration(milliseconds: 475),
            curve: Curves.ease,
            height: 40,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: isActive
                  ? color
                  : idx < 4 - rows
                      ? Colors.white.withOpacity(0)
                      : Colors.black38,
            ),
            margin: const EdgeInsets.all(4),
            child: Center(
              child: isActive
                  ? Text(
                      binaryCellValue.toString(),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.2),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : Container(),
            ),
          );
        }),
        ...[
          Text(
            int.parse(binaryInteger, radix: 2).toString(),
            style: TextStyle(fontSize: 30, color: color),
          ),
          Text(
            binaryInteger,
            style: TextStyle(fontSize: 15, color: color),
          )
        ]
      ],
    );
  }
}
