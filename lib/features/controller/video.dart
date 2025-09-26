
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import 'video_controller.dart';

class VideoContainer extends StatelessWidget {
  final String videoPath;
  final double width;
  final double height;

  const VideoContainer({
    super.key,
    required this.videoPath,
    this.width = 360,
    this.height = 429,
  });

  @override
  Widget build(BuildContext context) {
    // Controller ইন্সট্যান্স করো
    final VideoController controller =
    Get.put(VideoController(videoPath), tag: videoPath);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color(0xff00000000),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Obx(() {
        if (!controller.isInitialized.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: controller.videoPlayerController.value.size.width,
                height: controller.videoPlayerController.value.size.height,
                child: VideoPlayer(controller.videoPlayerController),
              ),
            ),
          );
        }
      }),
    );
  }
}
