import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  final String message;

  Failure(this.message);

  @override
  String toString() {
    return message;
  }

  @override
  List<Object?> get props => [message];
}

class NoFileSelectedFailure extends Failure{
  NoFileSelectedFailure() : super("No file was selected");
}