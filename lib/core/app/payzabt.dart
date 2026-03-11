import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/core/theme/theme.dart';

import '../../config/export/export.dart';

class Payzabt extends StatelessWidget {
  final AppRouter appRouter;

  const Payzabt({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder: (context, child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MultiBlocProvider(
          providers: [BlocProvider(create: (_) => getIt<AppCubit>())],
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return MaterialApp(
                title: AppConfig.instance.appName,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,

                themeAnimationDuration: const Duration(milliseconds: 700),
                themeAnimationCurve: Curves.easeInOutCubic,
                // navigatorObservers: [ChuckerFlutter.navigatorObserver],
                // home: GuideView(),
                initialRoute: AppRoute.splashScreen,
                onGenerateRoute: AppRouter.onGenerateRoute,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: context.read<AppCubit>().themeMode,
                builder: BotToastInit(),
                navigatorKey: navigatorKey,
              );
            },
          ),
        ),
      ),
    );
  }
}
