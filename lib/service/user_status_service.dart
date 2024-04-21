import 'package:yumi/statics/api_statics.dart';

class UserStatusService {
  /// params: {status : '{1-ready , 2-busy}'}
  static Future<dynamic> updateStatus({required int status}) async {
    final res = await DioClient.simpleDio().put(
      ApiKeys.userStatus,
      queryParameters: {'status': status},
    );
    return res;
  }
}
