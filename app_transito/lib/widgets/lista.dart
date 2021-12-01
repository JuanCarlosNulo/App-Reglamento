import 'package:app_transito/widgets/list_view_reutilizable.dart';
import 'package:flutter/material.dart';

///Esta clase se encarga de obtener los datos con los que se contruira la lista en las diferentes pantallas que la utilizan.
///Recibe los siguientes parámetros:
///-nombreRutaInicial: Nombre de la ruta desde la cual se esta construyendo la lista.
///-nombreRutaDestino: Ruta a la cual se redigira al usuario al seleccionar un item.
///-datos: Son los datos que se obtendrán en el "FutureBuilder", es de tipo "Future" porque es una llamada asincrona a la base de datos.

class Lista extends StatelessWidget {

  final String rutaInicial;
  final String rutaDestino;
  final Future<List> datos;

  const Lista({
    required this.rutaInicial,
    required this.rutaDestino,
    required this.datos
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this.datos,
      initialData: [],
      builder: (_, AsyncSnapshot<List<dynamic>> snapshot){
            return ListViewReutilizable(
              datos: snapshot.data!, 
              nombreRutaInicial: this.rutaInicial, 
              nombreRutaDestino: this.rutaDestino
            );
          }
        );
      }
}