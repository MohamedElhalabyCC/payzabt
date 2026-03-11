import 'package:easy_localization/easy_localization.dart';
import '../../../../config/export/export.dart';

class TransactionsToggleButtons extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onToggle;

  const TransactionsToggleButtons({
    super.key,
    required this.selectedIndex,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48.h,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            alignment: selectedIndex == 0
                ? AlignmentDirectional.centerStart
                : AlignmentDirectional.centerEnd,
            child: FractionallySizedBox(
              widthFactor: 0.5,
              child: Container(
                margin: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ),
          ),
          Row(
            children: [
              _buildToggleButton(
                context,
                title: LocaleKeys.expenses.tr(),
                isSelected: selectedIndex == 0,
                onTap: () => onToggle(0),
              ),
              _buildToggleButton(
                context,
                title: LocaleKeys.income.tr(),
                isSelected: selectedIndex == 1,
                onTap: () => onToggle(1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(
    BuildContext context, {
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 250),
            style: TextStyles.styleParagraphRegular14(
              context,
              color: isSelected ? const Color(0xff2F9A88) : AppColors.textWhite,
            ),
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
