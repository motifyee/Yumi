import 'package:common_code/util/random_string.dart';
import 'package:common_code/domain/bank_info/data/sources/bank_info_src.dart';
import 'package:common_code/domain/bank_info/entities/bankinfo_model.dart';
import 'package:common_code/common_code.dart';
import 'package:dependencies/dependencies.dart';

class BankInfoRemoteSrc implements BankInfoSrc {
  final APIClient client;
  final Endpoints endpoints;

  BankInfoRemoteSrc({APIClient? client, Endpoints? endpoints})
      : client = client ?? APIClient(),
        endpoints = endpoints ?? Endpoints();

  @override
  Future<String> addBankInfo(BankInfo bankInfo) async {
    try {
      final data = bankInfo.toJson();

      data['code'] = getRandomString(15);
      data.remove('id');

      final res = await client.post(
        '${endpoints.info}/bank',
        data: data,
      );

      String result = res.data as String;
      return result;
    } catch (e) {
      throw e.exceptionFromDio;
    }
  }

  @override
  Future<BankInfo> getBankInfo() async {
    try {
      final res = await client.get(
        '${endpoints.info}/bank',
      );

      final banks = res.data['data'] as List<dynamic>;

      if (banks.isEmpty) return const BankInfo();
      return BankInfo.fromJson(banks.first);
    } catch (e) {
      throw e.exceptionFromDio;
    }
  }

  @override
  Future<String> updateBankInfo(BankInfo bankInfo) async {
    try {
      final data = bankInfo.toJson();

      final res = await client.put(
        '${endpoints.info}/bank/${data['id']}',
        data: data,
      );

      String result = res.data;
      return result;
    } catch (e) {
      throw e.exceptionFromDio;
    }
  }
}
