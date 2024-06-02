<h2 align = "center"> 1. Video Player </h2>


The `video_player` package in Flutter is a powerful library that enables you to embed video playback functionality in your Flutter applications. It supports various video formats and provides extensive features to control video playback. Here’s a detailed description of the `video_player` package and how to use it.

### Overview

The `video_player` package allows you to:

- Load videos from network sources, assets, or file systems.
- Control video playback (play, pause, seek, etc.).
- Monitor video playback events such as buffering, completion, and errors.
- Access video metadata like duration, position, size, and aspect ratio.

### Installation

To use the `video_player` package, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  video_player: ^2.2.15
```

Then, run `flutter pub get` to install the package.

### Basic Usage

Here’s a step-by-step guide to implement a basic video player in a Flutter app using the `video_player` package.

#### Step 1: Import the Package

First, import the `video_player` package in your Dart file:

```dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
```

#### Step 2: Initialize the Video Player

Create a `StatefulWidget` to manage the video player’s state and lifecycle:

```dart
class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://www.example.com/video.mp4', // Replace with your video URL
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player Example'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
```

#### Step 3: Main Application Entry Point

In your `main.dart`, use the `VideoPlayerScreen` widget:

```dart
import 'package:flutter/material.dart';
import 'video_player_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Video Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VideoPlayerScreen(),
    );
  }
}
```

### Features and Capabilities

The `video_player` package offers a range of features to enhance video playback:

- **Initialization**: Initialize the video player with a network URL, asset, or file.
- **Controls**: Play, pause, seek to a position, and set loop mode.
- **Events**: Listen to events such as video completion, errors, and buffering updates.
- **Playback Speed**: Adjust the playback speed of the video.
- **Volume Control**: Adjust the volume of the video.
- **Fullscreen Support**: Implement fullscreen video playback.

### Example of Additional Features

Here’s an example of how to implement additional features such as seeking and displaying playback progress:

```dart
class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://www.example.com/video.mp4', // Replace with your video URL
    )
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player Example'),
      ),
      body: Column(
        children: [
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : CircularProgressIndicator(),
          VideoProgressIndicator(_controller, allowScrubbing: true),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.replay_10),
                onPressed: () {
                  _controller.seekTo(
                    _controller.value.position - Duration(seconds: 10),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.forward_10),
                onPressed: () {
                  _controller.seekTo(
                    _controller.value.position + Duration(seconds: 10),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

This example includes controls for playing, pausing, and seeking the video, as well as displaying a progress indicator.

### Conclusion

The `video_player` package in Flutter provides comprehensive support for video playback, allowing you to create rich multimedia experiences in your apps. With its flexibility and ease of use, you can integrate video functionality tailored to your application's needs.



<img src = "https://github.com/fenishpatel3150/video_player_app/assets/143187609/e022c874-76a4-4c05-975e-2de12b10ddb7" width=22% height=35%>
<img src = "https://github.com/fenishpatel3150/video_player_app/assets/143187609/583ce696-9fd1-4df7-88ae-4d39f9dfec4b" width=22% height=35%>
<img src = "https://github.com/fenishpatel3150/video_player_app/assets/143187609/88d0551e-f242-4df1-8131-3b0eb8a2327e" width=22% height=35%>

https://github.com/fenishpatel3150/video_player_app/assets/143187609/52b39383-9a87-4428-b8f2-7c4be6e4d723

