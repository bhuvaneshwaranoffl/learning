import 'package:flutter/material.dart';
import 'package:flutter_mart/model/video_player_model.dart';
import 'package:flutter_mart/provider/video_player_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatelessWidget {
  const VideoPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VideoProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Courses"),
        ),
        body: Consumer<VideoProvider>(
          builder: (context, videoProvider, child) {
            return ListView.builder(
              itemCount: courseCurriculum.length,
              itemBuilder: (context, index) {
                VideoModel course = courseCurriculum[index];
                return ExpansionTile(
                  title: Text(course.title),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.video_camera_back_sharp),
                      const SizedBox(width: 4),
                      Text(course.time),
                    ],
                  ),
                  onExpansionChanged: (isExpanded) async {
                    if (isExpanded) {
                      await videoProvider.initializeController(
                          index, course.video);
                      videoProvider.play(index);
                    } else {
                      videoProvider.pause(index);
                      videoProvider.disposeController(index);
                    }
                  },
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: _buildVideoPlayer(context, videoProvider, index),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(
      BuildContext context, VideoProvider videoProvider, int index) {
    final controller = videoProvider.getController(index);

    if (controller == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
        const SizedBox(height: 10),
        VideoProgressIndicator(
          controller,
          allowScrubbing: true,
          colors: VideoProgressColors(
            playedColor: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
              onPressed: () {
                controller.value.isPlaying
                    ? videoProvider.pause(index)
                    : videoProvider.play(index);
              },
            ),
          ],
        ),
      ],
    );
  }
}
