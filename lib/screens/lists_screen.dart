import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  static const String routeName = '/list';

  @override
  Widget build(BuildContext context) {
    final list = List.generate(1000, (index) => 'Index: $index');
    return Scaffold(
      appBar: AppBar(title: const Text('Listas')),
      body: SingleChildScrollView(
        child: Column(
          children: list
              .map((e) => ListTile(
                    title: Text(e),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
