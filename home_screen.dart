import 'package:flutter/material.dart';
import '../utils/emi_calculator.dart';
import '../widgets/input_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();
  final TextEditingController _tenureController = TextEditingController();

  double? emi, totalInterest, totalAmount;

  void _calculateEMI() {
    final double principal = double.tryParse(_amountController.text) ?? 0;
    final double rate = double.tryParse(_interestController.text) ?? 0;
    final int months = int.tryParse(_tenureController.text) ?? 0;

    final result = EmiCalculator.calculate(principal, rate, months);

    setState(() {
      emi = result['emi'];
      totalInterest = result['interest'];
      totalAmount = result['total'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("EMI Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputField(controller: _amountController, label: "Loan Amount"),
            InputField(controller: _interestController, label: "Interest Rate (p.a)"),
            InputField(controller: _tenureController, label: "Tenure (months)"),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _calculateEMI, child: const Text("Calculate")),
            const SizedBox(height: 20),
            if (emi != null) ...[
              Text("Monthly EMI: ₹${emi!.toStringAsFixed(2)}"),
              Text("Total Interest: ₹${totalInterest!.toStringAsFixed(2)}"),
              Text("Total Payment: ₹${totalAmount!.toStringAsFixed(2)}"),
            ]
          ],
        ),
      ),
    );
  }
}
