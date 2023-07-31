import 'package:flutter/material.dart';
import 'package:podcast_player_flutter/values/app_color.dart';

//Region Data
import '../datas/category.dart';
import '../datas/song.dart';

//Region Widget
import '../widgets/list_category_widget.dart';
import '../widgets/list_song_widget.dart';

//Region Page
import 'player_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.themeColor,
        elevation: 0,
        title: const Expanded(
          child: Text(
            'Welcome John Doe',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Image.asset(
                "assets/images/bell.png",
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Looking for podcast channels",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      filled: true,
                      fillColor: const Color(0xFF222B45),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      hintText: "Search",
                      hintStyle: const TextStyle(
                          color: Color(0xFF8F9BB3), fontSize: 14),
                      prefixIcon: Image.asset(
                        "assets/images/search.png",
                        width: 18,
                        height: 18,
                      )),
                ),
              ),
              Row(
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/chevron_down.png",
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
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
              SizedBox(
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listCategory.length,
                    itemBuilder: (context, index) {
                      return ListCategoryWidget(category: listCategory[index]);
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
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
              SizedBox(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listSong.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayerPage(
                                      song: listSong[index],
                                      listSong: listSong,
                                    )),
                          );
                        },
                        child: ListSongWidget(
                            listSong: listSong, song: listSong[index]),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
