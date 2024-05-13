import 'package:dio/dio.dart';
import 'package:yumi/app_target.dart';
import 'package:yumi/domain/transactions/data/source/transaction_source.dart';
import 'package:yumi/domain/transactions/entity/transaction.dart';
import 'package:yumi/extensions/unique_list_extension.dart';
import 'package:yumi/statics/api_statics.dart';
import 'package:yumi/statics/pagination_helper.dart';

class TransactionSourceRemote implements TransactionSource {
  @override
  Future<PaginationHelper<Transaction>> getAllTransactions({
    required PaginationHelper<Transaction> paginationHelper,
    required String userId,
  }) async {
    final Response res = await DioClient.simpleDio().get(ApiKeys.transactions,
        queryParameters: {
          'chefId': AppTarget.user == AppTargetUser.chefs ? userId : null,
          'driverId': AppTarget.user == AppTargetUser.drivers ? userId : null,
          'customerId':
              AppTarget.user == AppTargetUser.customers ? userId : null,
          'dateFrom': '0001-01-01T00:00:00.000',
          'dateTo': DateTime.now().toIso8601String(),
          ...paginationHelper.toJson(),
        }..removeWhere((key, value) => value == null));

    List<Transaction> transaction = res.data['data']
        .map<Transaction>((json) => Transaction.fromJson(json))
        .toList();

    return paginationHelper.copyWith(
      data: [...(paginationHelper.data as List<Transaction>), ...transaction]
          .unique((e) => e.guid),
      isLoading: false,
      pageNumber: res.data['pagination']['page'],
      lastPage: res.data['pagination']['pages'],
    ) as PaginationHelper<Transaction>;
  }
}
