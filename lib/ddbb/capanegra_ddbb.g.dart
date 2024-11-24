// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capanegra_ddbb.dart';

// ignore_for_file: type=lint
class $ClienteTable extends Cliente
    with drift.TableInfo<$ClienteTable, ClienteData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClienteTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _nombreMeta =
      const drift.VerificationMeta('nombre');
  @override
  late final drift.GeneratedColumn<String> nombre =
      drift.GeneratedColumn<String>('nombre', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 50),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns => [id, nombre];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cliente';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<ClienteData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  ClienteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClienteData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
    );
  }

  @override
  $ClienteTable createAlias(String alias) {
    return $ClienteTable(attachedDatabase, alias);
  }
}

class ClienteData extends drift.DataClass
    implements drift.Insertable<ClienteData> {
  final int id;
  final String nombre;
  const ClienteData({required this.id, required this.nombre});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['nombre'] = drift.Variable<String>(nombre);
    return map;
  }

  ClienteCompanion toCompanion(bool nullToAbsent) {
    return ClienteCompanion(
      id: drift.Value(id),
      nombre: drift.Value(nombre),
    );
  }

  factory ClienteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return ClienteData(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
    };
  }

  ClienteData copyWith({int? id, String? nombre}) => ClienteData(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
      );
  ClienteData copyWithCompanion(ClienteCompanion data) {
    return ClienteData(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClienteData(')
          ..write('id: $id, ')
          ..write('nombre: $nombre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClienteData &&
          other.id == this.id &&
          other.nombre == this.nombre);
}

class ClienteCompanion extends drift.UpdateCompanion<ClienteData> {
  final drift.Value<int> id;
  final drift.Value<String> nombre;
  const ClienteCompanion({
    this.id = const drift.Value.absent(),
    this.nombre = const drift.Value.absent(),
  });
  ClienteCompanion.insert({
    this.id = const drift.Value.absent(),
    required String nombre,
  }) : nombre = drift.Value(nombre);
  static drift.Insertable<ClienteData> custom({
    drift.Expression<int>? id,
    drift.Expression<String>? nombre,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
    });
  }

  ClienteCompanion copyWith(
      {drift.Value<int>? id, drift.Value<String>? nombre}) {
    return ClienteCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = drift.Variable<String>(nombre.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClienteCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre')
          ..write(')'))
        .toString();
  }
}

class $ProductoTable extends Producto
    with drift.TableInfo<$ProductoTable, ProductoData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductoTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _nombreMeta =
      const drift.VerificationMeta('nombre');
  @override
  late final drift.GeneratedColumn<String> nombre =
      drift.GeneratedColumn<String>('nombre', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 1, maxTextLength: 50),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const drift.VerificationMeta _precioMeta =
      const drift.VerificationMeta('precio');
  @override
  late final drift.GeneratedColumn<double> precio =
      drift.GeneratedColumn<double>('precio', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<drift.GeneratedColumn> get $columns => [id, nombre, precio];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'producto';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<ProductoData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('precio')) {
      context.handle(_precioMeta,
          precio.isAcceptableOrUnknown(data['precio']!, _precioMeta));
    } else if (isInserting) {
      context.missing(_precioMeta);
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  ProductoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
      precio: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}precio'])!,
    );
  }

  @override
  $ProductoTable createAlias(String alias) {
    return $ProductoTable(attachedDatabase, alias);
  }
}

class ProductoData extends drift.DataClass
    implements drift.Insertable<ProductoData> {
  final int id;
  final String nombre;
  final double precio;
  const ProductoData(
      {required this.id, required this.nombre, required this.precio});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['nombre'] = drift.Variable<String>(nombre);
    map['precio'] = drift.Variable<double>(precio);
    return map;
  }

  ProductoCompanion toCompanion(bool nullToAbsent) {
    return ProductoCompanion(
      id: drift.Value(id),
      nombre: drift.Value(nombre),
      precio: drift.Value(precio),
    );
  }

  factory ProductoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return ProductoData(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      precio: serializer.fromJson<double>(json['precio']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'precio': serializer.toJson<double>(precio),
    };
  }

  ProductoData copyWith({int? id, String? nombre, double? precio}) =>
      ProductoData(
        id: id ?? this.id,
        nombre: nombre ?? this.nombre,
        precio: precio ?? this.precio,
      );
  ProductoData copyWithCompanion(ProductoCompanion data) {
    return ProductoData(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      precio: data.precio.present ? data.precio.value : this.precio,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductoData(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('precio: $precio')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre, precio);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductoData &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.precio == this.precio);
}

class ProductoCompanion extends drift.UpdateCompanion<ProductoData> {
  final drift.Value<int> id;
  final drift.Value<String> nombre;
  final drift.Value<double> precio;
  const ProductoCompanion({
    this.id = const drift.Value.absent(),
    this.nombre = const drift.Value.absent(),
    this.precio = const drift.Value.absent(),
  });
  ProductoCompanion.insert({
    this.id = const drift.Value.absent(),
    required String nombre,
    required double precio,
  })  : nombre = drift.Value(nombre),
        precio = drift.Value(precio);
  static drift.Insertable<ProductoData> custom({
    drift.Expression<int>? id,
    drift.Expression<String>? nombre,
    drift.Expression<double>? precio,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (precio != null) 'precio': precio,
    });
  }

  ProductoCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<String>? nombre,
      drift.Value<double>? precio}) {
    return ProductoCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      precio: precio ?? this.precio,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = drift.Variable<String>(nombre.value);
    }
    if (precio.present) {
      map['precio'] = drift.Variable<double>(precio.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductoCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('precio: $precio')
          ..write(')'))
        .toString();
  }
}

class $ClienteProductoTable extends ClienteProducto
    with drift.TableInfo<$ClienteProductoTable, ClienteProductoData> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClienteProductoTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta =
      const drift.VerificationMeta('id');
  @override
  late final drift.GeneratedColumn<int> id = drift.GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const drift.VerificationMeta _clienteIdMeta =
      const drift.VerificationMeta('clienteId');
  @override
  late final drift.GeneratedColumn<int> clienteId = drift.GeneratedColumn<int>(
      'cliente_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const drift.VerificationMeta _productoIdMeta =
      const drift.VerificationMeta('productoId');
  @override
  late final drift.GeneratedColumn<int> productoId = drift.GeneratedColumn<int>(
      'producto_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const drift.VerificationMeta _cantidadMeta =
      const drift.VerificationMeta('cantidad');
  @override
  late final drift.GeneratedColumn<int> cantidad = drift.GeneratedColumn<int>(
      'cantidad', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const drift.Constant(1));
  @override
  List<drift.GeneratedColumn> get $columns =>
      [id, clienteId, productoId, cantidad];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cliente_producto';
  @override
  drift.VerificationContext validateIntegrity(
      drift.Insertable<ClienteProductoData> instance,
      {bool isInserting = false}) {
    final context = drift.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cliente_id')) {
      context.handle(_clienteIdMeta,
          clienteId.isAcceptableOrUnknown(data['cliente_id']!, _clienteIdMeta));
    } else if (isInserting) {
      context.missing(_clienteIdMeta);
    }
    if (data.containsKey('producto_id')) {
      context.handle(
          _productoIdMeta,
          productoId.isAcceptableOrUnknown(
              data['producto_id']!, _productoIdMeta));
    } else if (isInserting) {
      context.missing(_productoIdMeta);
    }
    if (data.containsKey('cantidad')) {
      context.handle(_cantidadMeta,
          cantidad.isAcceptableOrUnknown(data['cantidad']!, _cantidadMeta));
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
  @override
  ClienteProductoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClienteProductoData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      clienteId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cliente_id'])!,
      productoId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}producto_id'])!,
      cantidad: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cantidad'])!,
    );
  }

  @override
  $ClienteProductoTable createAlias(String alias) {
    return $ClienteProductoTable(attachedDatabase, alias);
  }
}

class ClienteProductoData extends drift.DataClass
    implements drift.Insertable<ClienteProductoData> {
  final int id;
  final int clienteId;
  final int productoId;
  final int cantidad;
  const ClienteProductoData(
      {required this.id,
      required this.clienteId,
      required this.productoId,
      required this.cantidad});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<int>(id);
    map['cliente_id'] = drift.Variable<int>(clienteId);
    map['producto_id'] = drift.Variable<int>(productoId);
    map['cantidad'] = drift.Variable<int>(cantidad);
    return map;
  }

  ClienteProductoCompanion toCompanion(bool nullToAbsent) {
    return ClienteProductoCompanion(
      id: drift.Value(id),
      clienteId: drift.Value(clienteId),
      productoId: drift.Value(productoId),
      cantidad: drift.Value(cantidad),
    );
  }

  factory ClienteProductoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return ClienteProductoData(
      id: serializer.fromJson<int>(json['id']),
      clienteId: serializer.fromJson<int>(json['clienteId']),
      productoId: serializer.fromJson<int>(json['productoId']),
      cantidad: serializer.fromJson<int>(json['cantidad']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'clienteId': serializer.toJson<int>(clienteId),
      'productoId': serializer.toJson<int>(productoId),
      'cantidad': serializer.toJson<int>(cantidad),
    };
  }

  ClienteProductoData copyWith(
          {int? id, int? clienteId, int? productoId, int? cantidad}) =>
      ClienteProductoData(
        id: id ?? this.id,
        clienteId: clienteId ?? this.clienteId,
        productoId: productoId ?? this.productoId,
        cantidad: cantidad ?? this.cantidad,
      );
  ClienteProductoData copyWithCompanion(ClienteProductoCompanion data) {
    return ClienteProductoData(
      id: data.id.present ? data.id.value : this.id,
      clienteId: data.clienteId.present ? data.clienteId.value : this.clienteId,
      productoId:
          data.productoId.present ? data.productoId.value : this.productoId,
      cantidad: data.cantidad.present ? data.cantidad.value : this.cantidad,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClienteProductoData(')
          ..write('id: $id, ')
          ..write('clienteId: $clienteId, ')
          ..write('productoId: $productoId, ')
          ..write('cantidad: $cantidad')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, clienteId, productoId, cantidad);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClienteProductoData &&
          other.id == this.id &&
          other.clienteId == this.clienteId &&
          other.productoId == this.productoId &&
          other.cantidad == this.cantidad);
}

class ClienteProductoCompanion
    extends drift.UpdateCompanion<ClienteProductoData> {
  final drift.Value<int> id;
  final drift.Value<int> clienteId;
  final drift.Value<int> productoId;
  final drift.Value<int> cantidad;
  const ClienteProductoCompanion({
    this.id = const drift.Value.absent(),
    this.clienteId = const drift.Value.absent(),
    this.productoId = const drift.Value.absent(),
    this.cantidad = const drift.Value.absent(),
  });
  ClienteProductoCompanion.insert({
    this.id = const drift.Value.absent(),
    required int clienteId,
    required int productoId,
    this.cantidad = const drift.Value.absent(),
  })  : clienteId = drift.Value(clienteId),
        productoId = drift.Value(productoId);
  static drift.Insertable<ClienteProductoData> custom({
    drift.Expression<int>? id,
    drift.Expression<int>? clienteId,
    drift.Expression<int>? productoId,
    drift.Expression<int>? cantidad,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (clienteId != null) 'cliente_id': clienteId,
      if (productoId != null) 'producto_id': productoId,
      if (cantidad != null) 'cantidad': cantidad,
    });
  }

  ClienteProductoCompanion copyWith(
      {drift.Value<int>? id,
      drift.Value<int>? clienteId,
      drift.Value<int>? productoId,
      drift.Value<int>? cantidad}) {
    return ClienteProductoCompanion(
      id: id ?? this.id,
      clienteId: clienteId ?? this.clienteId,
      productoId: productoId ?? this.productoId,
      cantidad: cantidad ?? this.cantidad,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<int>(id.value);
    }
    if (clienteId.present) {
      map['cliente_id'] = drift.Variable<int>(clienteId.value);
    }
    if (productoId.present) {
      map['producto_id'] = drift.Variable<int>(productoId.value);
    }
    if (cantidad.present) {
      map['cantidad'] = drift.Variable<int>(cantidad.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClienteProductoCompanion(')
          ..write('id: $id, ')
          ..write('clienteId: $clienteId, ')
          ..write('productoId: $productoId, ')
          ..write('cantidad: $cantidad')
          ..write(')'))
        .toString();
  }
}

abstract class _$Capanegra extends drift.GeneratedDatabase {
  _$Capanegra(QueryExecutor e) : super(e);
  $CapanegraManager get managers => $CapanegraManager(this);
  late final $ClienteTable cliente = $ClienteTable(this);
  late final $ProductoTable producto = $ProductoTable(this);
  late final $ClienteProductoTable clienteProducto =
      $ClienteProductoTable(this);
  @override
  Iterable<drift.TableInfo<drift.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<drift.TableInfo<drift.Table, Object?>>();
  @override
  List<drift.DatabaseSchemaEntity> get allSchemaEntities =>
      [cliente, producto, clienteProducto];
}

typedef $$ClienteTableCreateCompanionBuilder = ClienteCompanion Function({
  drift.Value<int> id,
  required String nombre,
});
typedef $$ClienteTableUpdateCompanionBuilder = ClienteCompanion Function({
  drift.Value<int> id,
  drift.Value<String> nombre,
});

class $$ClienteTableFilterComposer
    extends drift.Composer<_$Capanegra, $ClienteTable> {
  $$ClienteTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get nombre => $composableBuilder(
      column: $table.nombre, builder: (column) => drift.ColumnFilters(column));
}

class $$ClienteTableOrderingComposer
    extends drift.Composer<_$Capanegra, $ClienteTable> {
  $$ClienteTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get nombre => $composableBuilder(
      column: $table.nombre,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$ClienteTableAnnotationComposer
    extends drift.Composer<_$Capanegra, $ClienteTable> {
  $$ClienteTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);
}

class $$ClienteTableTableManager extends drift.RootTableManager<
    _$Capanegra,
    $ClienteTable,
    ClienteData,
    $$ClienteTableFilterComposer,
    $$ClienteTableOrderingComposer,
    $$ClienteTableAnnotationComposer,
    $$ClienteTableCreateCompanionBuilder,
    $$ClienteTableUpdateCompanionBuilder,
    (
      ClienteData,
      drift.BaseReferences<_$Capanegra, $ClienteTable, ClienteData>
    ),
    ClienteData,
    drift.PrefetchHooks Function()> {
  $$ClienteTableTableManager(_$Capanegra db, $ClienteTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClienteTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClienteTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClienteTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<String> nombre = const drift.Value.absent(),
          }) =>
              ClienteCompanion(
            id: id,
            nombre: nombre,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required String nombre,
          }) =>
              ClienteCompanion.insert(
            id: id,
            nombre: nombre,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ClienteTableProcessedTableManager = drift.ProcessedTableManager<
    _$Capanegra,
    $ClienteTable,
    ClienteData,
    $$ClienteTableFilterComposer,
    $$ClienteTableOrderingComposer,
    $$ClienteTableAnnotationComposer,
    $$ClienteTableCreateCompanionBuilder,
    $$ClienteTableUpdateCompanionBuilder,
    (
      ClienteData,
      drift.BaseReferences<_$Capanegra, $ClienteTable, ClienteData>
    ),
    ClienteData,
    drift.PrefetchHooks Function()>;
typedef $$ProductoTableCreateCompanionBuilder = ProductoCompanion Function({
  drift.Value<int> id,
  required String nombre,
  required double precio,
});
typedef $$ProductoTableUpdateCompanionBuilder = ProductoCompanion Function({
  drift.Value<int> id,
  drift.Value<String> nombre,
  drift.Value<double> precio,
});

class $$ProductoTableFilterComposer
    extends drift.Composer<_$Capanegra, $ProductoTable> {
  $$ProductoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<String> get nombre => $composableBuilder(
      column: $table.nombre, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<double> get precio => $composableBuilder(
      column: $table.precio, builder: (column) => drift.ColumnFilters(column));
}

class $$ProductoTableOrderingComposer
    extends drift.Composer<_$Capanegra, $ProductoTable> {
  $$ProductoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<String> get nombre => $composableBuilder(
      column: $table.nombre,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<double> get precio => $composableBuilder(
      column: $table.precio,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$ProductoTableAnnotationComposer
    extends drift.Composer<_$Capanegra, $ProductoTable> {
  $$ProductoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  drift.GeneratedColumn<double> get precio =>
      $composableBuilder(column: $table.precio, builder: (column) => column);
}

class $$ProductoTableTableManager extends drift.RootTableManager<
    _$Capanegra,
    $ProductoTable,
    ProductoData,
    $$ProductoTableFilterComposer,
    $$ProductoTableOrderingComposer,
    $$ProductoTableAnnotationComposer,
    $$ProductoTableCreateCompanionBuilder,
    $$ProductoTableUpdateCompanionBuilder,
    (
      ProductoData,
      drift.BaseReferences<_$Capanegra, $ProductoTable, ProductoData>
    ),
    ProductoData,
    drift.PrefetchHooks Function()> {
  $$ProductoTableTableManager(_$Capanegra db, $ProductoTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductoTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<String> nombre = const drift.Value.absent(),
            drift.Value<double> precio = const drift.Value.absent(),
          }) =>
              ProductoCompanion(
            id: id,
            nombre: nombre,
            precio: precio,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required String nombre,
            required double precio,
          }) =>
              ProductoCompanion.insert(
            id: id,
            nombre: nombre,
            precio: precio,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProductoTableProcessedTableManager = drift.ProcessedTableManager<
    _$Capanegra,
    $ProductoTable,
    ProductoData,
    $$ProductoTableFilterComposer,
    $$ProductoTableOrderingComposer,
    $$ProductoTableAnnotationComposer,
    $$ProductoTableCreateCompanionBuilder,
    $$ProductoTableUpdateCompanionBuilder,
    (
      ProductoData,
      drift.BaseReferences<_$Capanegra, $ProductoTable, ProductoData>
    ),
    ProductoData,
    drift.PrefetchHooks Function()>;
typedef $$ClienteProductoTableCreateCompanionBuilder = ClienteProductoCompanion
    Function({
  drift.Value<int> id,
  required int clienteId,
  required int productoId,
  drift.Value<int> cantidad,
});
typedef $$ClienteProductoTableUpdateCompanionBuilder = ClienteProductoCompanion
    Function({
  drift.Value<int> id,
  drift.Value<int> clienteId,
  drift.Value<int> productoId,
  drift.Value<int> cantidad,
});

class $$ClienteProductoTableFilterComposer
    extends drift.Composer<_$Capanegra, $ClienteProductoTable> {
  $$ClienteProductoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get clienteId => $composableBuilder(
      column: $table.clienteId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get productoId => $composableBuilder(
      column: $table.productoId,
      builder: (column) => drift.ColumnFilters(column));

  drift.ColumnFilters<int> get cantidad => $composableBuilder(
      column: $table.cantidad,
      builder: (column) => drift.ColumnFilters(column));
}

class $$ClienteProductoTableOrderingComposer
    extends drift.Composer<_$Capanegra, $ClienteProductoTable> {
  $$ClienteProductoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get clienteId => $composableBuilder(
      column: $table.clienteId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get productoId => $composableBuilder(
      column: $table.productoId,
      builder: (column) => drift.ColumnOrderings(column));

  drift.ColumnOrderings<int> get cantidad => $composableBuilder(
      column: $table.cantidad,
      builder: (column) => drift.ColumnOrderings(column));
}

class $$ClienteProductoTableAnnotationComposer
    extends drift.Composer<_$Capanegra, $ClienteProductoTable> {
  $$ClienteProductoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<int> get clienteId =>
      $composableBuilder(column: $table.clienteId, builder: (column) => column);

  drift.GeneratedColumn<int> get productoId => $composableBuilder(
      column: $table.productoId, builder: (column) => column);

  drift.GeneratedColumn<int> get cantidad =>
      $composableBuilder(column: $table.cantidad, builder: (column) => column);
}

class $$ClienteProductoTableTableManager extends drift.RootTableManager<
    _$Capanegra,
    $ClienteProductoTable,
    ClienteProductoData,
    $$ClienteProductoTableFilterComposer,
    $$ClienteProductoTableOrderingComposer,
    $$ClienteProductoTableAnnotationComposer,
    $$ClienteProductoTableCreateCompanionBuilder,
    $$ClienteProductoTableUpdateCompanionBuilder,
    (
      ClienteProductoData,
      drift
      .BaseReferences<_$Capanegra, $ClienteProductoTable, ClienteProductoData>
    ),
    ClienteProductoData,
    drift.PrefetchHooks Function()> {
  $$ClienteProductoTableTableManager(
      _$Capanegra db, $ClienteProductoTable table)
      : super(drift.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClienteProductoTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClienteProductoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClienteProductoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            drift.Value<int> clienteId = const drift.Value.absent(),
            drift.Value<int> productoId = const drift.Value.absent(),
            drift.Value<int> cantidad = const drift.Value.absent(),
          }) =>
              ClienteProductoCompanion(
            id: id,
            clienteId: clienteId,
            productoId: productoId,
            cantidad: cantidad,
          ),
          createCompanionCallback: ({
            drift.Value<int> id = const drift.Value.absent(),
            required int clienteId,
            required int productoId,
            drift.Value<int> cantidad = const drift.Value.absent(),
          }) =>
              ClienteProductoCompanion.insert(
            id: id,
            clienteId: clienteId,
            productoId: productoId,
            cantidad: cantidad,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), drift.BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ClienteProductoTableProcessedTableManager
    = drift.ProcessedTableManager<
        _$Capanegra,
        $ClienteProductoTable,
        ClienteProductoData,
        $$ClienteProductoTableFilterComposer,
        $$ClienteProductoTableOrderingComposer,
        $$ClienteProductoTableAnnotationComposer,
        $$ClienteProductoTableCreateCompanionBuilder,
        $$ClienteProductoTableUpdateCompanionBuilder,
        (
          ClienteProductoData,
          drift.BaseReferences<_$Capanegra, $ClienteProductoTable,
              ClienteProductoData>
        ),
        ClienteProductoData,
        drift.PrefetchHooks Function()>;

class $CapanegraManager {
  final _$Capanegra _db;
  $CapanegraManager(this._db);
  $$ClienteTableTableManager get cliente =>
      $$ClienteTableTableManager(_db, _db.cliente);
  $$ProductoTableTableManager get producto =>
      $$ProductoTableTableManager(_db, _db.producto);
  $$ClienteProductoTableTableManager get clienteProducto =>
      $$ClienteProductoTableTableManager(_db, _db.clienteProducto);
}
