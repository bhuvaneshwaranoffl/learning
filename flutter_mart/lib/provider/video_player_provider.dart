import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier {
  final Map<int, VideoPlayerController> _videoControllers = {};

  VideoPlayerController? getController(int index) {
    return _videoControllers[index];
  }

  Future<void> initializeController(int index, String videoPath) async {
    if (!_videoControllers.containsKey(index)) {
      final controller = VideoPlayerController.asset(videoPath);
      _videoControllers[index] = controller;
      await controller.initialize();
      notifyListeners();
    }
  }

  void play(int index) {
    final controller = _videoControllers[index];
    if (controller != null && !controller.value.isPlaying) {
      controller.play();
      notifyListeners();
    }
  }

  void pause(int index) {
    final controller = _videoControllers[index];
    if (controller != null && controller.value.isPlaying) {
      controller.pause();
      notifyListeners();
    }
  }

  void disposeController(int index) {
    final controller = _videoControllers[index];
    if (controller != null) {
      controller.dispose();
      _videoControllers.remove(index);
    }
  }

  @override
  void dispose() {
    for (var controller in _videoControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}
