import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/config/export/export.dart';

import 'package:payzabt/features/notifications/views/widgets/notifications_body.dart';

import '../../../core/widgets/arrow_back_widget.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

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
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
              gradient: AppColors.appGradient1,
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Column(
                          children: [
                            AppText(
                              text: LocaleKeys.notifications.tr(),
                              appTextStyle: TextStyles.styleParagraphRegular16(
                                context,
                                color: AppColors.textWhite,
                              ).copyWith(fontWeight: FontWeight.w500),
                            ),
                            AppText(
                              text: LocaleKeys.stayInformed.tr(),
                              appTextStyle: TextStyles.styleParagraphRegular12(
                                context,
                                color: AppColors.textWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  40.sizeBoxH,
                ],
              ).paddingOnly(top: 14.h, left: 20.w, right: 20.w),
            ),
          ),
          Expanded(child: NotificationsBody()),
        ],
      ),
    );
  }
}
