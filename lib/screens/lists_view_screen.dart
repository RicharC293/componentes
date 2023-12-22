import 'package:flutter/material.dart';

class ListsViewScreen extends StatelessWidget {
  const ListsViewScreen({super.key});

  static const String routeName = '/list-list-view';

  @override
  Widget build(BuildContext context) {
    final list = List.generate(10000, (index) => 'Index: $index');
    return Scaffold(
      appBar: AppBar(title: const Text('List View')),
      body: ListView(
        children: list
            .map((e) => ListTile(
                  title: Text(e),
                ))
            .toList(),
      ),
    );
  }
}
