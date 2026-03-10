import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:payzabt/features/home/views/home_view.dart';
import '../../config/export/export.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView>
    with TickerProviderStateMixin {
  var _bottomNavIndex = 0;

  late AnimationController _fabAnimationController;
  late AnimationController _borderRadiusAnimationController;
  late Animation<double> fabAnimation;
  late Animation<double> borderRadiusAnimation;
  late CurvedAnimation fabCurve;
  late CurvedAnimation borderRadiusCurve;
  late AnimationController _hideBottomBarAnimationController;

  final screens = [HomeView(), Container(), Container(), Container()];

  @override
  void initState() {
    super.initState();

    _fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _borderRadiusAnimationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    fabCurve = CurvedAnimation(
      parent: _fabAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    borderRadiusCurve = CurvedAnimation(
      parent: _borderRadiusAnimationController,
      curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );

    fabAnimation = Tween<double>(begin: 0, end: 1).animate(fabCurve);
    borderRadiusAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(borderRadiusCurve);

    _hideBottomBarAnimationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    Future.delayed(
      Duration(seconds: 1),
      () => _fabAnimationController.forward(),
    );
    Future.delayed(
      Duration(seconds: 1),
      () => _borderRadiusAnimationController.forward(),
    );
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (notification is UserScrollNotification &&
        notification.metrics.axis == Axis.vertical) {
      switch (notification.direction) {
        case ScrollDirection.forward:
          _hideBottomBarAnimationController.reverse();
          _fabAnimationController.forward(from: 0);
          break;
        case ScrollDirection.reverse:
          _hideBottomBarAnimationController.forward();
          _fabAnimationController.reverse(from: 1);
          break;
        case ScrollDirection.idle:
          break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: onScrollNotification,
        child: screens[_bottomNavIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        highlightElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        isExtended: true,
        child: Center(
          child: Icon(
            Icons.add_circle_outline,
            size: 56,
            color: Color(0xff0E4D6C),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: 4,
        height: 80.h,
        tabBuilder: (int index, bool isActive) {
          final List<String> svgIcons = [
            Assets.imagesSvgHomeIcon,
            Assets.imagesSvgEnvelopsIcon,
            Assets.imagesSvgGoalsIcon,
            Assets.imagesSvgSettingsIcon,
          ];

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgIcons[index],
                width: 24,
                // If your SVGs support color filtering, you can change color based on isActive
                colorFilter: index == 1
                    ? null
                    : ColorFilter.mode(
                        isActive
                            ? AppColors.selectedYellow
                            : AppColors.textWhite,
                        BlendMode.srcIn,
                      ),
              ),
              const SizedBox(height: 4),
              Text(
                _getLabel(index), // Optional labels like "Home", "Goals"
                style: TextStyle(
                  fontSize: 12,
                  color: isActive
                      ? AppColors.selectedYellow
                      : AppColors.textWhite,
                ),
              ),
            ],
          );
        },
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        // Use softEdge for that smooth bridge look
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        elevation: 0,
        backgroundGradient: LinearGradient(
          begin: const Alignment(0, -1.2),
          end: const Alignment(0, 1.3),
          colors: AppColors.gradientColors,
        ),
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }

  String _getLabel(index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Envelops";
      case 2:
        return "Goals";
      case 3:
        return "Settings";
      default:
        return "";
    }
  }
}
