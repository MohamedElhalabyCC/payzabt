import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payzabt/core/networking/enums/request_state.dart';
import 'package:payzabt/features/goals/data/repo/goals_repo.dart';

part 'goals_state.dart';

class GoalsCubit extends Cubit<GoalsState> {
  final GoalsRepo _goalsRepo;
  GoalsCubit(this._goalsRepo) : super(GoalsState());

  Future<void> getGoalsData() async {
    emit(state.copyWith(state: RequestState.loading));
    final result = await _goalsRepo.getGoalsData();
    result.when(
      failure: (l) => emit(state.copyWith(state: RequestState.error)),
      success: (r) => emit(state.copyWith(state: RequestState.success)),
    );
  }
}
