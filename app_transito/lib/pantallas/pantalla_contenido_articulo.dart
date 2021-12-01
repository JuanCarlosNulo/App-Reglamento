import 'package:app_transito/pantallas/pantalla_busqueda_por_palabra_Clave.dart';
import 'package:app_transito/providers/db_provider.dart';
import 'package:app_transito/widgets/safe_area.dart';
import 'package:flutter/material.dart';

///Esta pantalla se encarga de desplegar el contenido de un artículo.
///Aquí se deben definir los widgets que se mostrarán en la interfaz gráfica de esta pantalla.

class PantallaContenidoArticulo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ///Con esta línea se recupera el id que se manda como argumento al seleccionar un artículo en la pantalla "PantallaArticulos". 
    ///Este id será utilizado para recuperar el contenido del artículo seleccionado. 
    final idArticulo = ModalRoute.of(context)!.settings.arguments as int;
    
    return Scaffold(

      ///El appBar contiene el titulo de la pantalla y el boton que redirige a la pantalla
      ///en la que se pueden buscar artículos por palabras clave.
      appBar: AppBar(
        title: SafeArea(child: Text('CONTENIDO ARTÍCULO')),
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

      ///En el body se define un "FutureBuilder" que se encarga de recuperar el conrenido del artículo seleccionado
      ///y cargar la información en pantalla cuando el future este este resuelto.
      body: FutureBuilder(
        initialData: '',
        future: DBProvider.db.getContenidoArticulo(idArticulo),
        builder: (_, AsyncSnapshot<String?> snapshot){
          return SingleChildScrollView(
            padding: const EdgeInsets.all(15.0),
            scrollDirection: Axis.vertical,
            child: Text(snapshot.data!, textAlign: TextAlign.justify,style: TextStyle(fontSize: 17))
          );
        }
      )
    );
  }
}