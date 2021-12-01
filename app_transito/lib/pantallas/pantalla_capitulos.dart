import 'package:app_transito/modelos/modelo_capitulo.dart';
import 'package:app_transito/pantallas/pantalla_busqueda_por_palabra_Clave.dart';
import 'package:app_transito/providers/db_provider.dart';
import 'package:app_transito/widgets/lista.dart';
import 'package:app_transito/widgets/safe_area.dart';
import 'package:flutter/material.dart';

class PantallaCapitulos extends StatelessWidget {

  ///Esta clase representa a la pantalla en la que se muestran los nombres de los capítulos relacionados a determindo título del reglamento.
  ///Aquí se deben definir los widgets que se mostrarán en la interfaz gráfica de esta pantalla.
  @override
  Widget build(BuildContext context) {

    ///Con esta línea se recupera el id que se manda como argumento al seleccionar un título en  
    ///la pantalla "PantallaTitulos". Este id será utilizado para recuperar los capítulos relacionados al título seleccionado.  
    final idTitulo = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(

      ///el appBar contiene el titulo de la pantalla y el boton que redirige a la pantalla
      ///en la que se pueden buscar artículos por palabras clave.
      appBar: AppBar(
        title: SafeArea(child: Text('CAPÍTULOS')),
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

      ///En en body de esta pantalla se hace una lista con los nombres de los capítulos registrados en la base de datos.
      body: Lista(
        rutaInicial: 'capitulos',
        rutaDestino: 'articulos', 
        datos: _getCapitulos(idTitulo),
      ),
    );
  }

  ///Esta función recupera los nombres de los capítulos y devuelve una lista para que puedan mostrarse en pantalla..
  Future<List<ModeloCapitulo>> _getCapitulos(int id) async {
    return await DBProvider.db.getCapitulos(id);
  }
}