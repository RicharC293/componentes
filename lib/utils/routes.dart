import 'package:componentes/screens/alerts_screen.dart';
import 'package:componentes/screens/card_screen.dart';
import 'package:componentes/screens/form_screen.dart';
import 'package:componentes/screens/home_screen.dart';
import 'package:componentes/screens/infinity_scroll_screen.dart';
import 'package:componentes/screens/lists_screen.dart';
import 'package:componentes/screens/lists_view_screen.dart';
import 'package:componentes/screens/navigation_screen.dart';
import 'package:componentes/screens/photo_album_screen.dart';
import 'package:componentes/screens/routing_screen.dart';
import 'package:componentes/screens/sliders_screen.dart';

/// Crear nuestras rutas

final routes = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  RoutingScreen.routeName: (context) => const RoutingScreen(),
  NavigationScreen.routeName: (context) => const NavigationScreen(),
  ListScreen.routeName: (context) => const ListScreen(),
  ListsViewScreen.routeName: (context) => const ListsViewScreen(),
  AlertsScreen.routeName: (context) => const AlertsScreen(),
  CardScreen.routeName: (context) => const CardScreen(),
  PhotoAlbumScreen.routeName: (context) => PhotoAlbumScreen(),
  SlidersScreen.routeName: (context) => const SlidersScreen(),
  InfinityScrollScreen.routeName: (context) => const InfinityScrollScreen(),
  FormScreen.routeName: (context) => const FormScreen(),
};
