
 import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:video_player/video_player.dart';
 import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Video extends StatefulWidget {

  final VideoPlayerController? videoPlayerController;

  final String? url;
  Video({this.videoPlayerController, required this.url, Key? key}) : super(key : key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {

  YoutubePlayerController? videoController;


  @override
  void initState(){
    super.initState();

    videoController = YoutubePlayerController(
        initialVideoId: widget.url!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        controlsVisibleAtStart: true,
        enableCaption: true,
        captionLanguage: "ro",

      )

    );
  }
  @override
  Widget build(BuildContext context) {

    return YoutubePlayer(
        controller: videoController!,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.amber,
      aspectRatio: 16/9,
      liveUIColor: Colors.amber,


    );
  }

  @override
  void dispose(){
    super.dispose();
    widget.videoPlayerController!.dispose();

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
  
    return Container(
      child: Video(
        videoPlayerController: VideoPlayerController.network('https://github.com/DenisaTerchescu/Movie-trailer-app/blob/master/assets/335787.mp4'),
        url: widget.videoData,
      ),
    );
  }
}


