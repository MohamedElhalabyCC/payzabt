import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/features/savings/views/widgets/dialog.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../config/export/export.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({
    super.key,
    required this.budget,
    required this.saved,
    required this.title,
    required this.currency,
  });

  final double budget, saved;
  final String title, currency;

  @override
  Widget build(BuildContext context) {
    double percent = saved / budget;
    double cappedPercent = percent > 1.0 ? 1.0 : percent;
    return AppMainContainer(
      onTap: ()=>context.pushNamed(AppRoute.goalDetailsView,arguments: [title,budget,saved,currency]),
      hPadding: 18.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: title,
            appTextStyle: TextStyles.styleParagraphRegular16(
              context,
              color: Color(0xff0D4D69),
            ).copyWith(fontFamily: "Arimo"),
          ),
          6.sizeBoxH,
          Row(
            children: [
              Text(
                saved.toCommaSeparated(),
                style: TextStyle(
                  color: Color(0xff009689),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Arimo",
                ),
              ),
              Text(
                " / ${budget.toCommaSeparated()} $currency ",
                style: TextStyle(
                  color: AppColors.subText,
                  fontSize: 12.sp,
                  fontFamily: "Arimo",
                  fontWeight: FontWeight.w400, // Regular weight
                ),
              ),
            ],
          ),
          6.sizeBoxH,
          LinearPercentIndicator(
            lineHeight: 8.0,
            animation: true,
            animationDuration: 1000,
            percent: cappedPercent,
            barRadius: const Radius.circular(5.0),
            progressColor: AppColors.lightSecondary,
            backgroundColor: Color(0xff030213).withValues(alpha: 0.2),
            padding: EdgeInsets.zero,
          ),
          12.sizeBoxH,
          Row(
            children: [
              Expanded(
                child: AppText(
                  text:
                      "${(cappedPercent * 100).toStringAsFixed(0)}% ${LocaleKeys.completed.tr()}",
                  appTextStyle: TextStyles.styleParagraphRegular14(
                    context,
                    color: Color(0xff364153),
                  ),
                ),
              ),
              4.sizeBoxW,
              InkWell(
                onTap: ()=>showAnimatedAutoDismissDialog(context, AllocateToGoalDialogContent()),
                child: AppText(
                  text: LocaleKeys.addMoneyToGoal.tr(),
                  appTextStyle: TextStyles.styleParagraphRegular14(
                    context,
                    color: Color(0xff009689),
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

class ProgressGoalCard extends StatelessWidget {
  const ProgressGoalCard({
    super.key,
    required this.budget,
    required this.saved,
    required this.currency,
  });

  final double budget, saved;
  final String  currency;

  @override
  Widget build(BuildContext context) {
    double percent = saved / budget;
    double cappedPercent = percent > 1.0 ? 1.0 : percent;
    return AppMainContainer(
      hPadding: 18.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: LocaleKeys.goalProgress.tr(),
            appTextStyle: TextStyles.styleParagraphRegular16(
              context,
              color: Color(0xff4A5565),
            ),
          ),
          2.sizeBoxH,
          LinearPercentIndicator(
            lineHeight: 8.0,
            animation: true,
            animationDuration: 1000,
            percent: cappedPercent,
            barRadius: const Radius.circular(5.0),
            progressColor: AppColors.lightSecondary,
            backgroundColor: Color(0xff030213).withValues(alpha: 0.2),
            padding: EdgeInsets.zero,
          ),
          12.sizeBoxH,
          Row(
            children: [
              Expanded(
                child: AppText(
                  text:
                      "${(cappedPercent * 100).toCommaSeparated()}% ${LocaleKeys.completed.tr()}",
                  appTextStyle: TextStyles.styleParagraphRegular14(
                    context,
                    color: Color(0xff364153),
                  ),
                ),
              ),
              4.sizeBoxW,
              InkWell(
                onTap: ()=>showAnimatedAutoDismissDialog(context, AllocateToGoalDialogContent()),
                child: AppText(
                  text: LocaleKeys.addMoneyToGoal.tr(),
                  appTextStyle: TextStyles.styleParagraphRegular14(
                    context,
                    color: Color(0xff009689),
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
