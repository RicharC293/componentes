import 'package:componentes/screens/navigation_screen.dart';
import 'package:flutter/material.dart';

class RoutingScreen extends StatelessWidget {
  const RoutingScreen({super.key});

  static const String routeName = '/routing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routing'),
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Push Named'),
            onTap: () {
              Navigator.pushNamed(context, NavigationScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Push Replacement Named'),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, NavigationScreen.routeName);
            },
          ),
          ListTile(
            title: const Text('Push Named and Remove Until'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, NavigationScreen.routeName, (route) {
                print(route.settings.name == NavigationScreen.routeName);
                return false;
              });
            },
          ),
          ListTile(
            title: const Text('Pop'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const NavigationScreen();
              }));
            },
            child: Container(
              width: 100,
              // color: Colors.blue,
              child: const Text('Push'),
            ),
          ),
        ],
      ),
    );
  }
}
