import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/presentation/controller/video_controller.dart';
import 'package:laundry/presentation/widget/video/video_list_tile.dart';

class VideoView extends GetView<VideoController> {
  const VideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Videolar")),
      body: Obx(() {
        if (controller.videos.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.separated(
          padding: const EdgeInsets.all(20),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: controller.videos.length,
          itemBuilder: (context, index) {
            final video = controller.videos[index];
            return VideoListTile(video: video);
          },
        );
      }),
    );
  }
}
