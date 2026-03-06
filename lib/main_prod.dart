import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/core/app/payzabt.dart';

import 'config/export/export.dart';
import 'core/app/main_inits.dart';

void main() async {
  AppConfig.init(environment: Environment.prod);

  await mainInits();

  runApp(
    EasyLocalization(
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      saveLocale: true,
      child: Payzabt(appRouter: AppRouter()),
    ),
  );
}