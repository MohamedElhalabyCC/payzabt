import 'package:payzabt/features/analytics_reports/views/month_review_view.dart';
import 'package:payzabt/features/auth/views/forget_password_view.dart';
import 'package:payzabt/features/auth/views/login_view.dart';
import 'package:payzabt/features/auth/views/otp_view.dart';
import 'package:payzabt/features/auth/views/sign_up_view.dart';
import 'package:payzabt/features/bottom_nav_bar/bottom_nav_bar_view.dart';
import 'package:payzabt/features/budget_management/views/budget_management_view.dart';
import 'package:payzabt/features/envelops/views/edit_envelop_view.dart';
import 'package:payzabt/features/goals/logic/goals_cubit.dart';
import 'package:payzabt/features/notifications/views/notifications_view.dart';
import 'package:payzabt/features/onboarding/views/onboarding_view.dart';
import 'package:payzabt/features/profile/views/edit_profile_view.dart';
import 'package:payzabt/features/profile/views/profile_view.dart';
import 'package:payzabt/features/savings/views/savings_view.dart';
import 'package:payzabt/features/splash/splash_view.dart';
import 'package:payzabt/features/transactions/views/add_transactions_view.dart';
import 'package:payzabt/features/transactions/views/transactions_view.dart';

import '../../config/export/export.dart';
import '../../features/analytics_reports/views/insights_view.dart';
import '../../features/analytics_reports/views/rollover_view.dart';
import '../../features/goals/views/goal_details_view.dart';
import '../../features/settings/views/help_center_view.dart';
import '../../features/settings/views/privacy_view.dart';

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

      case AppRoute.savingsView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SavingsCubit>(),
            child: SavingsView(),
          ),
        );

      case AppRoute.transactionsView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<TransactionsCubit>(),
            child: TransactionsView(),
          ),
        );

      case AppRoute.addTransactionScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<TransactionsCubit>(),
            child: AddTransactionScreen(),
          ),
        );

      case AppRoute.editEnvelopScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<EnvelopsCubit>(),
            child: EditEnvelopScreen(),
          ),
        );

      case AppRoute.goalDetailsView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<GoalsCubit>(),
            child: GoalDetailsView(
              title: args[0],
              budget: args[1],
              saved: args[2],
              currency: args[3],
            ),
          ),
        );
      case AppRoute.notificationsView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<NotificationsCubit>(),
            child: NotificationsView(),
          ),
        );

      case AppRoute.profileView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: ProfileView(),
          ),
        );

      case AppRoute.editProfileView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ProfileCubit>(),
            child: EditProfileView(),
          ),
        );

      case AppRoute.fAQScreen:
        return MaterialPageRoute(
          builder: (_) => FAQScreen(),
        );

      case AppRoute.monthReviewScreen:
        return MaterialPageRoute(
          builder: (_) => MonthReviewScreen(),
        );

      case AppRoute.rolloverCompleteScreen:
        return MaterialPageRoute(
          builder: (_) => RolloverCompleteScreen(),
        );

      case AppRoute.privacyScreen:
        return MaterialPageRoute(
          builder: (_) => PrivacyScreen(),
        );
      case AppRoute.insightsScreen:
        return MaterialPageRoute(
          builder: (_) => InsightsScreen(),
        );

      case AppRoute.bottomNavBarScreen:
        return MaterialPageRoute(
          builder: (_) => BottomNavBarView(),
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
