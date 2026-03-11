import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/core/widgets/arrow_back_widget.dart';
import 'package:payzabt/features/transactions/views/widgets/add_expense_body.dart';
import 'package:payzabt/features/transactions/views/widgets/add_income_body.dart';

import '../../../config/export/export.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  bool isIncome = true;
  bool repeatEveryMonth = false;
  ValueNotifier<bool> isIncomeNotifier = ValueNotifier(true);


  final Color primaryTeal = const Color(0xFF2F9A88);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(gradient: AppColors.appGradient),
          ),

          SafeArea(
            child: Column(
              children: [
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
                          ValueListenableBuilder(
                              valueListenable: isIncomeNotifier,
                              builder: (context, value, child) {
                                return AppText(
                                  text: isIncomeNotifier.value ? LocaleKeys.recordMoneyIn.tr():LocaleKeys.recordMoneyOut.tr(),
                                  appTextStyle: TextStyles.styleParagraphRegular12(
                                    context,
                                    color: AppColors.textWhite,
                                  ),
                                );
                              }
                          ),
                        ],
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 16, vertical: 8),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ValueListenableBuilder(
                            valueListenable: isIncomeNotifier,
                            builder: (context, value, child) {
                              return _buildToggle();
                            }
                        ),
                        16.sizeBoxH,
                        Expanded(
                          child: ValueListenableBuilder(
                              valueListenable: isIncomeNotifier,
                              builder: (context, value, child) {
                                return isIncomeNotifier.value ? AddIncomeBody():AddExpenseBody();
                              }
                          ),
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 24,
                      vertical: 24,),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggle() {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: const Color(0xFFE5E7EB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => isIncomeNotifier.value = true,
              child: Container(
                decoration: BoxDecoration(
                  color: isIncomeNotifier.value ? primaryTeal : Colors
                      .transparent,
                  borderRadius: BorderRadiusDirectional.horizontal(
                    start: Radius.circular(12),
                  ),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.income.tr(),
                      style: TextStyle(
                        color: isIncomeNotifier.value ? Colors.white : Color(0xff2F9A88),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    4.sizeBoxW,
                    AppImageView(
                      Assets.imagesSvgWalletIncome,
                      width: 18.w,
                      height: 18.h,
                      color: isIncomeNotifier.value
                          ? Colors.white
                          : primaryTeal,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => isIncomeNotifier.value = false,
              child: Container(
                decoration: BoxDecoration(
                  color: !isIncomeNotifier.value ? primaryTeal : Colors
                      .transparent,
                  borderRadius: BorderRadiusDirectional.horizontal(
                    end: Radius.circular(12),
                  ),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      LocaleKeys.expenses.tr(),
                      style: TextStyle(
                        color: !isIncomeNotifier.value ? Colors.white : Color(0xff2F9A88),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    4.sizeBoxW,
                    AppImageView(
                      Assets.imagesSvgExpensesIcon,
                      width: 18.w,
                      height: 18.h,
                      color: !isIncomeNotifier.value
                          ? Colors.white
                          : primaryTeal,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
