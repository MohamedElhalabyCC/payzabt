import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';

class LogOutDialogContent extends StatelessWidget {
  const LogOutDialogContent({
    super.key,
  });


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
                  text: LocaleKeys.logout.tr(),
                  appTextStyle: TextStyles.styleH1Bold18(context),
                ),
              ),
            ],
          ),
          12.sizeBoxH,
          AppText(
            text: LocaleKeys.logoutConfirmation.tr(),
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
                title: LocaleKeys.logout.tr(),
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
