import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/config/export/export.dart';

import 'dialog.dart';
import 'savings_history_card.dart';

class SavingsBody extends StatelessWidget {
  const SavingsBody({super.key});

  static const List<String> months = ["Jun", "May", "Apr", "Mar", "Feb", "Jan"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          text: LocaleKeys.savingsHistory.tr(),
          appTextStyle: TextStyles.styleParagraphRegular16(context),
        ),
        14.sizeBoxH,
        ListView.builder(
          itemCount: months.length,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => SavingsHistoryCard(
            month: months[index],
            subtitle: "Monthly leftover",
            savings: "+5000",
          ).paddingOnly(bottom: 16.h),
        ),
        12.sizeBoxH,
        Row(
          children: [
            Expanded(
              child: AppButton(
                title: LocaleKeys.allocateToGoal.tr(),
                onTap: () => showAnimatedAutoDismissDialog(
                  context,
                  const AllocateToGoalDialogContent(),
                ),
              ),
            ),
            10.sizeBoxW,
            Expanded(
              child: AppButton(
                title: LocaleKeys.editSavings.tr(),
                background: Colors.white,
                borderColor: AppColors.lightSecondary,
                textColor: AppColors.lightSecondary,
                onTap: () => showAnimatedAutoDismissDialog(
                  context,
                  const EditSavingDialogContent(),
                ),
              ),
            ),
          ],
        ),
        8.sizeBoxH,
      ],
    ).paddingHorizontalOnly(18.w);
  }
}
