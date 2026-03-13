import 'package:easy_localization/easy_localization.dart';

import '../../../config/export/export.dart';
import '../../../core/widgets/arrow_back_widget.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      horizontalPadding: 0,
      verticalPadding: 0,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              gradient: AppColors.appGradient1,
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  8.sizeBoxH,
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: const ArrowBackWidget(),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: AppText(
                          text: LocaleKeys.privacyAndPolicy.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular16(
                            context,
                            color: AppColors.textWhite,
                          ).copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  30.sizeBoxH,
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: AppImageView(
                      Assets.imagesSvgPrivacyIcon,
                      height: 40.h,
                      width: 40.w,
                      color: Colors.white,
                    ),
                  ),
                  14.sizeBoxH,
                  AppText(
                    text: LocaleKeys.privacyPolicyDescription.tr(),
                    textAlign: TextAlign.center,
                    appTextStyle: TextStyles.styleParagraphRegular14(
                      context,
                      color: Color(0xffCBFBF1),
                    ),
                  ).paddingHorizontalOnly(24.w),
                  34.sizeBoxH,
                ],
              ).paddingOnly(top: 14.h, left: 20.w, right: 20.w),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.sizeBoxH,
                  AppMainContainer(
                    vPadding: 16.h,
                    hPadding: 26.w,
                    width: double.infinity,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x4C000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 12,
                        offset: Offset(0, 8),
                        spreadRadius: 6,
                      ),
                    ],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        6.sizeBoxH,
                        AppText(
                          text: LocaleKeys.privacyAndPolicy.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular16(
                            context,
                          ).copyWith(fontSize: 18,fontFamily: "Arimo"),
                        ),
                        12.sizeBoxH,
                        AppText(
                          text: LocaleKeys.privacyPolicyIntro.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular14(
                            context,
                            color: AppColors.textGreyed
                          ).copyWith(fontSize: 18,fontFamily: "Arimo"),
                        ),
                      ],
                    ),
                  ).paddingHorizontalOnly(24.w),
                  30.sizeBoxH,
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                    decoration: BoxDecoration(
                      color: Color(0xFFF0FDFA),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1.35, color: Color(0xFF95F6E4)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        6.sizeBoxH,
                        AppText(
                          text: LocaleKeys.privacyQuestionsTitle.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular16(
                            context,
                            color: const Color(0xff0B4F4A)
                          ),
                        ),
                        12.sizeBoxH,
                        AppText(
                          text: LocaleKeys.privacyPolicyContactNote.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular14(
                            context,
                            color: const Color(0xff00786F)
                          ),
                        ),
                        12.sizeBoxH,
                        AppText(
                          text: "${LocaleKeys.emailLabel.tr()} privacy@payright.app",
                          appTextStyle: TextStyles.styleParagraphRegular14(
                            context,
                            color: const Color(0xff005F5A)
                          ),
                        ),
                        12.sizeBoxH,
                        AppText(
                          text: "${LocaleKeys.supportLabel.tr()} help@payright.app",
                          appTextStyle: TextStyles.styleParagraphRegular14(
                            context,
                            color: const Color(0xff005F5A)
                          ),
                        ),
                      ],
                    ),
                  ).paddingHorizontalOnly(24.w)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FAQTile extends StatelessWidget {
  final String question;
  final String answer;

  const FAQTile({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 2,
            offset: Offset(0, 1),
            spreadRadius: -1,
          ),
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 3,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: const Color(0xFF99A1AF),
          collapsedIconColor: const Color(0xFF99A1AF),
          tilePadding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 6.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            question,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.textBlack, // Dark slate text color
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                answer,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textBlack, // Lighter grey for answer
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
