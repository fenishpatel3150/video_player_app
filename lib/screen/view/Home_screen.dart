import 'package:flutter/material.dart';
import 'package:video_player_app/screen/modal/video_list.dart';
import 'package:video_player_app/screen/view/componets/video_card.dart';


class Video_player extends StatefulWidget {
  const Video_player({super.key});

  @override
  State<Video_player> createState() => _HomePageState();
}

class _HomePageState extends State<Video_player> {
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (value) => setState(() {
                selectedIndex = value;
              }),
              itemCount: video.length,
              itemBuilder: (context, index) => VideoCard(
                videoPath: video[index],
                isSelected: selectedIndex == index,
              ),
            ),
          ),
        ],
      ),
    );
  }
}