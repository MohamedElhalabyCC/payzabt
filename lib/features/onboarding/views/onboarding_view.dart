import 'package:flutter/material.dart';

import 'package:payzabt/core/widgets/app_scaffold.dart';
import 'package:payzabt/features/onboarding/views/widgets/onboarding_body.dart';
import 'package:payzabt/core/widgets/main_app_bar.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
    verticalPadding: 0,
      appBar: MainAppBar(
        context: context,
        centerTitle: true,
        title:  "Onboarding", // or use LocaleKeys.onboarding_title.tr(context: context) if using localization
      ),
      body: const OnboardingBody(),
    );
  }
}