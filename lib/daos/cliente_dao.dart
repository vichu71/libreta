import 'package:drift/drift.dart';
import '../ddbb/capanegra_ddbb.dart';
import '../tablas/cliente.dart';

part 'cliente_dao.g.dart';

@DriftAccessor(tables: [Cliente])
class ClienteDao extends DatabaseAccessor<Capanegra> with _$ClienteDaoMixin {
  ClienteDao(Capanegra db) : super(db);

  // Insertar un cliente
  Future<void> insertarCliente(String nombre) async {
    into(db.cliente).insert(ClienteCompanion(nombre: Value(nombre)));

  }

  // Obtener todos los clientes
  Future<Future<List>> obtenerClientes() async {
    return select(db.cliente).get();
  }
}
