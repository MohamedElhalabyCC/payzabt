import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/config/export/export.dart';
import 'package:payzabt/features/auth/views/widgets/signin_container.dart';
import 'package:payzabt/features/onboarding/views/widgets/onboarding_text_section.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      horizontalPadding: 0,
      isBackgroundImage: true,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppImageView(
              Assets.imagesPngLogo,
              width: MediaQuery.of(context).size.height * 0.2,
              fit: BoxFit.fitWidth,
            ),
            40.sizeBoxH,
            Column(
              spacing: 20.h,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OnboardingTextSection(
                  title: LocaleKeys.welcomeBack.tr(),
                  subtitle: LocaleKeys.signInToContinue.tr(),
                  spacing: 0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                SignInContainer(),
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 16.w,vertical: 12.h),
      ),
    );
  }
}
