import 'package:fpdart/fpdart.dart';
import 'package:tasbeeh_app/core/errors/exception.dart';
import 'package:tasbeeh_app/core/errors/failure.dart';
import 'package:tasbeeh_app/features/counter/data/datasources/counter_local_data_source.dart';
import 'package:tasbeeh_app/features/counter/domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  final CounterLocalDataSource localDataSource;

  CounterRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, void>> incrementActivity(int id) async {
    try {
      final result = await localDataSource.incrementActivity(id);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(UnexceptedFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resetActivity(int id) async {
    try {
      final result = await localDataSource.resetActivity(id);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(UnexceptedFailure(e.toString()));
    }
  }
}
