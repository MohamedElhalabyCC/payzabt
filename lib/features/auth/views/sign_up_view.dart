import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/config/export/export.dart';
import 'package:payzabt/features/auth/views/widgets/sign_up_container.dart';
import 'package:payzabt/features/auth/views/widgets/signin_container.dart';
import 'package:payzabt/features/onboarding/views/widgets/onboarding_text_section.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      horizontalPadding: 0,
      isBackgroundImage: true,
      resizeToAvoidBottomInset: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImageView(
            Assets.imagesPngLogo,
            width: MediaQuery.of(context).size.height * 0.2,
            fit: BoxFit.fitWidth,
          ),
          1.sizeBoxH,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 20.h,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OnboardingTextSection(
                    title: LocaleKeys.createNewAccount.tr(),
                    subtitle: LocaleKeys.moneyOrganizedInOnePlace.tr(),
                    spacing: 0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  SignUpContainer(),
                ],
              ),
            ),
          ),
        ],
      ).paddingSymmetric(horizontal: 16.w,vertical: 12.h),
    );
  }
}
