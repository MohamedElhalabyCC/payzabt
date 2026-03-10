import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';

class SpendingTipContainer extends StatelessWidget {
  const SpendingTipContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Color(0xFFF0FDFA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1.35, color: Color(0xFF96F7E4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: LocaleKeys.foodSpendingIncreaseInsight.tr(),
            appTextStyle: TextStyles.styleParagraphRegular14(
              context,
              color: Color(0xFF0B4F4A),
            ).copyWith(fontFamily: "Arimo"),
          ),
          12.sizeBoxH,
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: GestureDetector(
              child: AppText(
                text: LocaleKeys.viewAll.tr(),
                appTextStyle: TextStyles.styleParagraphRegular12(
                  context,
                  color: Color(0xFF0E4D6C),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
