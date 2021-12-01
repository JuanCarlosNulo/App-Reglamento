///Esta clase sirve para manejar la información que pertenece a la tabla "Titulo" en la base de datos.
///los atributos id y nombre se mapean a los datos que se obtienen en cada consulta a la tabla amtes mencionada.

class ModeloTitulo {
  int? id;
  String? nombre;

  ModeloTitulo({
    this.id,
    this.nombre,
  });

  ///Esta función convierte el objeto json que se obtiene al hacer una consulta a la base de datos 
  ///a un objeto de tipo "ModeloTitulo" para que pueda ser manipulado en el código de la app.

  factory ModeloTitulo.fromJson(Map<String, dynamic> json) => ModeloTitulo(
    id: json["id"],
    nombre: json["nombreTitulo"],
  );
}
