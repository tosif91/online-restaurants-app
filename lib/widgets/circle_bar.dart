import 'package:flutter/material.dart';

Widget CircleBar(bool isActive) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 50),
    margin: EdgeInsets.symmetric(horizontal: 8),
    height: isActive ? 12 : 8,
    width: isActive ? 12 : 8,
    decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.lightBlue[50],
        borderRadius: BorderRadius.all(Radius.circular(12))),
  );
}