///Esta clase sirve para manejar la información que pertenece a las tablas "Clasificacion" y "Multa" en la base de datos.
///los atributos id, nombre, cantidadUmas y cantidadUmasConAgravante se mapean a los datos que se obtienen 
///en las consultas a tablas antes mencionadas.

class ModeloMulta {
  String? descripcion;
  String? nombre;
  String? cantidadUmas;
  String? cantidadUmasConAgravante;

  ModeloMulta({
    this.descripcion,
    this.nombre,
    this.cantidadUmas,
    this.cantidadUmasConAgravante,
  });

  ///Esta función convierte el objeto json que se obtiene al hacer una consulta a la base de datos 
   ///a un objeto de tipo "ModeloMulta" para que pueda ser manipulado en el código de la app.

  factory ModeloMulta.fromJson(Map<String, dynamic> json) => ModeloMulta(
    descripcion: json["descripcion"],
    nombre: json["nombre"],
    cantidadUmas: json["cantidadDeUmas"],
    cantidadUmasConAgravante: json["cantidadDeUmasConAgravante"],
  );
}
