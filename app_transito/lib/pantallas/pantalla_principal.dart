import 'package:app_transito/pantallas/pantalla_busqueda_por_palabra_Clave.dart';
import 'package:app_transito/widgets/boton.dart';
import 'package:app_transito/widgets/safe_area.dart';
import 'package:flutter/material.dart';


///Esta clase representa a la pantalla principal de la app.
///Aquí se deben definir los widgets que se mostrarán en la interfaz gráfica de esta pantalla.
class PantallaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      ///el appBar contiene el titulo de la pantalla y el boton que redirige a la pantalla
      ///en la que se pueden buscar artículos por palabras clave.
      appBar:AppBar(
        title: SafeArea(
          child: Text('TRÁNSITO VERACRUZ')
        ),
        centerTitle: true,
        actions: [
          SafeAreaReutilizable(
            boton: IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () => showSearch(context: context, delegate: BusquedaArticulos()),
            ),
          )
        ],
      ),

      ///En este caso el body de la pantalla sirve para centrar botones. Tambien se define 
      ///un "SingleChildScrollView" para que los elementos se ajusten a pantallas pequeñas.
      ///el widget "column" sirve para  acomodar los botones en forma vertical.
      body: Center(
        child: SingleChildScrollView(
          child:Column(
            children: <Widget>[
              Boton(icono: Icons.menu_book, etiqueta: 'Reglamento', color: Color.fromRGBO(21, 168, 31, .55), nombreRuta: 'titulos'),
              Boton(icono: Icons.table_chart, etiqueta: 'Tablas de multas', color: Color.fromRGBO(245, 206, 1, .55), nombreRuta: 'categorias'),
              Boton(icono: Icons.calculate_rounded, etiqueta: 'Calculadora', color: Color.fromRGBO(35, 57, 117, .55), nombreRuta: 'calculadora'),
            ]
          )
        ),
      ),
    );
  }
}