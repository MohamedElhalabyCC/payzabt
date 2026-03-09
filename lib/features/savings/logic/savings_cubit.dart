import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payzabt/core/networking/enums/request_state.dart';
import 'package:payzabt/features/savings/data/repo/savings_repo.dart';

part 'savings_state.dart';

class SavingsCubit extends Cubit<SavingsState> {
  final SavingsRepo _savingsRepo;
  SavingsCubit(this._savingsRepo) : super(SavingsState());

  Future<void> getSavingsData() async {
    emit(state.copyWith(state: RequestState.loading));
    final result = await _savingsRepo.getSavingsData();
    result.when(
      failure: (l) => emit(state.copyWith(state: RequestState.error)),
      success: (r) => emit(state.copyWith(state: RequestState.success)),
    );
  }
}
