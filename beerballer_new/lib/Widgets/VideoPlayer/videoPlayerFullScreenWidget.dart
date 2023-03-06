import 'package:beerballer_new/Models/firestoreModels/game.dart';
import 'package:beerballer_new/Widgets/VideoPlayer/basicOverlayWidget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerFullScreenWidget extends StatelessWidget {

  final VideoPlayerController controller;
  Game game;

  VideoPlayerFullScreenWidget(this.controller, this.game);

  @override
  Widget build(BuildContext context) =>
       controller.value.isInitialized
          ? GestureDetector(
              onTap: () => controller.value.isPlaying
                  ? controller.pause()
                  : controller.play(),
              child: buildVideo(context),
            )
          : Container(
              height: MediaQuery.of(context).size.height * 0.8,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );

  Widget buildVideo(BuildContext context) => Stack(
        children: [
          buildVideoPlayer(),
          BasicOverlayWidget(controller),
        ],
      );

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      );
}
