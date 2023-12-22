import 'package:componentes/screens/lists_screen.dart';
import 'package:componentes/screens/lists_view_screen.dart';
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
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Listas - Single Child Scroll View'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, ListScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Listas - ListView'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, ListsViewScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
