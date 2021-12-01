import 'package:app_transito/modelos/modelo_articulo.dart';
import 'package:app_transito/providers/db_provider.dart';
import 'package:app_transito/widgets/list_view_reutilizable.dart';
import 'package:flutter/material.dart';

///Esta clase se encarga de la búsqueda de artículos por palabra clave.
///Los métodos que implementa extienden de un searchDelegate proporcionado por Flutter para simplicar el manejo de este tipo de funcionalidad.

class BusquedaArticulos extends SearchDelegate{

  ///Mensaje que se mostrará en la barra de búsqueda para darle pistas al usuario de lo que debe ingresar.
  @override
  String get searchFieldLabel => 'Ingrese las palabras clave';

 
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      SafeArea(
        minimum: EdgeInsets.only(top: 10),
        child: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }
        )
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 10),
      child: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        }
      )
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _busqueda();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _busqueda();
  }

  ///Este método se encarga de validar la cadena de búsqueda y devolver los resultados cuando exista una cadena valida. 
  Widget _busqueda(){
    if(query.isEmpty){
      return _iconoDeInicio();
    } else if (query.length < 4){
      return Center(
        child: Text('Debe ingresar por lo menos una palabra mayor o igual a 4 letras', textAlign: TextAlign.center,));
    }else{
      return FutureBuilder(
       future: DBProvider.db.getArticulosPorPalabraClave(query),
       builder: (_, AsyncSnapshot<List<ModeloArticulo>> snapshot) {

         ///Esa linea sirve para validar que la búsqueda tiene resultados, 
         ///si la lista viene vacia la propiedad length es null por lo que se le asigna un 0.
         var tam = snapshot.data?.length ?? 0; 

         if(tam != 0){
           return ListViewReutilizable(
             datos: snapshot.data!, 
             nombreRutaInicial: 'busqueda', 
             nombreRutaDestino: 'contenidoArticulo'
          );
         }else{
           return Center(child: Text('No hay coincidencias'));
        }
       },
     );
    }
  }

  ///Este icono se mostrará cuando la barra de búsqueda no tenga contenido
  Widget _iconoDeInicio(){
    return Container(
      child: Center(
        child: Icon(Icons.article, size: 200, color: Color.fromRGBO(21, 168, 31, .55))
      ),
    );
  }
}