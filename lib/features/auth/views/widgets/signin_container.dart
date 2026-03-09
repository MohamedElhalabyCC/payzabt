import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/features/auth/logic/auth_cubit.dart';

import '../../../../config/export/export.dart';

class SignInContainer extends StatelessWidget {
  const SignInContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20.h,
        children: [
          1.sizeBoxH,
          AppText(
            text: LocaleKeys.signIn.tr(),
            appTextStyle: TextStyles.styleH1Bold24(
              context,
              color: AppColors.lightSecondary,
            ).copyWith(fontFamily: "Arimo"),
          ),
          CustomTextField(
            title: LocaleKeys.email.tr(),
            hintText: "example@gmail.com",
          ),
          BlocSelector<AuthCubit, AuthState, bool>(
            selector: (state) {
              return state.isPasswordHidden;
            },
            builder: (context, state) {
              return CustomTextField(
                obscureText: state,
                title: LocaleKeys.password.tr(),
                hintText: LocaleKeys.mustBe8Characters.tr(),
              );
            },
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: InkWell(
              onTap: () => context.pushNamed(AppRoute.forgetPasswordView),
              child: AppText(
                color: AppColors.lightSecondary,
                text: LocaleKeys.forgotPassword.tr(),
                appTextStyle: TextStyles.styleParagraphRegular14(
                  context,
                ).copyWith(fontFamily: "Arimo"),
              ),
            ),
          ),
          AppButton(
            title: LocaleKeys.signIn.tr(),
            height: 50.h,
            onTap: () =>
                context.pushNamedAndRemoveUntil(AppRoute.budgetManagementView),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: LocaleKeys.dontHaveAccount.tr(),
                appTextStyle: TextStyles.styleParagraphRegular16(
                  context,
                  color: AppColors.textGreyed,
                ).copyWith(fontFamily: "Arimo"),
              ),
              6.sizeBoxW,
              InkWell(
                onTap: () =>
                    context.pushNamedAndRemoveUntil(AppRoute.signUpView),
                child: AppText(
                  text: LocaleKeys.createAccount.tr(),
                  appTextStyle: TextStyles.styleH1Bold16(
                    context,
                    color: AppColors.textBlue,
                  ).copyWith(fontFamily: "Arimo"),
                ),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(vertical: 6.h),
    );
  }
}
