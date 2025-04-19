// File: pages/calculator_page.dart
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _a = TextEditingController();
  final TextEditingController _b = TextEditingController();
  double result = 0;

  void calculate(String op) {
    double x = double.tryParse(_a.text) ?? 0;
    double y = double.tryParse(_b.text) ?? 0;
    switch (op) {
      case '+':
        result = x + y;
        break;
      case '-':
        result = x - y;
        break;
      case '*':
        result = x * y;
        break;
      case '/':
        result = y != 0 ? x / y : 0;
        break;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _a.dispose();
    _b.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _a,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "First Number"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _b,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Second Number"),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children:
                  ['+', '-', '*', '/']
                      .map(
                        (op) => ElevatedButton(
                          onPressed: () => calculate(op),
                          child: Text(op),
                        ),
                      )
                      .toList(),
            ),
            const SizedBox(height: 20),
            Text("Result: $result", style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
