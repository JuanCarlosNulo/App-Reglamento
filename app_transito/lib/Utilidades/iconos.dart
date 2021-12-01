import 'package:flutter/material.dart';

///En esta variable se definen los iconos para la pantalla  de los titulos.
///El string que sirve como clave se define conforme al id de cierto registro de la base de datos.
///si desea obtener el icono de un registro con id = 40, deberá agregar una tupla
///en la que el string sea el id del registro y su valor sea el icono que quiere obtener.
final _iconosTitulos = <String, IconData>{
  '1'  : Icons.list_alt, 
  '2' : Icons.local_police,
  '3'   : Icons.nordic_walking,
  '4'   : Icons.follow_the_signs,
  '5'   : Icons.car_repair,
  '6'   : Icons.directions_bus,
  '7'   : Icons.manage_search,
  '8'   : Icons.library_books
};

///En esta variable se definen los iconos para la pantalla de los capitulos
final _iconoCapitulos = <String, IconData>{
  'capitulos'   : Icons.format_list_bulleted,
};

///En esta variable se definen los iconos para la pantalla de los articulos
final _iconoArticulos = <String, IconData>{
  'articulos'   : Icons.article,
};

///En esta variable se definen los iconos para la pantalla de las categorias de las multas
final _iconosCategoriasMultas = <String, IconData>{
  '1'  : Icons.commute_outlined, 
  '2' : Icons.local_police,
};

///Esta función devuelve los iconos correspondientes de acuerdo a la pantalla que lo llame.
Icon getIcon(String nombreRuta, String nombreIcono){

  final colorVerde = Color.fromRGBO(21, 168, 31, .55);
  final colorAmarillo = Color.fromRGBO(245, 206, 1, .55);
  final double tamIcono = 30.0;

  switch (nombreRuta) {
      case 'titulos':{
        return Icon(_iconosTitulos[nombreIcono], color: colorVerde, size: tamIcono);
      }
      case 'capitulos':{
        return Icon(_iconoCapitulos[nombreRuta], color: colorVerde, size: tamIcono);
      }
      case 'articulos':{
        return Icon(_iconoArticulos[nombreRuta], color: colorVerde, size: tamIcono);
      }
      case 'categorias':{
        return Icon(_iconosCategoriasMultas[nombreIcono], color: colorAmarillo, size: tamIcono);
      }
      case 'busqueda':{
        return Icon(_iconoArticulos['articulos'], color: colorVerde, size: tamIcono);
      }
      default:{
        return Icon(Icons.android_outlined);
      }
    }
}