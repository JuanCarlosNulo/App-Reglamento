import 'package:app_transito/modelos/modelo_multa.dart';
import 'package:flutter/material.dart';

///Esta clase se encarga de construir una tabla con información de las multas.
///Requiere del ID de la categoría para obtener los datos de las multas relacionadas a una categoría seleccionada
///en la pantalla "PantallaCategoriasDeMultas".
class Tabla extends StatelessWidget {
  final List<ModeloMulta?> multas;

  const Tabla({required this.multas});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 10),
          scrollDirection: Axis.horizontal,
          child: DataTable(
              headingTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
              dataTextStyle: TextStyle(color: Colors.black, fontSize: 10),
              headingRowColor: MaterialStateProperty.resolveWith(
                  (states) => Color.fromRGBO(245, 206, 1, .55)),
              columnSpacing: 43,
              columns: <DataColumn>[
                DataColumn(label: Text('Descripción')),
                DataColumn(label: Text('Clasificación')),
                DataColumn(label: Text('UMA')),
                DataColumn(
                    label: Container(
                        width: 50,
                        child: Text('Con agravante',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            textAlign: TextAlign.center)))
              ],
              rows: filas(multas)),
        ),
      ),
    ]);
  }

  ///Este método se encarga de crear las filas de la tabla. Requiere de las multas obtenidas de la base de datos para
  ///poisteriormente crear las celdas de una fila.
  List<DataRow> filas(List<ModeloMulta?> multas) {
    final List<DataRow> filas = [];

    multas.forEach((multa) {
      final fila = DataRow(cells: celdas(multa!));
      filas.add(fila);
    });

    return filas;
  }

  ///Este método se encarga de llenar las celdas de la fila con la información de las multas. Como parámetro recibe un 
  ///objeto tipo "ModeloMulta" del cual se tomará la información para llenar las celdas.
  List<DataCell> celdas(ModeloMulta multa) {
    final List<DataCell> celdas = [];
    celdas
      ..add(DataCell(Container(
          width: 90,
          child: Text(multa.descripcion!,
              overflow: TextOverflow.ellipsis,
              maxLines: 50,
              textAlign: TextAlign.justify))))
      ..add(DataCell(Center(child: Text(multa.nombre!))))
      ..add(DataCell(Center(child: Text(multa.cantidadUmas!))))
      ..add(DataCell(Center(child: Text(multa.cantidadUmasConAgravante!))));

    return celdas;
  }
}
