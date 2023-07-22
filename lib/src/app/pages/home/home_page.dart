import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String get route => '/home';

  @override
  State<HomePage> createState() => _HomrPageState();
}

class _HomrPageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          children: [
            Expanded(child: Text('Hello, heo mẹ!!')),
          ],
        ),
      ),
    );
  }
}
