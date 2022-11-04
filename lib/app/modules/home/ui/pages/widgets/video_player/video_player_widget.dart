import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smile_front/app/modules/home/presenter/controllers/video_controller.dart';
import 'package:smile_front/app/shared/themes/app_colors.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../shared/services/environment/environment_config.dart';

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
                width: MediaQuery.of(context).size.width < 400
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width < 1024
                        ? 400
                        : 800,
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
        Observer(builder: (_) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(color: AppColors.brandingBlue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width < 1024 ? 4 : 16,
                ),
                TextButton(
                  onPressed: () {
                    if (controller.isPlaying) {
                      _videoPlayerController.pause();
                      controller.setIsPlaying();
                    } else {
                      _videoPlayerController.play();
                      controller.setIsPlaying();
                    }
                  },
                  child: Icon(
                    controller.isPlaying ? Icons.pause : Icons.play_arrow,
                    size: MediaQuery.of(context).size.width < 1024 ? 24 : 32,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width < 1024 ? 4 : 16,
                ),
                TextButton(
                  onPressed: () {
                    _videoPlayerController.seekTo(Duration(
                        seconds:
                            _videoPlayerController.value.position.inSeconds +
                                10));
                  },
                  child: Icon(
                    Icons.fast_forward,
                    size: MediaQuery.of(context).size.width < 1024 ? 24 : 32,
                    color: AppColors.white,
                  ),
                ),
                Observer(builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width:
                            MediaQuery.of(context).size.width < 1024 ? 14 : 32,
                      ),
                      TextButton(
                        onPressed: () {
                          if (controller.val > 0.0) {
                            controller.setVal(0.0);
                          } else {
                            controller.setVal(1.0);
                          }
                        },
                        child: Icon(
                          controller.val == 0.0
                              ? Icons.volume_off
                              : controller.val <= 0.5
                                  ? Icons.volume_down
                                  : Icons.volume_up,
                          color: AppColors.white,
                          size: MediaQuery.of(context).size.width < 1024
                              ? 20
                              : 28,
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: AppColors.white,
                          inactiveTrackColor: AppColors.gray,
                          trackHeight:
                              MediaQuery.of(context).size.width < 1024 ? 1 : 3,
                          thumbColor: AppColors.white,
                          overlayColor: AppColors.placeholder,
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 20),
                          thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius:
                                  MediaQuery.of(context).size.width < 1024
                                      ? 8
                                      : 10),
                        ),
                        child: Slider(
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
                      ),
                    ],
                  );
                })
              ],
            ),
          );
        })
      ],
    );
  }
}
