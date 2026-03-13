import 'package:flutter/material.dart';

import 'package:payzabt/core/widgets/app_scaffold.dart';
import 'package:payzabt/features/analytics_reports/views/widgets/analytics_reports_body.dart';
import 'package:payzabt/core/widgets/main_app_bar.dart';

class AnalyticsReportsView extends StatelessWidget {
  const AnalyticsReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
    verticalPadding: 0,
      appBar: MainAppBar(
        context: context,
        centerTitle: true,
        title:  "AnalyticsReports", // or use LocaleKeys.analyticsReports_title.tr(context: context) if using localization
      ),
      body: const AnalyticsReportsBody(),
    );
  }
}