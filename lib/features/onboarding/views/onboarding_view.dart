import 'package:payzabt/features/onboarding/views/widgets/onboarding_body.dart';

import '../../../config/export/export.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      horizontalPadding: 0,
      isBackgroundImage: true,
      body: OnboardingBody(),
    );
  }
}
