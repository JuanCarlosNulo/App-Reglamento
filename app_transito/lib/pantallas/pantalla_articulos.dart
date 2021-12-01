import 'package:app_transito/modelos/modelo_articulo.dart';
import 'package:app_transito/pantallas/pantalla_busqueda_por_palabra_Clave.dart';
import 'package:app_transito/providers/db_provider.dart';
import 'package:app_transito/widgets/lista.dart';
import 'package:app_transito/widgets/safe_area.dart';
import 'package:flutter/material.dart';

///Esta clase representa a la pantalla en la cual se muestran los nombres de los artículos relacionados a determinado capítulo del reglamento.
///Aquí se deben definir los widgets que se mostrarán en la interfaz gráfica de esta pantalla.
class PantallaArticulos extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    ///Con esta línea se recupera el id que se manda como argumento al seleccionar un capítulo en la pantalla "PantallaCapitulos". 
    ///Este id será utilizado para recuperar los artículos relacionados al capítulo seleccionado.  
    final idCapitulo = ModalRoute.of(context)!.settings.arguments as int;
    
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(child: Text('ARTÍCULOS')),
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

      ///En en body de esta pantalla se hace una lista con los nombres de los artículos seleccionados de la base de datos.
      body: Lista(
        rutaInicial: 'articulos',
        rutaDestino: 'contenidoArticulo', 
        datos: _getArticulos(idCapitulo)
      ),
    );
  }

  ///Esta función recupera los nombres de los artículos y devuelve una lista para que puedan mostrarse en pantalla.
  Future<List<ModeloArticulo>> _getArticulos(int idArticulo) async {
    return await DBProvider.db.getNombreArticulos(idArticulo);
  }
}