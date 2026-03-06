import 'package:payzabt/core/networking/models/success_model.dart';
import 'package:payzabt/core/networking/network/network_call.dart';
import 'package:payzabt/core/networking/network/result.dart';
import 'package:payzabt/features/auth/data/api/auth_api_constants.dart';
import 'package:payzabt/features/auth/data/repo/auth_repo.dart';

class AuthApiServices extends AuthRepo {
  @override
  Future<Result<SuccessModel>> getAuthData() async {
    final data = {
      "per_page": 5,
    };
    return await networkCall<SuccessModel>(
      method: ServerMethods.GET,
      path: AuthApiConstants.getAuthData,
      params: data,
      fromJson: (json) => SuccessModel.fromJson(json),
    );
  }
}