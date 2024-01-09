import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  static const String routeName = '/alerts-screen';

  Future<void> _crearAlertaMaterial(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Hola Mundo"),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Descripción de la alerta"),
              Center(
                child: FlutterLogo(),
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Aceptar')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar')),
          ],
        );
      },
      barrierDismissible: false,
    );
  }

  Future<void> _crearAlertaCupertino(BuildContext context) async {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text("Cupertino"),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Descripción de la alerta"),
                Center(
                  child: FlutterLogo(),
                ),
              ],
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cerrar'),
              )
            ],
          );
        });
  }

  Future<void> _crearAlertaPorPlataforma(BuildContext context) async {
    // if (Platform.isAndroid) {
    //   _crearAlertaMaterial(context);
    // } else {
    //   _crearAlertaCupertino(context);
    // }
    await showAdaptiveDialog(
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            title: const Text('Adaptativo'),
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Descripción de la alerta"),
                Center(
                  child: FlutterLogo(),
                ),
              ],
            ),
            actions: [
              adaptiveAction(
                context: context,
                onPressed: () => Navigator.pop(context),
                child: const Text('Aceptar'),
              ),
            ],
          );
        });
  }

  Widget adaptiveAction(
      {required BuildContext context,
      required VoidCallback onPressed,
      required Widget child}) {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: onPressed, child: child);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: onPressed, child: child);
    }
  }

  /// Validar que funcione en la web
  /// Condición que ter permite crear un tipo de botón diferente 
  /// en el caso de que se use en la web. ElevatedButton(),

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alertas")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () {
                  _crearAlertaMaterial(context);
                },
                child: Text("Alerta Material")),
            TextButton(
                onPressed: () {
                  _crearAlertaCupertino(context);
                },
                child: Text("Alerta Cupertino")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _crearAlertaPorPlataforma(context);
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
