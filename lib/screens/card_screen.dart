import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  static const String routeName = '/card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Card")),
        body: Center(
          child: Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.photo_album),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Título de la tarjeta'),
                        Text('Este es el subtitulo o descripción de la tarjeta, Este es el subtitulo o descripción de la tarjeta, Este es el subtitulo o descripción de la tarjeta, Este es el subtitulo o descripción de la tarjeta'),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(onPressed: () {}, child: const Text('Aceptar'))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
