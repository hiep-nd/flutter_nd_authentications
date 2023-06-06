import 'package:built_value/built_value.dart';

abstract class NDException implements Exception {
  // NDException
  final String? message;
  final dynamic cause;

  const NDException({this.message, this.cause});

  // Exception
  @override
  String toString() {
    return (newBuiltValueToStringHelper(runtimeType.toString())
          ..add('message', message)
          ..add('cause', cause))
        .toString();
  }
}

abstract class NDGenericException<T> extends NDException {
  const NDGenericException({String? message, T? cause})
      : super(cause: cause, message: message);

  @override
  T? get cause => super.cause as T?;
}
