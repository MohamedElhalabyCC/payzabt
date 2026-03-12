import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/core/widgets/arrow_back_widget.dart';
import 'package:payzabt/features/goals/views/widgets/completed_goals.dart';
import 'package:payzabt/features/goals/views/widgets/goals_body.dart';

import '../../../config/export/export.dart';

class GoalsView extends StatefulWidget {
  const GoalsView({super.key});

  @override
  State<GoalsView> createState() => _GoalsViewState();
}

class _GoalsViewState extends State<GoalsView> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _expansionKey = GlobalKey();

  void _scrollToSelectedContent() {
    // Wait for the animation to finish, then scroll
    Future.delayed(const Duration(milliseconds: 300), () {
      final context = _expansionKey.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.33,
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
                      Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topStart,
                            child: const ArrowBackWidget(),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              children: [
                                AppText(
                                  text: LocaleKeys.goals.tr(),
                                  appTextStyle: TextStyles.styleParagraphRegular16(
                                    context,
                                    color: AppColors.textWhite,
                                  ).copyWith(fontWeight: FontWeight.w500),
                                ),
                                AppText(
                                  text: LocaleKeys.trackProgress.tr(),
                                  appTextStyle: TextStyles.styleParagraphRegular12(
                                    context,
                                    color: AppColors.textWhite,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      20.sizeBoxH,
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          spacing: 4.h,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: LocaleKeys.totalSavedTowardGoals.tr(),
                                  appTextStyle: TextStyles.styleParagraphRegular12(
                                    context,
                                    color: Color(0xffCBFBF1),
                                  ),
                                ),
                                4.sizeBoxW,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AppText(
                                      text: LocaleKeys.inProgress.tr(),
                                      appTextStyle:
                                      TextStyles.styleParagraphRegular12(
                                        context,
                                        color: Color(0xff00FFA9),
                                      ),
                                    ),
                                    4.sizeBoxW,
                                    AppImageView(
                                      Assets.imagesSvgTrendUp,
                                      height: 14.h,
                                      width: 14.w,
                                    ),
                                  ],
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text: "8,000 ${LocaleKeys.egp.tr()}",
                                  appTextStyle: TextStyles.styleParagraphRegular12(
                                    context,
                                    color: AppColors.textWhite,
                                  ).copyWith(fontSize: 20),
                                ),
                                AppText(
                                  text: "2 ${LocaleKeys.activeGoals.tr()}",
                                  appTextStyle: TextStyles.styleParagraphRegular12(
                                    context,
                                    color: AppColors.textWhite,
                                  ).copyWith(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      20.sizeBoxH,
                    ],
                  ).paddingOnly(top: 14.h, left: 20.w, right: 20.w),
                ),
              ),
              GoalsBody(),
            ],
          ),
          12.sizeBoxH,
          CompletedGoalsSection( expansionKey:_expansionKey ,onExpansionChanged:_scrollToSelectedContent ,),
        ],
      ),
    );
  }
}
