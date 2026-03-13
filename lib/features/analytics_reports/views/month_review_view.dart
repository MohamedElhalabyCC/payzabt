import 'package:easy_localization/easy_localization.dart';

import '../../../config/export/export.dart';
import '../../../core/widgets/arrow_back_widget.dart';

class MonthReviewScreen extends StatelessWidget {
  final bool isOverBudget;

  const MonthReviewScreen({super.key, this.isOverBudget = true});

  @override
  Widget build(BuildContext context) {

    return AppScaffold(
      horizontalPadding: 0,
      verticalPadding: 0,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              gradient: AppColors.appGradient1,
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  8.sizeBoxH,
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: const ArrowBackWidget(),
                  ),
                  Align(
                    alignment: AlignmentGeometry.bottomCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppText(
                          text: !isOverBudget
                              ? LocaleKeys.youSavedMoneyThisMonth.tr()
                              : LocaleKeys.thisMonthWasHeavy.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular16(
                            context,
                            color: AppColors.textWhite,
                          ).copyWith(fontWeight: FontWeight.w500),
                        ),
                        4.sizeBoxH,
                        AppText(
                          text: !isOverBudget
                              ? LocaleKeys.whatWouldYouLikeToDo.tr()
                              : LocaleKeys.letsDecideHowToHandle.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular12(
                            context,
                            color: AppColors.textWhite,
                          ),
                        ),
                        12.sizeBoxH,
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              AppText(
                                text: !isOverBudget
                                    ? LocaleKeys.totalRemaining.tr()
                                    : LocaleKeys.overBudget.tr(),
                                appTextStyle:
                                    TextStyles.styleParagraphRegular14(
                                      context,
                                      color: AppColors.textGreyed,
                                    ),
                              ),
                              AppText(
                                text:
                                    "${3500.toCommaSeparated()} ${LocaleKeys.egp.tr()}",
                                appTextStyle:
                                    TextStyles.styleH1Bold32(
                                      context,
                                      color: AppColors.textWhite,
                                    ).copyWith(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        26.sizeBoxH,
                      ],
                    ),
                  ),
                  20.sizeBoxH,
                ],
              ).paddingOnly(top: 14.h, left: 20.w, right: 20.w),
            ),
          ),

          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        _buildTipBox(context, isOverBudget),
                        const SizedBox(height: 24),
                        _buildBreakdownSection(context, isOverBudget),
                        const SizedBox(height: 24),
                        _buildActionSection(context, isOverBudget),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipBox(BuildContext context, bool overBudget) {
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

  Widget _buildBreakdownSection(BuildContext context, bool overBudget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          overBudget ? LocaleKeys.whatWentOver.tr() : LocaleKeys.breakdown.tr(),
          style: TextStyles.styleParagraphRegular16(
            context,
          ).copyWith(fontFamily: "Arimo"),
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
              _rowItem(context, "Food", "+1,500", Colors.orange, overBudget),
              const Divider(
                color: Color(0xffF3F4F6),
                thickness: 1,
              ).paddingVerticalOnly(4),
              _rowItem(
                context,
                "Shopping",
                "+2,000",
                Colors.purple,
                overBudget,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _rowItem(
    BuildContext context,
    String label,
    String value,
    Color dotColor,
    bool overBudget,
  ) {
    return Row(
      children: [
        CircleAvatar(radius: 4, backgroundColor: dotColor),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyles.styleParagraphRegular16(
            context,
            color: Color(0xFF364153),
          ),
        ),
        const Spacer(),
        Text(
          "$value ${LocaleKeys.egp.tr()}",
          style: TextStyles.styleParagraphRegular16(
            context,
            color: overBudget
                ? const Color(0xFFE7000B)
                : const Color(0xFF00BC7D),
          ),
        ),
      ],
    );
  }

  Widget _buildActionSection(context, bool overBudget) {
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
          _actionCard(
            context,
            LocaleKeys.carryItForward.tr(),
            "${LocaleKeys.nextMonthStartsWithMinus.tr()} 300 EGP",
            Color(0xffF3F4F6),
            Colors.black87,
            false,
            borderColor: const Color(0xffD1D5DC)
          ),
          const SizedBox(height: 16),
          _actionCard(
            context,
            LocaleKeys.startFresh.tr(),
            LocaleKeys.resetBudgetNextMonth.tr(),
            const Color(0xFF039855),
            Colors.white,
            true,
            gradient: LinearGradient(
              begin: Alignment(-0.01, -1.00),
              end: Alignment(0.01, 1),
              colors: [Color(0xFF00C850), Color(0xFF009865)],
            )
          ),
        ] else ...[
          _actionCard(
            context,
            LocaleKeys.saveIt.tr(),
            LocaleKeys.moveMoneyToSavings.tr(),
            const Color(0xFF2970FF),
            Colors.white,
            false,
            gradient: LinearGradient(
              begin: Alignment(-1.00, 0.00),
              end: Alignment(1, 0),
              colors: [Color(0xFF2B7FFF), Color(0xFF155CFB)],
            ),
          ),
          const SizedBox(height: 16),
          _actionCard(
            context,
            LocaleKeys.rollover.tr(),
            LocaleKeys.addToNextMonthBudget.tr(),
            const Color(0xFF9E77ED),
            Colors.white,
            false,
            gradient: LinearGradient(
              begin: Alignment(-1.00, 0.00),
              end: Alignment(1, 0),
              colors: [Color(0xFFAC46FF), Color(0xFF980FFA)],
            ),
          ),
        ],
      ],
    );
  }

  Widget _actionCard(
      BuildContext context,
    String title,
    String subtitle,
    Color bg,
    Color textCol,
    bool isRecommended, {
    Gradient? gradient,
    Color? borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor?? Colors.transparent),
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
                  style: TextStyles.styleH1Bold12(
                    context,
                    color: Colors.white,
                  ),
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
                      style: TextStyles.styleH1Bold18(
                        context,
                        color: textCol,
                      ),
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
          if(isRecommended)...[
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
    );
  }
}
