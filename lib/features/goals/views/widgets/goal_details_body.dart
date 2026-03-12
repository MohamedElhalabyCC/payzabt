import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:payzabt/features/savings/views/widgets/dialog.dart';

import '../../../../config/export/export.dart';
import 'goal_card.dart';
import 'goals_dialog.dart';

class GoalDetailsBody extends StatelessWidget {
  const GoalDetailsBody({
    super.key,
    required this.budget,
    required this.saved,
    required this.currency, required this.title,
  });

  final double budget, saved;
  final String title,currency;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          (MediaQuery.of(context).size.height * 0.29).sizeBoxH,
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ProgressGoalCard(
              budget: budget,
              saved: saved,
              currency: currency,
            ).paddingOnly(bottom: 18.h),
            itemCount: 1,
            padding: EdgeInsets.zero,
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: AppButton(
                  onTap: () => showAnimatedAutoDismissDialog(
                    context,
                    CreateGoalDialogContent(isEdit: true,),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppImageView(
                        Assets.imagesSvgEditIcon,
                        color: AppColors.textWhite,
                        height: 16.h,
                        width: 16.w,
                      ),
                      6.sizeBoxW,
                      AppText(
                        text: LocaleKeys.editGoal.tr(),
                        appTextStyle: TextStyles.styleSemiBold14(
                          context,
                          color: AppColors.textWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              12.sizeBoxW,
              Expanded(
                child: AppButton(
                  onTap: ()=>showAnimatedAutoDismissDialog(context, DeleteGoalDialogContent(title: title,)),
                  background: Colors.white,
                  borderColor: AppColors.textError,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.delete,
                        color: AppColors.textError,
                        size: 18.h,
                      ),
                      6.sizeBoxW,
                      AppText(
                        text: LocaleKeys.delete.tr(),
                        appTextStyle: TextStyles.styleSemiBold14(
                          context,
                          color: AppColors.textError,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          20.sizeBoxH,
        ],
      ),
    ).paddingSymmetric(horizontal: 22.w);
  }
}
