import 'package:flutter/material.dart';

class SlidersScreen extends StatelessWidget {
  const SlidersScreen({super.key});

  static const String routeName = '/sliders';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sliders")),
      body: Column(
        children: [
          Image.asset('assets/image.png'),
        ],
      ),
    );
  }
}