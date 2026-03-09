import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';

class BudgetManagementContainer extends StatefulWidget {
  final int index;
  const BudgetManagementContainer({super.key, this.index = 0});

  @override
  State<BudgetManagementContainer> createState() =>
      _BudgetManagementContainerState();
}

class _BudgetManagementContainerState extends State<BudgetManagementContainer> {
  ValueNotifier<int> counter = ValueNotifier(0);
  TextEditingController dayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        spacing: 20.h,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (MediaQuery.of(context).size.height * 0.22).sizeBoxH,
          AppMainContainer(
            hPadding: 18.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20.h,
              children: [
                AppText(
                  text: widget.index == 0
                      ? LocaleKeys.selectDayOfMonth.tr()
                      : widget.index == 1
                      ? LocaleKeys.whatIsYourMonthlyIncome.tr()
                      : widget.index == 2
                      ? LocaleKeys.setMonthlyBudget.tr()
                      : LocaleKeys.howMuchSavedSoFar.tr(),
                  appTextStyle: TextStyles.styleParagraphRegular14(
                    context,
                    color: Color(0xff364153),
                  ),
                ),
                if (widget.index == 0)
                  ValueListenableBuilder(
                    valueListenable: counter,
                    builder: (context, value, child) {
                      return Row(
                        children: List.generate(7, (index) {
                          final days = ["1", "5", "10", "15", "20", "25", "30"];
                          final isSelected = counter.value == index;
                          return Expanded(
                            child: InkWell(
                              onTap: () {
                                counter.value = index;
                                dayController.value = TextEditingValue(
                                  text: days[index].toString(),
                                );
                              },
                              child:
                                  Container(
                                    height: 45.h,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? AppColors.lightSecondary
                                          : Color(0xFFF3F4F6),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: AppText(
                                        text: days[index].toString(),
                                        appTextStyle:
                                            TextStyles.styleParagraphRegular16(
                                              context,
                                              color: isSelected
                                                  ? Colors.white
                                                  : null,
                                            ).copyWith(fontFamily: "Arimo"),
                                      ),
                                    ),
                                  ).paddingOnlyDirectional(
                                    end: index == days.length - 1 ? 0 : 4.w,
                                  ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                if(widget.index == 0)AppText(
                  text: LocaleKeys.enterSpecificDay.tr(),
                  appTextStyle: TextStyles.styleParagraphRegular14(
                    context,
                    color: Color(0xff364153),
                  ),
                ),
                CustomTextField(
                  controller: dayController,
                  hintText: widget.index == 0
                      ? LocaleKeys.dayOfMonthRange.tr()
                      : "0",
                  focusColor: Colors.transparent,
                  enabledColor: Colors.transparent,
                  validator: (_) {
                    return;
                  },
                  hintStyle: TextStyles.styleParagraphRegular24(context,color: Colors.black26.withValues(alpha: 0.5)),
                  maxLength: widget.index == 0 ? 2 : 10,
                  showCounter: false,
                  tPadding: 0,
                  bPadding: 0,
                  lPadding: 8.w,
                  rPadding: 8.w,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    if (widget.index == 0)
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        if (newValue.text.isEmpty) {
                          return newValue;
                        }
                        final int? value = int.tryParse(newValue.text);
                        if (value == null || value < 1 || value > 31) {
                          return oldValue;
                        }
                        return newValue;
                      }),
                  ],
                  suffixIcon: AppText(
                    text: widget.index == 0
                        ? LocaleKeys.day.tr()
                        : LocaleKeys.egp.tr(),
                    appTextStyle: TextStyles.styleParagraphRegular14(
                      context,
                      color: Color(0xff6A7282),
                    ),
                  ),
                ),
                if (widget.index == 1||widget.index == 3)AppText(
                  text:widget.index == 1?LocaleKeys.incomeUnderstandingTip.tr():LocaleKeys.skipSavingsStep.tr(),
                  appTextStyle: TextStyles.styleParagraphRegular14(
                    context,
                    color: Color(0xff6A7282),
                  ),
                ),
              ],
            ).paddingSymmetric(vertical: 6.h),
          ),
          1.sizeBoxH,
        ],
      ),
    ).paddingSymmetric(horizontal: 22.w);
  }
}
