import 'package:app_transito/pantallas/pantalla_articulos.dart';
import 'package:app_transito/pantallas/pantalla_calculadora.dart';
import 'package:app_transito/pantallas/pantalla_capitulos.dart';
import 'package:app_transito/pantallas/pantalla_contenido_articulo.dart';
import 'package:app_transito/pantallas/pantalla_titulos.dart';
import 'package:app_transito/pantallas/pantalla_principal.dart';
import 'package:app_transito/pantallas/pantalla_categorias_de_multas.dart';
import 'package:app_transito/pantallas/pantalla_tabla_de_multas.dart';
import 'package:flutter/material.dart';

///En esta función se establecen las rutas de la app para la navegación entre pantallas.
///Su objetivo es desplegar una pantalla.
///Cuando se requiera agregar nuevas pantallas a la app, simplemente debe agregar un nuevo par 
///"clave-valor", en el cual la "clave" sera un string que servirá como identificador de la ruta y
///el "valor" sera la referencia a la clase con la cual se crea la pantalla.

Map<String, WidgetBuilder> getRutas(){
  return <String, WidgetBuilder>{
        'pantallaPrincipal': (BuildContext context) => PantallaPrincipal(),
        'titulos': (BuildContext context) => PantallaTitulos(),
        'capitulos': (BuildContext context) => PantallaCapitulos(),
        'calculadora': (BuildContext context) => PantallaCalculadora(),
        'articulos': (BuildContext context) => PantallaArticulos(),
        'contenidoArticulo': (BuildContext context) => PantallaContenidoArticulo(),
        'categorias': (BuildContext context) => PantallaCategoriasDeMultas(),
        'tabla': (BuildContext context) => PantallaTablaMultas(),
  };
}