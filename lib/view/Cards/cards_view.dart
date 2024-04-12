import 'package:flutter/material.dart';
import 'package:ejercicio4/models.dart';

class PersonaListPage extends StatefulWidget {
  const PersonaListPage({super.key});

  @override
  PersonaListPageState createState() => PersonaListPageState();
}

class PersonaListPageState extends State<PersonaListPage> {
  Key _key = UniqueKey();
  PersonaViewModel _personaViewModel = PersonaViewModel();
  int? _visibleItems;
  double? _itemExtent;

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    _visibleItems = 8;
    _itemExtent = 340.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        key: _key,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AgregarPersona()),
            );
          },
          child: const Icon(Icons.add),
        ),
        resizeToAvoidBottomInset: false,
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
          title: const Text('EJERCICIO 4'),
        ),
        body: FutureBuilder<List<PersonaModel>>(
          future: _personaViewModel.obtenerPersonas(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (snapshot.hasData) {
              return CardsViewMagic(
                visualizedItems: _visibleItems,
                itemExtent: _itemExtent,
                children: snapshot.data!.map((persona) {
                  final index = snapshot.data!.indexOf(persona);
                  final borderColor =
                      Colors.accents[index % Colors.accents.length];
                  return PersonaCard(
                    borderColor: borderColor,
                    persona: persona,
                  );
                }).toList(),
                onTapFrontItem: (index) {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                  'Acciones para ${snapshot.data![index!].nombreUno} ${snapshot.data![index].nombreDos}'),
                              ElevatedButton(
                                child: const Text('Actualizar'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ElevatedButton(
                                child: const Text('Eliminar'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  _confirmarEliminacion(context,
                                      snapshot.data![index].idPersona!);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(child: Text("No hay datos disponibles"));
            }
          },
        ),
        drawer: Drawer(
          child: Material(
            textStyle: const TextStyle(color: Colors.white, fontSize: 16),
            child: Container(
              color: const Color(0xFF5B4382),
              padding: const EdgeInsets.all(20),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.settings_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          ' Configuración',
                          style: TextStyle(
                            fontSize: 26,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 40),
                    Row(
                      children: [
                        const Icon(
                          Icons.visibility_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                        const Text(
                          ' Visible items',
                          style: TextStyle(),
                        ),
                        Expanded(
                          child: Slider(
                            value: _visibleItems!.toDouble(),
                            min: 1,
                            max: 15,
                            divisions: 15,
                            label: '$_visibleItems',
                            activeColor: Colors.deepPurple[200],
                            inactiveColor: Colors.deepPurple[400],
                            onChanged: (value) {
                              setState(() {
                                _visibleItems = value.toInt();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    const Divider(height: 40),
                    Row(
                      children: [
                        const Icon(
                          Icons.widgets,
                          color: Colors.white,
                          size: 16,
                        ),
                        const Text(
                          ' Item Extent',
                          style: TextStyle(),
                        ),
                        Expanded(
                          child: Slider(
                            value: _itemExtent!,
                            min: 340,
                            max: MediaQuery.of(context).size.height * .8,
                            label: '$_itemExtent',
                            activeColor: Colors.deepPurple[200],
                            inactiveColor: Colors.deepPurple[400],
                            onChanged: (value) {
                              setState(() {
                                _itemExtent = value;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    const Divider(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmarEliminacion(
      BuildContext context, String personaId) async {
    try {
      await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmación'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('¿Estás seguro que deseas eliminar este registro?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancelar'),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () async {
                  await PersonaViewModel().eliminarPersona(personaId);
                  Navigator.pop(context);
                  scaffoldMessengerKey.currentState?.showSnackBar(
                    SnackBar(
                      content: Text('Se ha eliminado a la persona'),
                    ),
                  );
                  recargarPagina();
                },
                child:
                    const Text('Eliminar', style: TextStyle(color: Colors.red)),
              ),
            ],
          );
        },
      );
    } catch (error) {
      print('Error al confirmar eliminación: $error');
      scaffoldMessengerKey.currentState?.showSnackBar(
        const SnackBar(
          content:
              Text('Error al confirmar la eliminación del registro del alumno'),
        ),
      );
    }
  }

  void recargarPagina() {
  setState(() {
    _key = UniqueKey();
  });
}

}
