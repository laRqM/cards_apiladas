import 'package:flutter/material.dart';
import 'package:ejercicio4/models.dart';
import 'package:flutter/services.dart';

class AgregarPersona extends StatefulWidget {
  AgregarPersona({Key? key}) : super(key: key);

  @override
  _AgregarPersonaState createState() => _AgregarPersonaState();
}

class _AgregarPersonaState extends State<AgregarPersona> {
  final _personaViewModel = PersonaViewModel();
  late DateTime fechaNacimientoSeleccionada;

  late TextEditingController _nombreUnoController;
  late TextEditingController _nombreDosController;
  late TextEditingController _apellidoUnoController;
  late TextEditingController _apellidoDosController;
  late TextEditingController _fechaNacimientoController;
  late TextEditingController _puestoController;
  late TextEditingController _telefonoController;
  late TextEditingController _direccionController;
  late TextEditingController _emailController;
  late TextEditingController _websiteController;

  @override
  void initState() {
    super.initState();
    _nombreUnoController = TextEditingController();
    _nombreDosController = TextEditingController();
    _apellidoUnoController = TextEditingController();
    _apellidoDosController = TextEditingController();
    _fechaNacimientoController = TextEditingController();
    _puestoController = TextEditingController();
    _direccionController = TextEditingController();
    _emailController = TextEditingController();
    _telefonoController = TextEditingController();
    _websiteController = TextEditingController();
  }

  @override
  void dispose() {
    _nombreUnoController.dispose();
    _nombreDosController.dispose();
    _apellidoUnoController.dispose();
    _apellidoDosController.dispose();
    _fechaNacimientoController.dispose();
    _puestoController.dispose();
    _direccionController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  Future<void> _fechaNacimientoSeleccionada() async {
    DateTime? fecha = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());

    if (fecha != null) {
      setState(() {
        _fechaNacimientoController.text = fecha.toString().split(" ")[0];
        fechaNacimientoSeleccionada = fecha;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('AÑADIR PERSONA'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(143, 148, 251, .2),
                      blurRadius: 20.0,
                      offset: Offset(0, 10)),
                ],
              ),
              child: Form(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(158, 158, 158, .2)))),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa el primer nombre';
                          } else if (!RegExp(
                                  r'^([A-Za-zÑñÁáÉéÍíÓóÚú]+[\-]{0,1}[A-Za-zÑñÁáÉéÍíÓóÚú]+)(\s+([A-Za-zÑñÁáÉéÍíÓóÚú]+[\-]{0,1}[A-Za-zÑñÁáÉéÍíÓóÚú]+))*$')
                              .hasMatch(value)) {
                            return 'Nombre no válido';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _nombreUnoController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Primer nombre',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                          //filled: true,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(158, 158, 158, .2)))),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            if (!RegExp(
                                    r'^([A-Za-zÑñÁáÉéÍíÓóÚú]+[\-]{0,1}[A-Za-zÑñÁáÉéÍíÓóÚú]+)(\s+([A-Za-zÑñÁáÉéÍíÓóÚú]+[\-]{0,1}[A-Za-zÑñÁáÉéÍíÓóÚú]+))*$')
                                .hasMatch(value)) {
                              return 'Nombre no válido';
                            }
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _nombreDosController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Segundo nombre',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                          hintText: 'Opcional',
                          //filled: true,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(158, 158, 158, .2)))),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa el apellido paterno';
                          } else if (!RegExp(
                                  r'^([A-Za-zÑñÁáÉéÍíÓóÚú]+[\-]{0,1}[A-Za-zÑñÁáÉéÍíÓóÚú]+)(\s+([A-Za-zÑñÁáÉéÍíÓóÚú]+[\-]{0,1}[A-Za-zÑñÁáÉéÍíÓóÚú]+))*$')
                              .hasMatch(value)) {
                            return 'Apellido no válido';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _apellidoUnoController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Apellido paterno',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(158, 158, 158, .2)))),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        validator: (value) {
                          if (value != null && value.isNotEmpty) {
                            if (!RegExp(
                                    r'^([A-Za-zÑñÁáÉéÍíÓóÚú]+[\-]{0,1}[A-Za-zÑñÁáÉéÍíÓóÚú]+)(\s+([A-Za-zÑñÁáÉéÍíÓóÚú]+[\-]{0,1}[A-Za-zÑñÁáÉéÍíÓóÚú]+))*$')
                                .hasMatch(value)) {
                              return 'Apellido no válido';
                            }
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _apellidoDosController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Apellido materno',
                            labelStyle: TextStyle(color: Colors.grey[400]),
                            hintText: 'Opcional'),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(158, 158, 158, .2)))),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: 'Fecha de nacimiento',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                          //filled: true,
                          prefixIcon: Icon(Icons.calendar_today),
                          enabledBorder:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                        ),
                        controller: _fechaNacimientoController,
                        readOnly: true,
                        onTap: () {
                          _fechaNacimientoSeleccionada();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La fecha de nacimiento es requerida';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(158, 158, 158, .2)))),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa el puesto';
                          } else if (!RegExp(
                                  r'^([A-Za-zÑñÁáÉéÍíÓóÚú]+[\-]{0,1}[A-Za-zÑñÁáÉéÍíÓóÚú]+)(\s+([A-Za-zÑñÁáÉéÍíÓóÚú]+[\-]{0,1}[A-Za-zÑñÁáÉéÍíÓóÚú]+))*$')
                              .hasMatch(value)) {
                            return 'Puesto no válido';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _puestoController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Puesto',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                          //filled: true,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(158, 158, 158, .2)))),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa un número telefónico';
                          } else if (!RegExp(r'^\+\d{1,4}\d{8,10}$')
                              .hasMatch(value)) {
                            return 'Número telefónico no válido';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _telefonoController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Teléfono',
                            labelStyle: TextStyle(color: Colors.grey[400]),
                            hintText: '+529988776655'),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(158, 158, 158, .2)))),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa la dirección';
                          } else if (!RegExp(
                                  r'^[\w\s.,¡¿!?áéíóúüÁÉÍÓÚÜÑñ-]+$')
                              .hasMatch(value)) {
                            return 'Dirección no válida';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _direccionController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Dirección',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                          //filled: true,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(158, 158, 158, .2)))),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa una dirección de correo electrónico';
                          } else if (!RegExp(
                                  r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                                  r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                                  r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                                  r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                                  r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                                  r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                                  r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])')
                              .hasMatch(value)) {
                            return 'Correo electrónico no válido';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Correo electrónico',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(158, 158, 158, .2)))),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, ingresa el website';
                          } else if (!RegExp(
                                  r'^((https?|ftp|smtp):\/\/)?(www.)?[a-z0-9]+\.[a-z]+(\/[a-zA-Z0-9#]+\/?)*$')
                              .hasMatch(value)) {
                            return 'Website no válido';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _websiteController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Website',
                          labelStyle: TextStyle(color: Colors.grey[400]),
                          //filled: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                String nombreUno = _nombreUnoController.text;
                String nombreDos = _nombreDosController.text;
                String apellidoUno = _apellidoUnoController.text;
                String apellidoDos = _apellidoDosController.text;
                String fechaNacimiento = _fechaNacimientoController.text;
                String puesto = _puestoController.text;
                String telefono = _telefonoController.text;
                String direccion = _direccionController.text;
                String email = _emailController.text;
                String website = _websiteController.text;

                PersonaModel nuevaPersona = PersonaModel(
                  nombreUno: nombreUno,
                  nombreDos: nombreDos,
                  apellidoUno: apellidoUno,
                  apellidoDos: apellidoDos,
                  fechaNacimiento: fechaNacimiento,
                  puesto: puesto,
                  telefono: telefono,
                  direccion: direccion,
                  email: email,
                  website: website,
                );

                try {
                  await _personaViewModel.crearPersona(nuevaPersona);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Persona creada correctamente!")));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Error al crear a la persona")));
                }
              },
              style: ButtonStyle(
                minimumSize:
                    MaterialStateProperty.all(const Size(double.infinity, 50)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                    const TextStyle(fontWeight: FontWeight.bold)),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
              ),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(143, 148, 251, .2),
                      Color.fromRGBO(143, 148, 251, .6),
                    ],
                  ),
                ),
                child: const Center(
                  child: Text("Registrar"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
