import 'package:flutter/material.dart';
import '../values/app_color.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Oh, sorry😥!",
                style: TextStyle(
                    color: AppColor.bottomNaviColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "This feature is currently unavailable. Please wait for the upcoming upgrade...",
                style: TextStyle(
                    color: AppColor.bottomNaviColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
