///Esta clase sirve para manejar la información que pertenece a la tabla "CategoriaDeMultas" en la base de datos.
///los atributos id y nombre se mapean a los datos que se obtienenen en cada consulta a la tabla amtes mencionada.

class ModeloCategoriaDeMulta {
  int? id;
  String? nombre;
    
  ModeloCategoriaDeMulta({
    this.id,
    this.nombre,
  });

  ///Esta función convierte el objeto json que se obtiene al hacer una consulta a la base de datos 
  ///a un objeto de tipo "ModeloCategoriaDeMulta" para que pueda ser manipulado en el código de la app.
  factory ModeloCategoriaDeMulta.fromJson(Map<String, dynamic> json) => ModeloCategoriaDeMulta(
    id: json["id"],
    nombre: json["nombreCategoria"],
  );
}
