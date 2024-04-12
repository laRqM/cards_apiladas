class PersonaModel {
  String? idPersona;
  String nombreUno;
  String? nombreDos;
  String apellidoUno;
  String? apellidoDos;
  String fechaNacimiento;
  String puesto;
  String telefono;
  String direccion;
  String email;
  String website;

  PersonaModel({
    this.idPersona,
    required this.nombreUno,
    this.nombreDos,
    required this.apellidoUno,
    this.apellidoDos,
    required this.fechaNacimiento,
    required this.puesto,
    required this.telefono,
    required this.direccion,
    required this.email,
    required this.website,
  });

  factory PersonaModel.fromJson(Map<String, dynamic> json) {
    return PersonaModel(
      idPersona: json['id_persona'],
      nombreUno: json['nombre_uno'],
      nombreDos: json['nombre_dos'],
      apellidoUno: json['apellido_uno'],
      apellidoDos: json['apellido_dos'],
      fechaNacimiento: json['D_nacimiento'],
      puesto: json['puesto'],
      telefono: json['telefono'],
      direccion: json['direccion'],
      email: json['email'],
      website: json['website'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_persona': idPersona,
      'nombre_uno': nombreUno,
      'nombre_dos': nombreDos,
      'apellido_uno': apellidoUno,
      'apellido_dos': apellidoDos,
      'D_nacimiento': fechaNacimiento,
      'puesto': puesto,
      'telefono': telefono,
      'direccion': direccion,
      'email': email,
      'website': website,
    };
  }
}
