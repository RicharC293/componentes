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

  @override
  void initState() {
    super.initState();
    valueSlider1 = 0.1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sliders")),
      body: Column(
        children: [
          Transform.scale(
            scale: valueSlider1,
            child: Image.asset('assets/image.png', height: 300),
          ),
          Slider(
            value: valueSlider1,
            onChanged: (value) {
              print(value);
              setState(() {
                valueSlider1 = value;
              });
            },
            thumbColor: Colors.red,
            activeColor: Colors.yellow,
            inactiveColor: Colors.black,
          )
        ],
      ),
    );
  }
}
