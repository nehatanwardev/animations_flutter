import 'package:day_2_explicit_animation/explicit_animation_demo.dart';
import 'package:day_2_explicit_animation/explicit_animation_demo_2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explicit Animation Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AnimatedBottomSheetExample(),
    );
  }
}
