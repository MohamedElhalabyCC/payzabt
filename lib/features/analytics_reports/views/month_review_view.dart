import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/core/widgets/arrow_back_widget.dart';

import '../../../config/export/export.dart';
import 'widgets/action_section.dart';
import 'widgets/break_down_section.dart';
import 'widgets/tip_box.dart';

class MonthReviewScreen extends StatelessWidget {
  final bool isOverBudget;

  const MonthReviewScreen({super.key, this.isOverBudget = false});

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
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.sizeBoxH,
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: const ArrowBackWidget(),
                  ),
                  Align(
                    alignment: AlignmentGeometry.bottomCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText(
                          text: !isOverBudget
                              ? LocaleKeys.youSavedMoneyThisMonth.tr()
                              : LocaleKeys.thisMonthWasHeavy.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular16(
                            context,
                            color: AppColors.textWhite,
                          ).copyWith(fontWeight: FontWeight.w500),
                        ),
                        4.sizeBoxH,
                        AppText(
                          text: !isOverBudget
                              ? LocaleKeys.whatWouldYouLikeToDo.tr()
                              : LocaleKeys.letsDecideHowToHandle.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular12(
                            context,
                            color: AppColors.textWhite,
                          ),
                        ),
                        12.sizeBoxH,
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              AppText(
                                text: !isOverBudget
                                    ? LocaleKeys.totalRemaining.tr()
                                    : LocaleKeys.overBudget.tr(),
                                appTextStyle:
                                TextStyles.styleParagraphRegular14(
                                  context,
                                  color: AppColors.textGreyed,
                                ),
                              ),
                              AppText(
                                text:
                                "${3500.toCommaSeparated()} ${LocaleKeys.egp.tr()}",
                                appTextStyle:
                                TextStyles.styleH1Bold32(
                                  context,
                                  color: AppColors.textWhite,
                                ).copyWith(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        26.sizeBoxH,
                      ],
                    ),
                  ),
                  20.sizeBoxH,
                ],
              ).paddingOnly(top: 14.h, left: 20.w, right: 20.w),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  TipBoxWidget(overBudget: isOverBudget),
                  const SizedBox(height: 24),
                  BreakdownSectionWidget(overBudget: isOverBudget),
                  const SizedBox(height: 24),
                  ActionSectionWidget(overBudget: isOverBudget),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}