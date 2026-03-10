import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/core/widgets/custom_drop_down_menu.dart';

import '../../../../config/export/export.dart';

void showAnimatedAutoDismissDialog(BuildContext context,
    Widget child, {
      VoidCallback? afterClose,
    }) {
  BuildContext? dialogContext;

  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: 'AutoDismissDialog',
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (ctx, animation, secondaryAnimation) {
      dialogContext = ctx;
      return Center(
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          insetPadding: EdgeInsets.all(16),
          child: child,
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final curvedValue = Curves.easeInOut.transform(animation.value);
      return Transform.scale(
        scale: curvedValue,
        child: Opacity(opacity: animation.value, child: child),
      );
    },
  );
}

class EditSavingDialogContent extends StatelessWidget {
  const EditSavingDialogContent({
    super.key,
    // this.icon,
    // required this.title,
    // this.subtitle,
    // this.child,
  });

  //
  // final String? icon;
  // final Widget? child;
  // final String title;
  // final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: InkWell(onTap: () => context.pop(),
                child: Icon(Icons.close, color: Colors.black, size: 22,)),
          ),
          AppText(
            text: LocaleKeys.editTotalSavings.tr(),
            appTextStyle: TextStyles.styleH1Bold18(context),
          ),
          6.sizeBoxH,
          AppText(
            text: LocaleKeys.updateTotalSaving.tr(),
            appTextStyle: TextStyles.styleParagraphRegular14(
                context, color: AppColors.activeDot),
          ),
          20.sizeBoxH,
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Color(0xFFEEF3FE),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1.35, color: Color(0xFF077AAD)),
            ),
            child: ListTile(
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              title:
              AppText(
                text: LocaleKeys.currentSaving.tr(),
                appTextStyle: TextStyles.styleParagraphRegular14(
                  context,
                  color: AppColors.lightSecondary,
                ),
              ),
              subtitle: Row(
                children: [
                  AppText(
                    text: "50,000"" ",
                    appTextStyle: TextStyles.styleParagraphRegular24(
                      context,
                      color: Color(0xff0E4D6C),
                    ).copyWith(fontSize: 20.sp),),
                  AppText(
                    text: LocaleKeys.egp.tr(),
                    appTextStyle: TextStyles.styleParagraphRegular14(
                      context,
                      color: Color(0xff0E4D6C),
                    ),
                  )
                ],
              ),
            ),
          ),
          14.sizeBoxH,
          CustomTextField(
            hintText: "50000",
            title: "${LocaleKeys.newSavingAmount.tr()} (${LocaleKeys.egp
                .tr()})",
            titleColor: Colors.black,
            focusColor: Colors.transparent,
            enabledColor: Colors.transparent,
            validator: (_) {
              return;
            },
            hintStyle: TextStyles.styleParagraphRegular24(
                context, color: Colors.black26.withValues(alpha: 0.5)),
            tPadding: 0,
            bPadding: 0,
            lPadding: 8.w,
            rPadding: 8.w,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          14.sizeBoxH,
          Row(
            children: [
              Expanded(child: AppButton(
                title: LocaleKeys.cancel.tr(),
                background: Colors.white,
                borderColor: Colors.black.withValues(alpha: 0.1),
                textColor: Colors.black,
                onTap: () => context.pop(),
              )),
              10.sizeBoxW,
              Expanded(child: AppButton(
                title: LocaleKeys.saveChanges.tr(),
                onTap: () => context.pop(),
              )),
            ],
          ),

        ],
      ),
    );
  }
}

class AllocateToGoalDialogContent extends StatelessWidget {
  const AllocateToGoalDialogContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: InkWell(onTap: () => context.pop(),
                child: Icon(Icons.close, color: Colors.black, size: 22,)),
          ),
          AppText(
            text: LocaleKeys.allocateToGoal.tr(),
            appTextStyle: TextStyles.styleH1Bold18(context),
          ),
          6.sizeBoxH,
          AppText(
            text: LocaleKeys.allocatePortionToGoal.tr(),
            appTextStyle: TextStyles.styleParagraphRegular14(
                context, color: AppColors.activeDot),
          ),
          20.sizeBoxH,
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: Color(0xFFF0FDFA),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1.35, color: Color(0xFF96F7E4)),
            ),
            child: ListTile(
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              title:
              AppText(
                text: LocaleKeys.currentSaving.tr(),
                appTextStyle: TextStyles.styleParagraphRegular14(
                  context,
                  color: Color(0xff00786F),
                ),
              ),
              subtitle: Row(
                children: [
                  AppText(
                    text: "25,000"" ",
                    appTextStyle: TextStyles.styleParagraphRegular24(
                      context,
                      color: Color(0xff0B4F4A),
                    ).copyWith(fontSize: 20.sp),),
                  AppText(
                    text: LocaleKeys.egp.tr(),
                    appTextStyle: TextStyles.styleParagraphRegular14(
                      context,
                      color: Color(0xff0B4F4A),
                    ),
                  )
                ],
              ),
            ),
          ),
          14.sizeBoxH,
          CustomTextField(
            hintText: "50000",
            title: "${LocaleKeys.newSavingAmount.tr()} (${LocaleKeys.egp
                .tr()})",
            titleColor: Colors.black,
            focusColor: Colors.transparent,
            enabledColor: Colors.transparent,
            validator: (_) {
              return;
            },
            hintStyle: TextStyles.styleParagraphRegular24(
                context, color: Colors.black26.withValues(alpha: 0.5)),
            tPadding: 0,
            bPadding: 0,
            lPadding: 8.w,
            rPadding: 8.w,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          14.sizeBoxH,
          CustomDropDownMenu(
            dropdownMenuEntries: ["item1","item2","item3","item4",],
            onSubmit: (value) {},
            childBuilder: (value) => AppText(
              text: value?.toString() ?? '',
              appTextStyle: TextStyles.styleParagraphRegular14(context),
            ),
            selectedItemBuilder: (value) => AppText(
              text: value?.toString() ?? '',
              appTextStyle: TextStyles.styleParagraphRegular14(context),
            ),
            hintText: '',
          ),
          14.sizeBoxH,
          Row(
            children: [
              Expanded(child: AppButton(
                title: LocaleKeys.cancel.tr(),
                background: Colors.white,
                borderColor: Colors.black.withValues(alpha: 0.1),
                textColor: Colors.black,
                onTap: () => context.pop(),
              )),
              10.sizeBoxW,
              Expanded(child: AppButton(
                title: LocaleKeys.saveChanges.tr(),
                onTap: () => context.pop(),
              )),
            ],
          ),

        ],
      ),
    );
  }
}
