import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/core/widgets/arrow_back_widget.dart';
import 'package:payzabt/features/savings/views/widgets/savings_body.dart';

import '../../../config/export/export.dart';
import 'widgets/savings_tip_container.dart';

class SavingsView extends StatelessWidget {
  const SavingsView({super.key});

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
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(24),
              ),
              gradient: AppColors.appGradient1,
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        child: AppText(
                          text: LocaleKeys.savings.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular16(
                            context,
                            color: AppColors.textWhite,
                          ).copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  50.sizeBoxH,
                  AppText(
                    text: LocaleKeys.totalSavings.tr(),
                    appTextStyle: TextStyles.styleParagraphRegular14(
                      context,
                      color: AppColors.textWhite,
                    ),
                  ),
                  3.sizeBoxH,
                  AppText(
                    text: "20000 ${LocaleKeys.egp.tr()}",
                    appTextStyle: TextStyles.styleH1Bold32(
                      context,
                      color: AppColors.textWhite,
                    ).copyWith(fontWeight: FontWeight.w400),
                  ),
                  36.sizeBoxH,
                ],
              ).paddingOnly(top: 14.h, left: 20.w, right: 20.w),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  20.sizeBoxH,
                  SavingsTipContainer(),
                  20.sizeBoxH,
                  SavingsBody()
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
