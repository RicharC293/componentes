import 'package:flutter/material.dart';

class Services {
  Future<List<String>> getImages(int initialImage, int amount) async {
    try {
      // throw 'HA OCURRIDO UN ERROR';
      List<String> images = [];

      for (int i = initialImage; i < initialImage + amount; i++) {
        final url = 'https://picsum.photos/id/$i/1200';
        images.add(url);
      }

      await Future.delayed(const Duration(seconds: 1));

      return images;
    } catch (err) {
      debugPrint("GET_IMAGES: $err");
      rethrow;
    }
  }
}
