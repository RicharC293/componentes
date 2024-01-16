import 'package:componentes/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  static const String routeName = '/form-screen';

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String texto = '';

  late TextEditingController _controller;

  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;

  String nombre = '';
  String apellido = '';
  String cedula = '';
  String email = '';
  String contrasena = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario de Registro')),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text('Ingrese sus datos'),
                const SizedBox(height: 20),

                /// Ingreso de letras
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                    hintText: 'Richar',
                    prefixIcon: Icon(Icons.person),
                  ),
                  maxLines: 5,
                  onChanged: (value) {
                    print("Value: $value");

                    /// email del usuario sea generado automaticamente
                    /// nombre@apellido.com
                    if (_controller.text.isEmpty) {
                      _controller.text = '$value@'.toLowerCase();
                      return;
                    }
                    final currentEmail = _controller.text.split('@');

                    /// richar@cangui.com -> ['richar', ['cangui.com']]
                    if (currentEmail.length == 2) {
                      _controller.text =
                          '$value@${currentEmail[1]}'.toLowerCase();
                    } else {
                      _controller.text = '$value@'.toLowerCase();
                    }
                  },
                  validator: (value) {
                    // longitudes -> nombre debe tener mas de 2 caracteres
                    // validar si está vació
                    if (value == null) {
                      return 'Es requerido';
                    }
                    if (value.isEmpty) {
                      return 'El nombre no puede estar vacío';
                    }
                    if (value.length < 2) {
                      return 'El nombre debe tener mas de 2 caracteres';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    print("Save nombre");
                    nombre = value ?? '';
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Apellido',
                    hintText: 'Cangui',
                    prefixIcon: Icon(Icons.person),
                  ),
                  onChanged: (value) {
                    if (_controller.text.isEmpty) {
                      _controller.text = '@$value.com'.toLowerCase();
                      return;
                    }
                    final currentEmail = _controller.text.split('@');
                    if (currentEmail.length == 2) {
                      _controller.text =
                          '${currentEmail[0]}@$value.com'.toLowerCase();
                    } else {
                      _controller.text = '@$value.com'.toLowerCase();
                    }
                  },
                  validator: (value) {
                    // longitudes -> nombre debe tener mas de 2 caracteres
                    // validar si está vació
                    if (value == null) {
                      return 'Es requerido';
                    }
                    if (value.isEmpty) {
                      return 'El apellido no puede estar vacío';
                    }
                    if (value.length < 2) {
                      return 'El apellido debe tener mas de 2 caracteres';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    print("Save apellido");
                    apellido = value ?? '';
                  },
                ),
                const SizedBox(height: 20),
                CustomInput(
                  labelText: 'Cedula de identidad',
                  hintText: '0562818291',
                  keyboardType: TextInputType.number,
                  icon: Icons.numbers,
                  maxLength: 10,
                  validator: (value) {
                    // longitudes -> nombre debe tener mas de 2 caracteres
                    // validar si está vació
                    if (value == null) {
                      return 'Es requerido';
                    }
                    if (value.isEmpty) {
                      return 'La cédula no puede estar vacío';
                    }
                    if (value.length != 10) {
                      return 'La cédula debe tener 10 caracteres';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    print("ON_CHANGED: $value");
                  },
                  onSaved: (value) {
                    print("Save cedula");
                    cedula = value ?? '';
                  },
                ),
                const SizedBox(height: 20),
                // El email se va a autogenerar con el nombre y apellido
                TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'test@gmail.com',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su email';
                    }
                    // validar si un email contiene @, .com y no tiene espacios
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                    if (!emailRegex.hasMatch(value)) {
                      return 'Por favor ingrese un email valido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    print("Save email");
                    email = value ?? '';
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Contraseña',
                    prefix: const Icon(Icons.lock),
                    suffix: GestureDetector(
                        onTap: () {
                          _isObscure = !_isObscure;
                          setState(() {});
                        },
                        child: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off)),
                  ),
                  onSaved: (value) {
                    print("Save constraseña");
                    contrasena = value ?? '';
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final esValidoElForm =
                        _formKey.currentState?.validate() ?? false;
                    if (!esValidoElForm) return;
                    _formKey.currentState?.save();
                  },
                  child: const Text('Registrarse'),
                ),
                // check
                //https://flutter.github.io/samples/web/material_3_demo/
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home', tooltip: 'Test'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm_outlined), label: 'Time'),
        ],
        currentIndex: 1,
        onTap: (value) {
          print("Value: $value");
        },
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
