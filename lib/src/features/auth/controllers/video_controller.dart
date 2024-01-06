import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController _videoPlayerController;

  @override
  void onInit() {
    super.onInit();
    initializeVideo();
  }

  void initializeVideo() {
    _videoPlayerController = VideoPlayerController.asset('assets/videos/accompani_vid.mp4')
      ..initialize().then((_) async{
        _videoPlayerController.setLooping(true);
        await Future.delayed(const Duration(milliseconds: 100), () {
          _videoPlayerController.play();
          update();       
        });
      });
  }

  void stopVideo() {
    _videoPlayerController.dispose();
  }

  @override
  void onClose() {
    _videoPlayerController.dispose();
    super.onClose();
  }

  VideoPlayerController get videoPlayerController => _videoPlayerController;
}
