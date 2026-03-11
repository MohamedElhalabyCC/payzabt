import 'package:payzabt/core/networking/models/success_model.dart';
import 'package:payzabt/core/networking/network/result.dart';

abstract class TransactionsRepo {
  //! ----------------------------- POST REQUESTS -----------------------------

  // Future<Result<AuthModel>> login({
  //   required String mobile,
  //   required String mobileCode,
  //   required String password,
  // });

  //! ----------------------------- GET REQUESTS -----------------------------
  Future<Result<SuccessModel>> getTransactionsData();

  // Future<Result<SuccessModel>> checkCompanyUser(
  //     String companyCode, String username);

  // Future<Result<SuccessModel>> companyConfiguration(String companyCode);
}