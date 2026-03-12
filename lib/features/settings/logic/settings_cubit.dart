import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payzabt/core/networking/enums/request_state.dart';
import 'package:payzabt/features/settings/data/repo/settings_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final SettingsRepo _settingsRepo;
  SettingsCubit(this._settingsRepo) : super(SettingsState());

  Future<void> getSettingsData() async {
    emit(state.copyWith(state: RequestState.loading));
    final result = await _settingsRepo.getSettingsData();
    result.when(
      failure: (l) => emit(state.copyWith(state: RequestState.error)),
      success: (r) => emit(state.copyWith(state: RequestState.success)),
    );
  }
}
