import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key, required this.videoId});
  final String videoId;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: 0.3 * screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: YoutubePlayer(
            controller: YoutubePlayerController(
                initialVideoId: videoId,
                flags: const YoutubePlayerFlags(
                    autoPlay: false, mute: true, isLive: false)),
            showVideoProgressIndicator: true,
            progressIndicatorColor: ColorConstant.mainScaffoldBackgroundColor,
          ),
        ),
      ],
    );
  }
}

String shortenText(String text, {int maxLength = 30}) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return '${text.substring(0, maxLength)}...';
  }
}
