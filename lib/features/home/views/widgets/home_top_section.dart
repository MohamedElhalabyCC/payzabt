import 'package:easy_localization/easy_localization.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../config/export/export.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        gradient: AppColors.appGradient1,
      ),
      child: SafeArea(bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            4.sizeBoxH,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppImageView(
                  Assets.imagesPngLogo,
                  width: MediaQuery.of(context).size.height * 0.18,
                  fit: BoxFit.fitWidth,
                ),
                12.sizeBoxW,
                InkWell(
                  onTap: ()=>context.pushNamed(AppRoute.notificationsView),
                  child: AppImageView(
                    Assets.imagesSvgBellRinging,
                    width: 32.w,
                    height: 32.h,
                  ).paddingVerticalOnly(8),
                ),
              ],
            ),
            12.sizeBoxH,
            AppText(
              text: "${LocaleKeys.hi.tr()} Ahmed Hassan,\n${LocaleKeys.welcome.tr()}",
              appTextStyle: TextStyles.styleParagraphRegular24(
                context,
                color: AppColors.textWhite,
              ).copyWith(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            12.sizeBoxH,
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      spacing: 4.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: LocaleKeys.monthlyIncome.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular12(
                            context,
                            color: AppColors.textWhite,
                          ),
                        ),
                        AppText(
                          text: "20,000",
                          appTextStyle: TextStyles.styleParagraphRegular24(
                            context,
                            color: AppColors.textWhite,
                          ).copyWith(fontSize: 20.sp),
                        ),
                        AppText(
                          text: LocaleKeys.egp.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular12(
                            context,
                            color: AppColors.textWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                26.sizeBoxW,
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      spacing: 4.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: LocaleKeys.totalSavings.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular12(
                            context,
                            color: AppColors.textWhite,
                          ),
                        ),
                        AppText(
                          text: "42,000",
                          appTextStyle: TextStyles.styleParagraphRegular24(
                            context,
                            color: AppColors.textWhite,
                          ).copyWith(fontSize: 20.sp),
                        ),
                        AppText(
                          text: LocaleKeys.egp.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular12(
                            context,
                            color: AppColors.textWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            12.sizeBoxH,
            Row(
              children: [
                Expanded(
                  child: AppText(
                    text: LocaleKeys.monthlyBudget.tr(),
                    appTextStyle: TextStyles.styleParagraphRegular16(
                      context,
                      color: AppColors.textWhite,
                    ).copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                12.sizeBoxW,
                AppImageView(
                  Assets.imagesSvgEditIcon,
                  width: 18.w,
                  height: 18.h,
                ),
              ],
            ),
            12.sizeBoxH,
            AppText(
              text: LocaleKeys.spent.tr(),
              appTextStyle: TextStyles.styleParagraphRegular12(
                context,
                color: AppColors.textWhite,
              ).copyWith(fontWeight: FontWeight.w500),
            ),
            6.sizeBoxH,
            LinearPercentIndicator(
              lineHeight: 8.0,
              animation: true,
              animationDuration: 1000,
              percent: 0.7,
              barRadius: const Radius.circular(5.0),
              progressColor: const Color(0xff0043CE),
              backgroundColor: const Color(0xFFE5E7EB),
              padding: EdgeInsets.zero,
            ),
            6.sizeBoxH,
            Text(
              "9,000 ${LocaleKeys.egp.tr()} / 15,0000 ${LocaleKeys.egp.tr()} ${LocaleKeys.budget.tr()}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400, // Regular weight
              ),
            ),
            20.sizeBoxH,
          ],
        ).paddingOnly(top: 14.h, left: 20.w, right: 20.w),
      ),
    );
  }
}
