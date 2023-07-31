import 'package:flutter/material.dart';
//Region Model
import '../models/song.dart';

class ListSongWidget extends StatelessWidget {
  final List<Song> listSong;
  final Song song;
  const ListSongWidget({super.key, required this.listSong, required this.song});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, top: 15),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(song.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    song.date,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5), fontSize: 8),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    song.time,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 8),
                  )
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                width: 250,
                child: Text(
                  song.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          InkWell(
            onTap: () {},
            child: Image.asset(
              "assets/images/choose.png",
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
