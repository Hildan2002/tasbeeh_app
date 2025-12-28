import 'package:fpdart/fpdart.dart';
import 'package:tasbeeh_app/core/errors/exception.dart';
import 'package:tasbeeh_app/core/errors/failure.dart';
import 'package:tasbeeh_app/features/activity/data/datasources/activity_local_data_source.dart';
import 'package:tasbeeh_app/features/activity/data/models/activity_model.dart';
import 'package:tasbeeh_app/features/activity/domain/entities/activity.dart';
import 'package:tasbeeh_app/features/activity/domain/entities/activity_summary.dart';
import 'package:tasbeeh_app/features/activity/domain/repositories/activity_repository.dart';

class ActivityRepositoryImpl implements ActivityRepository {
  final ActivityLocalDataSource localDataSource;

  ActivityRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, List<Activity>>> getAllActivities() async {
    try {
      final result = await localDataSource.getAllActivities();
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } on UnexceptedException catch (e) {
      return Left(UnexceptedFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<ActivitySummary>>>
  getAllActivitiesSummary() async {
    try {
      final result = await localDataSource.getAllActivitiesSummary();
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } on UnexceptedException catch (e) {
      return Left(UnexceptedFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Activity>> getActivityById(int id) async {
    try {
      final result = await localDataSource.getActivityById(id);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } on UnexceptedException catch (e) {
      return Left(UnexceptedFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> addActivity(Activity activity) async {
    try {
      final activityModel = ActivityModel(
        id: activity.id,
        title: activity.title,
        currentValue: activity.currentValue,
        reminder: activity.reminder,
        targetValue: activity.targetValue,
        note: activity.note,
      );
      await localDataSource.addActivity(activityModel);
      return const Right(null);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } on UnexceptedException catch (e) {
      return Left(UnexceptedFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateActivity(Activity activity) async {
    try {
      final activityModel = ActivityModel(
        id: activity.id,
        title: activity.title,
        currentValue: activity.currentValue,
        reminder: activity.reminder,
        targetValue: activity.targetValue,
        note: activity.note,
      );
      await localDataSource.updateActivity(activityModel);
      return const Right(null);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } on UnexceptedException catch (e) {
      return Left(UnexceptedFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteActivity(int id) async {
    try {
      await localDataSource.deleteActivity(id);
      return const Right(null);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } on UnexceptedException catch (e) {
      return Left(UnexceptedFailure(e.message));
    }
  }
}
