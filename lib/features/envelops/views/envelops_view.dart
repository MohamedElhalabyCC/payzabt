import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/features/envelops/views/widgets/create_envelop_body.dart';
import 'package:payzabt/features/envelops/views/widgets/on_track_envelops_body.dart';

import '../../../config/export/export.dart';

class EnvelopsScreen extends StatefulWidget {
  const EnvelopsScreen({super.key});

  @override
  State<EnvelopsScreen> createState() => _EnvelopsScreenState();
}

class _EnvelopsScreenState extends State<EnvelopsScreen> {
  bool repeatEveryMonth = false;
  ValueNotifier<bool> isIncomeNotifier = ValueNotifier(true);


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
            bottom: false,
            child: Column(
              children: [
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
                ).paddingSymmetric(horizontal: 16, vertical: 12),
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
                        ).paddingOnly(right: 24,left: 24,top: 24,),
                        16.sizeBoxH,
                        Expanded(
                          child: ValueListenableBuilder(
                              valueListenable: isIncomeNotifier,
                              builder: (context, value, child) {
                                return isIncomeNotifier.value ? OnTrackEnvelopsBody():CreateEnvelopBody();
                              }
                          ),
                        ),
                      ],
                    ),
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
                  color: isIncomeNotifier.value ? AppColors.lightSecondary : Colors
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
                      LocaleKeys.onTrack.tr(),
                      style: TextStyle(
                        color: isIncomeNotifier.value ? Colors.white : AppColors.lightSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    4.sizeBoxW,
                    AppImageView(
                      Assets.imagesSvgOnTrackIcon,
                      width: 18.w,
                      height: 18.h,
                      color: isIncomeNotifier.value
                          ? Colors.white
                          : AppColors.lightSecondary,
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
                  color: !isIncomeNotifier.value ? AppColors.lightSecondary : Colors
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
                      LocaleKeys.create.tr(),
                      style: TextStyle(
                        color: !isIncomeNotifier.value ? Colors.white : AppColors.lightSecondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    4.sizeBoxW,
                    AppImageView(
                      Assets.imagesSvgEnvelopsIcon,
                      width: 18.w,
                      height: 18.h,
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
