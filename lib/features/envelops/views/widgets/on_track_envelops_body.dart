import 'package:easy_localization/easy_localization.dart';
import '../../../../config/export/export.dart';
import 'envelop_card.dart';

class OnTrackEnvelopsBody extends StatelessWidget {
  const OnTrackEnvelopsBody({super.key});

  static final envelops = [
    {"icon": Assets.imagesSvgHamburger,"color":Color(0xffFCE2A0), "title": LocaleKeys.food.tr(), "budget": 3000, "amount": 1500},
    {"icon": Assets.imagesSvgCar,"color":Color(0xffDAF0F6), "title": LocaleKeys.transportation.tr(), "budget": 1200, "amount": 600},
    {"icon": Assets.imagesSvgCircus,"color":Color(0xffDAF0F6), "title": LocaleKeys.entertainment.tr(), "budget": 3000, "amount": 2600},
    {"icon": Assets.imagesSvgShoppingCart,"color":Color(0xffEADAF6), "title": LocaleKeys.shopping.tr(), "budget": 1200, "amount": 600},
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: envelops.length,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = envelops[index];
        final String title = item["title"] as String;
        final double budget = (item["budget"] as num).toDouble(); // 'num' covers both int and double
        final double amount = (item["amount"] as num).toDouble();
        final String icon = item["icon"] as String;
        final Color color = item["color"] as Color;

        return EnvelopProgressCard(
          title: title,
          spentAmount: amount, // Now correctly passed as double
          budgetAmount: budget, // Now correctly passed as double
          iconData: icon,
          textColor: AppColors.lightSecondary, // Recommended to use your AppColors
          iconBackgroundColor: color,
        ).paddingOnly(bottom: 16.h, top: index == 0 ? 16.h : 0);
      },
    );
  }
}