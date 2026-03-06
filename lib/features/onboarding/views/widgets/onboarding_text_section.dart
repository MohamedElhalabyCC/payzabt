import '../../../../config/export/export.dart';

class OnboardingTextSection extends StatelessWidget {
  const OnboardingTextSection({super.key, required this.title, required this.subtitle});

  final String title,subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 14.h,
      children: [
        AppText(
          text: title,
          textAlign: TextAlign.center,
          appTextStyle: TextStyles.styleH1Bold32(
            context,
            color: AppColors.textWhite,
          ).copyWith(fontSize: 30.sp),
        ),

        AppText(
          text: subtitle,
          textAlign: TextAlign.center,
          appTextStyle: TextStyles.styleParagraphRegular16(
            context,
            color: AppColors.textWhite,
          ),
        ),
      ],
    );
  }
}
