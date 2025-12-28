import 'package:fpdart/fpdart.dart';
import 'package:tasbeeh_app/core/errors/failure.dart';
import 'package:tasbeeh_app/core/usecase/use_case.dart';
import 'package:tasbeeh_app/features/home/domain/entities/activity.dart';
import 'package:tasbeeh_app/features/home/domain/repositories/activity_repository.dart';

class UpdateActivity extends UseCase<void, Activity> {
  final ActivityRepository activityRepository;

  UpdateActivity(this.activityRepository);

  @override
  Future<Either<Failure, void>> call(Activity params) {
    return activityRepository.updateActivity(params);
  }
}
