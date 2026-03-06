import 'package:flutter/material.dart';

import 'package:payzabt/core/widgets/app_scaffold.dart';
import 'package:payzabt/features/auth/views/widgets/login_body.dart';
import 'package:payzabt/core/widgets/main_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      horizontalPadding: 0,
      isBackgroundImage: true,
      body: const AuthBody(),
    );
  }
}
