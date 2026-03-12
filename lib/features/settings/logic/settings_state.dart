part of 'settings_cubit.dart';

class SettingsState {
  final RequestState state;

  SettingsState({this.state = RequestState.initial});

  SettingsState copyWith({
    RequestState? state,
  }) {
    return SettingsState(
      state: state ?? this.state,
    );
  }
}
