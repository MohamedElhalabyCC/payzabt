import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/core/widgets/arrow_back_widget.dart';
import 'package:payzabt/features/goals/views/widgets/goal_details_body.dart';

import '../../../config/export/export.dart';

class GoalDetailsView extends StatelessWidget {
  const GoalDetailsView({super.key, required this.budget, required this.saved, required this.title, required this.currency});
  final double budget, saved;
  final String title, currency;
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        horizontalPadding: 0,
        verticalPadding: 0,
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.37,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
            gradient: AppColors.appGradient1,
          ),
          child: SafeArea(
            bottom: false,
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
                      alignment: Alignment.bottomCenter,
                      child: AppText(
                        text: LocaleKeys.goalDetails.tr(),
                        appTextStyle: TextStyles.styleParagraphRegular16(
                          context,
                          color: AppColors.textWhite,
                        ).copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                20.sizeBoxH,
                AppText(
                  text: title,
                  appTextStyle: TextStyles.styleParagraphRegular24(
                    context,
                    color: Colors.white,
                  ).copyWith(),
                ),
                6.sizeBoxH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      saved.toStringAsFixed(0),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      " / ${budget.toStringAsFixed(0)} $currency ",
                      style: TextStyle(
                        color: Color(0xffCBFBF1),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                6.sizeBoxH,
                AppText(
                  text: "${(budget-saved).toCommaSeparated()} ${LocaleKeys.egp.tr()} ${LocaleKeys.remaining.tr()}",
                  appTextStyle: TextStyles.styleParagraphRegular14(
                    context,
                    color: const Color(0xffCBFBF1),
                  ),
                ),
                20.sizeBoxH,
              ],
            ).paddingOnly(top: 14.h, left: 20.w, right: 20.w),
          ),
        ),
        GoalDetailsBody(title:title,budget: budget, saved: saved, currency: currency),
      ],
    ));
  }
}
