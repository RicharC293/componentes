import 'package:componentes/screens/routing_screen.dart';
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
            leading: const Icon(Icons.pages),
            title: const Text('Routing'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, RoutingScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
