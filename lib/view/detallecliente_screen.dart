import 'package:flutter/material.dart';
import '../ddbb/capanegra_ddbb.dart';
import '../daos/cliente_producto_dao.dart';

class DetalleClienteScreen extends StatefulWidget {
  final String nombreCliente;
  final int clienteId;
  final Capanegra database;

  const DetalleClienteScreen({
    Key? key,
    required this.nombreCliente,
    required this.clienteId,
    required this.database,
  }) : super(key: key);

  @override
  _DetalleClienteScreenState createState() => _DetalleClienteScreenState();
}

class ProductoSeleccionado {
  final ProductoData producto;
  int cantidad;

  ProductoSeleccionado({required this.producto, this.cantidad = 1});

  double get precioTotal => producto.precio * cantidad;
}

class _DetalleClienteScreenState extends State<DetalleClienteScreen> {
  late final ClienteProductoDao _dao;
  List<ProductoSeleccionado> _productosSeleccionados = [];
  List<ProductoData> _productosDisponibles = [];
  ProductoData? _productoSeleccionado;

  @override
  void initState() {
    super.initState();
    _dao = ClienteProductoDao(widget.database);
    _cargarProductos();
    _cargarProductosSeleccionados();
  }

  Future<void> _cargarProductos() async {
    try {
      final productos = await _dao.obtenerProductos();
      setState(() {
        _productosDisponibles = productos;
      });
    } catch (e) {
      print('Error al cargar productos: $e');
    }
  }

  Future<void> _cargarProductosSeleccionados() async {
    try {
      final productos = await _dao.obtenerProductosPorCliente(widget.clienteId);
      setState(() {
        _productosSeleccionados = productos;
      });
    } catch (e) {
      print('Error al cargar productos seleccionados: $e');
    }
  }

  Future<void> _anadirProducto(ProductoData producto) async {
    final index = _productosSeleccionados.indexWhere(
          (item) => item.producto.id == producto.id,
    );

    if (index != -1) {
      await _dao.anadirProductoACliente(widget.clienteId, producto.id);
      setState(() {
        _productosSeleccionados[index].cantidad++;
      });
    } else {
      await _dao.anadirProductoACliente(widget.clienteId, producto.id);
      setState(() {
        _productosSeleccionados.add(
          ProductoSeleccionado(producto: producto, cantidad: 1),
        );
      });
    }
  }

  Future<void> _eliminarProducto(ProductoData producto) async {
    try {
      await widget.database.delete(widget.database.producto).delete(producto);
      await _cargarProductos();
    } catch (e) {
      print('Error al eliminar producto: $e');
    }
  }

  void _incrementarCantidad(int index) async {
    final producto = _productosSeleccionados[index].producto;
    await _dao.anadirProductoACliente(widget.clienteId, producto.id);
    setState(() {
      _productosSeleccionados[index].cantidad++;
    });
  }

  void _reducirCantidad(int index) async {
    final producto = _productosSeleccionados[index].producto;
    await _dao.reducirCantidadOEliminar(widget.clienteId, producto.id);

    setState(() {
      if (_productosSeleccionados[index].cantidad > 1) {
        _productosSeleccionados[index].cantidad--;
      } else {
        _productosSeleccionados.removeAt(index);
      }
    });
  }

  void _mostrarDialogoProductos() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Permite que el diálogo ocupe casi toda la pantalla
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9, // Ocupa el 90% de la pantalla
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Gestión de Productos',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _productosDisponibles.length,
                  itemBuilder: (context, index) {
                    final producto = _productosDisponibles[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ListTile(
                        title: Text(
                          producto.nombre,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Precio: ${producto.precio.toStringAsFixed(2)} €',
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () async {
                            await _eliminarProducto(producto);
                          },
                        ),
                        onTap: () async {
                          await _anadirProducto(producto);
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Cerrar',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  void _abrirDialogoNuevoProducto() {
    final TextEditingController nombreController = TextEditingController();
    final TextEditingController precioController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text('Añadir nuevo producto'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre del producto',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: precioController,
                decoration: const InputDecoration(
                  labelText: 'Precio del producto',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () async {
                final nombre = nombreController.text.trim();
                final precio = double.tryParse(precioController.text.trim());

                if (nombre.isNotEmpty && precio != null && precio > 0) {
                  await _dao.anadirProducto(nombre, precio);
                  await _cargarProductos();
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Añadir'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarDialogoTotal() {
    final double total = _productosSeleccionados.fold(
      0.0,
          (sum, item) {
        // Asegurarse de que el precio total del producto se calcule correctamente
        final precioItem = item.producto.precio * item.cantidad;
        return sum + precioItem;
      },
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text('Total de ${widget.nombreCliente}'),
          content: Text(
            '${total.toStringAsFixed(2)} €',
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.indigoAccent,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
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
        title: Text(
          widget.nombreCliente,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // Espaciado a la derecha
            child: IconButton(
              icon: const Icon(
                Icons.add_circle,
                size: 40, // Tamaño aumentado
                color: Colors.lightGreen,
              ),
              onPressed: _abrirDialogoNuevoProducto,
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _mostrarDialogoProductos,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.inventory_2, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'añadir',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _productosSeleccionados.length,
              itemBuilder: (context, index) {
                final item = _productosSeleccionados[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text('${item.producto.nombre} (x${item.cantidad})'),
                    subtitle: Text(
                      'Precio total: ${item.precioTotal.toStringAsFixed(2)} €',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                          onPressed: () => _reducirCantidad(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                          onPressed: () => _incrementarCantidad(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoTotal,
        child: const Icon(Icons.calculate),
      ),
    );
  }
}
