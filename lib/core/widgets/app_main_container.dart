
import '../../config/export/export.dart';

class AppMainContainer extends StatelessWidget {
  final double? vPadding, hPadding, height, width, radius;
  final Widget? child;
  final Color? color; //Color
  final Decoration? decoration;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  const AppMainContainer({
    super.key,
    this.vPadding,
    this.hPadding,
    this.height,
    this.width,
    this.child,
    this.radius,
    this.color,
    this.decoration,
    this.border,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: hPadding ?? 30,
        vertical: vPadding ?? 12,
      ),
      decoration: decoration ??BoxDecoration(
        color: color ??DynamicColors.textColorInverse(context),
        borderRadius: BorderRadius.circular(radius??24.h),
        border: border,
        boxShadow:boxShadow?? [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 25),
            blurRadius: 50,
            spreadRadius: -12,
          ),
        ],
      ),
      child: child,
    );
  }
}
