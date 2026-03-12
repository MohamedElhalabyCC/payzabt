
import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';

class CreateGoalDialogContent extends StatelessWidget {
  const CreateGoalDialogContent({
    super.key, required this.isEdit,
  });
  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: InkWell(onTap: () => context.pop(),
                    child: const Icon(Icons.close, color: Colors.black, size: 22,)),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AppText(
                  text: isEdit?LocaleKeys.editGoal.tr():LocaleKeys.createNewGoal.tr(),
                  appTextStyle: TextStyles.styleH1Bold18(context),
                ),
              ),
            ],
          ),
          14.sizeBoxH,
          CustomTextField(
            hintText: "e.g., Emergency Fund, New Laptop",
            title: LocaleKeys.goalName.tr(),
            focusColor: Colors.transparent,
            enabledColor: Colors.transparent,
            validator: (_) {
              return;
            },
            hintStyle: TextStyles.styleParagraphRegular16(
                context, color: Colors.black26.withValues(alpha: 0.5)),
            tPadding: 0,
            bPadding: 0,
            lPadding: 8.w,
            rPadding: 8.w,
          ),
          14.sizeBoxH,
          CustomTextField(
            hintText: "0",
            title: LocaleKeys.targetAmount.tr(),
            focusColor: Colors.transparent,
            enabledColor: Colors.transparent,
            validator: (_) {
              return;
            },
            hintStyle: TextStyles.styleParagraphRegular16(
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
          24.sizeBoxH,
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
                title: isEdit?LocaleKeys.saveChanges.tr():LocaleKeys.createGoal.tr(),
                onTap: () => context.pop(),
              )),
            ],
          ),

        ],
      ),
    );
  }
}

class DeleteGoalDialogContent extends StatelessWidget {
  const DeleteGoalDialogContent({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 24.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: InkWell(onTap: () => context.pop(),
                    child: const Icon(Icons.close, color: Colors.black, size: 22,)),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AppText(
                  text: title,
                  appTextStyle: TextStyles.styleH1Bold18(context),
                ),
              ),
            ],
          ),
          12.sizeBoxH,
          AppText(
            text: LocaleKeys.deleteGoalConfirmation.tr(),
            appTextStyle: TextStyles.styleParagraphRegular14(
                context, color: AppColors.activeDot),
          ).paddingHorizontalOnly(16.w),
          20.sizeBoxH,
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
                title: LocaleKeys.deleteGoal.tr(),
                onTap: () => context.pop(),
                background: AppColors.textError,
              )),
            ],
          ),

        ],
      ),
    );
  }
}
