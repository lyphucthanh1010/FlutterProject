import 'package:flutter/material.dart';
import 'package:podcast_player_flutter/values/app_color.dart';

class ButtonLike extends StatefulWidget {
  const ButtonLike({super.key});

  @override
  State<ButtonLike> createState() => _ButtonLikeState();
}

bool like = false;

class _ButtonLikeState extends State<ButtonLike> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: like == false
          ? const Icon(
              Icons.favorite_border,
              color: Colors.white,
            )
          : const Icon(
              Icons.favorite,
              color: AppColor.bottomNaviColor,
            ),
      onPressed: () {
        setState(() {
          like = !like;
        });
      },
    );
  }
}
