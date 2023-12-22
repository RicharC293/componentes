import 'package:componentes/screens/home_screen.dart';
import 'package:componentes/utils/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      routes: routes,
      initialRoute: HomeScreen.routeName,
      theme: ThemeData.light(useMaterial3: true),
    );
  }
}
