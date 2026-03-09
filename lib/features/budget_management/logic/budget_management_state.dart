part of 'budget_management_cubit.dart';

class BudgetManagementState {
  final RequestState state;

  BudgetManagementState({this.state = RequestState.initial});

  BudgetManagementState copyWith({
    RequestState? state,
  }) {
    return BudgetManagementState(
      state: state ?? this.state,
    );
  }
}
