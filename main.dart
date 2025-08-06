import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const EmiCalculatorApp());
}

class EmiCalculatorApp extends StatelessWidget {
  const EmiCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
