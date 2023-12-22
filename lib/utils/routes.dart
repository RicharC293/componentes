import 'package:componentes/screens/home_screen.dart';
import 'package:componentes/screens/lists_screen.dart';
import 'package:componentes/screens/lists_view_screen.dart';
import 'package:componentes/screens/navigation_screen.dart';
import 'package:componentes/screens/routing_screen.dart';

/// Crear nuestras rutas

final routes = {
  HomeScreen.routeName : (context) => const HomeScreen(),
  RoutingScreen.routeName : (context) => const RoutingScreen(),
  NavigationScreen.routeName: (context) => const NavigationScreen(),
  ListScreen.routeName: (context) => const ListScreen(),
  ListsViewScreen.routeName: (context) => const ListsViewScreen(),
};