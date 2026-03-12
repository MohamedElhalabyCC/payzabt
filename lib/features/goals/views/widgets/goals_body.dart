import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';
import 'goal_card.dart';

class GoalsBody extends StatelessWidget {
  const GoalsBody({super.key});



  @override
  Widget build(BuildContext context) {
    final List goals = [
    {"title": "London Trip", "budget": 10000.0, "saved": 5000.0, "currency": "EGP"},
    {"title": "New Laptop", "budget": 10000.0, "saved": 2000.0, "currency": "EGP"},
  ];
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          (MediaQuery.of(context).size.height * 0.25).sizeBoxH,
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => GoalCard(
              title: goals[index]["title"],
              budget: goals[index]["budget"] as double,
              saved: goals[index]["saved"] as double,
              currency: goals[index]["currency"],
            ).paddingOnly(bottom: 18.h),
            itemCount: goals.length,
            padding: EdgeInsets.zero,
          ),
          18.sizeBoxH,
          AppButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Colors.white, size: 24),
                4.sizeBoxW,
                AppText(
                  text: LocaleKeys.createNewGoal.tr(),
                  appTextStyle: TextStyles.styleParagraphRegular14(
                    context,
                    color: Colors.white,
                  ).copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    ).paddingSymmetric(horizontal: 22.w);
  }
}
