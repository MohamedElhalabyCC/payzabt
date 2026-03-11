import 'package:easy_localization/easy_localization.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../config/export/export.dart';

class EnvelopProgressCard extends StatelessWidget {
  final String title;
  final double spentAmount;
  final double budgetAmount;
  final String iconData;
  final String currency;

  final Color textColor;
  final Color iconBackgroundColor;
  final Color progressForegroundColor;
  final Color progressBackgroundColor;
  final double cornerRadius;
  final EdgeInsets padding;

  const EnvelopProgressCard({
    super.key,
    required this.title,
    required this.spentAmount,
    required this.budgetAmount,
    required this.iconData,
    this.currency = "EGP",
    this.textColor = const Color(0xFF007A8A),
    this.iconBackgroundColor = const Color(0xFFDAF1F4),
    this.progressForegroundColor = const Color(0xFF00BB8B),
    this.progressBackgroundColor = const Color(0xFFE5E7EB),
    this.cornerRadius = 20.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
  });

  @override
  Widget build(BuildContext context) {
    final spentStr = spentAmount
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]},',
        );
    final budgetStr = budgetAmount
        .toStringAsFixed(0)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]},',
        );

    double percent = spentAmount / budgetAmount;
    double cappedPercent = percent > 1.0 ? 1.0 : percent;

    return InkWell(
      onTap: ()=>context.pushNamed(AppRoute.editEnvelopScreen),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(cornerRadius),
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
        child: Padding(
          padding: padding,
          child: Row(
            children: [
              Container(
                width: 70.w,
                height: 70.h,
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                  child: AppImageView(iconData,),
                ),
              ),
              12.sizeBoxW,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: title,
                      appTextStyle: TextStyle(
                        color: textColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500, // Medium-weight
                      ),
                    ),
                    6.sizeBoxH,
                    LinearPercentIndicator(
                      lineHeight: 8.0,
                      animation: true,
                      animationDuration: 1000,
                      percent: cappedPercent,
                      barRadius: const Radius.circular(5.0),
                      progressColor: progressForegroundColor,
                      backgroundColor: progressBackgroundColor,
                      padding: EdgeInsets.zero,
                    ),
                    6.sizeBoxH,
                    Text(
                      "$spentStr $currency / $budgetStr $currency ${LocaleKeys.budget.tr()}",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400, // Regular weight
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
