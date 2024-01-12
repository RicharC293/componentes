import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        // child: Image.network(image),
        child: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(image),
          imageErrorBuilder: (context, error, stackTrace) =>
              Image.asset('assets/placeholder.jpeg', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
