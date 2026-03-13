import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';

class TipBoxWidget extends StatelessWidget {
  final bool overBudget;
  const TipBoxWidget({super.key, required this.overBudget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: overBudget ? const Color(0xffEFF6FF) : const Color(0xffECFDF5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: overBudget ? const Color(0xffBEDBFF) : const Color(0xff96F7E4),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  overBudget
                      ? LocaleKeys.itHappensTip.tr()
                      : LocaleKeys.niceWorkTip.tr(),
                  style: TextStyles.styleParagraphRegular14(
                    context,
                    color: overBudget
                        ? const Color(0xff1C398E)
                        : const Color(0xff0B4F4A),
                  ).copyWith(fontFamily: "Arimo"),
                ),
                const SizedBox(height: 4),
                Text(
                  overBudget
                      ? LocaleKeys.someMonthsHarder.tr()
                      : LocaleKeys.didNotSpendEverything.tr(),
                  style: TextStyles.styleParagraphRegular12(
                    context,
                    color: overBudget
                        ? const Color(0xFF1447E6)
                        : const Color(0xFF00786F),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}