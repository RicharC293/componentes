import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class SlidersScreen extends StatefulWidget {
  const SlidersScreen({super.key});

  static const String routeName = '/sliders';

  @override
  State<SlidersScreen> createState() => _SlidersScreenState();
}

class _SlidersScreenState extends State<SlidersScreen> {
  // double valueSlider1 = 0.5;
  late double valueSlider1;
  late double valueSlider2;
  late double valueSlider3;

  @override
  void initState() {
    super.initState();
    valueSlider1 = 1.0;
    valueSlider2 = 2.0;
    valueSlider3 = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sliders")),
      body: Column(
        children: [
          ImageFiltered(
            imageFilter:
                ImageFilter.dilate(radiusX: valueSlider3, radiusY: valueSlider3),
            child: Transform.rotate(
              angle: valueSlider2 * pi,
              child: Transform.scale(
                scale: valueSlider1,
                child: Image.asset('assets/image.png', height: 300),
              ),
            ),
          ),
          Slider(
            value: valueSlider1,
            onChanged: (value) {
              // print(value);
              setState(() {
                valueSlider1 = value;
              });
            },
            thumbColor: Colors.red,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          ),
          Slider(
            min: 0,
            max: 2,
            value: valueSlider2,
            onChanged: (value) {
              /// 0   ---> 0
              /// 0.5 ---> 90
              /// 1   ---> 180
              /// 1.5 ---> 270
              /// 2   ---> 360
              setState(() {
                valueSlider2 = value;
              });
            },
          ),
          Slider(
            max: 3,
            value: valueSlider3,
            onChanged: (value) {
              // print(value);
              setState(() {
                valueSlider3 = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
