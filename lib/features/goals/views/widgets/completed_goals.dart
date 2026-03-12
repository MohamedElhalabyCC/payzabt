import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/config/export/export.dart';

class CompletedGoalsSection extends StatefulWidget {
  const CompletedGoalsSection({
    super.key,
    required this.expansionKey,
    required this.onExpansionChanged,
  });

  final GlobalKey expansionKey;
  final void Function() onExpansionChanged;

  @override
  State<CompletedGoalsSection> createState() => _CompletedGoalsSectionState();
}

class _CompletedGoalsSectionState extends State<CompletedGoalsSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              key: widget.expansionKey,
              collapsedIconColor: const Color(0xff99A1AF),
              iconColor: const Color(0xff99A1AF),
              collapsedBackgroundColor: Colors.transparent,
              title: Text(
                LocaleKeys.completedGoals.tr(),
                style: TextStyles.styleParagraphRegular16(
                  context,
                  color: Color(0xFF4A5565),
                ),
              ),
              onExpansionChanged: (isExpanded) {
                if (isExpanded) widget.onExpansionChanged();
              },
              children: [
                _buildCompletedGoalCard("New Phone", "5,000"),
                _buildCompletedGoalCard("Bali Trip", "20,000"),
                70.sizeBoxH,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedGoalCard(String title, String amount) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFB9F8CF)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0xFF00C950),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 18),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color:const Color(0xff1E2939), fontSize: 10.sp),
                ),
                2.sizeBoxH,
                Text(
                  "$amount ${LocaleKeys.egp.tr()}",
                  style: TextStyle(
                    color: Color(0xFF008236),
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
           Text(
            LocaleKeys.completed.tr(),
            style: TextStyle(
              color: Color(0xFF008236),
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
