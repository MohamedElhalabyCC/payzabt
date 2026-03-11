import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';
import '../../../../core/widgets/custom_drop_down_menu.dart';
import 'categories_bottom_sheet.dart';

class AddExpenseBody extends StatefulWidget {
  const AddExpenseBody({super.key});

  @override
  State<AddExpenseBody> createState() => _AddExpenseBodyState();
}

class _AddExpenseBodyState extends State<AddExpenseBody> {
  bool isIncome = true;

  bool repeatEveryMonth = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints) {
        return SingleChildScrollView(
          child:ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.sizeBoxH,
                CustomTextField(
                  hintText: LocaleKeys.addExpensesTitle.tr(),
                  fillColor: Colors.white,
                  title: LocaleKeys.title.tr(),
                  titleColor: Color(0xff2F9A88),
                  borderRadius: 12,
                ),
                12.sizeBoxH,
                CustomTextField(
                  hintText: LocaleKeys.addExpensesAmount.tr(),
                  fillColor: Colors.white,
                  title: LocaleKeys.amount.tr(),
                  titleColor: Color(0xff2F9A88),
                  borderRadius: 12,
                ),
                12.sizeBoxH,
                CustomTextField(
                  hintText: LocaleKeys.chooseCategory.tr(),
                  fillColor: Colors.white,
                  title: LocaleKeys.category.tr(),
                  titleColor: Color(0xff2F9A88),
                  borderRadius: 12,
                  onTap: ()=> showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // Allows the sheet to expand beyond half-screen
                    useSafeArea: true,
                    backgroundColor: Colors.transparent,
                    builder:
                        (_) => CategoriesBottomSheet(),
                  ),
                  validator: (_) {
                    return;
                  },
                  readOnly: true,
                  enabledColor: const Color(0xffD8DADC),
                  focusColor: const Color(0xffD8DADC),
                  enabled: false,
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xff717182),
                    size: 22,
                  ),
                ),
                12.sizeBoxH,
                CustomDropDownMenu(
                  dropdownMenuEntries: ["Cash", "Apple Pay", "Bank Transfer"],
                  onSubmit: (value) {},
                  title: LocaleKeys.paymentMethod.tr(),
                  titleColor: const Color(0xff2F9A88),
                  iconColor:const  Color(0xff717182),
                  childBuilder: (value) => AppText(
                    text: value?.toString() ?? '',
                    appTextStyle: TextStyles.styleParagraphRegular14(context),
                  ),
                  selectedItemBuilder: (value) => AppText(
                    text: value?.toString() ?? '',
                    appTextStyle: TextStyles.styleParagraphRegular14(context),
                  ),
                  hintText: LocaleKeys.paymentMethod.tr(),
                  fillColor: Colors.white,
                  enabledColor: const Color(0xffD8DADC),
                  focusColor: const Color(0xffD8DADC),
                ),
                12.sizeBoxH,
                CustomTextField(
                  hintText: LocaleKeys.addExtraNote.tr(),
                  fillColor: Colors.white,
                  title: LocaleKeys.note.tr(),
                  titleColor: Color(0xff2F9A88),
                  borderRadius: 12,
                ),
                12.sizeBoxH,
                _buildRepeatSwitch(context),
                24.sizeBoxH,
                AppButton(
                  title: LocaleKeys.addExpense.tr(),
                  background: Color(0xff2F9A88),
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _buildRepeatSwitch(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: LocaleKeys.repeatEveryMonth.tr(),
              appTextStyle: TextStyles.styleSemiBold14(
                context,
                color: Color(0xff2F9A88),
              ),
            ),
            AppText(
              text: LocaleKeys.autoAddedEveryMonth.tr(),
              appTextStyle: TextStyles.styleParagraphRegular12(
                context,
                color: Color(0xff2F9A88),
              ),
            ),
          ],
        ),
        Switch(
          value: repeatEveryMonth,
          activeColor: Color(0xff2F9A88),
          inactiveTrackColor: Colors.white,
          inactiveThumbColor: Color(0xff2F9A88),
          trackOutlineColor: WidgetStatePropertyAll(Color(0xff2F9A88)),
          onChanged: (val) => setState(() => repeatEveryMonth = val),
        ),
      ],
    );
  }
}
