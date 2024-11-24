import 'package:drift/drift.dart' as drift;
import 'package:drift/drift.dart';

class Producto extends drift.Table {
  drift.IntColumn get id => integer().autoIncrement()(); // ID autoincremental
  drift.TextColumn get nombre => text().withLength(min: 1, max: 50)(); // Nombre del producto
  drift.RealColumn get precio => real()(); // Precio del producto
}

class ClienteProducto extends Table {
  IntColumn get id => integer().autoIncrement()(); // ID autoincremental
  IntColumn get clienteId => integer()(); // ID del cliente
  IntColumn get productoId => integer()(); // ID del producto
  IntColumn get cantidad => integer().withDefault(const Constant(1))(); // Cantidad con valor predeterminado
}


