import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';

class SavingsTipContainer extends StatelessWidget {
  const SavingsTipContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Color(0xFFEEF3FE),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1.35, color: Color(0xFF077AAD)),
      ),
      child: AppText(
        text: LocaleKeys.savingsGrowingTip.tr(),
        appTextStyle: TextStyles.styleParagraphRegular14(
          context,
          color: Color(0xFF005F59),
        ),
      ),
    );
  }
}
