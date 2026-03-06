import '../../config/export/export.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body, floatingActionButton, bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool isBackgroundImage;
  final double? horizontalPadding, verticalPadding;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const AppScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.appBar,
    this.floatingActionButtonLocation,
    this.horizontalPadding,
    this.verticalPadding,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.isBackgroundImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Color(0xffFAFAFC),
      extendBody: true,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
      appBar: appBar,
      body: isBackgroundImage
          ? Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesPngSplashBackground),
                  fit: BoxFit.cover,
                ),
              ),
              child: SafeArea(
                child: body!,
              ),
            )
          : body!.paddingOnly(
              left: horizontalPadding ?? 20.w,
              right: horizontalPadding ?? 20.w,
              top: verticalPadding ?? 60.h,
              bottom: 0,
            ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
