import 'package:app_transito/modelos/modelo_titulo.dart';
import 'package:app_transito/pantallas/pantalla_busqueda_por_palabra_Clave.dart';
import 'package:app_transito/providers/db_provider.dart';
import 'package:app_transito/widgets/lista.dart';
import 'package:app_transito/widgets/safe_area.dart';
import 'package:flutter/material.dart';

class PantallaTitulos extends StatelessWidget {

  ///Esta clase representa a la pantalla en la que se muestran los nombres de los títulos del reglamento.
  ///Aquí se deben definir los widgets que se mostrarán en la interfaz gráfica de esta pantalla.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      ///el appBar contiene el titulo de la pantalla y el boton que redirige a la pantalla
      ///en la que se pueden buscar artículos por palabras clave.
      appBar: AppBar(
        title: SafeArea(
          child: Text('TÍTULOS')
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

      ///En en body de esta pantalla se hace una lista con los nombres de los títulos registrados en la base de datos.
      body: Lista(
        rutaInicial: 'titulos',
        rutaDestino: 'capitulos', 
        datos: _getTitulos(), 
      )
    );
  }

  ///Esta función recupera los nombres de los titulos y devuelve una lista para que puedan mostrarse en pantalla.
  Future<List<ModeloTitulo>> _getTitulos() async {
    return await DBProvider.db.getTitulos();
  }
}