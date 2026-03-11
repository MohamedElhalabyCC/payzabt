import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:payzabt/core/widgets/arrow_back_widget.dart';
import 'package:payzabt/features/envelops/views/widgets/delete_envelop_dialog.dart';
import 'package:payzabt/features/savings/views/widgets/dialog.dart';
import 'package:payzabt/features/transactions/views/widgets/categories_bottom_sheet.dart';

import '../../../config/export/export.dart';

class EditEnvelopScreen extends StatefulWidget {
  const EditEnvelopScreen({super.key});

  @override
  State<EditEnvelopScreen> createState() => _EditEnvelopScreenState();
}

class _EditEnvelopScreenState extends State<EditEnvelopScreen> {
  bool repeatEveryMonth = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                            text: LocaleKeys.envelopes.tr(),
                            appTextStyle: TextStyles.styleParagraphRegular16(
                              context,
                              color: AppColors.textWhite,
                            ).copyWith(fontWeight: FontWeight.w500),
                          ),
                          AppText(
                            text: LocaleKeys.setLimits.tr(),
                            appTextStyle: TextStyles.styleParagraphRegular12(
                              context,
                              color: AppColors.textWhite,
                            ),
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
                        Row(
                          children: [
                            Expanded(
                              child: AppButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppImageView(
                                      Assets.imagesSvgEditIcon,
                                      color: AppColors.textWhite,
                                      height: 16.h,
                                      width: 16.w,
                                    ),
                                    6.sizeBoxW,
                                    AppText(
                                      text: LocaleKeys.editEnvelope.tr(),
                                      appTextStyle: TextStyles.styleSemiBold14(
                                        context,
                                        color: AppColors.textWhite,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            12.sizeBoxW,
                            Expanded(
                              child: AppButton(
                                onTap: ()=>showAnimatedAutoDismissDialog(context, DeleteEnvelopDialogContent()),
                                background: Colors.white,
                                borderColor: AppColors.textError,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.delete,
                                      color: AppColors.textError,
                                      size: 18.h,
                                    ),
                                    6.sizeBoxW,
                                    AppText(
                                      text: LocaleKeys.delete.tr(),
                                      appTextStyle: TextStyles.styleSemiBold14(
                                        context,
                                        color: AppColors.textError,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        30.sizeBoxH,
                      ],
                    ).paddingOnly(right: 24, left: 24, top: 24),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
