import 'package:payzabt/config/export/export.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      verticalPadding: 0,
      horizontalPadding: 0,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/png/splash_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text("Payzabt"),
        ),
      ),
    );
  }
}