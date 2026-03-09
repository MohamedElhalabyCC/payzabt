import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/config/export/export.dart';
import 'package:payzabt/core/widgets/arrow_back_widget.dart';
import 'package:payzabt/core/widgets/custom_otp_field.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      horizontalPadding: 0,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24),
                ),
                gradient: LinearGradient(
                  begin: Alignment(0.09, -1.00),
                  end: Alignment(0.09, 1),
                  colors: [
                    AppColors.lighterGreen,
                    AppColors.lightBlueGreen,
                    AppColors.darkSecondary,
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: const ArrowBackWidget(),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: AppImageView(
                      Assets.imagesPngLogo,
                      width: MediaQuery.of(context).size.height * 0.2,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ).paddingOnly(top: 8.h),
            ),
          ),
          SafeArea(
            child: Column(
              spacing: 20.h,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (MediaQuery.of(context).size.height * 0.17).sizeBoxH,
                AppMainContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20.h,
                    children: [
                      1.sizeBoxH,
                      AppText(
                        text: LocaleKeys.checkEmail.tr(),
                        appTextStyle: TextStyles.styleH1Bold32(
                          context,
                          color: AppColors.lightSecondary,
                        ).copyWith(fontSize: 30.sp, fontWeight: FontWeight.w400),
                      ),
                      AppText(
                        text:"${ LocaleKeys.resetLinkSent.tr()}\n${ LocaleKeys.enterFiveDigitCode.tr()}",
                        appTextStyle: TextStyles.styleParagraphRegular14(
                          context,
                          color: AppColors.lightSecondary,
                        ),
                      ),
                      1.sizeBoxH,
                      CustomOtpField(
                        length: 5,
                      ),
                      1.sizeBoxH,
                    ],
                  ).paddingSymmetric(vertical: 6.h),
                ),
                1.sizeBoxH,
              ],
            ),
          ).paddingSymmetric(horizontal: 22.w),
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: AppButton(
              title: LocaleKeys.verifyCode.tr(),
              height: 50.h,
              onTap: () =>context.pushNamedAndRemoveUntil(AppRoute.loginScreen),
            ).paddingSymmetric(horizontal: 40.w, vertical: 8.h),
          ),
        ],
      ),
    );
  }
}
