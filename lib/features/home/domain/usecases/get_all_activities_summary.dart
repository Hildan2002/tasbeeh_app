import 'package:fpdart/fpdart.dart';
import 'package:tasbeeh_app/core/errors/failure.dart';
import 'package:tasbeeh_app/core/usecase/use_case.dart';
import 'package:tasbeeh_app/features/home/domain/entities/activity_summary.dart';
import 'package:tasbeeh_app/features/home/domain/repositories/activity_repository.dart';

class GetAllActivitiesSummary extends UseCase<List<ActivitySummary>, NoParams> {
  final ActivityRepository repository;

  GetAllActivitiesSummary(this.repository);

  @override
  Future<Either<Failure, List<ActivitySummary>>> call(NoParams params) {
    return repository.getAllActivitiesSummary();
  }
}
