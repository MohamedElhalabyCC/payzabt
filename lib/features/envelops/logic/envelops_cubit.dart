import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payzabt/core/networking/enums/request_state.dart';
import 'package:payzabt/features/envelops/data/repo/envelops_repo.dart';

part 'envelops_state.dart';

class EnvelopsCubit extends Cubit<EnvelopsState> {
  final EnvelopsRepo _envelopsRepo;
  EnvelopsCubit(this._envelopsRepo) : super(EnvelopsState());

  Future<void> getEnvelopsData() async {
    emit(state.copyWith(state: RequestState.loading));
    final result = await _envelopsRepo.getEnvelopsData();
    result.when(
      failure: (l) => emit(state.copyWith(state: RequestState.error)),
      success: (r) => emit(state.copyWith(state: RequestState.success)),
    );
  }
}