import 'package:app_transito/modelos/modelo_categoria_multa.dart';
import 'package:app_transito/providers/db_provider.dart';
import 'package:app_transito/widgets/lista.dart';
import 'package:flutter/material.dart';

///Esta clase representa a la pantalla en la cual se muestran los nombres de las categorias registradas en la basede datos.
///Aquí se deben definir los widgets que se mostrarán en la interfaz gráfica de esta pantalla.
class PantallaCategoriasDeMultas extends StatelessWidget {
 
   @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      ///En el appBar se define el título de la pantalla y color del AppBar
      appBar: AppBar(
        title: SafeArea(child: Text('CATEGORIAS')),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(245, 206, 1, .55)
      ),

      ///En en body de esta pantalla se hace una lista con los nombres de las categorias recuperadasde la base de datos.
      body: Lista(
        rutaInicial: 'categorias',
        rutaDestino: 'tabla', 
        datos: _getCategorias(), 
      ),
    );
  }

 ///Esta función recupera los nombres de las categorias de las multas y devuelve una lista para que puedan mostrarse en pantalla.
  Future<List<ModeloCategoriaDeMulta>> _getCategorias() async {
    return await DBProvider.db.getCategorias();
  }
}