import 'package:flutter/material.dart';
import 'dairy_screen.dart';

void main() {
  runApp(DiaryApp());
}

// ignore: use_key_in_widget_constructors
class DiaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diary App',
      home: DiaryScreen(),
    );
  }
}
