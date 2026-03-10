import 'package:payzabt/core/networking/models/success_model.dart';
import 'package:payzabt/core/networking/network/network_call.dart';
import 'package:payzabt/core/networking/network/result.dart';
import 'package:payzabt/features/home/data/api/home_api_constants.dart';
import 'package:payzabt/features/home/data/repo/home_repo.dart';

class HomeApiServices extends HomeRepo {
  @override
  Future<Result<SuccessModel>> getHomeData() async {
    final data = {
      "per_page": 5,
    };
    return await networkCall<SuccessModel>(
      method: ServerMethods.GET,
      path: HomeApiConstants.getHomeData,
      params: data,
      fromJson: (json) => SuccessModel.fromJson(json),
    );
  }
}