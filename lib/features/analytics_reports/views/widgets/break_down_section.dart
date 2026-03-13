import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';

class BreakdownSectionWidget extends StatelessWidget {
  final bool overBudget;
  const BreakdownSectionWidget({super.key, required this.overBudget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          overBudget ? LocaleKeys.whatWentOver.tr() : LocaleKeys.breakdown.tr(),
          style: TextStyles.styleParagraphRegular16(context).copyWith(fontFamily: "Arimo"),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFEAECF0)),
          ),
          child: Column(
            children: [
              BreakdownRowItem(
                label: "Food",
                value: "+1,500",
                dotColor: Colors.orange,
                overBudget: overBudget,
              ),
              const Divider(
                color: Color(0xffF3F4F6),
                thickness: 1,
              ).paddingVerticalOnly(4),
              BreakdownRowItem(
                label: "Shopping",
                value: "+2,000",
                dotColor: Colors.purple,
                overBudget: overBudget,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BreakdownRowItem extends StatelessWidget {
  final String label;
  final String value;
  final Color dotColor;
  final bool overBudget;

  const BreakdownRowItem({
    super.key,
    required this.label,
    required this.value,
    required this.dotColor,
    required this.overBudget,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 4, backgroundColor: dotColor),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyles.styleParagraphRegular16(context, color: const Color(0xFF364153)),
        ),
        const Spacer(),
        Text(
          "$value ${LocaleKeys.egp.tr()}",
          style: TextStyles.styleParagraphRegular16(
            context,
            color: overBudget ? const Color(0xFFE7000B) : const Color(0xFF00BC7D),
          ),
        ),
      ],
    );
  }
}