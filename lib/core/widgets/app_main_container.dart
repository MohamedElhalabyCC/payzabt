
import '../../config/export/export.dart';

class AppMainContainer extends StatelessWidget {
  final double? vPadding, hPadding, height, width, radius;
  final Widget? child;
  final Color? color; //Color
  final Decoration? decoration;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final void Function()? onTap;
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
    this.boxShadow, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius??24.h),
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(
          horizontal: hPadding ?? 30,
          vertical: vPadding ?? 12,
        ),
        decoration: decoration ??BoxDecoration(
          color: color ??Colors.white,
          borderRadius: BorderRadius.circular(radius??24.h),
          border: border,
          boxShadow:boxShadow?? [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              offset: const Offset(0, 25),
              blurRadius: 50,
              spreadRadius: -12,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
