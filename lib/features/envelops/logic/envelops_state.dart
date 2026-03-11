part of 'envelops_cubit.dart';

class EnvelopsState {
  final RequestState state;

  EnvelopsState({this.state = RequestState.initial});

  EnvelopsState copyWith({
    RequestState? state,
  }) {
    return EnvelopsState(
      state: state ?? this.state,
    );
  }
}
