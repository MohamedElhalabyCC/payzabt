import 'package:payzabt/core/networking/models/success_model.dart';
import 'package:payzabt/core/networking/network/network_call.dart';
import 'package:payzabt/core/networking/network/result.dart';
import 'package:payzabt/features/settings/data/api/settings_api_constants.dart';
import 'package:payzabt/features/settings/data/repo/settings_repo.dart';

class SettingsApiServices extends SettingsRepo {
  @override
  Future<Result<SuccessModel>> getSettingsData() async {
    final data = {
      "per_page": 5,
    };
    return await networkCall<SuccessModel>(
      method: ServerMethods.GET,
      path: SettingsApiConstants.getSettingsData,
      params: data,
      fromJson: (json) => SuccessModel.fromJson(json),
    );
  }
}