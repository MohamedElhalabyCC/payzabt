import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    super.key,
    required this.title,
    required this.date,
    required this.cost,
    required this.method,
    this.color,
  });

  final String title, date, cost, method;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1.35, color: Color(0xFFF2F4F6)),
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
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        // visualDensity: VisualDensity(horizontal: -2, vertical: -2),
        leading: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: color ?? Color(0xFFDAF0F6),
          ),
          child: AppImageView(Assets.imagesSvgBill, height: 32.h, width: 32.w),
        ),
        title: Row(
          children: [
            Expanded(
              child: AppText(
                text: title,
                appTextStyle: TextStyles.styleParagraphRegular16(
                  context,
                  color: AppColors.lighterGreen,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            6.sizeBoxH,
            AppText(
              text: "${LocaleKeys.egp.tr()} $cost",
              appTextStyle: TextStyles.styleParagraphRegular16(
                context,
                color: AppColors.lighterGreen,
              ).copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: AppText(
                text: date,
                appTextStyle: TextStyles.styleParagraphRegular14(
                  context,
                  color: AppColors.subText,
                ),
              ),
            ),
            6.sizeBoxH,
            AppText(
              text: method,
              appTextStyle: TextStyles.styleParagraphRegular14(
                context,
                color: Color(0xff2C3E50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
