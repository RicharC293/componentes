import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      /// ListView -> scrolleable
      /// -> paddings
      /// -> fisica -> physics
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.pages),
            title: Text('Routing'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              print("TAP");
            },
          ),
        ],
      ),
    );
  }
}