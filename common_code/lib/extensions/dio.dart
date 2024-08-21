import 'package:dependencies/dependencies.dart';

extension DioExceptionX on DioException {
  String? get errorMsg {
    if (response == null) return message;

    if (response!.data == null) return null;
    if (response!.data is String) return response!.data;

    return response!.data['message'];
  }
}
