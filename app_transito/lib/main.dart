import 'package:app_transito/rutas_de_pantallas/rutas.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'pantallaPrincipal',
      routes: getRutas(),
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.green[900]
        )
      ),
    );
  }
}