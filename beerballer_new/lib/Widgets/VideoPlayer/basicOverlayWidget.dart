import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BasicOverlayWidget extends StatelessWidget {
  VideoPlayerController controller;

  BasicOverlayWidget(
    this.controller,
  );

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Stack(
          children: <Widget>[
            buildIndicator(),
            buildPlay(context),
          ],
        ),
      );


  Widget buildIndicator() => VideoProgressIndicator(
        controller,
        allowScrubbing: true,
      );

  Widget buildPlay(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        alignment: Alignment.center,
        child: Icon(
          controller.value.isPlaying ? null : Icons.play_arrow,
          color: Colors.white,
          size: 80,
        ),
      );
}
