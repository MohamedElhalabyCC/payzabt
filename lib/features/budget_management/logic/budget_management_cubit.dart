import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payzabt/core/networking/enums/request_state.dart';
import 'package:payzabt/features/budget_management/data/repo/budget_management_repo.dart';

part 'budget_management_state.dart';

class BudgetManagementCubit extends Cubit<BudgetManagementState> {
  final BudgetManagementRepo _budgetManagementRepo;
  BudgetManagementCubit(this._budgetManagementRepo) : super(BudgetManagementState());

  Future<void> getBudgetManagementData() async {
    emit(state.copyWith(state: RequestState.loading));
    final result = await _budgetManagementRepo.getBudgetManagementData();
    result.when(
      failure: (l) => emit(state.copyWith(state: RequestState.error)),
      success: (r) => emit(state.copyWith(state: RequestState.success)),
    );
  }
}
