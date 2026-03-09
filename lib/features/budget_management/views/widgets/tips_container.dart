import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';

class TipsContainer extends StatelessWidget {
  const TipsContainer({super.key, required this.tip});

  final String tip;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Color(0xFFF0FDFA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1.35, color: Color(0xFF95F6E4)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: "${LocaleKeys.tipLabel.tr()} ",
            appTextStyle: TextStyles.styleH1Bold14(
              context,
              color: Color(0xff005F5A),
            ),
          ),
          Expanded(
            child: AppText(
              text: tip,
              appTextStyle: TextStyles.styleParagraphRegular14(
                context,
                color: Color(0xff005F5A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
