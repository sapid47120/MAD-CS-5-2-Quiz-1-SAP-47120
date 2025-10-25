import 'package:flutter/material.dart';
import 'quiz1_counter.dart';
import 'quiz2_list_conditions.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeMenu(),
  ));
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAD Quiz #1 – SAP 47120'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const CounterScreen()));
              },
              child: const Text('Question 1: Counter App'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const NumberInputScreen()));
              },
              child: const Text('Question 2: Dart Lists & Conditions'),
            ),
          ],
        ),
      ),
    );
  }
}
