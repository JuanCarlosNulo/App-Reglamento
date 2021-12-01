///Esta clase sirve para manejar la información que pertenece a la tabla "Capitulo" en la base de datos.
///los atributos id, y nombre se mapean a los datos que se obtienen en cada consulta a la tabla amtes mencionada.

class ModeloCapitulo {
  int? id;
  String? nombre;

  ModeloCapitulo({
    this.id,
    this.nombre,
  });
  
  ///Esta función convierte el objeto json que se obtiene al hacer una consulta a la base de datos 
  ///a un objeto de tipo "ModeloCapitulo" para que pueda ser manipulado en el código de la app.
  factory ModeloCapitulo.fromJson(Map<String, dynamic> json) => ModeloCapitulo(
    id: json["id"],
    nombre: json["nombreCapitulo"],
  );
}
