import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';

class ActionSectionWidget extends StatelessWidget {
  final bool overBudget;
  const ActionSectionWidget({super.key, required this.overBudget});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          overBudget
              ? LocaleKeys.howShouldHandleThis.tr()
              : LocaleKeys.whatWouldYouLikeToDo.tr(),
          style: TextStyles.styleParagraphRegular16(context),
        ),
        const SizedBox(height: 12),
        if (overBudget) ...[
          ActionCardWidget(
            title: LocaleKeys.carryItForward.tr(),
            subtitle: "${LocaleKeys.nextMonthStartsWithMinus.tr()} 300 EGP",
            bg: const Color(0xffF3F4F6),
            textCol: Colors.black87,
            isRecommended: false,
            borderColor: const Color(0xffD1D5DC),
          ),
          const SizedBox(height: 16),
          ActionCardWidget(
            title: LocaleKeys.startFresh.tr(),
            subtitle: LocaleKeys.resetBudgetNextMonth.tr(),
            bg: const Color(0xFF039855),
            textCol: Colors.white,
            isRecommended: true,
            showFooter: true,
            gradient: const LinearGradient(
              begin: Alignment(-0.01, -1.00),
              end: Alignment(0.01, 1),
              colors: [Color(0xFF00C850), Color(0xFF009865)],
            ),
          ),
        ] else ...[
          ActionCardWidget(
            title: LocaleKeys.saveIt.tr(),
            subtitle: LocaleKeys.moveMoneyToSavings.tr(),
            bg: const Color(0xFF2970FF),
            textCol: Colors.white,
            isRecommended: false,
            gradient: const LinearGradient(
              begin: Alignment(-1.00, 0.00),
              end: Alignment(1, 0),
              colors: [Color(0xFF2B7FFF), Color(0xFF155CFB)],
            ),
          ),
          const SizedBox(height: 16),
          ActionCardWidget(
            title: LocaleKeys.rollover.tr(),
            subtitle: LocaleKeys.addToNextMonthBudget.tr(),
            bg: const Color(0xFF9E77ED),
            textCol: Colors.white,
            isRecommended: false,
            onTap: ()=>context.pushNamed(AppRoute.rolloverCompleteScreen),
            gradient: const LinearGradient(
              begin: Alignment(-1.00, 0.00),
              end: Alignment(1, 0),
              colors: [Color(0xFFAC46FF), Color(0xFF980FFA)],
            ),
          ),
        ],
      ],
    );
  }
}

class ActionCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color bg;
  final Color textCol;
  final bool isRecommended;
  final bool showFooter;
  final Gradient? gradient;
  final Color? borderColor;
  final void Function()? onTap;

  const ActionCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.bg,
    required this.textCol,
    this.isRecommended = false,
    this.showFooter = false,
    this.gradient,
    this.borderColor, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor ?? Colors.transparent),
          gradient: gradient,
          boxShadow: [
            if (bg == Colors.white)
              BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10),
          ],
        ),
        child: Column(
          children: [
            if (isRecommended)
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    LocaleKeys.recommended.tr(),
                    style: TextStyles.styleH1Bold12(context, color: Colors.white),
                  ),
                ),
              ),
            const SizedBox(height: 2),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyles.styleH1Bold18(context, color: textCol),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyles.styleParagraphRegular14(
                          context,
                          color: textCol.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward, color: textCol, size: 20),
              ],
            ),
            if (showFooter) ...[
              const SizedBox(height: 6),
              Text(
                LocaleKeys.nextMonthRegularBudget.tr(),
                style: TextStyles.styleParagraphRegular12(
                  context,
                  color: textCol.withValues(alpha: 0.8),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}