import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/providers/video_provider.dart';

import '../widgets/full_screen_player.dart';
import '../widgets/pip_player.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PiP Home'),
        actions: [
          IconButton(
            icon: Icon(
              videoProvider.isMuted ? Icons.volume_off : Icons.volume_up,
            ),
            onPressed: () {
              videoProvider.toggleMute();
              _controller.setVolume(videoProvider.isMuted ? 0 : 1);
            },
          ),
          IconButton(
            icon: const Icon(Icons.fullscreen),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FullScreenPlayer(controller: _controller),
                ),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Text(
              'This is your app’s home screen.\nMinimize or play video in PiP.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          if (videoProvider.showPiP)
            PiPPlayer(controller: _controller), // 👈 draggable mini player
        ],
      ),
    );
  }
}
