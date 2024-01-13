import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  static const String routeName = '/form-screen';

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String texto = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario de Registro')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Registro"),
            const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                
                ),
                labelText: 'Nombre',
                hintText: 'Richar',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            TextFormField(),
            TextFormField(),
            TextFormField(),
            TextFormField(),
          ],
        ),
      ),

      /// Text Field
      // body: Column(
      //   children: [
      //     Text("ESTO ES LO QUE SE HA ESCRITO: $texto"),
      //     TextField(
      //       decoration: const InputDecoration(
      //         border: OutlineInputBorder(),
      //         labelText: 'Nombre',
      //         hintText: 'Richar',
      //       ),
      //       keyboardType: TextInputType.visiblePassword,
      //       maxLength: 10,
      //       onChanged: (value) {
      //         print("value: $value");
      //         setState(() {
      //           texto = value;
      //         });
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}
