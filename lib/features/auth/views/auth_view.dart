import 'package:flutter/material.dart';

import 'package:payzabt/core/widgets/app_scaffold.dart';
import 'package:payzabt/features/auth/views/widgets/auth_body.dart';
import 'package:payzabt/core/widgets/main_app_bar.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
    verticalPadding: 0,
      appBar: MainAppBar(
        context: context,
        centerTitle: true,
        title:  "Auth", // or use LocaleKeys.auth_title.tr(context: context) if using localization
      ),
      body: const AuthBody(),
    );
  }
}