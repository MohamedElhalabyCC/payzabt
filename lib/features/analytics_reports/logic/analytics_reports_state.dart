part of 'analytics_reports_cubit.dart';

class AnalyticsReportsState {
  final RequestState state;

  AnalyticsReportsState({this.state = RequestState.initial});

  AnalyticsReportsState copyWith({
    RequestState? state,
  }) {
    return AnalyticsReportsState(
      state: state ?? this.state,
    );
  }
}
