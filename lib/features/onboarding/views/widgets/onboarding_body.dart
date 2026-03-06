import 'package:easy_localization/easy_localization.dart';
import 'package:payzabt/features/onboarding/logic/onboarding_cubit.dart';
import 'package:payzabt/features/onboarding/views/widgets/onboarding_text_section.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../config/export/export.dart';
import 'login_signup_selection.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, int>(
        builder: (context, state) {
          final imagesList = [
                Assets.imagesPngOnboarding1,
                Assets.imagesPngOnboarding2,
                Assets.imagesPngOnboarding3,
                Assets.imagesPngOnboarding4,
                Assets.imagesPngOnboarding5,
                Assets.imagesPngLoginSignupImage,
              ],
              titlesList = [
                LocaleKeys.welcomeTitle.tr(context: context),
                LocaleKeys.trackYourSpend.tr(context: context),
                LocaleKeys.organizeSpendingWithEnvelopes.tr(context: context),
                LocaleKeys.buildYourSavings.tr(context: context),
                LocaleKeys.yourGoalsYourProgress.tr(context: context),
                LocaleKeys.exploreApp.tr(context: context),
              ],
              subtitlesList = [
                LocaleKeys.welcomeSubtitle.tr(context: context),
                LocaleKeys.trackYourExpenses.tr(context: context),
                LocaleKeys.setLimits.tr(context: context),
                LocaleKeys.saveLeftoverMoney.tr(context: context),
                LocaleKeys.createGoalsAndTrackSavings.tr(context: context),
                LocaleKeys.financeUnderControl.tr(context: context),
              ];
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: OnboardingTextSection(title: titlesList[state], subtitle: subtitlesList[state]),
              ),
              6.sizeBoxH,
              Align(
                alignment: Alignment.topCenter,
                child: AnimatedSmoothIndicator(
                  activeIndex: state,
                  count: imagesList.length,
                  effect: JumpingDotEffect(
                    dotHeight: 6,
                    radius: 20,
                    dotWidth: 6,
                    activeDotColor: AppColors.activeDot,
                    dotColor: AppColors.textWhite,
                  ),
                ),
              ),
              30.sizeBoxH,
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: PageView.builder(
                  itemCount: imagesList.length,
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    final newIndex = state + 1;
                    final cubit = context.read<OnboardingCubit>();

                    if (index > cubit.state) {
                      context.read<OnboardingCubit>().changeIndex(newIndex);
                    } else {
                      // راجع خطوة → عدل الـ state
                      cubit.changeIndex(index);
                    }
                  },
                  itemBuilder: (context, index) {
                    return index==imagesList.length-1?LoginSignupSelection(image: imagesList[index],):AppImageView(
                      imagesList[index],
                      margin: EdgeInsets.zero,
                      fit: BoxFit.fitHeight,
                    );
                  },
                ),
              ),
              12.sizeBoxH,
            ],
          ).paddingHorizontalOnly(16.h);
        },
      ),
    );
  }
}
