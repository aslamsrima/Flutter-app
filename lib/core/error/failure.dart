import 'package:equatable/equatable.dart';

/// Base class for all types of failures in the application.
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// Represents a failure related to server communication.
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

/// Represents a failure related to network connectivity.
class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}

/// Represents a failure related to database operations.
class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}
