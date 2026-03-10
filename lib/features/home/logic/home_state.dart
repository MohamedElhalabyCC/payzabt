part of 'home_cubit.dart';

class HomeState {
  final RequestState state;

  HomeState({this.state = RequestState.initial});

  HomeState copyWith({
    RequestState? state,
  }) {
    return HomeState(
      state: state ?? this.state,
    );
  }
}
