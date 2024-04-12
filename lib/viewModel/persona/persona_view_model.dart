import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:ejercicio4/model/persona.dart';

class PersonaViewModel {
  String get baseUrlPersona => dotenv.env['baseUrlPersona']!;
  String get baseUrlPersonas => dotenv.env['baseUrlPersonas']!;

  Future<List<PersonaModel>> obtenerPersonas() async {
    try {
      final respuesta = await http.get(Uri.parse(baseUrlPersonas));
      if (respuesta.statusCode == 200) {
        final List<dynamic> data = json.decode(respuesta.body);
        return data.map((json) => PersonaModel.fromJson(json)).toList();
      } else {
        print("Error en la respuesta: ${respuesta.statusCode}");
        print("Cuerpo de la respuesta: ${respuesta.body}");
        throw Exception("Error al obtener la lista de personas");
      }
    } catch (e) {
      print("Excepción durante la solicitud HTTP: $e");
      throw Exception("Error al obtener la lista de personas");
    }
  }

  Future<PersonaModel> obtenerPersona(int idPersona) async {
    try {
      final respuesta = await http.get(Uri.parse('$baseUrlPersona/$idPersona'));
      if (respuesta.statusCode == 200) {
        final dynamic data = json.decode(respuesta.body);
        return PersonaModel.fromJson(data);
      } else {
        print("Error en la respuesta: ${respuesta.statusCode}");
        print("Cuerpo de la respuesta: ${respuesta.body}");
        throw Exception("Error al obtener la información de la habitación");
      }
    } catch (e) {
      print("Excepción durante la solicitud HTTP: $e");
      throw Exception("Error al obtener la información de la persona");
    }
  }

  Future<void> crearPersona(PersonaModel persona) async {
    try {
      final respuesta = await http.post(
        Uri.parse(baseUrlPersona),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(persona.toJson()),
      );

      if (respuesta.statusCode != 200 && respuesta.statusCode != 201) {
        throw Exception("Error al crear a la persona: ${respuesta.statusCode}");
      }
    } catch (e) {
      print("Error en la respuesta: $e");
      throw Exception("Error al crear a la persona");
    }
  }

  Future<void> eliminarPersona(String idPersona) async {
    try {
      final respuesta = await http.delete(
        Uri.parse('$baseUrlPersona?id_persona=$idPersona'),
        headers: {'Content-Type': 'application/json'},
      );

      if (respuesta.statusCode != 204) {
        print("Cuerpo de la respuesta: ${respuesta.body}");
        throw Exception("Error al eliminar a la persona");
      }
    } catch (e) {
      print("Error en la respuesta: $e");
      throw Exception("Error al eliminar a la persona");
    }
  }
}
