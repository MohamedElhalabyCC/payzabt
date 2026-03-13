import 'package:easy_localization/easy_localization.dart';

import '../../../config/export/export.dart';

class RolloverCompleteScreen extends StatefulWidget {
  const RolloverCompleteScreen({super.key});

  @override
  State<RolloverCompleteScreen> createState() => _RolloverCompleteScreenState();
}

class _RolloverCompleteScreenState extends State<RolloverCompleteScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Staggered animations
  late Animation<double> _checkOpacity;
  late Animation<double> _checkScale;
  late Animation<double> _titleOpacity;
  late Animation<Offset> _titleSlide;
  late Animation<double> _subtitleOpacity;
  late Animation<Offset> _subtitleSlide;
  late Animation<double> _cardOpacity;
  late Animation<Offset> _cardSlide;
  late Animation<double> _buttonOpacity;
  late Animation<Offset> _buttonSlide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 2500,
      ), // Total duration for all staggered anims
    );

    const checkStart = 0.0;
    const checkEnd = 0.3;
    const titleStart = 0.3;
    const titleEnd = 0.5;
    const subtitleStart = 0.5;
    const subtitleEnd = 0.7;
    const cardStart = 0.7;
    const cardEnd = 0.9;
    const buttonStart = 0.9;
    const buttonEnd = 1.0;

    _checkOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(checkStart, checkEnd, curve: Curves.easeIn),
      ),
    );
    _checkScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(checkStart, checkEnd, curve: Curves.elasticOut),
      ),
    );

    _titleOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(titleStart, titleEnd, curve: Curves.easeIn),
      ),
    );
    _titleSlide = Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(
              titleStart,
              titleEnd,
              curve: Curves.easeOutCubic,
            ),
          ),
        );

    _subtitleOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(subtitleStart, subtitleEnd, curve: Curves.easeIn),
      ),
    );
    _subtitleSlide =
        Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(
              subtitleStart,
              subtitleEnd,
              curve: Curves.easeOutCubic,
            ),
          ),
        );

    _cardOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(cardStart, cardEnd, curve: Curves.easeIn),
      ),
    );
    _cardSlide = Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(
              cardStart,
              cardEnd,
              curve: Curves.easeOutCubic,
            ),
          ),
        );

    _buttonOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(buttonStart, buttonEnd, curve: Curves.easeIn),
      ),
    );
    _buttonSlide =
        Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(
              buttonStart,
              buttonEnd,
              curve: Curves.easeOutCubic,
            ),
          ),
        );

    // Start the animation on screen load
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const tealColor = Color(0xFF00BFA5);

    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [
                  Color(0xFF00BC7C),
                  Color(0xFF00BBA6),
                  Color(0xFF2B7FFF),
                ],
              ),
            ),
          ),
          // Main Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20.0,
              ),
              child: Column(
                children: [
                  const Spacer(flex: 3), // Space before checkmark

                  FadeTransition(
                    opacity: _checkOpacity,
                    child: ScaleTransition(
                      scale: _checkScale,
                      child: Container(
                        width: 100.0.w,
                        height: 100.0.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 10,
                              offset: Offset(0, 8),
                              spreadRadius: -6,
                            ),
                            BoxShadow(
                              color: Color(0x19000000),
                              blurRadius: 25,
                              offset: Offset(0, 20),
                              spreadRadius: -5,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.check_rounded,
                          color: tealColor,
                          size: 60.0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 2), // Space after checkmark

                  FadeTransition(
                    opacity: _titleOpacity,
                    child: SlideTransition(
                      position: _titleSlide,
                      child: Text(
                        LocaleKeys.rolloverComplete.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyles.styleH1Bold32(
                          context,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  // Subtitle Text
                  FadeTransition(
                    opacity: _subtitleOpacity,
                    child: SlideTransition(
                      position: _subtitleSlide,
                      child: Text(
                        LocaleKeys.yourRemainingMoneyBoost.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyles.styleParagraphRegular16(
                          context,
                          color: Colors.white,
                        ).copyWith(fontSize: 18),
                      ),
                    ),
                  ),
                  const Spacer(flex: 3), // Space before card
                  // Next Month's Boost Card
                  FadeTransition(
                    opacity: _cardOpacity,
                    child: SlideTransition(
                      position: _cardSlide,
                      child: Container(
                        padding: const EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppImageView(
                              Assets.imagesSvgTrendUp,
                              color: Colors.white,
                              width: 24.w,
                              height: 24.h,
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LocaleKeys.nextMonthsBoost.tr(),
                                    style: TextStyles.styleParagraphRegular16(
                                      context,
                                      color: Colors.white,
                                    ).copyWith(fontFamily: "Arimo"),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    LocaleKeys.amountAddToBoost.tr(),
                                    style: TextStyles.styleParagraphRegular12(
                                      context,
                                      color: Colors.white,
                                    ).copyWith(fontFamily: "Arimo"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 5), // Large space before button
                  // Go Back to Home Button
                  FadeTransition(
                    opacity: _buttonOpacity,
                    child: SlideTransition(
                      position: _buttonSlide,
                      child: AppButton(
                        title: LocaleKeys.goBackHome.tr(),
                        background: Colors.white,fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        textColor: AppColors.lighterGreen,
                        onTap: () => context.pop(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
