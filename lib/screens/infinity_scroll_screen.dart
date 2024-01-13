import 'dart:math';

import 'package:componentes/services/services.dart';
import 'package:componentes/widgets/image_card.dart';
import 'package:flutter/material.dart';

class InfinityScrollScreen extends StatefulWidget {
  const InfinityScrollScreen({super.key});

  static const String routeName = 'infinity-scroll';

  @override
  State<InfinityScrollScreen> createState() => _InfinityScrollScreenState();
}

class _InfinityScrollScreenState extends State<InfinityScrollScreen> {
  List<String>? _images;
  late int initialImages;
  late int amount;

  bool _isLoading = false;

  /// Crear un controlador de scroll
  late ScrollController _scrollController;

  /// Ejecutar un método previo a la primera renderización
  @override
  void initState() {
    super.initState();
    initialImages = 0;
    amount = 5;
    _scrollController = ScrollController();
    _scrollController.addListener(_listener);
    _getImages();
  }

  void _listener() {
    print("LISTENER");
    if (_scrollController.position.pixels + 50 >=
            _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      print("PUEDES HACER FETCH");
      initialImages = initialImages + amount;
      _getImages();
    }
  }

  Future<void> _getImages() async {
    try {
      print("InitialImages: $initialImages");
      setState(() {
        _isLoading = true;
      });
      final fetchImages = await Services().getImages(initialImages, amount);

      /// Spread operator
      /// _images = ['1','2','3']
      /// fetchImages = ['4','5','6']
      /// [...['1','2','3'], ...['4','5','6']]
      /// ['1','2',3','4','5','6']
      _images = [...?_images, ...fetchImages];

      print(_images);
    } catch (err) {
      _images = [];
      print("ERROR: $err");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// 1. FutureBuilder
  /// 2. Programar mediante condiciones
  /// 3. Gestor de estados
  ///

  /// Como controlar un scroll
  /// 1. Usando el NotificationListener;
  /// 2. Usando los controladores;

  @override
  void dispose() {
    _scrollController.removeListener(_listener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Infinity Scroll'), actions: [
        TextButton(
          onPressed: () {
            _scrollController.animateTo(0,
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceIn);
          },
          child: const Text('Inicio'),
        ),
        TextButton(
          onPressed: () {
            _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceIn);
          },
          child: const Text('Final'),
        ),
      ]),
      body: RefreshIndicator(
        onRefresh: () async {
          _images = [];
          initialImages = 0;
          await _getImages();
        },
        child: Builder(
          builder: (context) {
            if (_isLoading && _images == null) {
              return const Center(child: CircularProgressIndicator());
            }
            if (_images!.isEmpty) {
              return const Center(
                child: Icon(Icons.ac_unit),
              );
            }

            /// Uso del notification listener
            // return NotificationListener<ScrollNotification>(
            //   onNotification: (notification) {
            //     // print(notification.metrics.maxScrollExtent);
            //     // print(notification.metrics.pixels);
            //     //imprima un valor cuando nos falte 50 pixeles para llegar al fondo del scroll
            //     if (notification.metrics.pixels + 50 >=
            //             notification.metrics.maxScrollExtent &&
            //         !_isLoading) {
            //       print("PUEDES HACER FETCH");
            //       initialImages = initialImages + amount;
            //       _getImages();
            //     }
            //     return true;
            //   },
            //   child: Column(
            //     children: [
            //       if (_isLoading) const LinearProgressIndicator(),
            //       Expanded(
            //         child: ListView.builder(
            //           // physics: BouncingScrollPhysics(),
            //           itemBuilder: (context, index) {
            //             final image = _images![index];
            //             return ImageCard(image: image);
            //           },
            //           itemCount: _images!.length,
            //         ),
            //       ),
            //     ],
            //   ),
            // );
            /// Uso del controller
            return Column(
              children: [
                if (_isLoading) const LinearProgressIndicator(),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    // physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final image = _images![index];
                      return ImageCard(image: image);
                    },
                    itemCount: _images!.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      // body: FutureBuilder(
      //   future: Services().getImages(0, 10),
      //   builder: (context, snapshot) {
      //     // Muestas un loading
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //     // Capturar el error
      //     if(snapshot.hasError) {
      //       return const Center(child: Text("HA OCURRIDO UN ERROR VOLVER A CARGAR"));
      //     }

      //     if(snapshot.hasData) {
      //       print(snapshot.data);
      //       return ListView.builder(
      //         itemBuilder: (context, index) {
      //           final image = snapshot.data![index];
      //           return ImageCard(image: image);
      //         },
      //         itemCount: snapshot.data!.length,
      //       );
      //     }

      //     return const Center(child: Text("No hay data"));
      //   },
      // ),
    );
  }
}
