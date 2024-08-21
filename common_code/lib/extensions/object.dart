import 'package:common_code/common_code.dart';
import 'package:dependencies/dependencies.dart';

extension ObjectX on Object {
  CException get exceptionFromDio {
    if (this is! DioException) return GenericException(toString());

    var exception = this as DioException;

    if (exception.response == null) return NetworkException();
    return ServerException(exception);
  }
}
