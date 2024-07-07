import 'package:dio/dio.dart';
import 'package:yumi/core/exceptions.dart';
import 'package:yumi/domain/bank_info/data/sources/bank_info_src.dart';
import 'package:yumi/domain/bank_info/entities/bankinfo_model.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/util/random_string.dart';

class BankInfoRemoteSrc implements BankInfoSrc {
  @override
  Future<String> addBankInfo(BankInfo bankInfo) async {
    try {
      final data = bankInfo.toJson();

      data['code'] = getRandomString(15);
      data.remove('id');

      final res = await DioClient.simpleDio().post(
        '${ApiKeys.getApiKeyString(apiKey: ApiKeys.info)}/bank',
        data: data,
      );

      return res.data;
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }

  @override
  Future<BankInfo> getBankInfo() async {
    try {
      final res = await DioClient.simpleDio().get(
        '${ApiKeys.getApiKeyString(apiKey: ApiKeys.info)}/bank',
      );

      final banks = res.data['data'] as List<dynamic>;
      return BankInfo.fromJson(banks.first);
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }

  @override
  Future<String> updateBankInfo(BankInfo bankInfo) async {
    try {
      final data = bankInfo.toJson();

      final res = await DioClient.simpleDio().put(
        '${ApiKeys.getApiKeyString(apiKey: ApiKeys.info)}/bank/${data['id']}',
        data: data,
      );

      return res.data;
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }
}
