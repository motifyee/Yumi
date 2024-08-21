import 'package:common_code/util/random_string.dart';
import 'package:dio/dio.dart';
import 'package:common_code/domain/bank_info/data/sources/bank_info_src.dart';
import 'package:common_code/domain/bank_info/entities/bankinfo_model.dart';
import 'package:common_code/common_code.dart';

class BankInfoRemoteSrc implements BankInfoSrc {
  @override
  Future<String> addBankInfo(BankInfo bankInfo) async {
    try {
      final data = bankInfo.toJson();

      data['code'] = getRandomString(15);
      data.remove('id');

      final res = await APIClient().post(
        '${Endpoints().info}/bank',
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
      final res = await APIClient().get(
        '${Endpoints().info}/bank',
      );

      final banks = res.data['data'] as List<dynamic>;
      if (banks.isEmpty) return const BankInfo();
      return BankInfo.fromJson(banks.first);
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }

  @override
  Future<String> updateBankInfo(BankInfo bankInfo) async {
    try {
      final data = bankInfo.toJson();

      final res = await APIClient().put(
        '${Endpoints().info}/bank/${data['id']}',
        data: data,
      );

      return res.data;
    } catch (e) {
      throw ServerException(e as DioException);
    }
  }
}
