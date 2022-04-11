import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../shared/services/enviroment/enviroment_config.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key? key}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      '${EnvironmentConfig.S3_BASE_URL}video_smile1280x720.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();

    _controller.setLooping(false);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MouseRegion(
            onEnter: (pointerEnterEvent) async {
              if (mounted) {
                setState(() {
                  isClicked = false;
                });
              }
            },
            onExit: (pointerEnterEvent) async {
              await Future.delayed(const Duration(seconds: 2));
              if (mounted) {
                setState(() {
                  isClicked = true;
                });
              }
            },
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isClicked = true;
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
              child: Stack(
                children: [
                  VideoPlayer(_controller),
                  Center(
                    child: AnimatedOpacity(
                      opacity: isClicked ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: AppColors.brandingOrange,
                        size:
                            MediaQuery.of(context).size.width < 1024 ? 50 : 100,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 12,
                      child: VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        padding: const EdgeInsets.all(3),
                        colors: VideoProgressColors(
                            playedColor: AppColors.brandingOrange),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
