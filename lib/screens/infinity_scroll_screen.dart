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
  @override
  void initState() {
    super.initState();
    // _getImages();
  }

  Future<void> _getImages() async {
    final images = await Services().getImages(0, 10);
    print(images);
  }

  /// 1. FutureBuilder
  /// 2. Programar mediante condiciones
  /// 3. Gestor de estados

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Infinity Scroll')),
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
