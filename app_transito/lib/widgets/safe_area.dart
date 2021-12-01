import 'package:flutter/material.dart';

///Esta clase se encarga de acomodar un botón en el AppBar a la misma altura que el título.
///cuando se hace una instancia requiere de un IconButton que será el boton que acomodará en la UI. 

class SafeAreaReutilizable extends StatelessWidget {
  final IconButton boton;

  const SafeAreaReutilizable({
    required this.boton
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.only(top: 20),
      child: this.boton
    );
  }
}