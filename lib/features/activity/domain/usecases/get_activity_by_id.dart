import 'package:fpdart/fpdart.dart';
import 'package:tasbeeh_app/core/errors/failure.dart';
import 'package:tasbeeh_app/core/usecase/use_case.dart';
import 'package:tasbeeh_app/features/activity/domain/entities/activity.dart';
import 'package:tasbeeh_app/features/activity/domain/repositories/activity_repository.dart';

class GetActivityById extends UseCase<Activity, int> {
  final ActivityRepository activityRepository;

  GetActivityById(this.activityRepository);

  @override
  Future<Either<Failure, Activity>> call(int params) {
    return activityRepository.getActivityById(params);
  }
}
