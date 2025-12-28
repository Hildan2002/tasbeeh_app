import 'package:fpdart/fpdart.dart';
import 'package:tasbeeh_app/core/errors/failure.dart';
import 'package:tasbeeh_app/features/activity/domain/entities/activity.dart';
import 'package:tasbeeh_app/features/activity/domain/entities/activity_summary.dart';

abstract class ActivityRepository {
  Future<Either<Failure, List<Activity>>> getAllActivities();
  Future<Either<Failure, List<ActivitySummary>>> getAllActivitiesSummary();
  Future<Either<Failure, Activity>> getActivityById(int id);
  Future<Either<Failure, void>> addActivity(Activity activity);
  Future<Either<Failure, void>> updateActivity(Activity activity);
  Future<Either<Failure, void>> deleteActivity(int id);
}
