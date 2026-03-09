import 'package:payzabt/core/networking/models/success_model.dart';
import 'package:payzabt/core/networking/network/network_call.dart';
import 'package:payzabt/core/networking/network/result.dart';
import 'package:payzabt/features/budget_management/data/api/budget_management_api_constants.dart';
import 'package:payzabt/features/budget_management/data/repo/budget_management_repo.dart';

class BudgetManagementApiServices extends BudgetManagementRepo {
  @override
  Future<Result<SuccessModel>> getBudgetManagementData() async {
    final data = {
      "per_page": 5,
    };
    return await networkCall<SuccessModel>(
      method: ServerMethods.GET,
      path: BudgetManagementApiConstants.getBudgetManagementData,
      params: data,
      fromJson: (json) => SuccessModel.fromJson(json),
    );
  }
}