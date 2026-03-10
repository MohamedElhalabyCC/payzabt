import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/features/budget_management/logic/budget_management_cubit.dart';
import 'package:payzabt/features/budget_management/views/widgets/tips_container.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../config/export/export.dart';
import 'widgets/budget_management_body.dart';

class BudgetManagementView extends StatefulWidget {
  const BudgetManagementView({super.key});

  @override
  State<BudgetManagementView> createState() => _BudgetManagementViewState();
}

class _BudgetManagementViewState extends State<BudgetManagementView> {
  ValueNotifier<int> counter = ValueNotifier(0);
  List<String> header = [
        LocaleKeys.budgetCycleDate.tr(),
        LocaleKeys.income.tr(),
        LocaleKeys.budget.tr(),
        LocaleKeys.savings.tr(),
      ],
      titles = [
        LocaleKeys.monthlyBudgetResets.tr(),
        LocaleKeys.monthlyIncome.tr(),
        LocaleKeys.monthlyBudget.tr(),
        LocaleKeys.currentSaving.tr(),
      ],
      subTitles = [
        LocaleKeys.budgetCycleStartDayInfo.tr(),
        LocaleKeys.startWithMonthlyIncome.tr(),
        LocaleKeys.startWithMonthlyBudget.tr(),
        LocaleKeys.howMuchSavedSoFar.tr(),
      ],
      tips = [
        LocaleKeys.salaryDayDescription.tr(),
        LocaleKeys.incomeTip.tr(),
        LocaleKeys.budgetTip.tr(),
        LocaleKeys.savingTip.tr(),
      ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      horizontalPadding: 0,
      resizeToAvoidBottomInset: true,
      body: BlocBuilder<BudgetManagementCubit, BudgetManagementState>(
        builder: (context, state) {
          return Stack(
            children: [
              SafeArea(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(24),
                    ),
                    gradient: AppColors.appGradient1,
                  ),
                  child: ValueListenableBuilder(
                    valueListenable: counter,
                    builder: (context, value, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: AppText(
                              text: header[value],
                              appTextStyle: TextStyles.styleParagraphRegular16(
                                context,
                                color: AppColors.textWhite,
                              ).copyWith(fontWeight: FontWeight.w500),
                            ),
                          ),
                          24.sizeBoxH,
                          AppText(
                            text: titles[value],
                            appTextStyle:
                                TextStyles.styleH1Bold32(
                                  context,
                                  color: AppColors.textWhite,
                                ).copyWith(
                                  fontSize: 30.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          6.sizeBoxH,
                          AppText(
                            text: subTitles[value],
                            appTextStyle: TextStyles.styleParagraphRegular16(
                              context,
                              color: AppColors.textWhite,
                            ).copyWith(fontWeight: FontWeight.w500),
                          ),
                          16.sizeBoxH,
                          AnimatedSmoothIndicator(
                            activeIndex: value,
                            count: 4,
                            effect: ColorTransitionEffect(
                              dotHeight: 4,
                              radius: 20,
                              dotWidth: 50.w,
                              activeDotColor: AppColors.textWhite,
                              dotColor: AppColors.textWhite.withValues(
                                alpha: 0.3,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ).paddingOnly(top: 14.h, left: 20.w, right: 20.w),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: counter,
                builder: (context, value, child) {
                  return Column(
                    children: [
                      BudgetManagementContainer(index: value),
                      20.sizeBoxH,
                      TipsContainer(tip: tips[value]),
                    ],
                  );
                },
              ),
              Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(
                      height: 50.h,
                      background: AppColors.lightPrimary,
                      onTap: () {
                        if (counter.value < 3) {
                          counter.value++;
                        } else {
                          // Final step logic if any, or navigation
                          context.pushNamed(AppRoute.savingsView);
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            text: LocaleKeys.continue_.tr(),
                            appTextStyle: TextStyles.styleParagraphRegular16(
                              context,
                              color: AppColors.textWhite,
                            ).copyWith(fontSize: 18.sp),
                          ),
                          4.sizeBoxW,
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ).paddingSymmetric(horizontal: 40.w, vertical: 8.h),
                    8.sizeBoxH,
                    if (counter.value == 3)...[GestureDetector(
                      onTap: () {},
                      child: AppText(
                        text: LocaleKeys.skipForNow.tr(),
                        appTextStyle: TextStyles.styleParagraphRegular16(
                          context,
                          color: Color(0xff6A7282),
                        ),
                      ),
                    ),
                    12.sizeBoxH],
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
