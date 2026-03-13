import 'package:payzabt/core/networking/models/success_model.dart';
import 'package:payzabt/core/networking/network/network_call.dart';
import 'package:payzabt/core/networking/network/result.dart';
import 'package:payzabt/features/analytics_reports/data/api/analytics_reports_api_constants.dart';
import 'package:payzabt/features/analytics_reports/data/repo/analytics_reports_repo.dart';

class AnalyticsReportsApiServices extends AnalyticsReportsRepo {
  @override
  Future<Result<SuccessModel>> getAnalyticsReportsData() async {
    final data = {
      "per_page": 5,
    };
    return await networkCall<SuccessModel>(
      method: ServerMethods.GET,
      path: AnalyticsReportsApiConstants.getAnalyticsReportsData,
      params: data,
      fromJson: (json) => SuccessModel.fromJson(json),
    );
  }
}