import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/features/savings/views/widgets/dialog.dart';

import '../../../../config/export/export.dart';
import 'log_out_dialog.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  bool repeatEveryMonth = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 18.h,
      children: [
        _buildSettingsContainer(
          context,
          title: LocaleKeys.reportsAndInsights.tr(),
          child: Column(
            children: [
              _buildListTile(
                context,
                title: LocaleKeys.analyticsReport.tr(),
                isGradient: true,
                icon: Assets.imagesSvgAnalysisIcon,
              ),
              Divider(color: Color(0xffF3F4F6), thickness: 1),
              _buildListTile(
                context,
                title: LocaleKeys.changeIncome.tr(),
                icon: Assets.imagesSvgTermsIcon,
              ),
            ],
          ),
        ),
        _buildSettingsContainer(
          context,
          title: LocaleKeys.preferences.tr(),
          child: _buildListTile(
            context,
            title: LocaleKeys.notifications.tr(),
            icon: Assets.imagesSvgNotificationIcon,
            trailing: Transform.scale(
              scale: 0.7,
              alignment: AlignmentDirectional.centerEnd,
              child: Switch(
                value: repeatEveryMonth,
                activeColor: Colors.black,
                padding: EdgeInsets.zero,
                inactiveTrackColor: Colors.white,
                inactiveThumbColor: Colors.black,
                activeThumbColor: Colors.white,
                activeTrackColor: Colors.black,
                trackOutlineColor: WidgetStatePropertyAll(Colors.black),
                onChanged: (val) => setState(() => repeatEveryMonth = val),
              ),
            ),
          ),
        ),
        _buildSettingsContainer(
          context,
          title: LocaleKeys.support.tr(),
          child: Column(
            children: [
              _buildListTile(
                context,
                title: LocaleKeys.helpCenter.tr(),
                icon: Assets.imagesSvgHelpCenterIcon,
                onTap: ()=>context.pushNamed(AppRoute.fAQScreen)
              ),
              Divider(color: Color(0xffF3F4F6), thickness: 1),
              _buildListTile(
                context,
                onTap: ()=>context.pushNamed(AppRoute.privacyScreen),
                title: LocaleKeys.privacyPolicy.tr(),
                icon: Assets.imagesSvgPrivacyIcon,
              ),
              Divider(color: Color(0xffF3F4F6), thickness: 1),
              _buildListTile(
                context,
                onTap: ()=>context.pushNamed(AppRoute.monthReviewScreen),
                title: LocaleKeys.termsOfService.tr(),
                icon: Assets.imagesSvgTermsIcon,
              ),
            ],
          ),
        ),

        _buildSettingsContainer(
          context,
          child: _buildListTile(
            context,
            title: LocaleKeys.logout.tr(),
            icon: Assets.imagesSvgLogOutIcon,
            trailing: SizedBox.shrink(),
            iconColor:const Color(0xffFFE2E2),
            titleColor:const Color(0xffE7000B),
            onTap: ()=>showAnimatedAutoDismissDialog(context, LogOutDialogContent())
          ),
        ),
        90.sizeBoxH,
      ],
    ).paddingSymmetric(horizontal: 22.w);
  }

  Widget _buildSettingsContainer(
    BuildContext context, {
    required Widget child,
    String? title,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          AppText(
            text: title,
            appTextStyle: TextStyles.styleH1Bold14(
              context,
              color: AppColors.subText,
            ),
          ),
        12.sizeBoxH,
        AppMainContainer(
          hPadding: 0,
          vPadding: 6,
          radius: 14,
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
          child: child,
        ),
      ],
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    isGradient = false,
    Widget? trailing,
    Color? iconColor,
    Color? titleColor,
    void Function()? onTap,
    required String title,
    required String icon,
  }) {
    return ListTile(
      onTap: onTap,
      visualDensity: VisualDensity(horizontal: -4, vertical: -2),
      contentPadding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 20.w),
      leading: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: isGradient
              ? LinearGradient(
                  begin: Alignment(0.71, -0.71),
                  end: Alignment(-0.71, 0.71),
                  colors: [Color(0xFF00D4BD), Color(0xFF009689)],
                )
              : null,
          color: isGradient ? null : iconColor??Color(0xffF3F4F6),
        ),
        child: AppImageView(icon, height: 24.h, width: 24.w),
      ),
      title: AppText(
        text: title,
        appTextStyle: TextStyles.styleParagraphRegular16(
          context,
          color: isGradient ? Color(0xff00786F) :titleColor?? Colors.black,
        ).copyWith(fontFamily: "Arimo"),
      ),
      trailing:
          trailing ??
          Icon(Icons.arrow_forward_ios, color: Color(0xff99A1AF), size: 18),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        (MediaQuery.of(context).size.height * 0.15).sizeBoxH,
        AppMainContainer(
          radius: 14,
          hPadding: 0,
          vPadding: 0,
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
          onTap: ()=>context.pushNamed(AppRoute.profileView),
          child: ListTile(
            visualDensity: VisualDensity(horizontal: -4, vertical: -2),
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 12.w,
            ),
            leading: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.71, -0.71),
                  end: Alignment(-0.71, 0.71),
                  colors: [Color(0xFF00D4BD), Color(0xFF009689)],
                ),
                shape: BoxShape.circle,
              ),
              child: AppImageView(
                Assets.imagesSvgPersonIcon,
                height: 32.h,
                width: 32.w,
              ),
            ),
            title: AppText(
              text: "Ahmed Hassan",
              appTextStyle: TextStyles.styleH1Bold18(
                context,
              ).copyWith(fontFamily: "Arimo"),
            ),
            subtitle: AppText(
              text: "Ahmedhassan@gmail.com",
              appTextStyle: TextStyles.styleParagraphRegular14(
                context,
                color: AppColors.subText,
              ).copyWith(fontFamily: "Arimo"),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff99A1AF),
              size: 22,
            ),
          ),
        ),
      ],
    ).paddingSymmetric(horizontal: 22.w);
  }
}
