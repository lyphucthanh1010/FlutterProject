import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import '../values/app_color.dart';

//Region Page
import '../pages/chat_page.dart';
import '../pages/explore_page.dart';
import '../pages/profile_page.dart';
import '../pages/home_page.dart';
import '../pages/trend_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int index = 0;
  final pages = [
    const HomePage(),
    const TrendPage(),
    const ExplorePage(),
    const ChatPage(),
    const ProfilePage()
  ];

  TextStyle labelStyle(int index) {
    return index == this.index
        ? const TextStyle(
            color: AppColor.bottomNaviColor,
            fontSize: 11,
            fontWeight: FontWeight.w500)
        : TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 11,
            fontWeight: FontWeight.w500);
  }

  CurvedNavigationBarItem buildNavBarItem(
      String image, String label, int index) {
    return CurvedNavigationBarItem(
        child: Image.asset(
          "assets/images/$image.png",
          width: 20,
          height: 20,
        ),
        label: label,
        labelStyle: labelStyle(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          color: AppColor.backgroundBottomNaviColor,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: AppColor.bottomNaviColor,
          items: [
            buildNavBarItem("home", "Home", 0),
            buildNavBarItem("fire", "Trend", 1),
            buildNavBarItem("compass", "Explore", 2),
            buildNavBarItem("message", "Chat", 3),
            buildNavBarItem("person", "Profile", 4),
          ],
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
        body: pages[index]);
  }
}
