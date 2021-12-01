import 'package:flutter/material.dart';

///Esta clase se encarga de generar un Item para las pantallas que requieran una lista.
///Recibe los siguientes parámetros:
///-título: servirá para mostrar el nombre de los títulos, capítulos, artículos o categorias de multas,
/// dependiendo de la pantalla en la que se esta generando la lista.
///-icono: icono del item.
///-rutaDestino: Ruta a la cual se redigira al usuario al seleccionar un item.
///-id: Se manda como argumento a la ruta de destino para hacer las consultas correspondientes a la base de datos.
///Ejemplo: Si la ruta de destino es la de "capítulos", se deberá mandar el ID del título para que se recuperen
///de la base de datos los capítulos relacionados al título seleccionado.  
///subtitulo: Si la lista se esta creando desde la pantalla "BusquedaArticulos", el item tendrá un subtitulo
///para darle al usuario una vista previa del contenido de los articulos recuperados en la búsqueda. 

class ItemDeLista extends StatelessWidget {
  
 final String titulo;
  final Icon icono;
  final String rutaDestino;
  final int id;
  final String? subtitulo;

  const ItemDeLista({
    required this.titulo,
    required this.icono,
    required this.rutaDestino,
    required this.id,
    this.subtitulo
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: this.icono,
      title: Text(this.titulo),
      subtitle: Text(this.subtitulo!, overflow: TextOverflow.ellipsis, maxLines: 4, softWrap: false,),
      trailing: Icon(Icons.keyboard_arrow_right, color: Color.fromRGBO(21, 168, 31, .55)),
      onTap: (){
        Navigator.pushNamed(context, this.rutaDestino, arguments: this.id);
      }
    );
  }
}