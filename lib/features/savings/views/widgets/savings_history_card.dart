import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';

class SavingsHistoryCard extends StatelessWidget {
  const SavingsHistoryCard({super.key, required this.month, required this.subtitle, required this.savings});

  final String month,subtitle,savings;

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
        // visualDensity: VisualDensity(horizontal: -2, vertical: -2),
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffCBFBF1),
          ),
          child: AppImageView(
            Assets.imagesSvgSavingsIcon,
            height: 24.h,
            width: 24.w,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: AppText(
                text: month,
                appTextStyle: TextStyles.styleParagraphRegular14(context),
              ),
            ),
            6.sizeBoxH,
            AppText(
              text: savings,
              appTextStyle: TextStyles.styleParagraphRegular14(
                context,
                color: AppColors.lighterGreen,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: AppText(
                text: subtitle,
                appTextStyle: TextStyles.styleParagraphRegular14(
                  context,
                  color: AppColors.subText,
                ),
              ),
            ),
            6.sizeBoxH,
            AppText(
              text: LocaleKeys.egp.tr(),
              appTextStyle: TextStyles.styleParagraphRegular14(
                context,
                color: Color(0xff99A1AF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
