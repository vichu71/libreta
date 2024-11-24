import 'package:drift/drift.dart';
import '../ddbb/capanegra_ddbb.dart';
import '../tablas/producto.dart';
import '../view/detallecliente_screen.dart';
import 'package:drift/drift.dart' as drift;

part 'cliente_producto_dao.g.dart';

@DriftAccessor(tables: [ClienteProducto, Producto])
class ClienteProductoDao extends DatabaseAccessor<Capanegra>
    with _$ClienteProductoDaoMixin {
  ClienteProductoDao(Capanegra db) : super(db);

  // Obtener todos los productos disponibles
  Future<List<ProductoData>> obtenerProductos() async {
    return select(db.producto).get();
  }

  Future<List<ProductoSeleccionado>> obtenerProductosPorCliente(
      int clienteId) async {
    final query = select(db.producto).join(
      [
        innerJoin(
          db.clienteProducto,
          db.clienteProducto.productoId.equalsExp(db.producto.id),
        )
      ],
    )..where(db.clienteProducto.clienteId.equals(clienteId));

    final resultados = await query.get();
    return resultados.map((fila) {
      final producto = fila.readTable(db.producto);
      final clienteProducto = fila.readTable(db.clienteProducto);
      return ProductoSeleccionado(
        producto: producto,
        cantidad: clienteProducto.cantidad,
      );
    }).toList();
  }

  Future<void> anadirProductoACliente(int clienteId, int productoId) async {
    try {
      final existente = await (select(db.clienteProducto)
        ..where((tbl) =>
        tbl.clienteId.equals(clienteId) &
        tbl.productoId.equals(productoId)))
          .getSingleOrNull();

      if (existente != null) {
        // Incrementar cantidad si ya existe
        await update(db.clienteProducto).replace(
          ClienteProductoData(
            id: existente.id,
            clienteId: clienteId,
            productoId: productoId,
            cantidad: existente.cantidad + 1,
          ),
        );
      } else {
        // Insertar nueva relación con cantidad predeterminada
        await into(db.clienteProducto).insert(
          ClienteProductoCompanion(
            clienteId: drift.Value(clienteId),
            productoId: drift.Value(productoId),
            cantidad: const drift.Value(1),
          ),
        );
      }
    } catch (e) {
      print('Error en anadirProductoACliente: $e');
    }
  }


  Future<void> reducirCantidadOEliminar(int clienteId, int productoId) async {
    try {
      final existente = await (select(db.clienteProducto)
        ..where((tbl) =>
        tbl.clienteId.equals(clienteId) &
        tbl.productoId.equals(productoId)))
          .getSingleOrNull();

      if (existente != null) {
        if (existente.cantidad > 1) {
          // Reducir cantidad
          await update(db.clienteProducto).replace(
            ClienteProductoData(
              id: existente.id,
              clienteId: clienteId,
              productoId: productoId,
              cantidad: existente.cantidad - 1,
            ),
          );
        } else {
          // Eliminar relación completamente
          await (delete(db.clienteProducto)
            ..where((tbl) =>
            tbl.clienteId.equals(clienteId) &
            tbl.productoId.equals(productoId)))
              .go();
        }
      } else {
        print('No se encontró el producto en cliente_producto para eliminar.');
      }
    } catch (e) {
      print('Error en reducirCantidadOEliminar: $e');
    }
  }




  // Añadir un nuevo producto a la base de datos
  Future<void> anadirProducto(String nombre, double precio) async {
    // Comprobamos si ya existe un producto con el mismo nombre para evitar duplicados
    final existente = await (select(db.producto)
      ..where((tbl) => tbl.nombre.equals(nombre)))
        .getSingleOrNull();

    if (existente == null) {
      // Insertamos un nuevo producto si no existe
      await into(db.producto).insert(
        ProductoCompanion(
          nombre: drift.Value(nombre),
          precio: drift.Value(precio),
        ),
      );
    } else {
      throw Exception('El producto con el nombre "$nombre" ya existe.');
    }
  }
  Future<void> eliminarProducto(int productoId) async {
    try {
      await (delete(db.producto)..where((tbl) => tbl.id.equals(productoId))).go();
      print('Producto con id $productoId eliminado de la tabla productos.');
    } catch (e) {
      print('Error al eliminar producto de productos: $e');
    }
  }

}
