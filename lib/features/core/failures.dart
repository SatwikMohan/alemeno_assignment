abstract class Failure{
  final String message;
  Failure({required this.message});
}

class SomeSpecificError extends Failure{
  SomeSpecificError(String message) : super(message: message);
}