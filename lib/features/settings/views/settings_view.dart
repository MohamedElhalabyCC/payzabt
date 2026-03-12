

import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/features/settings/views/widgets/settings_body.dart';

import '../../../config/export/export.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
                  gradient: AppColors.appGradient1,
                ),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      8.sizeBoxH,
                      Align(
                        alignment: AlignmentGeometry.bottomCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(
                              text: LocaleKeys.profileSettings.tr(),
                              appTextStyle: TextStyles.styleParagraphRegular16(
                                context,
                                color: AppColors.textWhite,
                              ).copyWith(fontWeight: FontWeight.w500),
                            ),
                            AppText(
                              text: LocaleKeys.manageAccount.tr(),
                              appTextStyle: TextStyles.styleParagraphRegular12(
                                context,
                                color: AppColors.textWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.sizeBoxH,
                    ],
                  ).paddingOnly(top: 14.h, left: 20.w, right: 20.w),
                ),
              ),
              ProfileSection()
            ],
          ),
          22.sizeBoxH,
          SettingsBody(),
        ],
      ),
    );
  }
}