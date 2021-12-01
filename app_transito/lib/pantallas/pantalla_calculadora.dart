import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///Debido a que se debe cambiar el estado de la pantalla por el cálculo que se realiza, esta pantalla es de tipo "statefulwidget".
///La clase "PantallaCalculadora" se encarga de manejar el estado de la clase "_Calculadora".
///La clase "_Calculadora" Se encarga de hacer el cáclculo para determinar el valor de una multa en pesos 
///a partir del valor de la multa en UMAS. También se encarga de establecer los elementos de la interfaz gráfica.
class PantallaCalculadora extends StatefulWidget {
 
  @override
  _Calculadora createState() => _Calculadora();
}

class _Calculadora extends State<PantallaCalculadora>{
  
  ///Cantidad de umas ingresadas por el usuario
  int _umas = 0;
  ///Resultado del cálculo.
  double _resultado = 0.0;
  final SizedBox sizedBox = SizedBox(height: 30);

  @override
  Widget build(BuildContext context) {

    ///Este variable representa al campo de texto en el cual el usuario ingresará la cantidad de UMAS de su multa.
    TextField textField = TextField(
      decoration: InputDecoration(
        labelText: 'Cantidad de UMAS',
        helperText: 'Ingrese la cantidad de umas de su multa',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[ FilteringTextInputFormatter.digitsOnly],
      onChanged: (valor){
        setState(() {
          if(valor != ''){
            _umas = int.parse(valor);
            _calcularMulta(_umas);
          }else{
            _umas = 0;
            _calcularMulta(_umas);
          }
        });
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: SafeArea(child: Text('CALCULADORA')),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(35, 57, 117, .55),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              _getTextoEnFormato1('El valor actual de una UMA (Unidad de Medida y Actualización) es: '),
              sizedBox,
              _getTextoEnFormato2('89.62'),
              sizedBox,
              _getTextoEnFormato1('A continuación, ingrese la cantidad de UMAS impuestas en su multa para poder calcularla en pesos'),
              sizedBox,
              textField,
              sizedBox,
              _getTextoEnFormato2('El valor en pesos de su multa es: \n\n' + '\u0024 ' + '$_resultado')
            ],
          ),
        ),
    );
  }

  ///Esta función se encarga de hacer el cálculo para cambiar el resultado al momento de que el usuario ingresa la cantidad de UMAS.
  void _calcularMulta(int umas) {
    final valorActualUMA = 89.62;  
    _resultado = umas * valorActualUMA; 
  }

  ///Esta función da formato normal al texto que recibe como parámetro.
  Text _getTextoEnFormato1 (String texto){
    return Text(
      texto,
      style: TextStyle(fontSize: 15),
      textAlign: TextAlign.justify
    );
  }

  ///Esta función sirve para dar formato y resaltar en la interfaz el texto que recibe como parámetro.
  Text _getTextoEnFormato2 (String texto){
    return Text(
      texto,
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center
    );
  }
}
