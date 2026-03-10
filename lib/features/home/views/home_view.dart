import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/features/home/views/widgets/spendings_tip_container.dart';
import 'package:payzabt/features/home/views/widgets/transaction_card.dart';

import '../../../config/export/export.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      horizontalPadding: 0,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.sizeBoxH,
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
                      AppImageView(
                        Assets.imagesSvgBellRinging,
                        width: 32.w,
                        height: 32.h,
                      ).paddingVerticalOnly(8),
                    ],
                  ),
                  20.sizeBoxH,
                  AppText(
                    text: "${LocaleKeys.hi.tr()} Ahmed Hassan,",
                    appTextStyle: TextStyles.styleParagraphRegular24(
                      context,
                      color: AppColors.textWhite,
                    ).copyWith(fontSize: 20.sp, fontWeight: FontWeight.w500),
                  ),
                  AppText(
                    text: LocaleKeys.welcome.tr(),
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
                                appTextStyle:
                                    TextStyles.styleParagraphRegular12(
                                      context,
                                      color: AppColors.textWhite,
                                    ),
                              ),
                              AppText(
                                text: "20,000",
                                appTextStyle:
                                    TextStyles.styleParagraphRegular24(
                                      context,
                                      color: AppColors.textWhite,
                                    ).copyWith(fontSize: 20.sp),
                              ),
                              AppText(
                                text: LocaleKeys.egp.tr(),
                                appTextStyle:
                                    TextStyles.styleParagraphRegular12(
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
                                appTextStyle:
                                    TextStyles.styleParagraphRegular12(
                                      context,
                                      color: AppColors.textWhite,
                                    ),
                              ),
                              AppText(
                                text: "42,000",
                                appTextStyle:
                                    TextStyles.styleParagraphRegular24(
                                      context,
                                      color: AppColors.textWhite,
                                    ).copyWith(fontSize: 20.sp),
                              ),
                              AppText(
                                text: LocaleKeys.egp.tr(),
                                appTextStyle:
                                    TextStyles.styleParagraphRegular12(
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
                  36.sizeBoxH,
                ],
              ).paddingOnly(top: 14.h, left: 20.w, right: 20.w),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  20.sizeBoxH,
                  SpendingTipContainer(),
                  20.sizeBoxH,
                  _buildSectionTitle(context, LocaleKeys.recentTransactions.tr(), () {}),
                  12.sizeBoxH,
                  ListView.builder(
                    itemCount: 1,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => TransactionCard(
                      title: "Internet",
                      date: "12 jan 2022",
                      method: "In Cash",
                      cost: "500",
                    ).paddingOnly(bottom: 16.h),
                  ),

                ],
              ).paddingHorizontalOnly(18.w),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(
    BuildContext context,
    String title,
    void Function() onTap,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          text: title,
          appTextStyle: TextStyles.styleParagraphRegular16(
            context,
            color: const Color(0xff0E4D6C),
          ).copyWith(fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: onTap,
          child: AppText(
            text: LocaleKeys.viewAll.tr(),
            appTextStyle: TextStyles.styleParagraphRegular12(
              context,
              color: const Color(0xff0E4D6C),
            ),
          ),
        ),
      ],
    );
  }
}
