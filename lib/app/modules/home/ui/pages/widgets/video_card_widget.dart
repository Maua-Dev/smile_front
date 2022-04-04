import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoCardWidget extends StatefulWidget {
  const VideoCardWidget({Key? key}) : super(key: key);

  @override
  State<VideoCardWidget> createState() => _VideoCardWidgetState();
}

class _VideoCardWidgetState extends State<VideoCardWidget> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '_tw_Wb7ufEg',
    params: const YoutubePlayerParams(
      showControls: true,
      showFullscreenButton: true,
      privacyEnhanced: true,
      useHybridComposition: true,
      interfaceLanguage: 'pt-br',
      captionLanguage: 'pt-br',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.5,
      child: YoutubePlayerControllerProvider(
        controller: _controller,
        child: const YoutubePlayerIFrame(
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
