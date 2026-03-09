import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/config/export/export.dart';

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
          itemBuilder: (context, index) => Container(
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
                  AppText(
                    text: months[index],
                    appTextStyle: TextStyles.styleParagraphRegular14(context),
                  ),
                  Spacer(),
                  AppText(
                    text: "+5000",
                    appTextStyle: TextStyles.styleParagraphRegular14(
                      context,
                      color: AppColors.lighterGreen,
                    ),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  AppText(
                    text: "Monthly leftover",
                    appTextStyle: TextStyles.styleParagraphRegular14(
                      context,
                      color: AppColors.subText,
                    ),
                  ),
                  Spacer(),
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
          ).paddingOnly(bottom: 16.h),
        ),
        20.sizeBoxH,
      ],
    ).paddingHorizontalOnly(18.w);
  }
}
