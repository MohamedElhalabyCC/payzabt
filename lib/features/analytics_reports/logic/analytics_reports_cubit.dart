import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payzabt/core/networking/enums/request_state.dart';
import 'package:payzabt/features/analytics_reports/data/repo/analytics_reports_repo.dart';

part 'analytics_reports_state.dart';

class AnalyticsReportsCubit extends Cubit<AnalyticsReportsState> {
  final AnalyticsReportsRepo _analyticsReportsRepo;
  AnalyticsReportsCubit(this._analyticsReportsRepo) : super(AnalyticsReportsState());

  Future<void> getAnalyticsReportsData() async {
    emit(state.copyWith(state: RequestState.loading));
    final result = await _analyticsReportsRepo.getAnalyticsReportsData();
    result.when(
      failure: (l) => emit(state.copyWith(state: RequestState.error)),
      success: (r) => emit(state.copyWith(state: RequestState.success)),
    );
  }
}
