import 'package:fpdart/fpdart.dart';
import 'package:tasbeeh_app/core/errors/failure.dart';
import 'package:tasbeeh_app/core/usecase/use_case.dart';
import 'package:tasbeeh_app/features/activity/domain/entities/activity.dart';
import 'package:tasbeeh_app/features/activity/domain/repositories/activity_repository.dart';

class AddActivity extends UseCase<void, Activity> {
  final ActivityRepository activityRepository;

  AddActivity(this.activityRepository);

  @override
  Future<Either<Failure, void>> call(Activity params) {
    return activityRepository.addActivity(params);
  }
}
