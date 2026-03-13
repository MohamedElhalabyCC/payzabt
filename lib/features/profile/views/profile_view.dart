import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/core/widgets/arrow_back_widget.dart';

import '../../../config/export/export.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

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
                        alignment: Alignment.topCenter,
                        child: AppText(
                          text: LocaleKeys.profileSettings.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular16(
                            context,
                            color: AppColors.textWhite,
                          ).copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: AppImageView(
                          Assets.imagesSvgPenIcon,
                          height: 22.h,
                          width: 22.w,
                          onTap: ()=>context.pushNamed(AppRoute.editProfileView),
                        ),
                      ),
                    ],
                  ),
                  30.sizeBoxH,
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 6,
                          offset: Offset(0, 4),
                          spreadRadius: -4,
                        ),
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 15,
                          offset: Offset(0, 10),
                          spreadRadius: -3,
                        ),
                      ],
                    ),
                    child: AppText(
                      text: "AH",
                      appTextStyle: TextStyles.styleH1Bold32(
                        context,
                        color: Color(0xff009689),
                      ).copyWith(fontSize: 30),
                    ),
                  ),
                  14.sizeBoxH,
                  AppText(
                    text: "Ahmed Hassan",
                    appTextStyle: TextStyles.styleParagraphRegular24(
                      context,
                      color: AppColors.textWhite,
                    ),
                  ),
                  8.sizeBoxH,
                  AppText(
                    text: "Ahmed hassan421@gmail.com",
                    appTextStyle: TextStyles.styleParagraphRegular14(
                      context,
                      color: Color(0xffCBFBF1),
                    ),
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
                  AppMainContainer(
                    vPadding: 16.h,
                    hPadding: 26.w,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x4C000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 12,
                        offset: Offset(0, 8),
                        spreadRadius: 6,
                      ),
                    ],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        6.sizeBoxH,
                        AppText(
                          text: LocaleKeys.personalInformation.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular16(
                            context,
                          ).copyWith(fontSize: 18),
                        ),
                        6.sizeBoxH,
                        _buildListTile(
                          context,
                          title: LocaleKeys.fullName.tr(),
                          subtitle: "Ahmed Hassan",
                          icon: Assets.imagesSvgPersonIcon,
                          iconColor: const Color(0xff009689),
                          iconBackColor: const Color(0xffCBFBF1),
                        ),
                        Divider(color: Color(0xffF3F4F6), thickness: 1),
                        _buildListTile(
                          context,
                          title: LocaleKeys.email.tr(),
                          subtitle: "Ahmedhassan421@gmail.com",
                          icon: Assets.imagesSvgMailIcon,
                          iconBackColor: const Color(0xffDBEAFE),
                        ),
                        Divider(color: Color(0xffF3F4F6), thickness: 1),

                        _buildListTile(
                          context,
                          title: LocaleKeys.phoneNumber.tr(),
                          subtitle: "+20 123 456 7890",
                          icon: Assets.imagesSvgCallIcon,
                          iconBackColor: const Color(0xffF3E8FF),
                        ),
                      ],
                    ),
                  ).paddingHorizontalOnly(16.w),
                  20.sizeBoxH,
                  AppMainContainer(
                    vPadding: 16.h,
                    hPadding: 26.w,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x4C000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x26000000),
                        blurRadius: 12,
                        offset: Offset(0, 8),
                        spreadRadius: 6,
                      ),
                    ],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        6.sizeBoxH,
                        AppText(
                          text: LocaleKeys.accountInformation.tr(),
                          appTextStyle: TextStyles.styleParagraphRegular16(
                            context,
                          ).copyWith(fontSize: 18),
                        ),
                        6.sizeBoxH,
                        ListTile(
                          visualDensity: VisualDensity(horizontal: -4, vertical: -2),
                          contentPadding: EdgeInsets.symmetric(vertical: 6.h,),
                          title: AppText(
                            text: LocaleKeys.memberSince.tr(),
                            appTextStyle: TextStyles.styleParagraphRegular12(
                              context,
                              color: AppColors.subText,
                            ),
                          ),
                          subtitle: AppText(
                            text: "February 9, 2026",
                            appTextStyle: TextStyles.styleParagraphRegular16(
                              context,
                              color: Color(0xff101828),
                            ),
                          ),
                        ),
                        Divider(color: Color(0xffF3F4F6), thickness: 1),
                        ListTile(
                          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                          contentPadding: EdgeInsets.symmetric(vertical: 6.h,),
                          title: AppText(
                            text: LocaleKeys.activeStatus.tr(),
                            appTextStyle: TextStyles.styleParagraphRegular12(
                              context,
                              color: AppColors.subText,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Icon(Icons.circle, size: 10,color: const Color(0xff00C950),),
                              4.sizeBoxW,
                              AppText(
                                text: LocaleKeys.active.tr(),
                                appTextStyle: TextStyles.styleParagraphRegular14(
                                  context,
                                  color:  const Color(0xff00C950),
                                ),
                              ),
                            ],
                          ).paddingOnly(top: 4.h),
                        ),
                      ],
                    ),
                  ).paddingHorizontalOnly(16.w),
                  20.sizeBoxH
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    Color? iconColor,
    Color? iconBackColor,
    required String title,
    required String subtitle,
    required String icon,
  }) {
    return ListTile(
      visualDensity: VisualDensity(horizontal: -4, vertical: -2),
      contentPadding: EdgeInsets.symmetric(vertical: 6.h,),
      leading: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: iconBackColor,
        ),
        child: AppImageView(icon, color: iconColor, height: 24.h, width: 24.w),
      ),
      title: AppText(
        text: title,
        appTextStyle: TextStyles.styleParagraphRegular12(
          context,
          color: AppColors.subText,
        ),
      ),
      subtitle: AppText(
        text: subtitle,
        appTextStyle: TextStyles.styleParagraphRegular16(
          context,
          color: Color(0xff101828),
        ),
      ),
    );
  }
}
