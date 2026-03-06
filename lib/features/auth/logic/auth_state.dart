part of 'auth_cubit.dart';

class AuthState {
  final RequestState state;

  AuthState({this.state = RequestState.initial});

  AuthState copyWith({
    RequestState? state,
  }) {
    return AuthState(
      state: state ?? this.state,
    );
  }
}
