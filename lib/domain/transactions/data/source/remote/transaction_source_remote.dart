import 'package:dio/dio.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/domain/transactions/data/source/transaction_source.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/extensions/unique_list_extension.dart';
import 'package:common_code/common_code.dart';

class TransactionSourceRemote implements TransactionSource {
  @override
  Future<PaginatedData<Transaction>> getAllTransactions({
    required PaginatedData<Transaction> pagination,
    required String userId,
  }) async {
    final Response res = await APIClient().get(EndPoints.transactions,
        queryParameters: {
          'chefId': AppTarget.user == YumiApp.chefs ? userId : null,
          'driverId': AppTarget.user == YumiApp.drivers ? userId : null,
          'customerId': AppTarget.user == YumiApp.customers ? userId : null,
          'dateFrom': '0001-01-01T00:00:00.000',
          'dateTo': DateTime.now().toIso8601String(),
          ...pagination.toJson(),
        }..removeWhere((key, value) => value == null));

    List<Transaction> transaction = res.data['data']
        .map<Transaction>((json) => Transaction.fromJson(json))
        .toList();

    return pagination.copyWith(
      data: [...(pagination.data as List<Transaction>), ...transaction]
          .unique((e) => e.guid),
      isLoading: false,
      pageNumber: res.data['pagination']['page'],
      lastPage: res.data['pagination']['pages'],
    ) as PaginatedData<Transaction>;
  }
}
