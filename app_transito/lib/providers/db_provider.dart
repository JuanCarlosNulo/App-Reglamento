import 'dart:io';
import 'package:app_transito/modelos/modelo_articulo.dart';
import 'package:app_transito/modelos/modelo_capitulo.dart';
import 'package:app_transito/modelos/modelo_categoria_multa.dart';
import 'package:app_transito/modelos/modelo_multa.dart';
import 'package:app_transito/modelos/modelo_titulo.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

///Esta clase se encarga de manejar el acceso a la base de datos.
///Todos los métodos get validan que la consulta tenga datos y si no los tiene retorna una lista vacía.

class DBProvider {
  static Database? _database;

  ///Implementación del patron singleton para crear una sola instancia de la base de datos para todas las consultas.
  static final DBProvider db = DBProvider._();
  DBProvider._();

  ///Este método sirve para iniciar la base de datos si aún no hay una instancia de la clase. 
  ///Si ya existe una instancia, retorna la base de datos que ya esta iniciada. 
  Future<Database?> get baseDeDatos async {
    if (_database != null) return _database;

    _database = await iniciarDB();

    return _database;
  }

  ///Este método verifica que la base de datos exista en el dispositivo, si no existe copia el archivo de la carpeta
  ///assets para crearla localmente y despues abrirla. Si la base de datos ya existe, simplemente la abre. 
  Future<Database> iniciarDB() async {

    var rutaLocalBasesDeDatos = await getDatabasesPath();
    var rutaDBEspecifica = join(rutaLocalBasesDeDatos, "reglamentoTransito.db");

    var existe = await databaseExists(rutaDBEspecifica);

    if (!existe) {
      try {
        await Directory(dirname(rutaDBEspecifica)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "reglamento.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(rutaDBEspecifica).writeAsBytes(bytes, flush: true);
    }

    return await openDatabase(rutaDBEspecifica, readOnly: true);
  }

  Future<List<ModeloTitulo>> getTitulos() async {
    final db = await baseDeDatos;
    final titulos = await db?.query(
      'Titulo', 
      columns: ['id', 'nombreTitulo']);

    List<ModeloTitulo> listaTitulos = titulos!.isNotEmpty
        ? titulos.map((e) => new ModeloTitulo.fromJson(e)).toList()
        : [];
    return listaTitulos;
  }

  Future<List<ModeloCapitulo>> getCapitulos(int idTitulo) async {
    final db = await baseDeDatos;
    final capitulos = await db?.query(
      'Capitulo', 
      columns: ['id', 'nombreCapitulo'], 
      where: 'id_Titulo = ?', whereArgs: [idTitulo]);

    List<ModeloCapitulo> listaCapitulos = capitulos!.isNotEmpty
        ? capitulos.map((e) => new ModeloCapitulo.fromJson(e)).toList()
        : [];
    return listaCapitulos;
  }

  Future<List<ModeloArticulo>> getNombreArticulos(int idCapitulo) async {
    final db = await baseDeDatos;
    final capitulos = await db?.query(
      'Articulo', 
      columns: ['id', 'nombreArticulo'],
      where: 'id_Capitulo = ?',
      whereArgs: [idCapitulo]);

    List<ModeloArticulo> listaArticulos = capitulos!.isNotEmpty
        ? capitulos.map((e) => new ModeloArticulo.fromJson(e)).toList()
        : [];
    return listaArticulos;
  }

   Future<String?> getContenidoArticulo(int idArticulo) async {
    final db = await baseDeDatos;
    final respuesta = await db?.query(
      'Articulo',
      columns: ['contenido'],
      where: 'id = ?',
      whereArgs: [idArticulo]);

    return respuesta!.isNotEmpty
           ? ModeloArticulo.fromJson(respuesta.first).contenido
           :null;
  }

  Future<List<ModeloArticulo>> getArticulosPorPalabraClave(String palabraClave) async {
    final db = await baseDeDatos;
    final capitulos = await db?.query(
      'Articulo', 
      where: 'contenido LIKE ?',
      whereArgs: ['%$palabraClave%']);

    List<ModeloArticulo> listaArticulos = capitulos!.isNotEmpty
        ? capitulos.map((e) => new ModeloArticulo.fromJson(e)).toList()
        : [];
    return listaArticulos;
  }

  Future<List<ModeloCategoriaDeMulta>> getCategorias() async {
    final db = await baseDeDatos;
    final categorias = await db?.query(
      'CategoriaDeMultas', 
      columns: ['id', 'nombreCategoria']);

    List<ModeloCategoriaDeMulta> listaCategorias = categorias!.isNotEmpty
        ? categorias.map((e) => new ModeloCategoriaDeMulta.fromJson(e)).toList()
        : [];
    return listaCategorias;
  }

  Future<List<ModeloMulta?>> getMultas(int idCategoria) async {
    final db = await baseDeDatos;
    final categorias = await db?.rawQuery('''SELECT descripcion, nombre, Clasificacion.cantidadDeUmas, Clasificacion.cantidadDeUmasConAgravante 
                                             FROM Multa 
                                             INNER JOIN Clasificacion ON Clasificacion.id = Multa.id_Clasificacion 
                                             WHERE Multa.id_Categoria = ?''', [idCategoria]);

    List<ModeloMulta> listaCategorias = categorias!.isNotEmpty
        ? categorias.map((e) => new ModeloMulta.fromJson(e)).toList()
        : [];
    return listaCategorias;
  }
}