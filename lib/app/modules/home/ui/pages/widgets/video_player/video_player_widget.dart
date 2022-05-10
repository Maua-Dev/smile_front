import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/video_controller.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../shared/services/enviroment/enviroment_config.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key? key}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoPlayerController;
  var controller = VideoController();

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      '${EnvironmentConfig.S3_BASE_URL}video_smile1280x720.mp4',
    )..initialize().then((_) {
        setState(() {
          _videoPlayerController.setVolume(controller.val);
        });
      });

    _videoPlayerController.setLooping(false);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            _videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(_videoPlayerController))
                : const CircularProgressIndicator(),
            Positioned(
                bottom: 0,
                width: MediaQuery.of(context).size.width < 1024 ? 400 : 800,
                child: VideoProgressIndicator(
                  _videoPlayerController,
                  allowScrubbing: true,
                  colors: VideoProgressColors(
                      backgroundColor: AppColors.gray,
                      bufferedColor: AppColors.gray,
                      playedColor: AppColors.brandingOrange),
                ))
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width < 600 ? 8 : 16,
        ),
        Observer(builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(48, 32)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
                onPressed: () {
                  _videoPlayerController.seekTo(Duration(
                      seconds: _videoPlayerController.value.position.inSeconds -
                          10));
                },
                child: const Icon(Icons.fast_rewind),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width < 600 ? 4 : 16,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(48, 32)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
                onPressed: () {
                  if (controller.isPlaying) {
                    _videoPlayerController.pause();
                    controller.setIsPlaying();
                  } else {
                    _videoPlayerController.play();
                    controller.setIsPlaying();
                  }
                },
                child:
                    Icon(controller.isPlaying ? Icons.pause : Icons.play_arrow),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width < 600 ? 4 : 16,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(48, 32)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
                onPressed: () {
                  _videoPlayerController.seekTo(Duration(
                      seconds: _videoPlayerController.value.position.inSeconds +
                          10));
                },
                child: const Icon(Icons.fast_forward),
              ),
              MediaQuery.of(context).size.width >= 1024
                  ? Observer(builder: (_) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 32,
                          ),
                          Icon(
                            controller.val == 0.0
                                ? Icons.volume_off
                                : controller.val <= 0.5
                                    ? Icons.volume_down
                                    : Icons.volume_up,
                            color: AppColors.brandingPurple,
                            size: 28,
                          ),
                          Slider(
                              value: controller.val,
                              min: 0.0,
                              max: 1.0,
                              onChanged: (value) {
                                setState(() {
                                  controller.setVal(value);
                                  _videoPlayerController
                                      .setVolume(controller.val);
                                });
                              }),
                        ],
                      );
                    })
                  : const SizedBox.shrink(),
            ],
          );
        }),
        MediaQuery.of(context).size.width < 1024
            ? const SizedBox(
                height: 4,
              )
            : const SizedBox.shrink(),
        MediaQuery.of(context).size.width < 1024
            ? Observer(builder: (_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      controller.val == 0.0
                          ? Icons.volume_off
                          : controller.val <= 0.5
                              ? Icons.volume_down
                              : Icons.volume_up,
                      color: AppColors.brandingPurple,
                    ),
                    Slider(
                        value: controller.val,
                        min: 0.0,
                        max: 1.0,
                        onChanged: (value) {
                          setState(() {
                            controller.setVal(value);
                            _videoPlayerController.setVolume(controller.val);
                          });
                        }),
                  ],
                );
              })
            : const SizedBox.shrink(),
      ],
    );
  }
}
