import 'package:fpdart/fpdart.dart';
import 'package:tasbeeh_app/core/errors/failure.dart';
import 'package:tasbeeh_app/core/usecase/use_case.dart';
import 'package:tasbeeh_app/features/home/domain/repositories/activity_repository.dart';

class DeleteActivity extends UseCase<void, int> {
  final ActivityRepository activityRepository;

  DeleteActivity(this.activityRepository);

  @override
  Future<Either<Failure, void>> call(int params) {
    return activityRepository.deleteActivity(params);
  }
}
