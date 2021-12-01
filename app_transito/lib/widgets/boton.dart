import 'package:flutter/material.dart';


///Esta clase se encarga de generar un botón personalizado en la pantalla principal.
///recibe los siguientes parametros:
///-icono: icono que tendrá el botón.
///-texto: etiqueta que tendrá el botón.
///-color: Color del botón.
///-nombreRuta: nombre de la ruta a la que se redirigirá al usuario cuando seleccione la opción.
class Boton extends StatelessWidget {
  
  final IconData icono;
  final String etiqueta;
  final Color color;
  final String nombreRuta;

  const Boton({
    required this.icono, 
    required this.etiqueta,
    required this.color,
    required this.nombreRuta
  });

  ///La clase retorna un widget tipo "Container", en el cual se define el tamaño del botón y
  ///el margen que tendrá respecto a los bordes de la pantalla del dispositivo móvil.
  ///El widget "Expanded" en la propiedad label del botón sirve para que el texto se ajuste al 
  ///tamaño definido en el container, si se quita este widget pude haber problemas para renderizar este
  ///elemento en la pantalla de algunos celulares y se lanzara una excepcion.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      height: 180.0,
      width: 300.0,
      child: ElevatedButton.icon(
        icon: CircleAvatar(
          backgroundColor: Colors.white54,
          child: Icon(this.icono, color: Colors.black, size: 50),
          radius: 40.0),
        label: Expanded(
          child: Text(
            this.etiqueta,
            style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )
          ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          primary: Color.fromRGBO(this.color.red, this.color.green, this.color.blue, this.color.opacity),
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, this.nombreRuta);
        }
      ),
    );
  }
}