import 'package:payzabt/core/networking/models/success_model.dart';
import 'package:payzabt/core/networking/network/network_call.dart';
import 'package:payzabt/core/networking/network/result.dart';
import 'package:payzabt/features/savings/data/api/savings_api_constants.dart';
import 'package:payzabt/features/savings/data/repo/savings_repo.dart';

class SavingsApiServices extends SavingsRepo {
  @override
  Future<Result<SuccessModel>> getSavingsData() async {
    final data = {
      "per_page": 5,
    };
    return await networkCall<SuccessModel>(
      method: ServerMethods.GET,
      path: SavingsApiConstants.getSavingsData,
      params: data,
      fromJson: (json) => SuccessModel.fromJson(json),
    );
  }
}