import 'package:payzabt/core/networking/models/success_model.dart';
import 'package:payzabt/core/networking/network/network_call.dart';
import 'package:payzabt/core/networking/network/result.dart';
import 'package:payzabt/features/goals/data/api/goals_api_constants.dart';
import 'package:payzabt/features/goals/data/repo/goals_repo.dart';

class GoalsApiServices extends GoalsRepo {
  @override
  Future<Result<SuccessModel>> getGoalsData() async {
    final data = {
      "per_page": 5,
    };
    return await networkCall<SuccessModel>(
      method: ServerMethods.GET,
      path: GoalsApiConstants.getGoalsData,
      params: data,
      fromJson: (json) => SuccessModel.fromJson(json),
    );
  }
}