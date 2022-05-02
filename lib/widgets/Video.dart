
 import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final VideoPlayerController? videoPlayerController;
  final bool? loop;
  Video({this.videoPlayerController, this.loop, Key? key}) : super(key : key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  ChewieController? chewieController;

  @override
  void initState(){
    super.initState();
    chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.network('https://www.youtube.com/embed/dXxe7E6WPUM'),
    looping: true,
      aspectRatio: 16/9,
      autoInitialize: true,
      allowFullScreen: true,


    );
  }
  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: chewieController!,

    );
  }

  @override
  void dispose(){
    super.dispose();
    widget.videoPlayerController!.dispose();
    chewieController!.dispose();
  }
}


class TrailerPlayer extends StatefulWidget {
  final String videoData;

   TrailerPlayer({required this.videoData});

  @override
  _TrailerPlayerState createState() => _TrailerPlayerState();
}

class _TrailerPlayerState extends State<TrailerPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Video(
        videoPlayerController: VideoPlayerController.network('https://www.youtube.com/embed/dXxe7E6WPUM'),
      ),
    );
  }
}


