part of 'goals_cubit.dart';

class GoalsState {
  final RequestState state;

  GoalsState({this.state = RequestState.initial});

  GoalsState copyWith({
    RequestState? state,
  }) {
    return GoalsState(
      state: state ?? this.state,
    );
  }
}
