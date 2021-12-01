///Esta clase sirve para manejar la información que pertenece a la tabla "Articulo" en la base de datos.
///los atributos id, nombre y contenido se mapean a los datos que se obtienen en cada consulta a la tabla amtes mencionada.

class ModeloArticulo {
  int? id;
  String? nombre;
  String? contenido;
  
  ModeloArticulo({
    this.id,
    this.nombre,
    this.contenido,
  });

  ///Esta función convierte el objeto json que se obtiene al hacer una consulta a la base de datos 
  ///a un objeto de tipo "ModeloArticulo" para que pueda ser manipulado en el código de la app.
    
  factory ModeloArticulo.fromJson(Map<String, dynamic> json) => ModeloArticulo(
    id: json["id"],
    nombre: json["nombreArticulo"],
    contenido: json["contenido"],
  );
}
