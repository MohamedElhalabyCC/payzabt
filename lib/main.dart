import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/core/app/payzabt.dart';

import 'config/export/export.dart';
import 'core/app/main_inits.dart';

void main() async {
  AppConfig.init(environment: AppConfig.getEnvironmentFromArgs());
  await mainInits();

  runApp(
    EasyLocalization(
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      saveLocale: true,
      child: Payzabt(appRouter: AppRouter()),
    ),
  );
}
