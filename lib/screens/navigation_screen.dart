import 'package:flutter/material.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  static const String routeName = '/navigation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navegacion'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            // if (Navigator.canPop(context)) {
            //   Navigator.pop(context);
            // }
            Navigator.maybePop(context);
          },
          child: Text('Ir al home'),
        ),
      ),
    );
  }
}
