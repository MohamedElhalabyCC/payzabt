import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/config/export/export.dart';
import 'package:payzabt/features/profile/views/profile_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late List<String> images = [
    Assets.imagesSvgSplashIcon1,
    Assets.imagesSvgSplashIcon2,
    Assets.imagesSvgSplashIcon3,
    Assets.imagesSvgSplashIcon4,
    Assets.imagesSvgSplashIcon5,
  ];

  int _currentIndex = 0;
  Timer? _timer;
  bool _showRow = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        setState(() {
          _showRow = true;
        });
        _startAnimation();
      }
    });
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      if (mounted) {
        if (_currentIndex < images.length - 1) {
          setState(() {
            _currentIndex++;
          });
        } else {
          timer.cancel();
          context.pushNamedAndRemoveUntil(AppRoute.onboardingView);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      horizontalPadding: 0,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesPngSplashBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: AnimatedOpacity(
          opacity: _showRow ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 800),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12.w,
            children: [
              AppImageView(
                images[_currentIndex],
                key: ValueKey<int>(_currentIndex),
                fit: BoxFit.fitHeight,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Pay",
                            style: TextStyle(
                              fontSize: 48.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textWhite,
                            ),
                          ),
                          TextSpan(
                            text: "zabt",
                            style: TextStyle(
                              fontSize: 48.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF2B69EB),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppText(
                      text: LocaleKeys.tagline.tr(),
                      appTextStyle: TextStyles.styleParagraphRegular16(
                        context,
                        color: AppColors.textWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
