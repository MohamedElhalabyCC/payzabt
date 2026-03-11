import 'package:payzabt/core/networking/models/success_model.dart';
import 'package:payzabt/core/networking/network/network_call.dart';
import 'package:payzabt/core/networking/network/result.dart';
import 'package:payzabt/features/envelops/data/api/envelops_api_constants.dart';
import 'package:payzabt/features/envelops/data/repo/envelops_repo.dart';

class EnvelopsApiServices extends EnvelopsRepo {
  @override
  Future<Result<SuccessModel>> getEnvelopsData() async {
    final data = {
      "per_page": 5,
    };
    return await networkCall<SuccessModel>(
      method: ServerMethods.GET,
      path: EnvelopsApiConstants.getEnvelopsData,
      params: data,
      fromJson: (json) => SuccessModel.fromJson(json),
    );
  }
}