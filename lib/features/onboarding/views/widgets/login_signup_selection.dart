import 'package:easy_localization/easy_localization.dart';

import '../../../../config/export/export.dart';

class LoginSignupSelection extends StatelessWidget {
  const LoginSignupSelection({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Spacer(),
        AppImageView(
          image,
          fit: BoxFit.fitHeight,
          margin: EdgeInsets.symmetric(horizontal: 12.w,vertical: 16.h),
          height: MediaQuery.of(context).size.height*0.35,
        ),
        Spacer(),
        AppButton(
          title: LocaleKeys.signIn.tr(),
          background: AppColors.textWhite,
          textColor:AppColors.lightSecondary,
          onTap: ()=>context.pushNamedAndRemoveUntil(AppRoute.loginScreen),
        ),
        12.sizeBoxH,
        AppButton(
          title: LocaleKeys.createAccount.tr(),
          background: Colors.transparent,
          textColor:AppColors.textWhite,
          borderColor: AppColors.textWhite,
          shadowColor: Colors.transparent,
        ),
        16.sizeBoxH,
      ],
    );
  }
}
