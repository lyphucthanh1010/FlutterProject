import 'dart:ui';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:podcast_player_flutter/values/app_color.dart';

//Region Model
import '../models/song.dart';

//Region Widget
import '../widgets/list_song_widget.dart';
import '../widgets/button_like.dart';
import '../widgets/button_play.dart';

class PlayerPage extends StatelessWidget {
  final Song song;
  final List<Song> listSong;
  const PlayerPage({super.key, required this.song, required this.listSong});

  Widget _buildControlButton(String assetName, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        assetName,
        width: 24,
        height: 24,
      ),
    );
  }

  Widget _buildPlayerImage(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 250,
        width: 230,
        child: Stack(children: [
          Center(
              child: Image.asset(
            song.image,
            height: 250,
            width: 210,
          )),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
            child: Container(),
          )),
          Positioned(
            top: 0,
            child: Container(
              height: 220,
              width: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(song.image),
                ),
              ),
            ),
          ),
          const Positioned(top: 5, right: 18, child: ButtonLike())
        ]),
      ),
    );
  }

  Widget _buildControlBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildControlButton("assets/images/shuffle.png", () {}),
        _buildControlButton("assets/images/back.png", () {}),
        const ButtonPlay(),
        _buildControlButton("assets/images/next.png", () {}),
        _buildControlButton("assets/images/sync.png", () {}),
      ],
    );
  }

  Widget _buildSongListView(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listSong.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PlayerPage(
                          song: listSong[index],
                          listSong: listSong,
                        )),
              );
            },
            child: ListSongWidget(listSong: listSong, song: listSong[index]),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF192038),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left),
        ),
        actions: [
          _buildControlButton("assets/images/setting.png", () {}),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildPlayerImage(context),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  song.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              _buildControlBar(context),
              ProgressBar(
                progress: const Duration(seconds: 60),
                total: const Duration(seconds: 180),
                thumbColor: Colors.white,
                baseBarColor: Colors.white.withOpacity(0.24),
                progressBarColor: AppColor.bottomNaviColor,
                timeLabelTextStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5), fontSize: 10),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Best Podcast Episodes',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View all",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                ],
              ),
              _buildSongListView(context)
            ],
          ),
        ),
      ),
    );
  }
}
