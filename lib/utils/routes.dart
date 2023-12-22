import 'package:componentes/screens/home_screen.dart';
import 'package:componentes/screens/routing_screen.dart';

/// Crear nuestras rutas

final routes = {
  HomeScreen.routeName : (context) => const HomeScreen(),
  RoutingScreen.routeName : (context) => const RoutingScreen(),
};