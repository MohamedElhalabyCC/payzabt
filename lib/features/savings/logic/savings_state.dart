part of 'savings_cubit.dart';

class SavingsState {
  final RequestState state;

  SavingsState({this.state = RequestState.initial});

  SavingsState copyWith({
    RequestState? state,
  }) {
    return SavingsState(
      state: state ?? this.state,
    );
  }
}
