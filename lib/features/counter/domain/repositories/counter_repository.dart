import 'package:fpdart/fpdart.dart';
import 'package:tasbeeh_app/core/errors/failure.dart';

abstract class CounterRepository {
  Future<Either<Failure, void>> incrementActivity(int id);
  Future<Either<Failure, void>> resetActivity(int id);
}
