
import '../../../config/export/export.dart';
import 'widgets/home_body.dart';
import 'widgets/home_top_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      horizontalPadding: 0,
      body: Column(
        children: [
          HomeTopSection(),
          Expanded(
            child: SingleChildScrollView(
              child: HomeBody().paddingHorizontalOnly(18.w),
            ),
          ),
        ],
      ),
    );
  }

}
