import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/features/transactions/views/widgets/categories_bottom_sheet.dart';

import '../../../../config/export/export.dart';

class CreateEnvelopBody extends StatefulWidget {
  const CreateEnvelopBody({super.key});

  @override
  State<CreateEnvelopBody> createState() => _CreateEnvelopBodyState();
}

class _CreateEnvelopBodyState extends State<CreateEnvelopBody> {
  bool repeatEveryMonth = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          12.sizeBoxH,
          CustomTextField(
            hintText: LocaleKeys.addIncomeAmount.tr(),
            fillColor: Colors.white,
            title: LocaleKeys.amount.tr(),
            borderRadius: 12,
          ),
          12.sizeBoxH,
          CustomTextField(
            hintText: LocaleKeys.chooseCategory.tr(),
            fillColor: Colors.white,
            title: LocaleKeys.category.tr(),
            borderRadius: 12,
            onTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              // Allows the sheet to expand beyond half-screen
              useSafeArea: true,
              backgroundColor: Colors.transparent,
              builder: (_) => CategoriesBottomSheet(),
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
          _buildRepeatSwitch(context),
          24.sizeBoxH,
          Spacer(),
          AppButton(title: LocaleKeys.createEnvelope.tr()),
          30.sizeBoxH,
        ],
      ).paddingOnly(right: 24, left: 24, top: 24),
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
                color: AppColors.lightSecondary,
              ),
            ),
            AppText(
              text: LocaleKeys.autoAddedEveryMonth.tr(),
              appTextStyle: TextStyles.styleParagraphRegular12(
                context,
                color: AppColors.lightSecondary,
              ),
            ),
          ],
        ),
        Switch(
          value: repeatEveryMonth,
          activeColor: AppColors.lightSecondary,
          inactiveTrackColor: Colors.white,
          inactiveThumbColor: AppColors.lightSecondary,
          trackOutlineColor: WidgetStatePropertyAll(AppColors.lightSecondary),
          onChanged: (val) => setState(() => repeatEveryMonth = val),
        ),
      ],
    );
  }
}
