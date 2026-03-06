import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payzabt/core/networking/enums/request_state.dart';
import 'package:payzabt/features/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(AuthState());

  void changeValues({bool? isPasswordHidden, bool? sendEmailIsDone}) {
    emit(
      state.copyWith(
        isPasswordHidden: isPasswordHidden ?? state.isPasswordHidden,
        sendEmailIsDone: sendEmailIsDone ?? state.sendEmailIsDone,
      ),
    );
  }

  Future<void> getAuthData() async {
    emit(state.copyWith(state: RequestState.loading));
    final result = await _authRepo.getAuthData();
    result.when(
      failure: (l) => emit(state.copyWith(state: RequestState.error)),
      success: (r) => emit(state.copyWith(state: RequestState.success)),
    );
  }
}
