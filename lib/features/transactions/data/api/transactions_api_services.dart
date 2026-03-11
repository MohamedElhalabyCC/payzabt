import 'package:payzabt/core/networking/models/success_model.dart';
import 'package:payzabt/core/networking/network/network_call.dart';
import 'package:payzabt/core/networking/network/result.dart';
import 'package:payzabt/features/transactions/data/api/transactions_api_constants.dart';
import 'package:payzabt/features/transactions/data/repo/transactions_repo.dart';

class TransactionsApiServices extends TransactionsRepo {
  @override
  Future<Result<SuccessModel>> getTransactionsData() async {
    final data = {
      "per_page": 5,
    };
    return await networkCall<SuccessModel>(
      method: ServerMethods.GET,
      path: TransactionsApiConstants.getTransactionsData,
      params: data,
      fromJson: (json) => SuccessModel.fromJson(json),
    );
  }
}