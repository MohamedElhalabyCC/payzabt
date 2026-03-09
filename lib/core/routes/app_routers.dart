import 'package:payzabt/features/auth/logic/auth_cubit.dart';
import 'package:payzabt/features/auth/views/forget_password_view.dart';
import 'package:payzabt/features/auth/views/login_view.dart';
import 'package:payzabt/features/auth/views/otp_view.dart';
import 'package:payzabt/features/auth/views/sign_up_view.dart';
import 'package:payzabt/features/budget_management/logic/budget_management_cubit.dart';
import 'package:payzabt/features/budget_management/views/budget_management_view.dart';
import 'package:payzabt/features/onboarding/views/onboarding_view.dart';
import 'package:payzabt/features/splash/splash_view.dart';

import '../../config/export/export.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    dynamic args;
    if (settings.arguments != null) args = settings.arguments;
    switch (settings.name) {
      case AppRoute.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashView());
      case AppRoute.onboardingView:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case AppRoute.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: LoginView(),
          ),
        );
      case AppRoute.signUpView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: SignUpView(),
          ),
        );

      case AppRoute.forgetPasswordView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: ForgetPasswordView(),
          ),
        );

      case AppRoute.oTPView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: OTPView(),
          ),
        );

      case AppRoute.budgetManagementView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<BudgetManagementCubit>(),
            child: BudgetManagementView(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: AppText(text: 'No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
