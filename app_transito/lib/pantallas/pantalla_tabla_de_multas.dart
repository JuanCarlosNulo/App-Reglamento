import 'package:app_transito/modelos/modelo_multa.dart';
import 'package:app_transito/providers/db_provider.dart';
import 'package:app_transito/widgets/safe_area.dart';
import 'package:app_transito/widgets/tabla.dart';
import 'package:flutter/material.dart';


///Esta clase representa a la pantalla en la cual se muestra una tabla con la información de las multas relacionadas a determinada categoria.
///Aquí se deben definir los widgets que se mostrarán en la interfaz gráfica de esta pantalla.
class PantallaTablaMultas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ///Con esta línea se recupera el id que se manda como argumento al seleccionar una categoria en la pantalla "PantallaCategoriasDeMultas". 
    ///Este id será utilizado para recuperar la información de las multas relacionados a la categoria seleccionada.
    final idCategoria = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(

      ///El appBar contiene el titulo de la pantalla y el boton que redirige a la pantalla
      ///de la calculadora en la que podrán calcular sus multas en pesos de acuerdo a la cantidad de UMAS de .
      appBar: AppBar(
        title: SafeArea(child: Text('TABLA DE MULTAS')),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(245, 206, 1, .55),
        actions: [
          SafeAreaReutilizable(
            boton:IconButton(
            icon: Icon(Icons.calculate_outlined),
            onPressed: () => Navigator.pushNamed(context, 'calculadora'),
            ),
          )
        ],
      ),

      ///En el body de esta pantalla se defime un "FutureBuilder" que se encarga de recuperar la información de las multas
      ///y posteriormente crear crear un widget que se encargará de crear la tabla con los datos recuperados.
      body: FutureBuilder(
        future: DBProvider.db.getMultas(idCategoria),
        builder: (_, AsyncSnapshot<List<ModeloMulta?>> snapshot) {
          List<ModeloMulta?> multas = snapshot.data ?? [];
          return Tabla(multas: multas);
        }
      )
    );
  }
}