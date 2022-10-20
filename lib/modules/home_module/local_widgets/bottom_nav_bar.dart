import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../../../../../../../index.dart';

class BottomNavBar extends StatefulWidget {
  final ValueChanged<int> onTabChanged;

  const BottomNavBar({Key? key, required this.onTabChanged}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List _getNavBardItem(BuildContext context) {
    return [
      {"icon": 'assets/icons/home.svg'},
      {"icon": 'assets/icons/fav.svg'},
      {"icon": 'assets/icons/wallet.svg'},
      {"icon": 'assets/icons/profile.svg'},
    ];
  }

  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      gapLocation: GapLocation.none,
      elevation: 5,
      rightCornerRadius: 20,
      leftCornerRadius: 20,
      notchSmoothness: NotchSmoothness.smoothEdge,
      height: kBottomNavigationBarHeight + 10,
      tabBuilder: (int index, bool isActive) {
        var item = _getNavBardItem(context)[index];
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SvgPicture.asset(
                  item["icon"],
                ),
              ),
            ],
          ),
        );
      },
      activeIndex: _activeIndex,
      itemCount: _getNavBardItem(context).length,
      onTap: (value) {
        setState(() {
          _activeIndex = value;
        });
        widget.onTabChanged(_activeIndex);
      },
    );
  }
}
