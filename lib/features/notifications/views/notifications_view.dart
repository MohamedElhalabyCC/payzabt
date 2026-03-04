import 'package:payzabt/config/export/export.dart';

import 'package:payzabt/features/notifications/views/widgets/notifications_body.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      appBar: MainAppBar(
        context: context,
        centerTitle: true,
        title: "notifications", // or use LocaleKeys.notifications_title.tr(context: context) if using localization
      ),
      body: const NotificationsBody(),
    );
  }
}
