import 'package:flutter/material.dart';
import 'widgets/bottom_navigation.dart';
import '/values/app_color.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColor.themeColor),
      home: const Scaffold(body: BottomNavigation()),
      debugShowCheckedModeBanner: false,
    );
  }
}
