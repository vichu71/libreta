//import 'package:drift/drift.dart';
import 'package:drift/drift.dart' as drift;


class Cliente extends drift.Table {
  drift.IntColumn get id => integer().autoIncrement()();
  drift.TextColumn get nombre => text().withLength(min: 1, max: 50)();
}
