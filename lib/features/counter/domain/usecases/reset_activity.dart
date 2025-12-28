import 'package:fpdart/fpdart.dart';
import 'package:tasbeeh_app/core/errors/failure.dart';
import 'package:tasbeeh_app/core/usecase/use_case.dart';
import 'package:tasbeeh_app/features/counter/domain/repositories/counter_repository.dart';

class ResetActivity extends UseCase<void, int> {
  final CounterRepository repository;

  ResetActivity(this.repository);

  @override
  Future<Either<Failure, void>> call(int params) {
    return repository.resetActivity(params);
  }
}
