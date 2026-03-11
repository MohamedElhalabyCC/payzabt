import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';

class AddIncomeBody extends StatefulWidget {
  const AddIncomeBody({super.key});

  @override
  State<AddIncomeBody> createState() => _AddIncomeBodyState();
}

class _AddIncomeBodyState extends State<AddIncomeBody> {
  bool isIncome = true;

  bool repeatEveryMonth = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        12.sizeBoxH,
        CustomTextField(
          hintText: LocaleKeys.addIncomeTitle.tr(),
          fillColor: Colors.white,
          title: LocaleKeys.title.tr(),
          titleColor: Color(0xff2F9A88),
          borderRadius: 12,
        ),
        12.sizeBoxH,
        CustomTextField(
          hintText: LocaleKeys.addIncomeAmount.tr(),
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
          onTap: () {},
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
        _buildRepeatSwitch(context),
        24.sizeBoxH,
        AppButton(
          title: LocaleKeys.addIncome.tr(),
          background: Color(0xff2F9A88),
        ),
      ],
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
