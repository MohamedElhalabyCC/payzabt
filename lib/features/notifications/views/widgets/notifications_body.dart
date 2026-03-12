import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';
import 'notification_card.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isNull = true;
    return isNull
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12.h,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFF3F4F6),
                  shape: BoxShape.circle,
                ),
                child: AppImageView(
                  Assets.imagesSvgNoNotificationsIcon,
                  width: 40.w,
                  height: 40.h,
                ),
              ),
              1.sizeBoxH,
              AppText(
                text: LocaleKeys.noNotifications.tr(),
                appTextStyle: TextStyles.styleH1Bold24(context).copyWith(fontFamily: "Arimo"),
              ),
              AppText(
                text: LocaleKeys.noNotificationsSubtitle.tr(),
                appTextStyle: TextStyles.styleParagraphRegular16(
                  context,
                  color: Color(0xff4A5565),
                ).copyWith(fontFamily: "Arimo"),
              ),
            ],
          )
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.sizeBoxH,
                AppText(
                  text: "TODAY",
                  appTextStyle: TextStyles.styleParagraphRegular14(
                    context,
                    color: AppColors.textGreyed,
                  ),
                ),
                8.sizeBoxH,
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 7,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => NotificationCard(
                    title: "Budget Limit Warning",
                    description: "You're close to your monthly budget limit.",
                    time: "2 hours ago",
                    iconPath: Assets.imagesSvgHamburger,
                  ).paddingOnly(bottom: 16),
                ),
              ],
            ).paddingHorizontalOnly(16),
          );
  }
}
