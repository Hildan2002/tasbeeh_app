import 'package:equatable/equatable.dart';

abstract class AppException extends Equatable implements Exception {
  final String message;

  const AppException(this.message);

  @override
  List<Object?> get props => [message];
}

class DatabaseException extends AppException {
  const DatabaseException(super.message);
}

class UnexceptedException extends AppException {
  const UnexceptedException(super.message);
}
