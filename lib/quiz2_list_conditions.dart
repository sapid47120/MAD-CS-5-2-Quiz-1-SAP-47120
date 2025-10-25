import 'package:flutter/material.dart';

class NumberInputScreen extends StatefulWidget {
  const NumberInputScreen({super.key});

  @override
  State<NumberInputScreen> createState() => _NumberInputScreenState();
}

class _NumberInputScreenState extends State<NumberInputScreen> {
  final List<TextEditingController> controllers =
  List.generate(6, (_) => TextEditingController());
  String result = "";

  void calculate() {
    try {
      final numbers =
      controllers.map((c) => int.parse(c.text.trim())).toList();
      final sumOfOdds =
      numbers.where((n) => n.isOdd).fold<int>(0, (a, b) => a + b);
      final smallest = numbers.reduce((a, b) => a < b ? a : b);
      setState(() {
        result =
        "Numbers: $numbers\nSum of odd numbers: $sumOfOdds\nSmallest number: $smallest";
      });
    } catch (e) {
      setState(() => result = "⚠ Please enter valid integers in all fields.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dart Lists & Conditions"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Enter 6 integers:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            for (int i = 0; i < 6; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  controller: controllers[i],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Number ${i + 1}",
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculate,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text("Calculate"),
            ),
            const SizedBox(height: 20),
            Text(result, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
