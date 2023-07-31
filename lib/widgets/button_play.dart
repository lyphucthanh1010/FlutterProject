import 'package:flutter/material.dart';

class ButtonPlay extends StatefulWidget {
  const ButtonPlay({super.key});

  @override
  State<ButtonPlay> createState() => _ButtonPlayState();
}

bool play = false;

class _ButtonPlayState extends State<ButtonPlay> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          play = !play;
        });
      },
      child: Image.asset(
        play == false ? "assets/images/play.png" : "assets/images/pause.png",
        width: 50,
        height: 50,
      ),
    );
  }
}
