import 'package:app_transito/Utilidades/iconos.dart';
import 'package:app_transito/widgets/item_de_lista.dart';
import 'package:flutter/material.dart';

///Esta clase se encarga de generar generar los items de una lista de acuerdo al tamaño de la lista que recibe como parámetro.
///Recibe los siguientes parámetros:
///-datos: Lista con los datos que se deberan mostrar en la lista. Es de tipo "dynamic" porque debido a que la lista
///se puede construir desde diferentes pantallas, los datos pueden ser de diferentes tipos. Por ejemplo: si la lista se crea
///desde la pantalla "PantallaTitulos" los objetos de esta lista seran de tipo "ModeloTitulo", por el contrario si la 
///lista se crea desde la pantalla "PantallaCapitulos", la lista tendra objetos de tipo "ModeloCapitulo".
///-nombreRutaInicial: Nombre de la ruta desde la cual se esta construyendo la lista. Sirve para obtener los iconos
///correspondientes a la pantalla de esta ruta.
///-nombreRutaDestino: Ruta a la cual se redirigirá al usuario al seleccionar un item.

class ListViewReutilizable extends StatelessWidget {
  
  final List<dynamic> datos;
  final String nombreRutaInicial;
  final String nombreRutaDestino;

  const ListViewReutilizable({
    required this.datos,
    required this.nombreRutaInicial,
    required this.nombreRutaDestino
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: datos.length,
      itemBuilder: (_, int index) => ItemDeLista(
        titulo: datos[index].nombre, 
        icono: getIcon(nombreRutaInicial, datos[index].id.toString()), 
        rutaDestino: nombreRutaDestino, 
        id: datos[index].id,
        subtitulo: _getSubtitulo(datos[index])
      ),
    );
  }

  ///Esta método sirve para establecer el subtitulo de los items de la lista en caso que se este creando desde la
  ///pantalla "BusquedaArticulos". Recibe un objeto tipo "dynamic" que cambiara a "ModeloArticulo" cuando la lista se este construyendo.
  String _getSubtitulo(dynamic articulo){
    if(this.nombreRutaInicial == 'busqueda'){
      return articulo.contenido!;
    }else{
      return '';
    }
  }
}