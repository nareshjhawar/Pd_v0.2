import 'package:flutter/material.dart';

class Task {
  String tasknumber;
  String title;
  Color progresscolor;
  double value;

  Task({
    required this.tasknumber,
    required this.title,
    required this.progresscolor,
    required this.value
  });
}

List<Task> tasklist = [
  Task(tasknumber: "40 tasks", title: "Set Routine", progresscolor: const Color(0xFFAC05FF), value: 0.8),
  Task(tasknumber: "16 tasks", title: "Analyze Mode", progresscolor:  Colors.blue, value: 0.6),
];
