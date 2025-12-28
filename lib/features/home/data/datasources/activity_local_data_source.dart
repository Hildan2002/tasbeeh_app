import 'package:drift/drift.dart';
import 'package:tasbeeh_app/core/database/database.dart';
import 'package:tasbeeh_app/core/errors/exception.dart';
import 'package:tasbeeh_app/features/home/data/models/activity_model.dart';
import 'package:tasbeeh_app/features/home/data/models/activity_summary_model.dart';

abstract class ActivityLocalDataSource {
  Future<List<ActivityModel>> getAllActivities();
  Future<List<ActivitySummaryModel>> getAllActivitiesSummary();
  Future<ActivityModel> getActivityById(int id);
  Future<void> addActivity(ActivityModel activity);
  Future<void> updateActivity(ActivityModel activity);
  Future<void> incrementActivity(int id);
  Future<void> resetActivity(int id);
  Future<void> deleteActivity(int id);
}

class ActivityLocalDataSourceImpl implements ActivityLocalDataSource {
  final AppDatabase database;

  ActivityLocalDataSourceImpl(this.database);

  @override
  Future<List<ActivityModel>> getAllActivities() async {
    try {
      final result = await database.select(database.activityTable).get();
      return result
          .map(
            (e) => ActivityModel(
              id: e.id,
              title: e.title,
              currentValue: e.currentValue,
              reminder: e.reminder,
              targetValue: e.targetValue,
              note: e.note,
            ),
          )
          .toList();
    } on DriftWrappedException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw UnexceptedException(e.toString());
    }
  }

  @override
  Future<List<ActivitySummaryModel>> getAllActivitiesSummary() async {
    try {
      final query = database.selectOnly(database.activityTable)
        ..addColumns([database.activityTable.id, database.activityTable.title]);

      final result = await query.get();

      return result.map((row) {
        return ActivitySummaryModel(
          id: row.read(database.activityTable.id)!,
          title: row.read(database.activityTable.title)!,
        );
      }).toList();
    } on DriftWrappedException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw UnexceptedException(e.toString());
    }
  }

  @override
  Future<ActivityModel> getActivityById(int id) async {
    try {
      final result = await (database.select(
        database.activityTable,
      )..where((tbl) => tbl.id.equals(id))).getSingle();

      return ActivityModel(
        id: result.id,
        title: result.title,
        currentValue: result.currentValue,
        reminder: result.reminder,
        targetValue: result.targetValue,
        note: result.note,
      );
    } on DriftWrappedException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw UnexceptedException(e.toString());
    }
  }

  @override
  Future<void> addActivity(ActivityModel activity) async {
    try {
      final companion = ActivityTableCompanion.insert(
        title: activity.title,
        currentValue: activity.currentValue,
        reminder: Value(activity.reminder),
        targetValue: Value(activity.targetValue),
        note: Value(activity.note),
      );
      await database.into(database.activityTable).insert(companion);
    } on DriftWrappedException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw UnexceptedException(e.toString());
    }
  }

  @override
  Future<void> updateActivity(ActivityModel activity) async {
    try {
      if (activity.id == null) {
        throw const DatabaseException("Activity ID cannot be null for update");
      }
      final companion = ActivityTableCompanion(
        id: Value(activity.id!),
        title: Value(activity.title),
        currentValue: Value(activity.currentValue),
        reminder: Value(activity.reminder),
        targetValue: Value(activity.targetValue),
        note: Value(activity.note),
      );
      await database.update(database.activityTable).replace(companion);
    } on DriftWrappedException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw UnexceptedException(e.toString());
    }
  }

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

  @override
  Future<void> deleteActivity(int id) async {
    try {
      await (database.delete(
        database.activityTable,
      )..where((tbl) => tbl.id.equals(id))).go();
    } on DriftWrappedException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      throw UnexceptedException(e.toString());
    }
  }
}
