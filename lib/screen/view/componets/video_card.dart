import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/screen/view/componets/parallax_flow-screen.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({super.key, required this.videoPath, required this.isSelected});

  final String videoPath;
  final bool isSelected;
  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _videoPlayerController;
  final GlobalKey _videoKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.videoPath);

    _videoPlayerController
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..setVolume(0)
      ..initialize().then(
            (value) => setState(() {}),
      )
      ..play();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin:  widget.isSelected ? const EdgeInsets.symmetric(vertical: 16, horizontal: 4) : const EdgeInsets.symmetric(vertical: 38, horizontal: 16) ,
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 6),
            blurRadius: 8,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Flow(
            delegate: ParallaxFlowDelegate(
              scrollable: Scrollable.of(context),
              backgroundImageKey: _videoKey,
              listItemContext: context,
            ),
            children: [
              AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController, key: _videoKey,),
              ),
            ]),
      ),
    );
  }
}