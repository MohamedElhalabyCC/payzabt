import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/features/auth/logic/auth_cubit.dart';

import '../../../../config/export/export.dart';

class SignUpContainer extends StatelessWidget {
  const SignUpContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppMainContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20.h,
        children: [
          1.sizeBoxH,
          AppText(
            text: LocaleKeys.createAccount.tr(),
            appTextStyle: TextStyles.styleH1Bold24(
              context,
              color: AppColors.lightSecondary,
            ).copyWith(fontFamily: "Arimo"),
          ),
          CustomTextField(
            title: LocaleKeys.fullName.tr(),
            hintText: LocaleKeys.fullName.tr(),
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
              return Column(
                spacing: 20.h,
                children: [
                  CustomTextField(
                    obscureText: state,
                    title: LocaleKeys.createPassword.tr(),
                    hintText: LocaleKeys.mustBe8Characters.tr(),
                  ),
                  CustomTextField(
                    obscureText: state,
                    title: LocaleKeys.confirmPassword.tr(),
                    hintText: LocaleKeys.repeatPassword.tr(),
                  ),
                ],
              );
            },
          ),
          RichText(text: TextSpan(children: [
            TextSpan(
              text: LocaleKeys.agreeToThe.tr(),
                style: TextStyles.styleParagraphRegular14(
                    context, color: AppColors.textGreyed).copyWith(
                    fontFamily: "Arimo")
            ),
            TextSpan(
              text: LocaleKeys.termsOfService.tr(),
                style: TextStyles.styleParagraphRegular14(
                    context, color: AppColors.lightSecondary).copyWith(
                    fontFamily: "Arimo")
            ),
            TextSpan(
                text: LocaleKeys.and.tr(),
                style: TextStyles.styleParagraphRegular14(
                    context, color: AppColors.textGreyed).copyWith(
                    fontFamily: "Arimo")
            ),
            TextSpan(
              text: LocaleKeys.privacyPolicy.tr(),
                style: TextStyles.styleParagraphRegular14(
                    context, color: AppColors.lightSecondary).copyWith(
                    fontFamily: "Arimo")
            ),
          ])),
          AppButton(
            title: LocaleKeys.createAccount.tr(),
            onTap: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: LocaleKeys.haveAnAccount.tr(),
                appTextStyle: TextStyles.styleParagraphRegular16(
                  context,
                  color: AppColors.textGreyed,
                ).copyWith(fontFamily: "Arimo"),
              ),
              6.sizeBoxW,
              InkWell(
                onTap: () =>context.pushNamedAndRemoveUntil(AppRoute.loginScreen),
                child: AppText(
                  text: LocaleKeys.signIn.tr(),
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
