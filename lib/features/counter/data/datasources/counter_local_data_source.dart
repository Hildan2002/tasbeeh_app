import 'package:drift/drift.dart';
import 'package:tasbeeh_app/core/database/database.dart';
import 'package:tasbeeh_app/core/errors/exception.dart';

abstract class CounterLocalDataSource {
  Future<void> incrementActivity(int id);
  Future<void> resetActivity(int id);
}

class CounterLocalDataSourceImpl implements CounterLocalDataSource {
  final AppDatabase database;

  CounterLocalDataSourceImpl(this.database);

  @override
  Future<void> incrementActivity(int id) async {
    try {
      final query = database.update(database.activityTable)
        ..where((tbl) => tbl.id.equals(id));

      await query.write(
        ActivityTableCompanion.custom(
          currentValue: database.activityTable.currentValue + const Constant(1),
        ),
      );
    } on DriftWrappedException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw UnexceptedException(e.toString());
    }
  }

  @override
  Future<void> resetActivity(int id) async {
    try {
      final companion = ActivityTableCompanion(currentValue: const Value(0));
      await (database.update(
        database.activityTable,
      )..where((tbl) => tbl.id.equals(id))).write(companion);
    } on DriftWrappedException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw UnexceptedException(e.toString());
    }
  }
}
