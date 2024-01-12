import 'package:componentes/widgets/image_card.dart';
import 'package:flutter/material.dart';

class PhotoAlbumScreen extends StatelessWidget {
  PhotoAlbumScreen({super.key});

  static const String routeName = '/photo-album';

  final fotoPerfil =
      'https://media.licdn.com/dms/image/C4E03AQGoyfc-MIJi6A/profile-displayphoto-shrink_800_800/0/1571083364880?e=1710374400&v=beta&t=LgwEsIt_CMtyCi45re4MrJL2epAsCrzLCmnvUPqJzPs';

  final listImages = List.generate(
      50,
      (index) => index == 0
          ? 'https://picsum.photo/id/$index/1200'
          : 'https://picsum.photos/id/$index/1200');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album de fotos'),
        actions: const [
          CircleAvatar(
            child: Text('RC'),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 50,
                // backgroundImage: NetworkImage(fotoPerfil),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Image.network(fotoPerfil),
                ),

                /// Tomar una imagen y subirla
                /// - file o take image -> tomar una foto o seleccionar un archivo del dispositivo -> package -> quality -> 0-100
                /// - File o Ulist
                /// - Resquest backend
                // child: Container(
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(300)),
                //     color: Colors.red,
                //   ),

                //   child: Image.network(fotoPerfil),
                //   ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Richar Cangui',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Mis recuerdos',
                          style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children:
                listImages.map((image) => ImageCard(image: image)).toList(),
          ),
        ],
      ),
    );
  }
}
