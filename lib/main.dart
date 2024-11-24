import 'package:flutter/material.dart';
import 'package:libreta/view/clientes_screen.dart';
import 'ddbb/capanegra_ddbb.dart';

void main() {
  final db = Capanegra();
  runApp(MyApp(database: db));
}

class MyApp extends StatelessWidget {
  final Capanegra database;

  const MyApp({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Clienteeesssss',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ClientesScreen(database: database),
    );
  }
}
