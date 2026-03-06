part of 'auth_cubit.dart';

class AuthState {
  final RequestState state;
  final bool isPasswordHidden, rememberMe, sendEmailIsDone;

  AuthState({
    this.state = RequestState.initial,
    this.isPasswordHidden = true,
    this.rememberMe = false,
    this.sendEmailIsDone = false,
  });

  AuthState copyWith({
    RequestState? state,
    bool? isPasswordHidden,
    bool? rememberMe,
    bool? sendEmailIsDone,
  }) {
    return AuthState(
      state: state ?? this.state,
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
      rememberMe: rememberMe ?? this.rememberMe,
      sendEmailIsDone: sendEmailIsDone ?? this.sendEmailIsDone,
    );
  }
}
