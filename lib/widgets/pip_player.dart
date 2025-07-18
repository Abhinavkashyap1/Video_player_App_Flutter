import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/providers/video_provider.dart';

class PiPPlayer extends StatelessWidget {
  final VideoPlayerController controller;

  const PiPPlayer({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);

    return Positioned(
      bottom: 20,
      right: 20,
      child: Draggable(
        feedback: _buildVideoBox(context),
        childWhenDragging: const SizedBox.shrink(),
        child: _buildVideoBox(context),
      ),
    );
  }

  Widget _buildVideoBox(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);

    return Container(
      width: 160,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
      ),
      child: Stack(
        children: [
          if (controller.value.isInitialized)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
            ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {
                videoProvider.closePiP();
              },
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.red,
                child: Icon(Icons.close, size: 14, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
