import 'dart:io';
import 'package:drift/drift.dart' as drift;
import 'package:drift/drift.dart';
import 'package:drift/native.dart'; // Base de datos persistente
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart'; // Para obtener directorios específicos
import '../tablas/cliente.dart';
import '../tablas/producto.dart';

part 'capanegra_ddbb.g.dart';

@drift.DriftDatabase(tables: [Cliente, Producto, ClienteProducto])
class Capanegra extends _$Capanegra {
  // Constructor para almacenamiento persistente
  Capanegra() : super(_openConnection());

  // Versión actual del esquema de la base de datos
  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) async {
      // Crea todas las tablas
      await migrator.createAll();


    },
    onUpgrade: (migrator, from, to) async {
      if (from == 1) {
        // Si venimos de la versión 1, crea las tablas nuevas
        await migrator.createTable(producto);
        await migrator.createTable(clienteProducto);
      }
    },
  );

}

// Función para configurar la conexión
drift.LazyDatabase _openConnection() {
  return drift.LazyDatabase(() async {
    // Obtiene el directorio de almacenamiento para la aplicación
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'mi_bbdd.sqlite'));
    return NativeDatabase(file);
  });
}
