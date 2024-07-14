import 'package:common_code/common_code.dart';

class UserStatusService {
  /// params: {status : '{1-ready , 2-busy}'}
  static Future<dynamic> updateStatus({required int status}) async {
    final res = await APIClient().put(
      EndPoints.userStatus,
      queryParameters: {'status': status},
    );
    return res;
  }
}
