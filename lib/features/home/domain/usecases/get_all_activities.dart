import 'package:fpdart/fpdart.dart';
import 'package:tasbeeh_app/core/errors/failure.dart';
import 'package:tasbeeh_app/core/usecase/use_case.dart';
import 'package:tasbeeh_app/features/home/domain/entities/activity.dart';
import 'package:tasbeeh_app/features/home/domain/repositories/activity_repository.dart';

class GetAllActivities extends UseCase<List<Activity>, NoParams> {
  final ActivityRepository activityRepository;

  GetAllActivities(this.activityRepository);

  @override
  Future<Either<Failure, List<Activity>>> call(NoParams params) {
    return activityRepository.getAllActivities();
  }
}
