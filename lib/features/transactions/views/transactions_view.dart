import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../config/export/export.dart';
import '../../../core/widgets/arrow_back_widget.dart';
import '../../home/views/widgets/transaction_card.dart';

class TransactionsView extends StatefulWidget {
  const TransactionsView({super.key});

  @override
  State<TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> {
  ValueNotifier<int> selectedCategory = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      horizontalPadding: 0,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              gradient: AppColors.appGradient1,
            ),
            child: SafeArea(
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
                              text: LocaleKeys.transactions.tr(),
                              appTextStyle: TextStyles.styleParagraphRegular16(
                                context,
                                color: AppColors.textWhite,
                              ).copyWith(fontWeight: FontWeight.w500),
                            ),
                            AppText(
                              text: LocaleKeys.reviewRecentActivity.tr(),
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
                  CustomTextField(
                    hintText: LocaleKeys.searchTransactions.tr(),
                    borderRadius: 16,
                    hintStyle: TextStyles.styleParagraphRegular16(
                      context,
                      color: Colors.white,
                    ).copyWith(fontFamily: "Arimo"),
                    prefixIcon: Icon(
                      CupertinoIcons.search,
                      color: Colors.white,
                    ),
                    fillColor: Colors.white.withValues(alpha: 0.2),
                    enabledColor: Colors.transparent,
                    focusColor: Colors.transparent,
                  ),
                  20.sizeBoxH,
                  ValueListenableBuilder(
                    valueListenable: selectedCategory,
                    builder: (context, value, child) {
                      return IntrinsicWidth(
                        child: Row(
                          children: [
                            Expanded(
                              child: buildCategoryItem(
                                text: LocaleKeys.expenses.tr(),
                                context: context,
                                isSelected: selectedCategory.value == 0,
                                onTap: () {
                                  selectedCategory.value = 0;
                                },
                              ),
                            ),
                            12.sizeBoxW,
                            Expanded(
                              child: buildCategoryItem(
                                text: LocaleKeys.income.tr(),
                                context: context,
                                isSelected: selectedCategory.value == 1,
                                onTap: () {
                                  selectedCategory.value = 1;
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  26.sizeBoxH,
                ],
              ).paddingOnly(top: 14.h, left: 20.w, right: 20.w),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              shrinkWrap: true,
              itemBuilder: (context, index) => TransactionCard(
                title: "Internet",
                date: "12 jan 2022",
                method: "In Cash",
                cost: "500",
                color: Color(0xffC1C1C5).withValues(alpha: 0.4),
              ).paddingOnly(bottom: 16.h,top: index==0?16.h:0),
            ),
          ),

        ],
      ),
    );
  }

  Widget buildCategoryItem({
    required BuildContext context,
    required String text,
    required void Function() onTap,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white
              : Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(99),
        ),
        child: AppText(
          text: text,
          appTextStyle: TextStyles.styleParagraphRegular14(
            context,
            color: isSelected ? const Color(0xff2F9A88) : AppColors.textWhite,
          ),
        ),
      ),
    );
  }
}
