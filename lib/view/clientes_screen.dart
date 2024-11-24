import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import '../ddbb/capanegra_ddbb.dart';
import 'detallecliente_screen.dart';
import 'package:flutter/material.dart' as flutter;

class ClientesScreen extends StatefulWidget {
  final Capanegra database;

  const ClientesScreen({Key? key, required this.database}) : super(key: key);

  @override
  _ClientesScreenState createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _guardarCliente() async {
    final nombre = _controller.text.trim();
    if (nombre.isNotEmpty) {
      await widget.database.into(widget.database.cliente).insert(
        ClienteCompanion(nombre: Value(nombre)),
      );
      _controller.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Cliente guardado exitosamente'),
          backgroundColor: Colors.blueAccent,
        ),
      );
      setState(() {}); // Refrescar la lista
    }
  }

  Future<void> _borrarCliente(int id) async {
    await (widget.database.delete(widget.database.cliente)
      ..where((tbl) => tbl.id.equals(id)))
        .go();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Cliente eliminado exitosamente'),
        backgroundColor: Colors.redAccent,
      ),
    );
    setState(() {}); // Refrescar la lista
  }

  void _mostrarDialogoEliminarCliente(int clienteId, String clienteNombre) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            'Eliminar Cliente',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            '¿Estás seguro de que deseas eliminar al cliente "$clienteNombre"?',
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                await _borrarCliente(clienteId);
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/icon/capanegra100.png',
          height: 40, // Ajusta la altura según el tamaño de tu imagen
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: flutter.Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: flutter.Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Nombre del Cliente',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: OutlinedButton(
                      onPressed: _guardarCliente,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.blue, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Crear Cliente',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Lista de Clientes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: FutureBuilder<List<ClienteData>>(
                future: widget.database.select(widget.database.cliente).get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final clientes = snapshot.data!;
                  if (clientes.isEmpty) {
                    return const Center(
                      child: Text(
                        'No hay clientes registrados',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: clientes.length,
                    itemBuilder: (context, index) {
                      final cliente = clientes[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        elevation: 5,
                        shadowColor: Colors.orangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetalleClienteScreen(
                                  nombreCliente: cliente.nombre,
                                  clienteId: cliente.id,
                                  database: widget.database,
                                ),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: ListTile(
                            leading: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                _mostrarDialogoEliminarCliente(
                                    cliente.id, cliente.nombre);
                              },
                            ),
                            title: Text(
                              cliente.nombre,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
