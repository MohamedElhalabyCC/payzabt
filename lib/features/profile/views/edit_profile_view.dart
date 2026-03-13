import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/core/widgets/arrow_back_widget.dart';

import '../../../config/export/export.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: "Ahmed Hassan");
    final emailController = TextEditingController(
      text: "Ahmedhassan421@gmail.com",
    );
    final phoneController = TextEditingController(text: "+20 123 456 7890");
    return AppScaffold(
      verticalPadding: 0,
      horizontalPadding: 0,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
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
                  36.sizeBoxH,
                ],
              ).paddingOnly(top: 14.h, left: 20.w, right: 20.w),
            ),
          ),
          Column(
            children: [
              (MediaQuery.of(context).size.height * 0.27).sizeBoxH,
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
                      text: LocaleKeys.editProfileInformation.tr(),
                      appTextStyle: TextStyles.styleParagraphRegular16(
                        context,
                      ).copyWith(fontSize: 18),
                    ),
                    12.sizeBoxH,
                    _buildTextField(
                      context,
                      readOnly: false,
                      title: LocaleKeys.fullName.tr(),
                      controller: nameController,
                      isMust: true,
                      icon: Assets.imagesSvgPersonIcon,
                    ),
                    12.sizeBoxH,
                    _buildTextField(
                      context,
                      readOnly: true,
                      title: LocaleKeys.emailAddress.tr(),
                      isMust: true,
                      controller: emailController,
                      icon: Assets.imagesSvgMailIcon,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    2.sizeBoxH,
                    AppText(
                      text: LocaleKeys.emailCannotChanged.tr(),
                      appTextStyle: TextStyles.styleParagraphRegular12(
                        context,
                        color: const Color(0xff99A1AF),
                      ).copyWith(fontFamily: "Arimo"),
                    ),
                    12.sizeBoxH,
                    _buildTextField(
                      context,
                      readOnly: false,
                      title: LocaleKeys.phoneNumber.tr(),
                      controller: phoneController,
                      icon: Assets.imagesSvgCallIcon,
                      keyboardType: TextInputType.number,
                    ),
                    12.sizeBoxH,
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            background: Colors.white,
                            borderColor: Colors.black.withValues(alpha: 0.1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.close,size: 18,color: Colors.black,),
                                6.sizeBoxW,
                                AppText(
                                  text: LocaleKeys.cancel.tr(),
                                  appTextStyle: TextStyles.styleSemiBold14(
                                    context,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        12.sizeBoxW,
                        Expanded(
                          child: AppButton(
                            background: Color(0xff00BBA7),
                            borderColor: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check,
                                  color: AppColors.textWhite,
                                  size: 18.h,
                                ),
                                6.sizeBoxW,
                                AppText(
                                  text: LocaleKeys.saveChanges.tr(),
                                  appTextStyle: TextStyles.styleSemiBold14(
                                    context,
                                    color: AppColors.textWhite,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ).paddingHorizontalOnly(24.w),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    TextEditingController? controller,
    required bool readOnly,
    bool? isMust,
    TextInputType? keyboardType,
    required String title,
    required String icon,
  }) {
    return CustomTextField(
      title: title,
      isMust: isMust,
      style: TextStyles.styleSubtitleMedium14(
        context,
        color: Color(0xff717182),
      ),
      labelStyle: TextStyles.styleSubtitleMedium14(
        context,
        color: Color(0xff717182),
      ),
      controller: controller,
      keyboardType: keyboardType,
      prefixIcon: AppImageView(
        icon,
        color: Color(0xff99A1AF),
        width: 20.w,
        height: 20.h,
      ),
      hintColor: Color(0xff717182),
      titleColor: Colors.black,
      focusColor: Colors.transparent,
      enabledColor: Colors.transparent,
      readOnly: readOnly,
      validator: (_) {
        return;
      },
      tPadding: 0,
      bPadding: 0,
      lPadding: 8.w,
      rPadding: 8.w,
    );
  }
}
