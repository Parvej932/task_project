
import 'package:get/get.dart';

import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  RxBool isInitialized = false.obs;



  final String videoPath;

  VideoController(this.videoPath);

  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.asset(videoPath)
      ..initialize().then((_) {
        isInitialized.value = true;
        videoPlayerController.setLooping(true);
        videoPlayerController.play();
        update();
      });
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
