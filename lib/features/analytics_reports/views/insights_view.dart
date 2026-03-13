import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../config/export/export.dart';
import '../../../core/widgets/arrow_back_widget.dart';

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      horizontalPadding: 0,
      verticalPadding: 0,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              gradient: AppColors.appGradient1,
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  8.sizeBoxH,
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: const ArrowBackWidget(),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: AppText(
                          text: LocaleKeys.insights.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular16(
                            context,
                            color: AppColors.textWhite,
                          ).copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  6.sizeBoxH,
                  AppText(
                    text: LocaleKeys.understandingSpendingBehavior.tr(),
                    appTextStyle: TextStyles.styleParagraphRegular12(
                      context,
                      color: const Color(0xffCBFBF1),
                    ),
                  ),
                  36.sizeBoxH,
                ],
              ).paddingOnly(top: 14.h, left: 20.w, right: 20.w),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.sizeBoxH,
                  _SectionHeader(
                    icon: Icons.calendar_today_outlined,
                    title: LocaleKeys.thisMonth.tr(),
                  ),
                  const SpendingSummaryCard(
                    totalAmount: "32,500",
                    percentageChange: "-8%",
                    isIncrease: false,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    LocaleKeys.weeklySpending.tr(),
                    style: TextStyles.styleParagraphRegular16(
                      context,
                    ),
                  ),
                  const SizedBox(height: 12),
                  WeeklySpendingCard(
                    weeklyData: [
                      {"label": "${LocaleKeys.week.tr()} 1", "amount": "5,000", "percent": 0.4},
                      {"label": "${LocaleKeys.week.tr()} 2", "amount": "7,000", "percent": 0.55},
                      {"label": "${LocaleKeys.week.tr()} 3", "amount": "10,000", "percent": 0.8},
                      {"label": "${LocaleKeys.week.tr()} 4", "amount": "12,000", "percent": 0.95},
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Category Trends",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF344054),
                    ),
                  ),
                  const SizedBox(height: 12),
                  CategoryTrendCard(
                    category: "Food",
                    amount: "12,500",
                    trend: "19%",
                    isIncrease: true,
                    icon: Assets.imagesSvgHamburger,
                    iconColor: Color(0xFFFDB022),
                    insightText:
                        "Your food spending increased by 19% compared to last month.",
                  ),
                  const SizedBox(height: 16),
                   CategoryTrendCard(
                    category: "Shopping",
                    amount: "8,500",
                    trend: "8%",
                    isIncrease: false,
                    icon: Assets.imagesSvgShoppingCart,
                    iconColor: Color(0xFF7F56D9),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SectionHeader({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF4A5565)),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyles.styleParagraphRegular16(
              context,
              color: Color(0xFF475467),
            ),
          ),
        ],
      ),
    );
  }
}

class SpendingSummaryCard extends StatelessWidget {
  final String totalAmount;
  final String percentageChange;
  final bool isIncrease;

  const SpendingSummaryCard({
    super.key,
    required this.totalAmount,
    required this.percentageChange,
    required this.isIncrease,
  });

  @override
  Widget build(BuildContext context) {
    final trendColor = isIncrease
        ? const Color(0xFF10B981)
        : const Color(0xFFF04438);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: _cardDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                LocaleKeys.totalSpent.tr(),
                style: TextStyles.styleParagraphRegular14(context,color:AppColors.subText,),
              ),
              const SizedBox(height: 4),
              Text(
                totalAmount,
                style: TextStyles.styleParagraphRegular24(
                  context,
                ).copyWith(fontSize: 30),
              ),
              Text(
                LocaleKeys.egp.tr(),
                style:  TextStyles.styleParagraphRegular14(context,color:AppColors.subText,),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.vsLastMonth.tr(),
                style:  TextStyles.styleParagraphRegular14(context,color:AppColors.subText,),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    isIncrease ? Icons.trending_up : Icons.trending_down,
                    color: trendColor,
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    percentageChange,
                    style: TextStyles.styleParagraphRegular16(
                      context,
                      color: trendColor,
                    ).copyWith(fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WeeklySpendingCard extends StatelessWidget {
  final List<Map<String, dynamic>> weeklyData;

  const WeeklySpendingCard({super.key, required this.weeklyData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20,left: 20,top: 24,bottom: 14),
      decoration: _cardDecoration(),
      child: Column(
        children: weeklyData.map((data) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['label'],
                  style: TextStyles.styleParagraphRegular14(
                    context,
                    color:AppColors.textGreyed,
                  ),
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearPercentIndicator(
                    lineHeight: 8.0,
                    animation: true,
                    animationDuration: 1000,
                    percent: data['percent'],
                    barRadius: const Radius.circular(5.0),
                    progressColor: const Color(0xff00BBA7),
                    backgroundColor: Color(0xff030213).withValues(alpha: 0.2),
                    padding: EdgeInsets.zero,
                  )
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${LocaleKeys.egp.tr()} ${data['amount']}",
                    style: TextStyles.styleParagraphBold16(
                      context,
                      color: Color(0xFF00BC7D),
                    ).copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CategoryTrendCard extends StatelessWidget {
  final String category;
  final String amount;
  final String trend;
  final bool isIncrease;
  final String icon;
  final Color iconColor;
  final String? insightText;

  const CategoryTrendCard({
    super.key,
    required this.category,
    required this.amount,
    required this.trend,
    required this.isIncrease,
    required this.icon,
    required this.iconColor,
    this.insightText,
  });

  @override
  Widget build(BuildContext context) {
    final trendColor = isIncrease
        ? const Color(0xFF10B981)
        : const Color(0xFFF04438);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: AppImageView(icon, color: iconColor,height:26.h ,width: 26.w,),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: TextStyles.styleParagraphRegular16(
                        context
                      ).copyWith(fontFamily: "Arimo"),
                    ),
                    Text(
                      "$amount ${LocaleKeys.egp.tr()}",
                      style: TextStyles.styleParagraphRegular12(
                        context,
                        color: AppColors.subText,
                      ).copyWith(fontFamily: "Arimo"),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    isIncrease ? Icons.trending_up : Icons.trending_down,
                    color: trendColor,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    trend,
                    style: TextStyles.styleParagraphRegular14(
                      context,
                      color: trendColor,
                    ).copyWith(fontFamily: "Arimo"),
                  ),
                ],
              ),
            ],
          ),
          if (insightText != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFBEB),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFFEE685)),
              ),
              child: Text(
                insightText!,
                style: TextStyles.styleParagraphRegular12(
                  context,
                  color: Color(0xFF973C00),
                ).copyWith(fontFamily: "Arimo"),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// Global helper for card styling
BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(24),
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
  );
}
